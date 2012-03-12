testing
testIncludesLike

	| testString01 |
	
	testString01 := 'hola buenos dias' findTokens: Character space.
	self assert: ( testString01 includesLike: 'hole' ).
	self assert: ( testString01 includesLike: 'holas' ).
	self assert: ( testString01 includesLike: 'bueno' ).
	self assert: ( testString01 includesLike: 'buenas' ).	


