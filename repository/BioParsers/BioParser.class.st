"
BioParser is the main access point to parsing in the BioSmalltalk library. It acts as a Facade to the parsing subsystem.

There are two ways of using a parser

1) As a tokenizer, which will always answer an Array with the input String tokenized.
2) As a proper parser, which will always construct and answer a real Smalltalk object.

1) As a tokenizer

The protocol for the tokenizer is sending:

BioParser tokenizeXXX where XXX is what you want to parse, for example: #tokenizeAccession: , #tokenizeSwissProtEntryName:, #tokenizeGenBankIdentifier:, etc. The corresponding parser will be instantiated and the answer will be a ""primitive type"" Smalltalk object. In the case of accession numbers would be an Array because an accession number is usually composed of name and version, in the case of a GenBank identifier would be a String, etc.

2) As a parser

The elemental protocol for starting to use the parser is sending a message to this class, for example: BioParser parseAccession: '...'

This will create a new instance of the appropiate parser, send the #parse: message and and answer, in this example, a BioAccession instance with values properly filled from the parsing results if it was succesful. You may always test manually the parsing process by tokenizing before constructing the real object (this may be useful if there are lots of input): BioParser tokenizeAccession: '....'

Use cases:

1) If the parsing was succesfully, and the parser was instantiated with #tokenize, the #results message will answer an Array with the elements parsed.
2) If the parsing was succesfully, and the parser was instantiated with #parseAccession:, #parseGb:, #parseGi:, #parseEmb:, etc. the #results message will answer an instance of the proper class, This could be BioAccession, BioGenBankIdentifier, etc.
3) If the parsing was unsuccesful, the #results message will answer the ""expected"" parser's message. This could indicate the parser used was not appropiate for parsing the input entered or the parser itself is not parsing well the input.

Format of database identifiers

 GenBank                           gi|gi-number|gb|accession|locus
 EMBL Data Library                 gi|gi-number|emb|accession|locus
 DDBJ, DNA Database of Japan       gi|gi-number|dbj|accession|locus
 NBRF PIR                          pir||entry
 Protein Research Foundation       prf||name
 SWISS-PROT                        sp|accession|name
 Brookhaven Protein Data Bank (1)  pdb|entry|chain
 Brookhaven Protein Data Bank (2)  entry:chain|PDBID|CHAIN|SEQUENCE
 Patents                           pat|country|number 
 GenInfo Backbone Id               bbs|number 
 General database identifier       gnl|database|identifier
 NCBI Reference Sequence           ref|accession|locus
 Local Sequence identifier         lcl|identifier
"
Class {
	#name : #BioParser,
	#superclass : #BioObject,
	#category : #'BioParsers-Core'
}

