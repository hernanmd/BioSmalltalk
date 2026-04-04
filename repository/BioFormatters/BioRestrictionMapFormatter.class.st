Class {
	#name : 'BioRestrictionMapFormatter',
	#superclass : 'BioFormatter',
	#category : 'BioFormatters-Restriction',
	#package : 'BioFormatters',
	#tag : 'Restriction'
}

{ #category : 'formatting' }
BioRestrictionMapFormatter >> format: aSequence enzymes: aCollection [
	| stream sites |
	stream := WriteStream on: String new.
	stream nextPutAll: 'Restriction Map for: '; nextPutAll: aSequence name asString; cr.
	stream nextPutAll: 'Length: '; nextPutAll: aSequence size asString; cr.
	stream nextPutAll: 'Topology: '; nextPutAll: (aSequence isCircular ifTrue: [ 'Circular' ] ifFalse: [ 'Linear' ]); cr.
	stream cr.

	sites := OrderedCollection new.
	aCollection do: [ :enzyme |
		(enzyme searchIn: aSequence) do: [ :pos |
			sites add: { pos . enzyme name . pos + enzyme cut5 } ] ].

	sites sort: [ :a :b | a first < b first ].

	stream nextPutAll: 'Site Index', (Character tab asString), 'Enzyme', (Character tab asString), 'Cut Position'; cr.
	sites do: [ :each |
		stream nextPutAll: each first asString; tab; nextPutAll: each second asString; tab; nextPutAll: each third asString; cr ].

	^ stream contents
]
