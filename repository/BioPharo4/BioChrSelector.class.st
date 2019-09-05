"
Helper class to select an organism and its corresponding chromosome(s)

Answer an <Association> with the resulting selection.

| selector |
selector := BioChrSelector open.
selector selection

"
Class {
	#name : #BioChrSelector,
	#superclass : #BioSpcSelector,
	#instVars : [
		'organismList',
		'chrList'
	],
	#category : 'BioPharo4-Core'
}

{ #category : #specs }
BioChrSelector class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newColumn: [ : col |
			col 
				newRow: [ : row |
					row
						newColumn: #organismList width: 200;
						addVSplitter;				
						newColumn: #chrList ];
				newRow: #toolbar height: self toolbarHeight ];
		yourself

]

{ #category : #opening }
BioChrSelector class >> open [
	" Display the receiver "

	| newSelector |
	
	newSelector := self new.
	newSelector
		openWithSpec;
		centered.
	newSelector window modalRelativeTo: World.
	newSelector window whenClosedDo: [ ^ newSelector chrList selectedItem ].
	^ newSelector.
]

{ #category : #accessing }
BioChrSelector >> chrList [
	^ chrList
]

{ #category : #accessing }
BioChrSelector >> chrList: anObject [
	chrList := anObject
]

{ #category : #private }
BioChrSelector >> chromosomeListFor: anOrganismString [

	| maxChrNum |
		
	maxChrNum := BioSpeciesLists faoSpeciesWithChr at: anOrganismString.
	^ (OrderedCollection with: 'All')
			addAll: (1 to: maxChrNum) asOrderedCollection;
			yourself
]

{ #category : #initialization }
BioChrSelector >> initializePresenter [
	" Private - See superimplementor's comment "

	self organismList 
		whenSelectedItemChanged: [ : selOrg | self chrList items: (self chromosomeListFor: selOrg) ].

]

{ #category : #initialization }
BioChrSelector >> initializeWidgets [
	" Private - See superimplementor's comment "

	super initializeWidgets.
	self instantiateModels: #(
		organismList 	SpcLabeledList 
		chrList 			SpcLabeledList).
	self organismList
		items: BioSpeciesLists faoSpeciesWithChr keys;
		label: 'Select Organism'.
	self chrList
		label: 'Select Chromosome(s)';
		beMultipleSelection.

]

{ #category : #accessing }
BioChrSelector >> organismList [
	^ organismList
]

{ #category : #accessing }
BioChrSelector >> organismList: anObject [
	organismList := anObject
]

{ #category : #accessing }
BioChrSelector >> selection [
	" Answer an <Association> with the selected organism <String> and the selected chromosome <Integer> "
	
	^ self organismList selectedItem -> self chrList selectedItem
]

{ #category : #api }
BioChrSelector >> title [
	" Private - See superimplementor's comment "

	^ 'Organism/Chromosome(s) Selector'
]
