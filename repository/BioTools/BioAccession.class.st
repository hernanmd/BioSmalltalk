"
GTAccession has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.

Instance Variables:
	version		<String>		Represents the biological version number of the accession
"
Class {
	#name : #BioAccession,
	#superclass : #BioNamedObject,
	#instVars : [
		'version'
	],
	#category : #'BioTools-Core'
}

{ #category : #converting }
BioAccession >> asFastaRecord [
	"Retrieve the sequence identified by the receiver and answer a <BioFastaRecord> with it"

	| eClient eWebEnv eResponse |

	eWebEnv := BioEntrezClient new nuccore
			term: self asString;
			setUseHistory;
			search.
	eClient := BioEntrezClient new nuccore.
	eResponse := eClient
		webEnv: eWebEnv;
		setFasta;
		fetch.
	^ eResponse result asFastaRecord 
]

{ #category : #converting }
BioAccession >> asString [
	" Answer a <String> that represents the receiver."

	^ String streamContents: [ : stream | 
			stream nextPutAll: self names last.
			self hasVersion ifTrue: [ 
				stream
					nextPut: $.;
					nextPutAll: self version asString ] ]
]

{ #category : #testing }
BioAccession >> hasVersion [
	" Answer <true> if receiver is correctly versioned "
	
	^ self isVersioned and: [ self version asString notEmpty ]
]

{ #category : #testing }
BioAccession >> isEmpty [
	" Answer whether the receiver contains a name. "
	
	^ self hasName not
]

{ #category : #testing }
BioAccession >> isNotEmpty [

	^ self isEmpty not.
]

{ #category : #testing }
BioAccession >> isVersioned [
	" Answer <true> if the receiver has a version number "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ version notNil
]

{ #category : #printing }
BioAccession >> printOn: aStream [
	" Private - See superimplementor´s comment "

	super printOn: aStream.
	self names do: [ : n | aStream nextPutAll: n between: Character space and: Character space ].
	self version ifNotNil: [ :arg | aStream nextPutAll: self version ]
]

{ #category : #accessing }
BioAccession >> version [
	^ version
]

{ #category : #accessing }
BioAccession >> version: anObject [
	version := anObject
]
