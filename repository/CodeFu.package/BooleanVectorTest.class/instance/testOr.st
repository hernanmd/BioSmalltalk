running
testOr

	| w vw |
	v := BooleanVector withAll: #(false false true true false false true true).
	w := BooleanVector withAll: #(false true false true true false true false).

	vw := v | w.

	self assert: vw size = 8.
	self assert: (vw asArray = #(false true true true true false true true)).