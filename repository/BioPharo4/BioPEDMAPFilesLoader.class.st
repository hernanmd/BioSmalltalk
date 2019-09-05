"
A helper window to load .PED and .MAP files.

BioPEDMAPFilesLoader open

"
Class {
	#name : #BioPEDMAPFilesLoader,
	#superclass : #ComposableModel,
	#instVars : [
		'toolbar',
		'mapFile',
		'populationNameTextEdit',
		'pedFile',
		'textFieldForPed',
		'textFieldForMap',
		'actionBlock'
	],
	#category : 'BioPharo4-Core'
}

{ #category : #spec }
BioPEDMAPFilesLoader class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed
		newRow: [ : c | 
				c 
					newColumn: [ : r | r 
						add: #populationNameTextEdit 	height: self toolbarHeight;
						add: #textFieldForPed				height: self toolbarHeight;
						add: #textFieldForMap				height: self toolbarHeight;
						add: #toolbar						height: self toolbarHeight
					] 
		].
]

{ #category : #opening }
BioPEDMAPFilesLoader class >> open [

	^ self new open
]

{ #category : #opening }
BioPEDMAPFilesLoader class >> openWithOwner: anObject [

	^ self new
		owner: anObject;
		openWithSpec;
		extent: 350 @ 650
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> actionBlock [
	^ actionBlock
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> actionBlock: anObject [
	actionBlock := anObject
]

{ #category : #private }
BioPEDMAPFilesLoader >> addPEDMAPFiles [
	" Private - Add all receiver's phased files to workflow manager "
	
	self validateParameters
		ifFalse: [ ^ self ].
	self actionBlock isNil 
		ifTrue: [ ^ self pedFile -> self mapFile ]
		ifFalse: [ self actionBlock value: self pedFile value: self mapFile ].
"		addPopulationName: self populationNameTextEdit pendingText;
		addInputFile: self pedFile , self populationNameTextEdit pendingText;
		addInputFile: self mapFile , self populationNameTextEdit pendingText.
"	self informUser.


]

{ #category : #api }
BioPEDMAPFilesLoader >> extent [

	^ 700 @ 150
]

{ #category : #private }
BioPEDMAPFilesLoader >> informUser [

	(self confirm: 'PED and MAP files added. Do you want to load additional populations?')
		ifFalse: [ self delete ]
		ifTrue: [ 
			self problemPopulationCheck state: false.
			self textFieldForPed clearText.
			self textFieldForMap clearText.
			self populationNameTextEdit clearText  ]


]

{ #category : #initialization }
BioPEDMAPFilesLoader >> initializePresenter [
	" Private - See superimplementor's comment "
	
	super initializePresenter.
	self toolbar firstButtonAction: [ ].
	self toolbar secondButtonAction: [ ^ self addPEDMAPFiles ].
	self toolbar thirdButtonAction: [ self delete ].
]

{ #category : #initialization }
BioPEDMAPFilesLoader >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		populationNameTextEdit	SpcLabeledTextField
		textFieldForPed				SpcLabeledTextFieldWithBrowseButton					
		textFieldForMap				SpcLabeledTextFieldWithBrowseButton
		toolbar						SpcThreeButtonToolbar).

	self setWidgetProperties.		
	self setFocusOrder.

]

{ #category : #accessing }
BioPEDMAPFilesLoader >> mapFile [
	^ sampleFile
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> mapFile: anObject [
	sampleFile := anObject
]

{ #category : #opening }
BioPEDMAPFilesLoader >> open [

	^ self 
		openWithSpec;
		centered
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> pedFile [
	^ pedFile
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> pedFile: anObject [
	pedFile := anObject
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> populationNameTextEdit [
	^ populationNameTextEdit
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> problemPopulationName [

	^ self owner problemPopulationName
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> problemPopulationName: aString [

	^ self owner problemPopulationName: aString

]

{ #category : #initialization }
BioPEDMAPFilesLoader >> setFocusOrder [

	self focusOrder
		add: populationNameTextEdit;
		add: textFieldForPed;
		add: textFieldForMap;
		add: toolbar.

]

{ #category : #initialization }
BioPEDMAPFilesLoader >> setWidgetProperties [

	self populationNameTextEdit 
		label: 'Population';
		ghostText: 'Enter population name'.

	self textFieldForPed 
		label: '.PED File';
		fileExtension: 'ped';
		textFieldWidth: self textFieldWidth;
		whenTextChanged: [ : fileName | self pedFile: fileName ].
		
	self textFieldForMap 
		label: '.MAP File';
		fileExtension: 'map';
		textFieldWidth: self textFieldWidth;
		whenTextChanged: [ : fileName | self mapFile: fileName ].
				
	self toolbar
		firstButtonLabel: 'Help';
		secondButtonLabel: 'Load';
		thirdButtonLabel: 'Close'.
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> textFieldForMap [
	^ textFieldForMap
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> textFieldForMap: anObject [
	textFieldForMap := anObject
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> textFieldForPed [
	^ textFieldForPed
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> textFieldForPed: anObject [
	textFieldForPed := anObject
]

{ #category : #api }
BioPEDMAPFilesLoader >> textFieldWidth [
	" Answer a <Number> used for setting the width of file text field "
	
	^ 800
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> title [

	^ 'Load PED/MAP Files'
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> toolbar [
	^ toolbar
]

{ #category : #accessing }
BioPEDMAPFilesLoader >> toolbar: anObject [
	toolbar := anObject
]

{ #category : #private }
BioPEDMAPFilesLoader >> validateParameters [

	self populationNameTextEdit pendingText
		ifEmpty: [ self informMessage: 'Population name cannot be empty'.
			^ false ].
	self textFieldForPed pendingText 
		ifEmpty: [ self informMessage: 'PED file must be selected'.
			^ false ].
	self textFieldForMap pendingText 
		ifEmpty: [ self informMessage: 'MAP file must be selected'.
			^ false ].
	^ true
		
]
