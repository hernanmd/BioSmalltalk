"
SAX parser with filtering capabilities. This should be moved to a  XMLPullParser implementation

Instance Variables:
	current	<String>
"
Class {
	#name : #BioEntrezResultParser,
	#superclass : #BioSAXParser,
	#category : 'BioParsers-Core'
}

{ #category : #content }
BioEntrezResultParser >> characters: aString [
	" See superimplementor´s comment "

	catchNodes
		ifTrue: [ results add: aString ].
	self catchOff.

]

{ #category : #private }
BioEntrezResultParser >> estimatedResultSize [
	" Private - See superimplementor's comment "
	
	^ 20
]

{ #category : #private }
BioEntrezResultParser >> resultClass [
	" Private - See superimplementor's comment "
	
	^ OrderedCollection
]

{ #category : #accessing }
BioEntrezResultParser >> startElement: elementName attributeList: attributeList [
	" Private - See superimplementor's comment "
	
	(self selectedNodes includes: elementName) ifFalse: [ ^ self ].
	self catchOn.
	current := elementName

]

{ #category : #accessing }
BioEntrezResultParser >> startElement: elementName attributes: attributeList [
	" Private - See superimplementor's comment "
	
	(self selectedNodes includes: elementName)
		ifFalse: [ ^ self ].
	self catchOn.			
	current := elementName
]
