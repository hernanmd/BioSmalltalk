instance creation
row: rowIndex on: matrix

	^(super new: matrix columnSize)
		setMatrix: matrix;
		setMapBlock: [ :index | rowIndex @ index ];
		yourself