Class {
	#name : #BioNCBIBlastSAXParser,
	#superclass : #BioSAXParser,
	#category : #'BioParsers-Core'
}

{ #category : #'handling - content' }
BioNCBIBlastSAXParser >> characters: aString [
	" This call corresponds to the Java SAX call characters(char[] ch, int start, int length)."

	current
		ifNotNil: [ 
			aString withBlanksCondensed ifNotEmpty: [
				current blastValue: aString.
				results addNode: current ] ]
]

{ #category : #private }
BioNCBIBlastSAXParser >> estimatedResultSize [
	" Private - See superimplementor's comment "
	
	^ 500
]

{ #category : #'handling - content' }
BioNCBIBlastSAXParser >> resultClass [
	" Private - See superimplementor's comment "
	
	^ BioBlastRootNode

]

{ #category : #accessing }
BioNCBIBlastSAXParser >> selectNodes: aCollection [
	" Private - Structure nodes are added to preserve the result tree structure"

	selectedNodes := aCollection , BioBlastStructureNode nodes
]

{ #category : #'handling - content' }
BioNCBIBlastSAXParser >> startElement: elementName attributeList: attributeList [
	" Private - Included because older version of the SAX parser contains this method "

	current := nil.
	(self selectedNodes includes: elementName)
		ifTrue: [ (current := results nodeFor: elementName)
				ifNotNil: [ :arg | current addToRoot: results ] ]
]

{ #category : #'handling - content' }
BioNCBIBlastSAXParser >> startElement: elementName attributes: attributeList [
	" Probably obsolete "

	current := nil.
	(self selectedNodes includes: elementName) ifTrue: [ 
		(current := results nodeFor: elementName)
			ifNotNil: [ current addToRoot: results ] ]
]
