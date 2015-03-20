accessing
userCommentAt: aSymbol

	| userCommentPragma textComment |
	
	textComment := String new.
	userCommentPragma :=  ( self >> aSymbol ) pragmas 
		detect: [: pragma | pragma key = #userComment: ]
		ifNone: [ textComment := 'No description was defined for the selected method' translated ].
	textComment isEmpty
		ifTrue: [ textComment := userCommentPragma argumentAt: 1 ].
	^ textComment