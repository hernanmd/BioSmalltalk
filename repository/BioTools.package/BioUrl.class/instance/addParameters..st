deprecate
addParameters: aQueryString
	" Append aQueryString as the receiver's database name "

	| params queryField |
	^ (params := (aQueryString findTokens: '=')) size = 2
		ifTrue: [ queryField := params first first = $& 
					ifTrue: [ params first allButFirst ]
					ifFalse: [ params first ].
			self & (queryField -> params last) ]
		ifFalse: [ self error ]