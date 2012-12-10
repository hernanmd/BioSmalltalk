vector functions
dotProduct: aVector
	"comment stating purpose of message"

	| sum |
	(aVector hasSize: self size) ifFalse: [ ^self noMatchError ].
	sum := 0.
	self with: aVector do: [ :a :b | sum := sum + (a * b) ].
	^sum.