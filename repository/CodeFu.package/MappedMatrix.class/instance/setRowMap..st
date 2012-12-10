initialize-release
setRowMap: mapping

	rowMap := mapping ifNil: [ NumberMapping new: matrix rowSize ]