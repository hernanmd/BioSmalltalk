instance creation
from: top to: bottom on: matrix

	^(self new: bottom - top + 1)
		setMatrix: matrix;
		setMapBlock: [ :row :column | row@column - top + 1 ];
		yourself