options
aecAsZero
	" Allow nonstandard chromosome IDs. The '0' modifier causes these chromosome codes to be treated as if they had been set to zero. (This is sometimes necessary to produce reports readable by older software.) "

	self propertyAt: 'aec' ifAbsentPut: [ 0 ]