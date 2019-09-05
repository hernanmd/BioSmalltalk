Class {
	#name : #BioRandomStream,
	#superclass : #BioRepeatStream,
	#instVars : [
		'random',
		'percentages'
	],
	#category : 'BioBenchmarks-Fasta'
}

{ #category : #accessing }
BioRandomStream >> next [

	| r |

	r := random next.
	repeatPtr := repeatPtr + 1.
	1 to: percentages size do: [ : i |
		(r < (percentages at: i)) ifTrue: [ ^ collection at: i ] ]
]

{ #category : #accessing }
BioRandomStream >> on: aCollection [

	| size cp |
	
	repeatPtr := 0.
	random := BioRandomNumber to: 1.0d0.
	size := aCollection size.
	percentages := Array new: size.
	collection := Array new: size.
	cp := 0.0d0.
	1 to: size do: [: i |
	  	collection at: i put: (aCollection at: i) first.
 		percentages at: i put: (cp := cp + (aCollection at: i) last) ]
]

{ #category : #accessing }
BioRandomStream >> random: aRandomNumber [
	" Share the random number generator so we can get the expected results. "
	
	random := aRandomNumber
]
