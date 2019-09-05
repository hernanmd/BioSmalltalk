"
PHYLIP format comes in fourth forms: 

Phylip standard interleaved	.phylipi
Phylip standard sequential	.phylips
Phylip relaxed interleaved	.rphylipi
Phylip relaxed sequential	.rphylips

Phylip relaxed

It is 'relaxed' when a Phylip formatted file sequence names are longer than 10 characters. Relaxed Phylip (sequential and interleaved) will produce the same output as standard Phylip, except that in the relaxed format sequence names are not truncated to 10 characters. Instead, sequence names are left as they are and buffered with whitespaces based on the longest sequence name in the submitted data set. This ensures proper display of the aligned sequences in the interleaved format and consistent sequence name lengths for both interleaved and sequential formats.

Phylip files must begin with a line that looks like:

  78  i

which shows the number of sequences in the file (3), the number of characters in each sequence (78), and then the letter ""i"" or ""s"" which indicates ""interleaved"" or ""sequential"". The i or s letters are optional.

Standard phylip files have a limitation of 10 characters in the sequence names. For this reason, we also provide relaxed phylip options that will preserve the full length of your sequence names.


Internal Representation and Key Implementation Points.

    Instance Variables
	numberOfCharacters:		<Object>
	numberOfTaxa:		<Object>
	sequences:		<Object>


    Implementation Points
"
Class {
	#name : #BioPhylip,
	#superclass : #BioNamedObject,
	#instVars : [
		'numberOfTaxa',
		'numberOfCharacters',
		'sequences'
	],
	#category : #'BioFormatters-Formatters-PHYLIP'
}

{ #category : #accessing }
BioPhylip >> asAlignment [
	" Answer a <BioAlignment> object with receiver's contents "
	
	| align |
	
	align := BioAlignment new.
	self sequences do: [ : seq | align addSequence: seq ].
	^ align
]

{ #category : #converting }
BioPhylip >> asString [
	" Answer the String representation of the receiver." 	
	
	^ String streamContents: [ : stream |
		stream nextPutAll: self numberOfTaxa asString;
			space;
			nextPutAll: self numberOfCharacters asString;
			cr.
		self taxonIdentifiers with: (self sequences first: self numberOfTaxa) do: [ : id : seq |
			stream 
				nextPutAll: id;
				nextPutAll: seq asString;
				cr ].
		(self sequences allButFirst: self numberOfTaxa) do: [ : seq |
			stream 	nextPutAll: seq ]  ]
]

{ #category : #accessing }
BioPhylip >> numberOfCharacters [
	" Answer an <Integer> with the receiver number of characters in the matrix "
	
	^ numberOfCharacters
]

{ #category : #accessing }
BioPhylip >> numberOfCharacters: anObject [
	numberOfCharacters := anObject
]

{ #category : #accessing }
BioPhylip >> numberOfTaxa [
	" Answer an <Integer> with the receiver number of taxa "
	
	^ numberOfTaxa
]

{ #category : #accessing }
BioPhylip >> numberOfTaxa: anObject [
	numberOfTaxa := anObject
]

{ #category : #accessing }
BioPhylip >> sequences [
	^ sequences
]

{ #category : #accessing }
BioPhylip >> sequences: anObject [
	sequences := anObject
]

{ #category : #accessing }
BioPhylip >> taxonIdentifiers [
	" Answer a <Collection> with the taxon identifiers in the receiver (up to 10 characters each) "

	| idCol answeredIds |
	
	idCol := (self sequences first: self numberOfTaxa) collect: #name.
	answeredIds := OrderedCollection new: self numberOfTaxa.
	idCol do: [ : idString |
		idString size = 10
			ifFalse: [ 
				| remSize pads |
				remSize := 10 - idString size.
				pads := BioObject generateJoin: ' ' repeat: remSize.
				answeredIds add: idString , pads ]
			ifTrue: [ answeredIds add: idString ] ].
	^ answeredIds
]
