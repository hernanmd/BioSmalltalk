running
testDeer90

	| corpus tdm |
	corpus := CorpusTest new testDeer90.
	tdm := self testEmpty.
	tdm addVocabulary: corpus. 

	self assert: tdm documentSize = corpus documents size.
	self assert: tdm termSize = corpus terms distinctSize.

	self assert: tdm dimension = (42@9).

	^tdm