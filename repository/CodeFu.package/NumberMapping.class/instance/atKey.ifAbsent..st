accessing
atKey: key ifAbsent: exceptionBlock
	"Returns index of an ordinal key,
	that is maps backwards from new to old 'indices'."

	^[ back at: key ]
		on: SubscriptOutOfBoundsError
		do: [ :ex | exceptionBlock value ]