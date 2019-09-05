Class {
	#name : #BioSatelliteSequence,
	#superclass : #BioRepeatSequence,
	#category : 'BioTools-Repeats'
}

{ #category : #defaults }
BioSatelliteSequence >> defaultMaxMotifSize [

	^ 6500
]

{ #category : #defaults }
BioSatelliteSequence >> defaultMinMotifSize [
	
	^ 100
]

{ #category : #testing }
BioSatelliteSequence >> isSatelliteSequence [
	" Answer <true> if the receiver represents a classic satellite sequence "
	
	^ true
]
