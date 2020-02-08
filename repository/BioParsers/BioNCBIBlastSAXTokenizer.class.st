Class {
	#name : #BioNCBIBlastSAXTokenizer,
	#superclass : #BioNCBIBlastSAXParser,
	#category : #'BioParsers-Core'
}

{ #category : #accessing }
BioNCBIBlastSAXTokenizer >> characters: aString [
	"This call corresponds to the Java SAX call characters(char[] ch, int start, int length)."

	aString withBlanksCondensed ifNotEmpty: [
		catchNodes ifTrue: [ results add: aString ].
		current := nil. 
		self catchOff ].
]

{ #category : #private }
BioNCBIBlastSAXTokenizer >> resultClass [
	" Private - See superimplementor's comment "
	
	^ OrderedCollection
]

{ #category : #accessing }
BioNCBIBlastSAXTokenizer >> startElement: elementName attributes: attributeList [
	" Private - See superimplementor's comment "
	
	(self selectedNodes includes: elementName) 
		ifTrue: [ 
			self catchOn.
			current := elementName ].


]
