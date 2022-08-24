Class {
	#name : #BioNCBIBlastClientTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'ncbiClient'
	],
	#category : #'BioBlastTests-Core'
}

{ #category : #accessing }
BioNCBIBlastClientTest >> ncbiClient [
	^ ncbiClient
]

{ #category : #accessing }
BioNCBIBlastClientTest >> ncbiClient: anObject [
	ncbiClient := anObject
]

{ #category : #accessing }
BioNCBIBlastClientTest >> newNCBIClient [

	^ BioNCBIWebBlastWrapper new
]

{ #category : #accessing }
BioNCBIBlastClientTest >> setUp [

	super setUp.
	ncbiClient := self newNCBIClient.
]

{ #category : #testing }
BioNCBIBlastClientTest >> test01InterfacesClientAccess [
	| blastInterface |
	blastInterface := BioBlastWrapper.
	self assert: blastInterface wrappers isCollection.
	self assert: blastInterface ncbi = BioNCBIBlastWrapper.
	self assert: blastInterface ncbi local = BioNCBILocalBlastWrapper.
	self assert: blastInterface wu remote isNil.
	self assert: blastInterface ncbi remote = BioNCBIWebBlastWrapper
]

{ #category : #testing }
BioNCBIBlastClientTest >> test02LatestLocalClientAccess [

	| blastInterface |
	
	blastInterface := BioBlastWrapper.
	
	self assert: blastInterface ncbi local latest class = BioNCBILocalBlastPlus2224.
	self assert: blastInterface ncbi local latest blastxPath isString.
	self assert: blastInterface ncbi local latest blastnPath isString.
	self assert: blastInterface ncbi local latest blastpPath isString.
	self assert: blastInterface ncbi local latest tblastnPath isString.
	self assert: blastInterface ncbi local latest tblastxPath isString.


	

]

{ #category : #testing }
BioNCBIBlastClientTest >> test02LegacyLocalClientAccess [

	| blastInterface |
	
	blastInterface := BioBlastWrapper.
	
	self assert: blastInterface ncbi local legacy class = BioNCBILocalBlastLegacy2223.	
	self assert: blastInterface ncbi local legacy blastAllPath isString.
	self assert: blastInterface ncbi local legacy bl2seqPath isString.
	self assert: blastInterface ncbi local legacy blastClustPath isString.
	self assert: blastInterface ncbi local legacy blastPgpPath isString.
	self assert: blastInterface ncbi local legacy copymatPath isString.
	self assert: blastInterface ncbi local legacy fastaCmdPath isString.
	self assert: blastInterface ncbi local legacy formatDbPath isString.
	self assert: blastInterface ncbi local legacy formatRpsDbPath isString.
	self assert: blastInterface ncbi local legacy impalaPath isString.
	self assert: blastInterface ncbi local legacy makeMatPath isString.
	self assert: blastInterface ncbi local legacy megaBlastPath isString.
	self assert: blastInterface ncbi local legacy rpsBlastPath isString.
	self assert: blastInterface ncbi local legacy seedTopPath isString.

]

{ #category : #testing }
BioNCBIBlastClientTest >> test03PutSettings [

	| cmd |
	
	cmd := self ncbiClient nucleotide
			query: '555';
			hitListSize: 10;
			filterLowComplexity;
			expectValue: 10;
			blastn;
			blastPlainService.
	self assert: (cmd tokenizeParameters includes: 'DATABASE=nr').
	self assert: (cmd tokenizeParameters includes: 'QUERY=555').
	self assert: (cmd tokenizeParameters includes: 'HITLIST_SIZE=10').
	self assert: (cmd tokenizeParameters includes: 'FILTER=L').
	self assert: (cmd tokenizeParameters includes: 'EXPECT=10').
	self assert: (cmd tokenizeParameters includes: 'PROGRAM=blastn').
	self assert: (cmd tokenizeParameters includes: 'SERVICE=plain').


]

{ #category : #testing }
BioNCBIBlastClientTest >> test04GetSettings [

	self assert: (self ncbiClient get isKindOf: BioNCBIGet).
	self should: [ self ncbiClient fetch ] raise: BioErrorSpecificationObject.

]

{ #category : #testing }
BioNCBIBlastClientTest >> test04PutSettings [

	| cmd |

	cmd := self ncbiClient nucleotide query: '555'.
	self 
		assert: cmd client downloadUrl
		equals: 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&DATABASE=nr&QUERY=555'.
	
	cmd := self newNCBIClient nucleotide autoFormatFull.
	self 
		assert: cmd client downloadUrl 
		equals: 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&DATABASE=nr&AUTO_FORMAT=Fullauto'.

	cmd := self newNCBIClient nucleotide query: '555'; autoFormatFull.
	self 
		assert: cmd client downloadUrl
		equals: 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&DATABASE=nr&QUERY=555&AUTO_FORMAT=Fullauto'.

	cmd := self newNCBIClient nucleotide query: '555'; autoFormatOff.
	self 
		assert: cmd client downloadUrl 
		equals: 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&DATABASE=nr&QUERY=555&AUTO_FORMAT=Off'.

	cmd := self newNCBIClient nucleotide query: '555'; autoFormatSemiauto.
	self 
		assert: cmd client downloadUrl 
		equals: 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&DATABASE=nr&QUERY=555&AUTO_FORMAT=Semiauto'.

	cmd := self newNCBIClient nucleotide query: '555'; autoFormatFull; blastn.
	self assert: (cmd tokenizeParameters includes: 'AUTO_FORMAT=Fullauto').
	self assert: (cmd tokenizeParameters includes: 'PROGRAM=blastn').

]

{ #category : #testing }
BioNCBIBlastClientTest >> testCreation [

	self assert: (self ncbiClient isKindOf: BioNCBIWebBlastWrapper).


]

{ #category : #testing }
BioNCBIBlastClientTest >> testSettings [

	| cmd |
	
	cmd := self ncbiClient nucleotide.
	self assert: (cmd isKindOf: BioNCBIPut).
	self assert: (cmd client isKindOf: BioNCBIWebBlastWrapper).
	self assert: (cmd client downloadUrl last: 2) = 'nr'.
	cmd query: '555'.
	self assert: (cmd tokenizeParameters includes: 'QUERY=555').
	cmd hitListSize: 10.
	self assert: (cmd tokenizeParameters includes: 'HITLIST_SIZE=10').
]
