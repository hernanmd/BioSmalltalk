Class {
	#name : #BioSpcSelector,
	#superclass : #ComposablePresenter,
	#instVars : [
		'toolbar'
	],
	#category : #'BioPharo7-Spec'
}

{ #category : #opening }
BioSpcSelector class >> open [
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

{ #category : #initialization }
BioSpcSelector >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(toolbar SpcTwoButtonToolbar).
	self toolbar
		firstButtonLabel: 'Ok';
		firstButtonAction: [ self window close ];
		secondButtonLabel: 'Cancel';
		secondButtonAction: [ self delete ].

]

{ #category : #accessing }
BioSpcSelector >> toolbar [
	^ toolbar
]

{ #category : #accessing }
BioSpcSelector >> toolbar: anObject [
	toolbar := anObject
]
