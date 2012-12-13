*BioTools
withoutBlanks
	"Return a copy of the receiver with leading/trailing blanks removed
	 and white spaces condensed."

	| trimmed |
	trimmed := self trimBoth.
	^ String streamContents: [:stream |
		trimmed do: [:c | c == Character space ifFalse: [stream nextPut: c] ]].

	" ' abc  d   ' withoutBlanks "
