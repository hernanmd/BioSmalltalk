Extension { #name : #String }

{ #category : #'*hapax' }
String >> asStemmed [

	^self stem
]

{ #category : #'*hapax' }
String >> isEnglishStopword [

	^self size < 2 or: [ Stopwords isEnglishStopword: self ]
]

{ #category : #'*hapax' }
String >> isSpanishStopword [

	^self size < 2 or: [ Stopwords isSpanishStopword: self ]
]

{ #category : #'*hapax' }
String >> stem [

	^Stemmer stem: self
]
