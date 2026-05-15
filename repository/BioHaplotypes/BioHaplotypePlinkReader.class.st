"
I read PLINK-format genotype data and produce BioHaplotypes collections.

I can operate in two modes:
1. Direct file parsing: Use fromPedFile:mapFile: to read pre-existing .ped/.map files.
2. PLINK execution: Use fromBfile:usingPlink: to run PLINK via BioPLINKWrapper and parse the output.

Each individual in the .ped file produces two BioHaplotype objects (one per phased strand).

Example:
| reader haplotypes |
reader := BioHaplotypePlinkReader fromPedFile: 'data.ped' mapFile: 'data.map'.
haplotypes := reader asBioHaplotypes.

Or with PLINK execution:
| reader plink |
plink := BioPLINK1Wrapper new bfile: 'mydata'.
reader := BioHaplotypePlinkReader fromBfile: 'mydata' usingPlink: plink.
"
Class {
	#name : 'BioHaplotypePlinkReader',
	#superclass : 'Object',
	#instVars : [
		'plinkWrapper',
		'pedFile',
		'mapFile',
		'variants',
		'haplotypesInternal'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioHaplotypePlinkReader class >> fromBfile: bfilePrefix [
	"Convenience: create a default PLINK1Wrapper and run --recode12 on the given bfile prefix."

	| wrapper |
	wrapper := BioPLINK1Wrapper new
		           bfile: bfilePrefix;
		           recode12;
		           yourself.
	^ self fromBfile: bfilePrefix usingPlink: wrapper
]

{ #category : 'instance creation' }
BioHaplotypePlinkReader class >> fromBfile: bfilePrefix usingPlink: plinkWrapper [
	"Use a BioPLINKWrapper to run PLINK --recodeHV on a .bed/.bim/.fam dataset,
	 then parse the output into haplotypes."

	^ self new
		  plinkWrapper: plinkWrapper;
		  executeAndReadFromBfile: bfilePrefix;
		  yourself
]

{ #category : 'instance creation' }
BioHaplotypePlinkReader class >> fromPedFile: pedPath mapFile: mapPath [
	"Read PLINK .ped and .map files and construct haplotypes.
	 Each sample row in .ped becomes two haplotypes (one per phased strand)."

	^ self new
		  readPedFile: pedPath mapFile: mapPath;
		  yourself
]

{ #category : 'converting' }
BioHaplotypePlinkReader >> asBioHaplotypes [
	"Answer the parsed haplotypes as a BioHaplotypes collection."

	^ BioHaplotypes
		  withHaplotypes: self haplotypesInternal
		  identifier: 'plink_import'
]

{ #category : 'execution' }
BioHaplotypePlinkReader >> executeAndReadFromBfile: bfilePrefix [
	"Run PLINK via the wrapper to generate a recode output, then parse it. 
	This executes: plink --bfile <prefix> --recode12 --out <prefix>_recode"

	| result outputPath pedPath mapPath |
	plinkWrapper
		bfile: bfilePrefix;
		recode12;
		out: bfilePrefix , '_recode'.
	result := plinkWrapper execute.
	outputPath := bfilePrefix , '_recode'.
	pedPath := outputPath , '.ped'.
	mapPath := outputPath , '.map'.
	^ self readPedFile: pedPath mapFile: mapPath
]

{ #category : 'accessing' }
BioHaplotypePlinkReader >> haplotypesInternal [

	^ haplotypesInternal ifNil: [
		  haplotypesInternal := OrderedCollection new ]
]

{ #category : 'accessing' }
BioHaplotypePlinkReader >> haplotypesInternal: aCollection [

	haplotypesInternal := aCollection
]

{ #category : 'accessing' }
BioHaplotypePlinkReader >> mapFile [

	^ mapFile
]

{ #category : 'accessing' }
BioHaplotypePlinkReader >> mapFile: aPath [

	mapFile := aPath
]

{ #category : 'parsing' }
BioHaplotypePlinkReader >> parseMapLines: lineArray [
	"Parse .map file lines into BioVariant objects.
	Format: chr  rsID  genDist  position"

	^ lineArray
		  reject: [ :line | line isEmpty or: [ line beginsWith: '#' ] ]
		  thenCollect: [ :line |
				  | fields |
				  fields := line findTokens: Character space.
				  BioVariant
					  position: (fields at: 4) asInteger
					  referenceAllele: ''
					  alternateAlleles: #(  )
					  rsID: (fields at: 2)
					  chromosome: fields first ]
]

{ #category : 'parsing' }
BioHaplotypePlinkReader >> parsePedLines: lineArray variants: variantArray [
	"Parse .ped file lines into an OrderedCollection of BioHaplotype objects.
	 Each individual row generates two haplotypes (one per phased strand).
	 Format: famID  indID  paternalID  maternalID  sex  phenotype  A1 A2 A1 A2 ..."

	| results |
	results := OrderedCollection new.
	lineArray do: [ :line |
			| fields indID alleles alleleA alleleB idx |
			line isEmpty ifFalse: [
					fields := line findTokens: Character space.
					indID := fields at: 2.
					alleles := fields allButFirst: 6.
					"Split phased alleles into two haplotypes"
					alleleA := OrderedCollection new.
					alleleB := OrderedCollection new.
					idx := 1.
					[ idx <= alleles size ] whileTrue: [
							alleleA add: (alleles at: idx).
							alleleB add: (alleles at: idx + 1).
							idx := idx + 2 ].
					results add: (BioHaplotype
							 withAlleles: alleleA asArray
							 atVariants: variantArray
							 identifier: indID , '_a').
					results add: (BioHaplotype
							 withAlleles: alleleB asArray
							 atVariants: variantArray
							 identifier: indID , '_b') ] ].
	^ results
]

{ #category : 'accessing' }
BioHaplotypePlinkReader >> pedFile [

	^ pedFile
]

{ #category : 'accessing' }
BioHaplotypePlinkReader >> pedFile: aPath [

	pedFile := aPath
]

{ #category : 'accessing' }
BioHaplotypePlinkReader >> plinkWrapper [

	^ plinkWrapper
]

{ #category : 'accessing' }
BioHaplotypePlinkReader >> plinkWrapper: aWrapper [

	plinkWrapper := aWrapper
]

{ #category : 'reading' }
BioHaplotypePlinkReader >> readPedFile: pedPath mapFile: mapPath [
	"Parse PLINK .ped and .map files. 
		.map format: chromosome  rsID  geneticDist  position (4 columns, whitespace-separated)
		.ped format: familyID  individualID  paternalID  maternalID  sex  phenotype  allele1 allele2 ... (per SNP)
	 Each individual produces two haplotypes (phased strands)."

	| mapLines pedLines |
	pedFile := pedPath.
	mapFile := mapPath.
	mapLines := mapPath asFileReference contents lines.
	variants := self parseMapLines: mapLines.
	pedLines := pedPath asFileReference contents lines.
	haplotypesInternal := self parsePedLines: pedLines variants: variants.
	^ BioHaplotypes
		  withHaplotypes: haplotypesInternal
		  identifier: 'plink_import'
]

{ #category : 'accessing' }
BioHaplotypePlinkReader >> variants [

	^ variants ifNil: [ variants := Array new ]
]

{ #category : 'accessing' }
BioHaplotypePlinkReader >> variants: anArray [

	variants := anArray
]
