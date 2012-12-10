initialize-release
setIndices: aReindexing

	indices := aReindexing ifNil: [ NumberMapping new: vector size ]