{ #category : #'parse-ncbi-identifiers' }
BioParser class >> parseAccession: aString [
	" Parse aString containing an accession number and answer an accession instance "
	
	^ ( BioAccessionParser on: aString ) parse
]

{ #category : #'instance creation' }
BioParser class >> parseAmbiguousWithSeparators: aSequenceString [
	" Parse aSequenceString containing an ambiguous sequence "
	
	^ ( BioAmbiguousBaseParser on: aSequenceString ) parseWithSeparators
]

{ #category : #'instance creation' }
BioParser class >> parseAmbiguousWithoutSeparators: aSequenceString [
	" Parse aSequenceString containing an ambiguous sequence "
	
	^ ( BioAmbiguousBaseParser on: aSequenceString ) parseWithoutSeparators
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> parseDocumentFrom: anObject [
	" Answer a Collection of header nodes found in anObject "
	
	^ BioNCBIBlastSAXParser new
		selectNodes: BioNCBIBlastReader allNodeNames;
		parse: anObject
]

{ #category : #'parse-fasta' }
BioParser class >> parseFasta: aFastaString [
	" Parse aFastaString and answer a single fasta instance "
	
	^ (BioFASTABasicParser on: aFastaString) parse
]

{ #category : #'parse-fasta' }
BioParser class >> parseFastaFile: aFilepath [
	" Parse aFastaString and answer a single fasta instance "

	^ (BioFASTABasicParser on: aFilepath contents) parse
]

{ #category : #'parse-ncbi-genbank' }
BioParser class >> parseFlatGenBank: aGenBankString [
	" Parse aGenBankString and answer a single fasta instance "
	
	^ (BioFlatGenBankParser on: aGenBankString) parse
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> parseFullNcbiXmlGBSeq: aString [
	" Answer a <Collection> of header nodes found in aString "

	^ BioEntrezXMLGBSeqFullParser parse: aString
]

{ #category : #'parse-fasta' }
BioParser class >> parseMultiFasta: aFastaString [
	" Parser aFastaString representing a MultiFASTA sequence.
	Answer a FastaMultiRecord object "
	
	^ (BioFASTAMultiParser on: aFastaString) parse
]

{ #category : #'parse-fasta' }
BioParser class >> parseMultiFastaAlignment: aFastaString [
	" Parser aFastaString representing a <String> containing multiple sequences in FASTA format.
	Answer a <BioFastaMultiRecord> object "
	
	^ (BioMultiFASTAAlignmentParser on: aFastaString) parse
]

{ #category : #'parse-fasta' }
BioParser class >> parseMultiFastaAlignmentFile: aFastaFullFileLocation [
	" Parse aFastaFullFileLocation representing a <String> containing a file with multiple sequences in FASTA format. Answer a <BioFastaMultiRecord> object "
	
	^ (BioMultiFASTAAlignmentParser on: (self openFullFileNamed: aFastaFullFileLocation) contents) parse
]

{ #category : #'parse-fasta' }
BioParser class >> parseMultiFastaFile: aFastaFullFileLocation [
	" Parser aFastaString representing a MultiFASTA sequence.
	Answer a FastaMultiRecord object "
	
	^ (BioFASTAMultiParser on: (self openFullFileNamed: aFastaFullFileLocation) contents) parse
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> parseNcbiXmlBlast: aString nodes: nodesCollection [
	" Parse with nodesCollection and answer a <Collection> of nodes found in aString "
	
	^ (BioNCBIXMLBlastParser on: aString)
		selectNodes: nodesCollection;
		parse
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> parseNcbiXmlGBSeq: aString [
	" Answer a <Collection> of header nodes found in aString "
	
	^ BioEntrezXMLGBBasicParser parse: aString
]

{ #category : #'parse-phylip' }
BioParser class >> parsePhylipInterleavedDNA: aPhylipString [
	" Parse aPhylipString and answer a BioPhylip object with contents filled "
	
	^ ( BioPhylipParser on: aPhylipString ) parseDna
]

{ #category : #'parse-phylip' }
BioParser class >> parsePhylipInterleavedProtein: aPhylipString [
	" Parse aPhylipString and answer a BioPhylip object with contents filled "
	
	^ ( BioPhylipParser on: aPhylipString ) parseProtein
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> saxParseNcbiXmlBlast: anObject nodes: aCollection [
	" Answer a Collection of nodes found in anObject "
	
	^ BioNCBIBlastSAXParser newParser
		selectNodes: aCollection;
		parse: anObject
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> saxParseNcbiXmlBlastNodes: anObject [
	" Answer a Collection of header nodes found in anObject "
	
	^ BioNCBIBlastSAXParser newParser
		selectNodes: BioNCBIBlastReader hitNodesNames;
		parse: anObject
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> saxTokenizeNcbiXmlBlast: anObject nodes: aBlock [
	" Answer a Collection of nodes found in anObject "
	
	^ BioNCBIBlastSAXTokenizer newParser
		selectNodes: aBlock;
		parse: anObject
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> saxTokenizeNcbiXmlBlast: anObject nodes: nodes conditionBlock: aBlock [
	" Answer a Collection of nodes found in anObject "
	
	^ BioNCBIBlastSAXTokenizer newParser
		conditionBlock: aBlock;
		selectNodes: nodes;
		parse: anObject
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> saxTokenizeNcbiXmlBlastNodes: anObject [
	" Answer a Collection of nodes found in anObject "
	
	^ BioNCBIBlastSAXTokenizer newParser
		selectNodes: BioNCBIBlastReader hitNodesNames;
		parse: anObject
]

{ #category : #'parse-ncbi-identifiers' }
BioParser class >> tokenizeAccession: aString [
	" Tokenize aString containing an accession number "
	
	^ (BioAccessionParser on: aString) tokenize
]

{ #category : #'instance creation' }
BioParser class >> tokenizeAmbiguousLettersToSeparators: aSequenceString [
	" Tokenize aString containing an ambiguous sequence without separators, i.e. [ACT] "
	
	^ (BioAmbiguousBaseParser on: aSequenceString) tokenizeWithoutSeparators
]

{ #category : #'instance creation' }
BioParser class >> tokenizeAmbiguousWithSeparators: aSequenceString [
	" Tokenize aString containing an ambiguous sequence delimited with separators, i.e. [A/C/T] "
	
	^ (BioAmbiguousBaseParser on: aSequenceString) tokenizeWithSeparators
]

{ #category : #'instance creation' }
BioParser class >> tokenizeAmbiguousWithoutSeparators: aSequenceString [
	" Tokenize aString containing an ambiguous sequence without separators, i.e. [ACT] "
	
	^ (BioAmbiguousBaseParser on: aSequenceString) tokenizeWithoutSeparators
]

{ #category : #'parse-csv' }
BioParser class >> tokenizeCSV: aCSVStringOrStream delimiter: aCharacter [
	" Tokenize aCSVStringOrStream with CSV format "
	
	^ (NeoCSVReader on: aCSVStringOrStream readStream)
		separator: aCharacter;
		upToEnd
]

{ #category : #'parse-fasta' }
BioParser class >> tokenizeFasta: aString [
	" Tokenize aString representing a FASTA sequence "
	
	^ ( BioFASTABasicParser on: aString ) tokenize first
]

{ #category : #'parse-fasta' }
BioParser class >> tokenizeFastaDescription: aString [
	" Tokenize aString representing a FASTA header String "
	
	^ (BioFASTAParser on: aString) tokenizeDescriptionText
]

{ #category : #'parse-fasta' }
BioParser class >> tokenizeFastaHeader: aString [
	" Tokenize aString representing a FASTA header String "
	
	^ (BioFASTAParser on: aString) tokenizeDescriptionLine
]

{ #category : #'parse-ncbi-identifiers' }
BioParser class >> tokenizeGi: aString [
	" Tokenize aString containing a gene identifier. If aString does not begin with 'gi|' then answer an empty Collection "
	
	| result |
	
	^ (result := (BioGIParser on: aString) tokenize) = 'Error: ''gi|'' expected'
		ifTrue: [ ^ Array new ]
		ifFalse: [ result ]
		
]

{ #category : #'parse-ncbi-identifiers' }
BioParser class >> tokenizeLocus: aString [
	" Tokenize aString containing an accession number "
	
	^ ( BioGBParser on: aString ) tokenizeLocus
]

{ #category : #'parse-fasta' }
BioParser class >> tokenizeMultiFasta: aString [
	" Tokenize aString representing a MultiFASTA sequence "
	
	^ (BioFASTABasicParser on: aString) tokenize
]

{ #category : #'parse-fasta' }
BioParser class >> tokenizeMultiFastaFile: aFastaFullFileLocation [
	" Tokenize aString representing a MultiFASTA sequence "
	
	^ (BioFASTABasicParser on: (self openFullFileNamed: aFastaFullFileLocation) contents) tokenize
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> tokenizeNcbiXmlBlast: aString nodes: aCollection [
	" Answer a Collection of hit tokens found in aString "
	
	^ (BioNCBIXMLBlastParser on: aString) tokenizeNodes: aCollection.
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> tokenizeNcbiXmlBlastHeader: aString [
	" Answer a <Collection> of header nodes found in aXMLString "
	
	^ (BioNCBIXMLBlastParser on: aString) tokenizeHeader
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> tokenizeNcbiXmlBlastHits: xmlString [
	" Answer a Collection of hit nodes found in xmlString "
	
	" needs work "
	^ (BioNCBIXMLBlastParser on: xmlString) tokenizeHits
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> tokenizeNcbiXmlBlastHsps: aString [
	" Answer a Collection of hsps (high scoring pairs) nodes found in aXMLString "
	
	^ ( BioNCBIXMLBlastParser on: aString ) parseHsps
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> tokenizeNcbiXmlEntrezResultKeys: aString [
	" Answer a Collection of hit nodes found in aXMLString "
	
	^ BioEResultKeysParser parse: aString
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> tokenizeNcbiXmlEntrezSearchResult: aString [
	" Answer a Collection of hit nodes found in aXMLString "
	
	^ BioEntrezXMLGBFullParser parse: aString
]

{ #category : #'parse-ncbi-xml' }
BioParser class >> tokenizeNcbiXmlEntrezSearchResult: aString nodes: aCollection [
	" Answer a Collection of hit nodes found in aXMLString "
	
	^ ((BioXMLParser on: aString readStream) 
				selectNodes: aCollection) tokenizeNodes
]

{ #category : #'parse-phylip' }
BioParser class >> tokenizePhylipInterleavedDNA: aPhylipString [
	" Parse aPhylipString and answer a BioPhylip object with contents filled "
	
	^ ( BioPhylipParser on: aPhylipString ) tokenizeInterleavedDNA
]

{ #category : #'parse-phylip' }
BioParser class >> tokenizePhylipInterleavedProtein: aPhylipString [
	" Parse aPhylipString and answer a BioPhylip object with contents filled "
	
	^ ( BioPhylipParser on: aPhylipString ) tokenizeInterleavedProtein
]

{ #category : #'parse-ncbi-identifiers' }
BioParser class >> tokenizeSwissProtEntryName: aString [
	" Tokenize aString representing a Swiss-Prot identifier "
	
	^ (BioSwissProtParser on: aString) tokenizeSwissProtEntryName
]
