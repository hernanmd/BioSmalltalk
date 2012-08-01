accessing
scanSequences

	[ parser isEndTag: 'GBSeq' ]
		whileFalse: [ 
			( self selectedNodes includes: parser tag )
				ifTrue: [ self saveTag: parser tag value: parser text ].
			parser next ]