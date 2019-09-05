Class {
	#name : #TermFrequency,
	#superclass : #LocalWeighting,
	#category : 'Hapax'
}

{ #category : #accessing }
TermFrequency >> abbreviation [

	^'tf'
]

{ #category : #weighting }
TermFrequency >> forValue: value [

	^value
]
