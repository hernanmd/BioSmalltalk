arithmetic
-= aNumber
	
	^self with: (self coerce: aNumber) affect: [ :a :b | a - b ]