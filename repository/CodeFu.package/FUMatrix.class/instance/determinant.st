arithmetic
determinant
	| a11 a12 a21 a22 |
	[ self hasDimension: 2@2 ] assert.
	a11 := self atPoint: 1@1.
	a12 := self atPoint: 1@2.
	a21 := self atPoint: 2@1.
	a22 := self atPoint: 2@2.

	^(a11 * a22) - (a12 * a21).