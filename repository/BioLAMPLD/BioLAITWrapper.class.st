"
(BioLAITWrapper on: 'C:\p4\newResults3\postlampld-avg-50.txt' )
	globalAverageAncestry.

"
Class {
	#name : #BioLAITWrapper,
	#superclass : #BioWrapperObject,
	#category : 'BioLAMPLD-Core'
}

{ #category : #accessing }
BioLAITWrapper >> defaultProgramName [
	" Private - See superimplementor's comment "

	^ self lait
]

{ #category : #accessing }
BioLAITWrapper >> globalAverageAncestry [

	^ ((((NeoCSVReader on: self inputFile asFileReference readStream)
		separator: Character space;
		skipHeader;
		addField;
		addFloatField;
		addFloatField;
		upToEnd) collect: #third) sum / 100) round: 4
]

{ #category : #programs }
BioLAITWrapper >> lait [

	^ 'lait.pl'
]

{ #category : #accessing }
BioLAITWrapper >> url [
	" Private - See superimplementor's comment "

	^ 'http://www.pitt.edu/~wec47/lait.html'
]
