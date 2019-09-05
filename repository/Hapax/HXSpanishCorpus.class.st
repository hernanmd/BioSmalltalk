Class {
	#name : #HXSpanishCorpus,
	#superclass : #Corpus,
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #removing }
HXSpanishCorpus >> removeStopwords [

	documents do: [ :each |
		each removeSpanishStopwords ]
]
