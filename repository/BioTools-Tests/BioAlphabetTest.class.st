Class {
	#name : 'BioAlphabetTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests-Alphabets',
	#package : 'BioTools-Tests',
	#tag : 'Alphabets'
}

{ #category : 'testing' }
BioAlphabetTest >> testTranslation [

	self assert: ( BioIUPACDNA		withAllSubclasses allSatisfy: [: alpha | alpha new canTranslate ] ).
	self assert: ( BioIUPACRNA		withAllSubclasses allSatisfy: [: alpha | alpha new canTranslate ] ).
	self assert: ( BioIUPACProtein	withAllSubclasses noneSatisfy: [: alpha | alpha new canTranslate ] ).
	
]
