"
BioBlastCSVFormatter is a formatter to visualize BLAST results mainly in Excel. 
Conserved positions are written as a dot $. and mutations are explicitly written.

Instance Variables:
	consensus	<String>

"
Class {
	#name : #BioBlastCSVFormatter,
	#superclass : #BioCSVFormatter,
	#instVars : [
		'consensus'
	],
	#category : #'BioFormatters-Formatters-CSV'
}

{ #category : #accessing }
BioBlastCSVFormatter class >> description [
	" See superimplementor's comment "

	^ 'CSV from Blast HIT Collection'
]

{ #category : #accessing }
BioBlastCSVFormatter class >> identifiers [
	"Answer a <Collection> of identifiers of the receiver"
	
	^ #('BlastReportCSV')
]

{ #category : #accessing }
BioBlastCSVFormatter >> consensus [

	^ consensus
		ifNil: [ consensus := String empty ]
]

{ #category : #accessing }
BioBlastCSVFormatter >> consensus: anObject [
	consensus := anObject
]

{ #category : #accessing }
BioBlastCSVFormatter >> export [

	isValid and: [ self exportFrom: self samples ]
]

{ #category : #exporting }
BioBlastCSVFormatter >> exportConsensus [
	" Private - Write a row representing the consensus sequence "
	
	stream nextPutAll: 'Consensus'.
	self consensus do: [: letter |
		stream
			nextPut: self delimiterSourceCharacter;
			nextPut: letter ].
	stream cr.
]

{ #category : #exporting }
BioBlastCSVFormatter >> exportFromXML: aBlastXMLString [
	" Answer the resulting formatted <String>. Write a CSV file from aBlastXMLString"
	
	| hitCollection |
	
	hitCollection := (BioParser saxParseNcbiXmlBlastNodes: aBlastXMLString) hits.
	self initializeStream: hitCollection.
	self exportPositions: hitCollection.
	self exportConsensus.
	self exportMatrixFromBLAST: hitCollection.
	self 
		dumpToFileNamed: self outputFilename 
		contents: stream contents.
	^ stream contents

]

{ #category : #exporting }
BioBlastCSVFormatter >> exportHitCount: anInteger in: aStream [

	anInteger timesRepeat: [ 
		aStream 
			nextPut: self delimiterSourceCharacter;
			nextPut: $. ].
]

{ #category : #exporting }
BioBlastCSVFormatter >> exportIdentities: aStream count: anInteger [

	anInteger timesRepeat: [ aStream nextPut: $. ].
]

{ #category : #exporting }
BioBlastCSVFormatter >> exportMatrixFromBLAST: hitCollection [
	
	hitCollection do: [: hitNode |
		| prev name |		
		" Write the description "
		prev := 0.
		name := self escapeDelimiters: hitNode hitDefinition blastValue.	
		stream nextPutAll: name.
		(self mutationIndexesIn: hitNode) do: [: index |
			self exportHitCount: (index - prev) - 1 in: stream.
			stream 
				nextPut: self delimiterSourceCharacter;
				nextPut: (hitNode selectHspHSeq at: index).
			prev := index ].
		" Write remaining identities "	
		prev = hitNode selectHspMidLine size ifFalse: [ 
			self exportHitCount: hitNode selectHspMidLine size - prev in: stream ].
		stream cr ].

]

{ #category : #exporting }
BioBlastCSVFormatter >> exportPositions: hitCollection [
	" Private - Export a row for the sequence positions "

	| posCount |

	" Space for the first column "
	stream space.
	" How many positions to write. Needs work, this could be a user-defined range..."
	posCount := hitCollection first selectHspAlign.
	1 to: posCount do: [: i | 
		stream 
			nextPut: self delimiterSourceCharacter; 
			nextPutAll: i asString ].
	stream cr.	

]

{ #category : #accessing }
BioBlastCSVFormatter >> mutationIndexesIn: hitNode [
	" Private - Answer a Collection of positions in alignmentCollection were there is a mutation "
	
	^ hitNode selectHspMidLine indicesOfCharacter: Character space
]

{ #category : #accessing }
BioBlastCSVFormatter >> parserClass [

	^ BioNCBIBlastSAXParser
]

{ #category : #accessing }
BioBlastCSVFormatter >> sizeFrom: hitCollection [

	^ ( hitCollection size + 1 ) * ( hitCollection first selectHspAlign asNumber + 1 )
]
