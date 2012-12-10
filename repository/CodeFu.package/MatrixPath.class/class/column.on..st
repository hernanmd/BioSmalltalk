instance creation
column: columnIndex on: matrix 

	^(super new: matrix rowSize)
		setMatrix: matrix;
		setMapBlock: [ :index | index @ columnIndex ];
		yourself