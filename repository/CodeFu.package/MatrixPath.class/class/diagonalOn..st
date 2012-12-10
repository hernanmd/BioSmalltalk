instance creation
diagonalOn: matrix

	[ matrix isSquare ] assert.
	^(super new: matrix columnSize)
		setMatrix: matrix;
		setMapBlock: [ :index | index @ index ];
		yourself