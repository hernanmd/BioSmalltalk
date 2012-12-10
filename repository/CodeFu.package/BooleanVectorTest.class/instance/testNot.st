running
testNot

	v := BooleanVector withAll: #(false false true true false false true true).

	self assert: v not size = 8.
	self assert: (v not asArray = #(true true false false true true false false)).