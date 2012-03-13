accessing
y

	| pos |
	pos := self attributes at: #pos ifAbsent: [^ nil].
	^ (pos findTokens: ',') second asNumber