"
Represents a satellite (repetitive) DNA sequence. Extends BioRepeatSequence with satellite-specific defaults and testing.
"
Class {
	#name : 'BioSatelliteSequence',
	#superclass : 'BioRepeatSequence',
	#category : 'BioTools-Sequences',
	#package : 'BioTools',
	#tag : 'Sequences'
}

{ #category : 'defaults' }
BioSatelliteSequence >> defaultMaxMotifSize [

	^ 6500
]

{ #category : 'defaults' }
BioSatelliteSequence >> defaultMinMotifSize [
	
	^ 100
]

{ #category : 'testing' }
BioSatelliteSequence >> isSatelliteSequence [
	" Answer <true> if the receiver represents a classic satellite sequence "
	
	^ true
]
