Class {
	#name : #InverseDocumentFrequency,
	#superclass : #GlobalWeighting,
	#category : 'Hapax'
}

{ #category : #accessing }
InverseDocumentFrequency >> abbreviation [

	^'idf'
]

{ #category : #weighting }
InverseDocumentFrequency >> forTerm: aVector [

	"^1 + ((aVector size / (self documentFrequency: aVector)) log: 2)"
	^((aVector size / (self documentFrequency: aVector)) log: 2)
]
