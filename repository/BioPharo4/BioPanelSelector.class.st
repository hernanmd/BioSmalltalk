Class {
	#name : #BioPanelSelector,
	#superclass : #BioSpcSelector,
	#instVars : [
		'organizationList',
		'organismList',
		'markersList',
		'selector'
	],
	#category : 'BioPharo4-Core'
}

{ #category : #specs }
BioPanelSelector class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newColumn: [ : col |
			col 
				newRow: #selector;
				newRow: #toolbar height: self toolbarHeight ];
		yourself

]

{ #category : #examples }
BioPanelSelector class >> example1 [

	BioPanelSelector open
]

{ #category : #opening }
BioPanelSelector class >> open [
	" Display the receiver "

	| newSelector |
	
	newSelector := self new.
	newSelector
		openWithSpec;
		centered.
	newSelector window modalRelativeTo: World.
	newSelector window whenClosedDo: [ ^ newSelector ].
	^ newSelector.
]

{ #category : #accessing }
BioPanelSelector >> dataModel [

	| dm |
	
	dm := Dictionary new.
	BioPanel subclasses do: [ : panelClass | 
			dm at: panelClass panelName put: panelClass ].
	^ dm

]

{ #category : #accessing }
BioPanelSelector >> dataModelItems [
	" Answer a <Collection> of <String> with receiver's panel names "

	^ self dataModel keys 
]

{ #category : #initialization }
BioPanelSelector >> initializeWidgets [
	" Private - See superimplementor's comment "
	
	super initializeWidgets.
	self instantiateModels: #(selector 	SpcDoubleSelectorList).

	self selector
		dataModel: self dataModel;
		selector: #at:;
		detailSelector: #markersForSpeciesAt:;
		detailListSelector: #supportedSpecies;
		selectionListItems: self dataModelItems;
		secondLabelText: 'Organism';
		label: 'Panel';
		title: 'Panel Selector'
]

{ #category : #accessing }
BioPanelSelector >> markersList [
	^ markersList
]

{ #category : #accessing }
BioPanelSelector >> markersList: anObject [
	markersList := anObject
]

{ #category : #accessing }
BioPanelSelector >> organismList [
	^ organismList
]

{ #category : #accessing }
BioPanelSelector >> organismList: anObject [
	organismList := anObject
]

{ #category : #accessing }
BioPanelSelector >> organizationList [
	^ organizationList
]

{ #category : #accessing }
BioPanelSelector >> organizationList: anObject [
	organizationList := anObject
]

{ #category : #accessing }
BioPanelSelector >> selector [
	^ selector
]

{ #category : #accessing }
BioPanelSelector >> selector: anObject [
	selector := anObject
]
