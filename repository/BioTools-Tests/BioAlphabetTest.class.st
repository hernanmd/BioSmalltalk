Class {
	#name : #BioAlphabetTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'alphabet'
	],
	#category : #'BioTools-Tests-Biological'
}

{ #category : #testing }
BioAlphabetTest >> testTranslation [

	self assert: ( BioIUPACDNA		withAllSubclasses allSatisfy: [: alpha | alpha new canTranslate ] ).
	self assert: ( BioIUPACRNA		withAllSubclasses allSatisfy: [: alpha | alpha new canTranslate ] ).
	self assert: ( BioIUPACProtein	withAllSubclasses noneSatisfy: [: alpha | alpha new canTranslate ] ).
	
]
