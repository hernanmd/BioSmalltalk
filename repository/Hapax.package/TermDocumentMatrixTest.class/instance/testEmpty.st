running
testEmpty

	| tdm |
	tdm := TermDocumentMatrix empty.

	self assert: tdm documentSize = 0.
	self assert: tdm termSize = 0.

	self assert: tdm dimension = (0@0).

	^tdm