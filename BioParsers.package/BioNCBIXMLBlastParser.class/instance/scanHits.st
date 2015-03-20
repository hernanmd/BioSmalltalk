accessing
scanHits
	" Private - Scan and save the selected receiver's expression hit nodes "

	[ parser isEndTag: 'Hit' ]
		whileFalse: [ 
			( self selectedNodes includes: parser tag )
				ifTrue: [ self saveTag: parser tag value: parser text ].
			parser next ]