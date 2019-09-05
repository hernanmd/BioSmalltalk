Class {
	#name : #BioFileFormatTest,
	#superclass : #BioAbstractTest,
	#category : 'BioFormatterTests-Core'
}

{ #category : #testing }
BioFileFormatTest >> csvContents01 [
	" Answer a <String> with a sample test file path "
	
	^ self testFilesFullDirectoryName / 'Test001.csv'
]

{ #category : #testing }
BioFileFormatTest >> phylipContents01 [
	" Answer a <String> with a sample test file path "
	
	^ self testFilesFullDirectoryName / 'dna_interleaved.phy'
]

{ #category : #testing }
BioFileFormatTest >> phylipContents02 [
	" Answer a <String> with a sample test file path "
	
	^ self testFilesFullDirectoryName / 'dna_sequential.phy'
]

{ #category : #testing }
BioFileFormatTest >> testCSV01 [

	| file |
	
	file := BioCSVFile on: self csvContents01.
	self deny: file isNil.
	
	file ignoreLinesCount: 2.
	self assert: file ignoreLinesCount = 2.
	
	file ignoreFirstLines.
	self assert: file ignoreLinesStrategy = #ignoreHeadersCount:.
	
	file ignoreLastLines.
	self assert: file ignoreLinesStrategy = #ignoreLastLinesCount:

]

{ #category : #testing }
BioFileFormatTest >> testFileExtensionFor [

	| fastaExt |
	
	fastaExt := BioFileFormat fileExtensionFor: 'FASTA'.
	self deny: fastaExt isNil.
	self assert: fastaExt isString.
	self assert: fastaExt = 'csfasta'.
	self should: [ BioFileFormat fileExtensionFor: String empty ] raise: BioNotFoundObject.
]

{ #category : #testing }
BioFileFormatTest >> testFileExtensionsFor [

	| fastaExt |
	
	fastaExt := BioFileFormat fileExtensionsFor: 'FASTA'.
	self deny: fastaExt isNil.
	self deny: fastaExt isString.
	self assert: (fastaExt isKindOf: SequenceableCollection).
	self assert: fastaExt = #('csfasta').
	self should: [ BioFileFormat fileExtensionsFor: '' ] raise: BioNotFoundObject.
]

{ #category : #testing }
BioFileFormatTest >> testFormats [

	BioFileFormat initialize.
	self deny: (BioFileFormat isRegistered: 'InvalidDescriptionFormat').
	#('ABI' 'ace' 'AceDB' 'ALF' 
	'BSML' 
	'CHAOS' 'CTF' 'CSV' 'CHADO' 
	'EMBL' 'Entrez' 'Excel' 'EXP'
	'FASTAQ' 'fastq' 'fasta' 'FASTA' 
	'GAME' 'GCG' 'GenBank' 'gbank' 'genbank'
	'InterProScan' 
	'KEGG' 
	'Nexus' 
	'Phred' 'Phylip' 'phy' 'PIR' 'PLN' 'PTT'
	'scf' 'SeqXML' 'SwissProt' 'sp' 'Staden'
	'TIGR' 'txt'
	'ZTR') do: [ : format | self assert: (BioFileFormat isRegistered: format) ]
]

{ #category : #testing }
BioFileFormatTest >> testPhylipFile [

	| file |
	
	file := BioPhylipFile on: self phylipContents01.
	self deny: file isNil.
	self assert: (file possibleExtensions includes: 'phy').
	self assert: (file possibleExtensions includes: 'ph').	
	self deny: file contents isEmpty.

]

{ #category : #testing }
BioFileFormatTest >> testRegisterFileExtensionFor [

	BioFileFormat removeFormat: 'txt'.
	self deny: ( BioFileFormat fileExtensionsFor: 'Text File' ) = #('txt').
	BioFileFormat
	   registerFormat: 'Text File'
	   extensions: #('txt')
	   description: 'General Text File Format'
	   rootClass: BioCSVFile.
	self assert: (( BioFileFormat fileExtensionsFor: 'Text File' ) bioHasEqualElements: #('txt')).
	BioFileFormat removeFormat: 'txt'.
]

{ #category : #testing }
BioFileFormatTest >> testRegistry [

	self deny: BioFileFormat registry isNil.
	self deny: BioFileFormat registry isEmpty.
	self assert: ( BioFileFormat registry allSatisfy: [: f | f isKindOf: BioFileFormat ] ).
	
]
