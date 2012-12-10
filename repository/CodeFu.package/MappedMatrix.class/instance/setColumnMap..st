initialize-release
setColumnMap: mapping

	columnMap := mapping ifNil: [ NumberMapping new: matrix columnSize ]