"
From the MEGA website: ""MEGA is an integrated tool for conducting sequence alignment, inferring phylogenetic trees, estimating divergence times, mining online databases, estimating rates of molecular evolution, inferring ancestral sequences, and testing evolutionary hypotheses."".

This class is an exporter for the MEGA file format.

MEGA Input Format may contain

-DNA sequence, 
-Protein sequence, 
-Evolutionary distance, 
-Phylogenetic tree data

 data formats for molecular sequences, distances, and phylogenetic trees separately. However, there are a number of features that are common to all MEGA data files.
 
"
Class {
	#name : #BioMEGAFormatter,
	#superclass : #BioFileFormatter,
	#instVars : [
		'alignments',
		'codeTable',
		'longestNameCount',
		'formatType',
		'groupNameQualifier',
		'identical',
		'indel',
		'megaDescription',
		'missing',
		'numberOfNucleotidesOrAminoacids',
		'numberOfSequences',
		'numberOfSynonymsWithSequences',
		'propertySetting',
		'title'
	],
	#category : #'BioFormatters-Formatters-MEGA'
}

{ #category : #accessing }
BioMEGAFormatter class >> description [
	" Answer a <String> identifying the receiver's class "
	
	^ 'MEGA Formatter (version 6)'
]

{ #category : #'instance creation' }
BioMEGAFormatter class >> forDataTypeDNA [
	" Answer a new instance configured for containing nucleotide sequence data "
	
	^ self new 
		formatType: 'DNA';
		yourself
]

{ #category : #'instance creation' }
BioMEGAFormatter class >> forDataTypeDistance [
	" Answer a new instance configured for containing nucleotide sequence data "
	
	^ self new 
		formatType: 'Distance';
		yourself
]

{ #category : #'instance creation' }
BioMEGAFormatter class >> forDataTypeNucleotide [
	" Answer a new instance configured for containing nucleotide sequence data "
	
	^ self new 
		formatType: 'Nucleotide';
		yourself
]

{ #category : #'instance creation' }
BioMEGAFormatter class >> forDataTypeProtein [
	" Answer a new instance configured for containing Protein sequence data "
	
	^ self new 
		formatType: 'Protein';
		yourself
]

{ #category : #'instance creation' }
BioMEGAFormatter class >> forDataTypeRNA [
	" Answer a new instance configured for containing RNA sequence data "
	
	^ self new 
		formatType: 'RNA';
		yourself
]

{ #category : #accessing }
BioMEGAFormatter class >> formatExtension [
	" Private - Answer a String corresponding for the receiver's file output format "

	^ 'meg'
]

{ #category : #accessing }
BioMEGAFormatter class >> identifiers [
	" See superimplementor's comment "
	
	^ #('MEGA6')
]

{ #category : #accessing }
BioMEGAFormatter >> alignments [
	" Answer a <Collection> of receiver's alignment "

	^ alignments
]

{ #category : #accessing }
BioMEGAFormatter >> alignments: aCollection [

	alignments := aCollection
]

{ #category : #private }
BioMEGAFormatter >> bestNameFor: seqAssoc [
	" Answer a <String> with a identifiable name for group of sequences in seqAssoc. See class comments for details on seqAssoc expected format "
	
	^ seqAssoc value
		detect: [ : d | d includesKey: self groupNameQualifier ]
		ifFound: [ : found | found  at: self groupNameQualifier ]
		ifNone: [ 'Unnamed_Seq' , BioNamedObject uniqueName ] 
]

{ #category : #private }
BioMEGAFormatter >> buildMEGARecordId: seqName sequence: seqString [
	" Answer a new MEGA record formatted for valid export to text file "
	
	^ BioMEGASeqRecord new
		name: (self formatNameFrom: seqName);
		alignment: (self formatSequenceFrom: seqString);
		yourself
]

{ #category : #accessing }
BioMEGAFormatter >> codeTable [
	" Answer a <String> "

	^ codeTable
		ifNil: [ 
			self setCodeTableAsStandard.
			codeTable ]
]

{ #category : #accessing }
BioMEGAFormatter >> codeTable: aString [
	" Set the receiver's missing to indicate missing data to be aCharacter "
	
	codeTable := aString
]

{ #category : #private }
BioMEGAFormatter >> defaultFormatType [

	^ 'DNA'
]

{ #category : #exporting }
BioMEGAFormatter >> export [
	" Write the contents to receiver's file name "

	self exportHeader.
	self exportStatementTitle.
	self exportStatementDescription.
	self exportStatementFormat.
	self stream cr.
	self exportFromAlignment: self alignments.
	self 
		dumpToFileNamedFullPath: self outputFilename
		contents: self stream contents. 
]

{ #category : #exporting }
BioMEGAFormatter >> exportCodeTable [
	" Write the receiver's code table setting "
	
	self stream
		nextPutAll: 'CodeTable=';
		nextPutAll: self codeTable.
]

{ #category : #exporting }
BioMEGAFormatter >> exportDataType [
		
	self stream
		nextPutAll: 'DataType=';
		nextPutAll: self formatType;
		space 
]

{ #category : #exporting }
BioMEGAFormatter >> exportFromAlignment: aBioAlignment [

	| records |
	
	records := aBioAlignment collect: [ : assoc | self exportGroup: assoc ] .
	longestNameCount := records max: [ : megaRecordsGroup | megaRecordsGroup max: [ : mr | mr name size ] ].
	[ self isAlignmentEmpty: records ]
		whileFalse: [ self exportMegaRecords: records ]
]

{ #category : #exporting }
BioMEGAFormatter >> exportGroup: anAssociation [ 
	" Private - Iterate over anAssociation, build and export the MegaRecords in proper format "
	
	| megaRecords |
	
	" Divide sequences in 80-column group"
	megaRecords := OrderedCollection new.
	anAssociation value associationsDo: [ : groupAssoc |
		megaRecords add: (
			self 
				buildMEGARecordId: (self bestNameFor: groupAssoc) 
				sequence: groupAssoc key) ].
	^ megaRecords
]

{ #category : #exporting }
BioMEGAFormatter >> exportHeader [
	" Private - The first line must contain the keyword #MEGA to indicate that the data file is in MEGA format."
	
	self stream 
		nextPutAll: '#mega';
		crlf
]

{ #category : #exporting }
BioMEGAFormatter >> exportIdentical [
	" Write the receiver's identical setting "
	
	self stream
		nextPutAll: 'Identical=';
		nextPut: self identical
]

{ #category : #exporting }
BioMEGAFormatter >> exportIndel [
	" Write the receiver's indel setting "
	
	self stream
		nextPutAll: 'Indel=';
		nextPut: self indel;
		space.
]

{ #category : #exporting }
BioMEGAFormatter >> exportMegaRecords: aCollection [
	" Iterate over aCollection and write results into the receiver's stream "

	aCollection do: [ : megaRecordsGroup | 
			megaRecordsGroup
				keysAndValuesDo: [ :index :mr | 
					mr
						exportTo: self stream
						nameSpacing: longestNameCount
						alignmentNumber: index ] ].
	self stream cr
]

{ #category : #exporting }
BioMEGAFormatter >> exportMissing [
	" Write the receiver's missing setting "
	
	self stream
		nextPutAll: 'Missing=';
		nextPut: self missing;
		space
]

{ #category : #exporting }
BioMEGAFormatter >> exportNumberOfNucleotidesOrAminoacids [
	" Write the receiver's number of nucleotides or amino acids "
	
	self stream
		nextPutAll: 'NSites=';
		nextPutAll: self numberOfNucleotidesOrAminoacids asString
]

{ #category : #exporting }
BioMEGAFormatter >> exportNumberOfSequences [
	" Write the receiver's number of sequences "
	
	self stream
		nextPutAll: 'NSeqs=';
		nextPutAll: self numberOfSequences asString
]

{ #category : #exporting }
BioMEGAFormatter >> exportNumberOfSynonymsWithSequences [
	" Write the receiver's number of synonyms "
	
	self stream
		nextPutAll: 'NTaxa=';
		nextPutAll: self numberOfSynonymsWithSequences asString
]

{ #category : #exporting }
BioMEGAFormatter >> exportPropertySetting [
	" Write the receiver's property setting "
	
	self stream
		nextPutAll: 'Property=';
		nextPutAll: self propertySetting
]

{ #category : #exporting }
BioMEGAFormatter >> exportStatementDescription [

	(self megaDescription includes: ';')
		ifTrue: [ self error: 'Description must not contain any ;' ].
	self stream
		nextPutAll: '!!Description ';
		nextPutAll: self megaDescription;
		nextPut: $;;
		crlf
]

{ #category : #exporting }
BioMEGAFormatter >> exportStatementFormat. [
	" A format statement contains one or more command statements. A command statement contains a command and a valid setting keyword (command=keyword format). For example, the command statement DataType=Nucleotide tells MEGA that nucleotide sequence data is contained in the file. Based on the DataType setting, different types of keywords are valid. "
	
	self stream nextPutAll: '!!Format '.
	self 
		exportDataType;
		exportIndel;
		exportCodeTable.
	self stream nextPut: $; 
]

{ #category : #exporting }
BioMEGAFormatter >> exportStatementTitle [

	self stream
		nextPutAll: '!!Title ';
		nextPutAll: self title;
		nextPut: $;;
		crlf
]

{ #category : #accessing }
BioMEGAFormatter >> fileNamePrefix [
	" Answer a <String> with the prefix of the output file name "
	
	^ 'mega_'
]

{ #category : #private }
BioMEGAFormatter >> formatNameFrom: nameString [
	" Remove invalid MEGA characters from nameString "
	
	^ nameString copyReplaceAll: ' ' with: '_' 
]

{ #category : #private }
BioMEGAFormatter >> formatSequenceFrom: seqString [

	^ (((seqString groupsOf: 10 atATimeCollect: [ : each | each joinUsing: String empty ])
		groupsOf: 8 atATimeCollect: [ : each | each ])
			collect: [ : each | each joinUsing: String space ]) asOrderedCollection
]

{ #category : #accessing }
BioMEGAFormatter >> formatType [

	^ formatType
		ifNil: [ formatType := self defaultFormatType ]
]

{ #category : #accessing }
BioMEGAFormatter >> formatType: anObject [

	formatType := anObject
]

{ #category : #accessing }
BioMEGAFormatter >> groupNameQualifier [
	" Answer a <String>. The group name qualifier is a property used to group the receiver's aligned records "

	^ groupNameQualifier
		ifNil: [ groupNameQualifier := 'breed' ]
]

{ #category : #accessing }
BioMEGAFormatter >> groupNameQualifier: anObject [

	^ groupNameQualifier := anObject
]

{ #category : #accessing }
BioMEGAFormatter >> identical [
	
	^ identical
]

{ #category : #accessing }
BioMEGAFormatter >> identical: aCharacter [
	" Set the receiver's identical to show identify with the first sequence to be aCharacter "
	
	identical := aCharacter
]

{ #category : #accessing }
BioMEGAFormatter >> indel [
	
	^ indel
		ifNil: [ indel := $- ]
]

{ #category : #accessing }
BioMEGAFormatter >> indel: aCharacter [
	" Set the receiver's indel to identify insertion/deletions in sequence alignments to be aCharacter "
	
	indel := aCharacter
]

{ #category : #testing }
BioMEGAFormatter >> isAlignmentEmpty: aCollection [ 

	^ aCollection allSatisfy: [ : megaRecordGroup |
		megaRecordGroup allSatisfy: [ : mr | mr hasEmptyAlignment ] ]
]

{ #category : #accessing }
BioMEGAFormatter >> megaDescription [
	^ megaDescription
		ifNil: [ megaDescription := 'Missing Description' ]
]

{ #category : #accessing }
BioMEGAFormatter >> megaDescription: anObject [
	megaDescription := anObject
]

{ #category : #accessing }
BioMEGAFormatter >> missing [
	
	^ missing
]

{ #category : #accessing }
BioMEGAFormatter >> missing: aCharacter [
	" Set the receiver's missing to indicate missing data to be aCharacter "
	
	missing := aCharacter
]

{ #category : #accessing }
BioMEGAFormatter >> numberOfNucleotidesOrAminoacids [
	
	^ numberOfNucleotidesOrAminoacids
]

{ #category : #accessing }
BioMEGAFormatter >> numberOfNucleotidesOrAminoacids: aNumber [
	" Set the receiver's number of nucleotides or amino acids to be aNumber "
	
	numberOfNucleotidesOrAminoacids  := aNumber
]

{ #category : #accessing }
BioMEGAFormatter >> numberOfSequences [
	
	^ numberOfSequences
]

{ #category : #accessing }
BioMEGAFormatter >> numberOfSequences: aNumber [
	" Set the receiver's number of sequences to be aNumber "
	
	numberOfSequences := aNumber
]

{ #category : #accessing }
BioMEGAFormatter >> numberOfSynonymsWithSequences [
	
	^ numberOfSynonymsWithSequences
]

{ #category : #accessing }
BioMEGAFormatter >> numberOfSynonymsWithSequences: aNumber [
	" Set the receiver's number of synonyms to be aNumber "
	
	numberOfSynonymsWithSequences  := aNumber
]

{ #category : #accessing }
BioMEGAFormatter >> propertySetting [
	
	^ propertySetting
]

{ #category : #accessing }
BioMEGAFormatter >> propertySetting: aString [
	" Set the receiver's property setting to be aString "
	
	propertySetting := aString
]

{ #category : #accessing }
BioMEGAFormatter >> setCodeTableAsStandard [

	self codeTable: 'Standard'
]

{ #category : #accessing }
BioMEGAFormatter >> setDataFormatAsLowerleft [
	" Set the DataFormat property "
	
	self dataFormat: 'Lowerleft'
]

{ #category : #accessing }
BioMEGAFormatter >> setDataFormatAsUpperright [
	" Set the DataFormat property "
	
	self dataFormat: 'Uperright'
]

{ #category : #accessing }
BioMEGAFormatter >> setPropertyAsCoding [
	" Set the receiver's property "
	
	self propertySetting: 'Coding'
]

{ #category : #accessing }
BioMEGAFormatter >> setPropertyAsEnd [
	" Set the receiver's property "
	
	self propertySetting: 'End'
]

{ #category : #accessing }
BioMEGAFormatter >> setPropertyAsExon [
	" Set the receiver's property "
	
	self propertySetting: 'Exon'
]

{ #category : #accessing }
BioMEGAFormatter >> setPropertyAsIntron [
	" Set the receiver's property "
	
	self propertySetting: 'Intron'
]

{ #category : #accessing }
BioMEGAFormatter >> setPropertyAsNonCoding [
	" Set the receiver's property "
	
	self propertySetting: 'NonCoding'
]

{ #category : #accessing }
BioMEGAFormatter >> title [
	^ title
		ifNil: [ title := 'Missing Title' ]
]

{ #category : #accessing }
BioMEGAFormatter >> title: anObject [
	title := anObject
]
