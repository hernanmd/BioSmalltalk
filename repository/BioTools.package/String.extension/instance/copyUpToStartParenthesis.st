*BioTools
copyUpToStartParenthesis
	" Answer the receiver without preserving all Character's up to the first opening parenthesis

	'this is a (test)' withoutParenthesis -> 'this is a '
	'this is another (test) (with several) parenthesis' -> 'this is another'

	"
	^ (self includes: $()
		ifTrue: [ (self copyUpTo: $() trimRight ]
		ifFalse: [ self ]