Class {
	#name : #LogTermFrequency,
	#superclass : #LocalWeighting,
	#category : 'Hapax'
}

{ #category : #accessing }
LogTermFrequency >> abbreviation [

	^'log'
]

{ #category : #weighting }
LogTermFrequency >> forValue: value [

	^(value + 1) log: 2
]
