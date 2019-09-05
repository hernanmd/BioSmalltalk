Class {
	#name : #BinaryTermFrequency,
	#superclass : #LocalWeighting,
	#category : 'Hapax'
}

{ #category : #accessing }
BinaryTermFrequency >> abbreviation [

	^'bin'
]

{ #category : #weighting }
BinaryTermFrequency >> forValue: value [

	^value sign
]
