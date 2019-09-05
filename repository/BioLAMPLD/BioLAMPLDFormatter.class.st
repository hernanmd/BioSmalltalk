"
Helper class to format files according to LAMP-LD input.


"
Class {
	#name : #BioLAMPLDFormatter,
	#superclass : #BioFileFormatter,
	#instVars : [
		'referenceAllelesFile',
		'plinkWrapper'
	],
	#category : 'BioLAMPLD-Core'
}

{ #category : #accessing }
BioLAMPLDFormatter class >> description [
	" See superimplementor's comment "
	
	^ 'LAMP-LD Writer'
]

{ #category : #examples }
BioLAMPLDFormatter class >> example1 [
	" Export reference alleles "

	BioLAMPLDFormatter new 
		inputFile: 'Exported_Forward-Strand-Base-Call.txt';
		outputFilename: 'reference-alleles.txt';
		exportFromAffymetrixRefAlleles.

]

{ #category : #examples }
BioLAMPLDFormatter class >> example2 [
	" Export MAP file from Affymetrix Software Suite "

	BioLAMPLDFormatter new 
		inputFile: 'Exported-for-PLINK_by_Probe_Set_ID.map';
		outputFilename: 'Sorted_MAP-by_position.map';
		exportFromAffymetrixMap.

]

{ #category : #examples }
BioLAMPLDFormatter class >> example3 [
	" Export BED, BIM and FAM files using plink "

	| wd |
	
	wd := self testFilesFullDirectoryName / 'pedmap'.
	BioLAMPLDFormatter new 
		inputFile: (wd / 'sample_ped') fullName;	
		outputFilename: (wd / 'sample_ped') fullName;
		referenceAllelesFile: (wd / 'reference_alleles.txt') fullName;		
		exportBed.

]

{ #category : #examples }
BioLAMPLDFormatter class >> example4 [
	" Export BED, BIM and FAM files using plink "

	| lf |
	lf := BioLAMPLDFormatter new.
	lf plinkWrapper
		noPheno;
		noParents;
		noSex.
	lf	
		inputFile: (self testFilesFullDirectoryName / 'pedmap' / 'sample_ped') fullName;	
		outputFilename: 'sample_ped';
		referenceAllelesFile: (self testFilesFullDirectoryName / 'pedmap' / 'reference_alleles.txt') fullName;		
		exportBed.

]

{ #category : #accessing }
BioLAMPLDFormatter class >> identifiers [
	" Answer a <Collection> of identifiers of the receiver "
	
	^ #('LAMP-LD')
]

{ #category : #accessing }
BioLAMPLDFormatter >> exportBed [
	" Write .bed, .bim file and .fam files using a reference allele file to force specific allele as A1 (which might not be the minor allele) and input file. Answer a <BioResultObject> "
	
	^ self plinkWrapper
		file: self inputFile;
		out: self outputFilename;
		makeBed;
		referenceAlleles: self referenceAllelesFile;
		execute
		
]

{ #category : #accessing }
BioLAMPLDFormatter >> exportFromAffymetrixMap [
	" Write a .map file (s exported from Affymetrix Suite) without headers and sorted by physical position. Add the following fields: chromosome, marker ID, centimorgan, physical position "

	(NeoCSVWriter on: self outputFileStream)
		separator: Character tab;
		fieldWriter: #raw;
		nextPutAll: (BioMAPFormatter newFromInputFile: self inputFile) sortByPosition;
		flush
]

{ #category : #accessing }
BioLAMPLDFormatter >> exportFromAffymetrixRefAlleles [
	" Write a file with reference alleles (one allele by row) for PLINK, taken from Affymetrix full TXT report "

	self outputFileStream
		nextPutAll: self parseReferenceAlleles;
		flush;
		close
]

{ #category : #accessing }
BioLAMPLDFormatter >> exportFromAffymetrixRefAllelesAt: fieldName [
	" Write a file with reference alleles (one allele by row) for PLINK, taken from Affymetrix full TXT report "

	self outputFileStream
		nextPutAll: (self parseReferenceAllelesAt: fieldName);
		flush;
		close
]

{ #category : #accessing }
BioLAMPLDFormatter >> exportPositions [
	" Write .bed, .bim file and .fam files using a reference allele file to force specific allele as A1 (which might not be the minor allele) and input file. Answer a <BioResultObject> "
	
	^ self plinkWrapper
		file: self inputFile;
		out: self outputFilename;
		makeBed;
		referenceAlleles: self referenceAllelesFile;
		execute
		
]

{ #category : #accessing }
BioLAMPLDFormatter >> parseReferenceAlleles [

	^ (BioAffyTXTFormatter newFromInputFile: self inputFile) 
			referenceAlleles joinUsing: Character cr
]

{ #category : #accessing }
BioLAMPLDFormatter >> parseReferenceAllelesAt: fieldName [

	| affyFormatter |
	
	affyFormatter := (BioAffyTXTFormatter newFromInputFile: self inputFile)
			refAlleleFieldName: fieldName;
			yourself.
	^ affyFormatter referenceAlleles joinUsing: Character cr
]

{ #category : #accessing }
BioLAMPLDFormatter >> plinkWrapper [
	" Answer a <BioPLINKWrapper> used to configure plink options to the receiver "

	^ plinkWrapper
		ifNil: [ plinkWrapper := BioPLINK2Wrapper new ]
]

{ #category : #accessing }
BioLAMPLDFormatter >> plinkWrapper: aBioPLINKWrapper [

	plinkWrapper := aBioPLINKWrapper
]

{ #category : #accessing }
BioLAMPLDFormatter >> referenceAllelesFile [
	^ referenceAllelesFile
]

{ #category : #accessing }
BioLAMPLDFormatter >> referenceAllelesFile: aFilename [
	" The reference alleles files is used as parameter of PLINK run "

	referenceAllelesFile := aFilename
]
