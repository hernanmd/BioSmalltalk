Class {
	#name : #BioNCBIBlastSAXTokenizer,
	#superclass : #BioNCBIBlastSAXParser,
	#category : #'BioParsers-Core'
}

{ #category : #'handling - content' }
BioNCBIBlastSAXTokenizer >> characters: aString [
	"This call corresponds to the Java SAX call characters(char[] ch, int start, int length)."

	aString withBlanksCondensed ifNotEmpty: [
		catchNodes ifTrue: [ results add: aString ].
		current := nil. 
		self catchOff ].
]

{ #category : #'handling - content' }
BioNCBIBlastSAXTokenizer >> resultClass [
	" Private - See superimplementor's comment "
	
	^ OrderedCollection
]

{ #category : #'handling - content' }
BioNCBIBlastSAXTokenizer >> startElement: elementName attributes: attributeList [

	(self selectedNodes includes: elementName) ifFalse: [ ^ self ].
	self catchOn.
	current := elementName
]
