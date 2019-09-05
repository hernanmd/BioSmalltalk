Class {
	#name : #HXEnglishCorpus,
	#superclass : #Corpus,
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #removing }
HXEnglishCorpus >> removeStopwords [

	documents do: [ :each |
		each removeEnglishStopwords ]
]
