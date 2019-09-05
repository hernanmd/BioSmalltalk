Extension { #name : #Inspector }

{ #category : #'*biopharo' }
Inspector >> addSmalltalkItemsTo: aMenu [

	aMenu addList: #(
		-
		('Method refs to this inst var'		referencesToSelection)
		('Methods storing into this inst var'	defsOfSelection)
		('Objects pointing to this value'		objectReferencesToSelection)
		('Explore pointers'					explorePointers)
		-
		('Browse full (b)'					browseMethodFull)
		('Browse class'						browseClass)
		('Browse hierarchy (h)'				classHierarchy)
		('Browse protocol (p)'				browseFullProtocol)
		-
		('Inst var refs...'					browseInstVarRefs)
		('Inst var defs...'					browseInstVarDefs)
		('Class var refs...'					classVarRefs)
		('Class variables'					browseClassVariables)
		('Class refs (N)'						browseClassRefs)
		-
		('Copy name (c)'					copyName)		
		('Basic inspect'						inspectBasic)
		).

]

{ #category : #'*biopharo' }
Inspector >> bioReadSelection [
	" Private - (Pharo 1.3) Sent from #fieldListMenu:
	Answer a Reader over the current selected item in the receiver "

	^ self object bioReader explore
]

{ #category : #'*biopharo' }
Inspector >> bioSerializeSelection [
	" Private - (Pharo 1.3) Sent from #fieldListMenu:
	Serialize the current selected item in the receiver "

	| fileName |
	fileName := self object class name , '-' , BioObject currentSeconds , '.obj'.
	^ (BioSerializationEngine for: fileName) serialize: self object
]

{ #category : #'*biopharo' }
Inspector >> fieldListMenu: aMenu [
	"Arm the supplied menu with items for the field-list of the receiver"

	aMenu addStayUpItemSpecial.
	aMenu addList: #(
		('Inspect (i)'						inspectSelection 		nil #smallInspectItIcon)
		('Explore (I)'						exploreSelection 		nil #smallInspectItIcon)
		('Serialize'						bioSerializeSelection 	nil #smallExportIcon)
		('Reader'						bioReadSelection 		nil #smallForwardIcon)					
		).
	self addCollectionItemsTo: aMenu.
	self addSmalltalkItemsTo: aMenu.
	^ aMenu



]

{ #category : #'*biopharo' }
Inspector >> inspectElement [
	"Create and schedule an Inspector on an element of the receiver's model's currently selected collection."
	| sel selSize countString count nameStrs |
	self selectionIndex = 0 ifTrue: [ ^ self changed: #flash ].
	((sel := self selection) isKindOf: SequenceableCollection) ifFalse: 
		[ (sel isKindOf: MorphExtension) ifTrue: [ ^ sel inspectElement ].
		^ sel inspect ].
	(selSize := sel size) = 1 ifTrue: [ ^ sel first inspect ].
	selSize <= 20 ifTrue: 
		[ nameStrs := (1 to: selSize) asArray collect: 
			[ :ii | 
			ii printString , '   ' , (((sel at: ii) printStringLimitedTo: 25) 
					replaceAll: Character cr
					with: Character space) ].
		count := UIManager default 
			chooseFrom: nameStrs asString substrings
			title: 'which element?'.
		count = 0 ifTrue: [ ^ self ].
		^ (sel at: count) inspect ].
	countString := UIManager default 
		request: 'Which element? (1 to ' , selSize printString , ')'
		initialAnswer: '1'.
	countString isEmptyOrNil ifTrue: [ ^ self ].
	count := Integer readFrom: countString readStream.
	(count > 0 and: [ count <= selSize ]) 
		ifTrue: [ (sel at: count) inspect ]
		ifFalse: [ Beeper beep ]
]
