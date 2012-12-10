printing
storeSparseBinaryOn: aBinaryStream 
	" No senders found "
	" self needsWork "

"	| stream |
	stream := NetworkByteOrderStream wrap: aBinaryStream.
	stream
		nextLongPut: self rowSize;
		nextLongPut:  self columnSize;
		nextLongPut:  self sparseSize.
	self columns do: [ :column |
		stream nextLongPut: column sparseSize.
		column doSparseWithIndex: [ :value :index |
			stream nextLongPut: index - 1; nextFloatPut: value.
		].
	]."