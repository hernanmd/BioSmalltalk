accessing
setParameters: aQueryString
	" Add or modify aQueryString in the receiver's parameters "

	| paramName |
	
	paramName := aQueryString copyUpTo: $=.
	( self parameters includes: paramName )
		ifFalse: [ self addParameters: aQueryString ]
		ifTrue: [ 
			| params pos |
			params := self path last findTokens: self urlTokens keep: self urlTokens.
			pos := ( params indexOf: paramName ) + 2.
			params at: pos put: ( aQueryString copyAfter: $= ).
			self path removeLast.
			self path addLast: ( params joinUsing: String empty ) ]
