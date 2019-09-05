Class {
	#name : #BioNCBIXMLBlastParser,
	#superclass : #BioXMLParser,
	#category : 'BioParsers-XML'
}

{ #category : #'initialize-release' }
BioNCBIXMLBlastParser >> initializeWith: aString [
	" Private - Set the receiver's parser "
	
	super initialize.
	self expression: aString.
	parser := XMLPullParser parse: self expression.
]

{ #category : #accessing }
BioNCBIXMLBlastParser >> scanHits [
	" Private - Scan and save the selected receiver's expression hit nodes "

	[ parser isEndTag: 'Hit' ]
		whileFalse: [ 
			( self selectedNodes includes: parser tag )
				ifTrue: [ self saveTag: parser tag value: parser text ].
			parser next ]
]

{ #category : #accessing }
BioNCBIXMLBlastParser >> tokenizeHeader [
	" Parse the receiver expression and answer the header nodes found "

	self formatter: BioXMLDictionary new.
	[ parser isStartTag: 'BlastOutput_iterations' ]
		whileFalse: [ 
			parser next.
			(parser textWhileNotTag: 'BlastOutput_iterations')
				ifNotNil: [ : node | self saveTag: node key value: node value ] ].
	^ self results
]

{ #category : #accessing }
BioNCBIXMLBlastParser >> tokenizeHits [
	" Parse the receiver expression and answer the selected nodes found "

	self tokenizeNodes: self selectedNodes.
	^ self result
]
