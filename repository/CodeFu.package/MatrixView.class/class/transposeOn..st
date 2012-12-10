instance creation
transposeOn: matrix

	^(self new: matrix dimension transpose)
		setMatrix: matrix;
		setMapBlock: [ :row :column | column @ row ];
		yourself