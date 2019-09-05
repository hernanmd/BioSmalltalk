"
Provides a toolbar and widget answering behavior for selection widgets.

Internal Representation and Key Implementation Points.

    Instance Variables
	toolbar:		<SpcTwoButtonToolbar>


    Implementation Points
"
Class {
	#name : #BioSpcSelector,
	#superclass : #ComposableModel,
	#instVars : [
		'toolbar'
	],
	#category : 'BioPharo4-Core'
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
