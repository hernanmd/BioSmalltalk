*hapax
isEnglishStopword

	^self size < 2 or: [ Stopwords isEnglishStopword: self ]