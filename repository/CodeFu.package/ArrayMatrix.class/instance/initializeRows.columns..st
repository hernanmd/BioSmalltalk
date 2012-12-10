initialize-release
initializeRows: n columns: m

	rowSize := n.
	columnSize := m.
	array := Array new: n * m.
	^self