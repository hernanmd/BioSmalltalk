private-algorithm
stemIncludesVowel
	"comment stating purpose of message"

	1 to: cursor do: [:index | (self isVowelAt: index) ifTrue: [^true]].
	^false