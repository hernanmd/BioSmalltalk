instance creation
on: aMatrix rowMap: rowReindexing columnMap: columnReindexing

	^(super on: aMatrix)
		setRowMap: rowReindexing;
		setColumnMap: columnReindexing;
		yourself.