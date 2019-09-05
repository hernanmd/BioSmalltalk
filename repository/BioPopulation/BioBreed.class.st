"
Represents a species breed including its synonyms and any relevant locations.

Instance Variables
	locations:		<Collection>
	synonyms:		<Collection>

locations
	- xxxxx

synonyms
	- xxxxx

"
Class {
	#name : #BioBreed,
	#superclass : #BioNamedBreed,
	#instVars : [
		'synonyms',
		'locations'
	],
	#category : 'BioPopulation-Core'
}

{ #category : #'instance creation' }
BioBreed class >> named: aString [
	" Answer a new instance of the receiver adding aString as name "

	^ self new name: aString
]

{ #category : #accessing }
BioBreed class >> removePrefixes: locString [
	" Given locString including a space Character, remove any possible known location prefix.
	Answer locString without the prefix, if found "

	^ locString bioRemovePrefixes

]

{ #category : #accessing }
BioBreed class >> repositoryFor: aString [

	^ self allSubclasses select: [: cls | cls descriptionIncludes: aString ]
]

{ #category : #accessing }
BioBreed >> addLocation: locationString [
	" Add locationString to the receive's locations "

	self locations 
			add: locationString;
			yourself.
]

{ #category : #accessing }
BioBreed >> addSynonym: synString [
	" Add synString as receiver's synonym "
	
	self synonyms 
		add: synString;
		yourself.
]

{ #category : #accessing }
BioBreed >> allNames [
	" Answer a <Collection> of all receiver names including synonyms "

	^ self names , self synonyms
]

{ #category : #converting }
BioBreed >> asString [


]

{ #category : #accessing }
BioBreed >> dumpCSVTo: aStream [
	" Write the receiver contents in the following CSV format:
	
	name1[,name2,name3....];synonym1[,synonym2....];location1[,location2....]
	
	names should never be empty "
	self outputNamesTo: aStream.
	self outputSynonymsTo: aStream.
	self outputLocationsTo: aStream
]

{ #category : #testing }
BioBreed >> hasSynonym [
	" Answer <true> if receiver's synonyms is not empty "
	
	^ self synonyms notEmpty
]

{ #category : #testing }
BioBreed >> includesLocation: locationString [
	" Answer whether the receiver includes locationString. "

	^ self locations asLowercase anySatisfy: [ : n | n beginsWith: locationString asLowercase ]

]

{ #category : #testing }
BioBreed >> includesName: aString [
	"Answer whether the receiver contains a sequence named aString."

	| lcs allNames allSyns |
	lcs := aString asLowercase trimBoth. 
	allNames := self names asLowercase trimBoth.
	allSyns := self synonyms asLowercase trimBoth.
	^ (allNames includes: lcs) or: [ allSyns includes: lcs ]
]

{ #category : #testing }
BioBreed >> includesNameBeginsWith: aString [
	" Answer whether the receiver begins with aString. "

	^ (self names asLowercase anySatisfy: [ : n | n beginsWith: aString asLowercase ]) 
		or: [ self synonyms asLowercase anySatisfy: [: s | s beginsWith: aString asLowercase ] ]
]

{ #category : #'text-mining' }
BioBreed >> isFoundIn: aString [
	" Answer <true> if the receiver's is located at aString "
	
	^ self locationsWithoutPrefixes asLowercase includes: aString asLowercase
]

{ #category : #accessing }
BioBreed >> locations [
	" Answer a <Collection> of receiver's locations "

	^ locations
		ifNil: [ locations := OrderedCollection new ]
]

{ #category : #accessing }
BioBreed >> locations: anObject [
	locations := anObject
]

{ #category : #'text-mining' }
BioBreed >> locationsWithoutPrefixes [
	" Answer a <Collection> of Strings with receiver's locations without common prefixes "
	
	^ self locations collect: [ : loc | self class removePrefixes: loc ]
]

{ #category : #accessing }
BioBreed >> names [
	" Answer a <Collection> of receiver's names. If a name is divided by a $- delimiter, then add a copy
	of that name with replacing the minus character with blanks "

	| answer cNames normalizedName |
	
	answer := (cNames := super names)
				detect: [: aName | aName includes: $- ]
				ifNone: [ nil ].
	^ answer
		ifNil: [ cNames ]
		ifNotNil: [ 
			(names includes: ( normalizedName := answer copyReplaceAll: '-' with: ' '))
				ifFalse: [			
					cNames 
						add: normalizedName ;
						yourself ]
				ifTrue: [ cNames ] ]
		
]

{ #category : #accessing }
BioBreed >> outputLocationsTo: aStream [
	" Private - See comment in #outputAsCsvTo: "
	
	self locations isEmpty
		ifTrue: [ aStream nextPut: $- ]
		ifFalse: [ self locations do: [: each | 
					aStream 
						nextPutAll: each; 
						nextPut: $, ].
					aStream back ].
]

{ #category : #accessing }
BioBreed >> outputNamesTo: aStream [
	" Private - See comment in #outputAsCsvTo: "

	self names do: [: each | 
		aStream nextPutAll: each; nextPut: $, ].
	aStream 
		back;
		nextPut: $;.
]

{ #category : #accessing }
BioBreed >> outputSynonymsTo: aStream [
	" Private - See comment in #outputAsCsvTo: "

	self synonyms isEmpty
		ifTrue: [ aStream nextPut: $- ]
		ifFalse: [ 
			self synonyms do: [ : each | aStream nextPutAll: each; nextPut: $, ].
			aStream back ].
	aStream nextPut: $;.
]

{ #category : #printing }
BioBreed >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	aStream 
		nextPutAll: self name between: $[ and: $];
		space.
	self locations ifNotNilDo: [: loc |
		aStream nextPutAll: loc between: $| and: $| ].
	aStream
		space;		
		nextPutAll: self synonyms size asString between: $( and: $);
		space;
		nextPutAll: self synonyms asString
]

{ #category : #accessing }
BioBreed >> synonyms [

	^ synonyms
		ifNil: [ synonyms := OrderedCollection new ]	
]

{ #category : #accessing }
BioBreed >> synonyms: anObject [
	synonyms := anObject
]

{ #category : #accessing }
BioBreed >> synonymsCount [
	" Answer a <Number> with receiver's count of synonyms "

	^ self synonyms size
]
