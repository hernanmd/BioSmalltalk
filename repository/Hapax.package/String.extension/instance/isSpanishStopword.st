*hapax
isSpanishStopword

	^self size < 2 or: [ Stopwords isSpanishStopword: self ]