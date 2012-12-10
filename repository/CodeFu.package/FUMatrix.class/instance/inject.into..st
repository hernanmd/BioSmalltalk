enumerating
inject: value into: aBlock

	| result |
	result := value.
	self do: [:each | result := aBlock value: result value: each].
	^result