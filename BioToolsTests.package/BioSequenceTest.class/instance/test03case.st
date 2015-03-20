testing
test03case

	self assert: ( self sequence asUppercase asString allSatisfy: [: car | car isUppercase ] ).
	self assert: ( self sequence asLowercase asString allSatisfy: [: car | car isLowercase ] ).	