initialize-release
setS: aVector setU: leftMatrix setV: rightMatrix

	S := aVector.
	U := leftMatrix.
	V := rightMatrix.
	[ S size = U columnSize ] assert.
	[ S size = V columnSize ] assert.