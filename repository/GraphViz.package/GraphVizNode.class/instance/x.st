accessing
x

	| pos |
	pos := self attributes at: #pos ifAbsent: [^ nil].
	^ (pos findTokens: ',') first asNumber