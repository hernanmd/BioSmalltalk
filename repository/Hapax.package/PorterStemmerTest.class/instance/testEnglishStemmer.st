test
testEnglishStemmer

	| data |
	data := self class porterTestData runsFailing: #isSeparator.

	1 

	timesRepeat: [ 
		1 to: data size by: 2 do: [ :index |
			| each stem |
			each := data at: index + 1.
			stem := data at: index.
			self assert: (PorterStemmer new stem: each) = stem ]]