"
Test class for BioISAGPanel. Validates ISAG-FAO microsatellite marker panel data for all supported species including cattle, buffaloes, sheep, goats, pigs, horses, donkeys, camelids, chickens, and dogs.
"
Class {
	#name : 'BioISAGPanelTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioTools-Tests-Panels',
	#package : 'BioTools-Tests',
	#tag : 'Panels'
}

{ #category : 'testing' }
BioISAGPanelTest >> testCattleMarkers [

	| markers |
	markers := BioISAG_STRPanel markersForCattle.
	self assert: markers size equals: 30.
	self assert: markers first name equals: 'INRA063'.
	self assert: markers first start equals: 167.
	self assert: markers first end equals: 189
]

{ #category : 'testing' }
BioISAGPanelTest >> testMarkersForSpecies [

	| species |
	self assert: BioISAG_STRPanel markersForSpecies size equals: 10.
	species := BioISAG_STRPanel markersForSpecies keys.
	self assert: (species includes: 'cattle').
	self assert: (species includes: 'buffaloes').
	self assert: (species includes: 'sheep').
	self assert: (species includes: 'goat').
	self assert: (species includes: 'pig').
	self assert: (species includes: 'horse').
	self assert: (species includes: 'donkey').
	self assert: (species includes: 'camelid').
	self assert: (species includes: 'chicken').
	self assert: (species includes: 'dog')
]

{ #category : 'testing' }
BioISAGPanelTest >> testNewSpeciesMarkers [

	| horseMarkers buffaloMarkers camelidMarkers donkeyMarkers chickenMarkers |
	horseMarkers := BioISAG_STRPanel markersForHorse.
	self assert: horseMarkers size equals: 29.
	self assert: horseMarkers first name equals: 'HMS07'.
	buffaloMarkers := BioISAG_STRPanel markersForBuffaloes.
	self assert: buffaloMarkers size equals: 29.
	self assert: buffaloMarkers first name equals: 'CSSM033'.
	camelidMarkers := BioISAG_STRPanel markersForCamelid.
	self assert: camelidMarkers size equals: 25.
	self assert: camelidMarkers first name equals: 'CMS9'.
	donkeyMarkers := BioISAG_STRPanel markersForDonkey.
	self assert: donkeyMarkers size equals: 30.
	self assert: donkeyMarkers first name equals: 'HMS07'.
	chickenMarkers := BioISAG_STRPanel markersForChicken.
	self assert: chickenMarkers size equals: 30.
	self assert: chickenMarkers first name equals: 'ADL0268'
]

{ #category : 'testing' }
BioISAGPanelTest >> testPopulatePanels [

	BioISAG_STRPanel table: nil.
	BioISAG_STRPanel populatePanels.
	self assert: BioISAG_STRPanel table size equals: 10.
	self assert: (BioISAG_STRPanel table at: 'cattle') size equals: 30.
	self assert: (BioISAG_STRPanel table at: 'buffaloes') size equals: 29.
	self assert: (BioISAG_STRPanel table at: 'horse') size equals: 29.
	self assert: (BioISAG_STRPanel table at: 'chicken') size equals: 30
]
