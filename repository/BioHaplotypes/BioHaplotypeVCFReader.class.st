Class {
	#name : 'BioHaplotypeVCFReader',
	#superclass : 'Object',
	#instVars : [
		'vcfData',
		'sampleIndex'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioHaplotypeVCFReader class >> fromFile: aFilename [

	| vcf |
	vcf := VCF fromFile: aFilename.
	^ self fromVCF: vcf
]

{ #category : 'instance creation' }
BioHaplotypeVCFReader class >> fromString: aString [

	| vcf |
	vcf := VCF fromString: aString.
	^ self fromVCF: vcf
]

{ #category : 'instance creation' }
BioHaplotypeVCFReader class >> fromVCF: aVCF [

	^ self new
		  readFromVCF: aVCF;
		  yourself
]

{ #category : 'private' }
BioHaplotypeVCFReader >> alleleForIndex: indexString ref: refAllele alts: altAlleles [
	"Convert VCF allele index (0=REF, 1=first ALT, etc.) to allele string."

	| idx |
	idx := indexString asInteger.
	idx isNil ifTrue: [ ^ indexString ].
	idx = 0 ifTrue: [ ^ refAllele ].
	idx > 0
		ifTrue: [ ^ altAlleles at: idx ]
		ifFalse: [ ^ indexString ]
]

{ #category : 'private' }
BioHaplotypeVCFReader >> buildVariantsFromVCF [
	"Build BioVariant objects from VCF data lines."

	^ vcfData dataLines collect: [ :dl |
			  BioVariant
				  position: dl posInteger
				  referenceAllele: dl ref
				  alternateAlleles: dl altAlleles
				  rsID: (dl hasVariantId
						   ifTrue: [ dl vid ]
						   ifFalse: [ nil ])
				  chromosome: dl chrom ]
]

{ #category : 'private' }
BioHaplotypeVCFReader >> parsePhasedGenotype: gtString ref: refAllele alts: altAlleles into: halfCalls atSampleIndex: sampleIdx [
	"Parse a phased genotype string like '0|1' into allele values for each strand."

	| alleles index1 index2 |
	(gtString includes: $|)
		ifTrue: [
				alleles := gtString splitOn: $|.
				index1 := sampleIdx * 2 - 1.
				index2 := sampleIdx * 2.
				(halfCalls at: index1) add:
					(self
						 alleleForIndex: (alleles at: 1)
						 ref: refAllele
						 alts: altAlleles).
				(halfCalls at: index2) add:
					(self
						 alleleForIndex: (alleles at: 2)
						 ref: refAllele
						 alts: altAlleles) ]
		ifFalse: [
				index1 := sampleIdx * 2 - 1.
				index2 := sampleIdx * 2.
				(halfCalls at: index1) add: refAllele.
				(halfCalls at: index2) add: refAllele ]
]

{ #category : 'reading' }
BioHaplotypeVCFReader >> readFromVCF: aVCF [
	"Read phased VCF data and return a BioHaplotypes collection.
	 Each phased sample (0|1 format) becomes one haplotype per phased strand."

	| variants haplotypes halfCalls sampleNames nSamples |
	vcfData := aVCF.
	variants := self buildVariantsFromVCF.
	sampleNames := aVCF sampleNames.
	nSamples := sampleNames size.
	halfCalls := Array new: nSamples * 2.
	"Collect all phased alleles per haplotype strand"
	1 to: nSamples * 2 do: [ :i |
	halfCalls at: i put: OrderedCollection new ].
	aVCF dataLines do: [ :dl |
			| ref alts gt |
			ref := dl ref.
			alts := dl altAlleles.
			1 to: nSamples do: [ :si |
					gt := dl genotypeAt: si.
					self
						parsePhasedGenotype: gt
						ref: ref
						alts: alts
						into: halfCalls
						atSampleIndex: si ] ].
	"Build BioHaplotype objects"
	haplotypes := (1 to: nSamples * 2) collect: [ :hi |
			              | alleles sampleName strand sampleIdx |
			              sampleIdx := hi + 1 // 2.
			              sampleName := sampleNames at: sampleIdx.
			              strand := hi even
				                        ifTrue: [ 'b' ]
				                        ifFalse: [ 'a' ].
			              alleles := (halfCalls at: hi) asArray.
			              BioHaplotype
				              withAlleles: alleles
				              atVariants: variants
				              identifier: sampleName , '_' , strand ].
	^ BioHaplotypes
		  withHaplotypes: haplotypes
		  identifier: aVCF sampleNames first , '_population'
]

{ #category : 'accessing' }
BioHaplotypeVCFReader >> sampleIndex [

	^ sampleIndex ifNil: [ sampleIndex := 1 ]
]

{ #category : 'accessing' }
BioHaplotypeVCFReader >> sampleIndex: anInteger [

	sampleIndex := anInteger
]

{ #category : 'accessing' }
BioHaplotypeVCFReader >> vcfData [

	^ vcfData
]

{ #category : 'accessing' }
BioHaplotypeVCFReader >> vcfData: anObject [

	vcfData := anObject
]
