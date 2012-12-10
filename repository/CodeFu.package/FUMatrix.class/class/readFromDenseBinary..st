instance creation
readFromDenseBinary: aBinaryStream

	" No senders found "
	" self needsWork "

"	| m n matrix stream |
	stream := NetworkByteOrderStream wrap: aBinaryStream.
	m := stream nextLong.
	n := stream nextLong.
	matrix := self rows: m columns: n.
	1 to: m do: [ :row |
		1 to: n do: [ :column |
			matrix at: row and: column put: (stream nextFloat).
		]
	].
	^matrix"