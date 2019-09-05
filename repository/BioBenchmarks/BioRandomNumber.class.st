Class {
	#name : #BioRandomNumber,
	#superclass : #Object,
	#instVars : [
		'seed',
		'scale'
	],
	#classVars : [
		'FModulus',
		'Increment',
		'Modulus',
		'Multiplier'
	],
	#category : 'BioBenchmarks-Fasta'
}

{ #category : #'class initialization' }
BioRandomNumber class >> initialize [

	super initialize.
	FModulus := 139968.0d0.
	Increment := 29573.
	Modulus := 139968.
	Multiplier := 3877
]

{ #category : #'class initialization' }
BioRandomNumber class >> to: anInteger [
   ^ self basicNew to: anInteger
]

{ #category : #accessing }
BioRandomNumber >> next [

   seed := (seed * Multiplier + Increment) \\ Modulus.
   ^ (seed * scale) / FModulus
]

{ #category : #private }
BioRandomNumber >> to: anInteger [

	seed := 42.
	scale := anInteger
]
