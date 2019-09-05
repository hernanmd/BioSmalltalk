Extension { #name : #OrderedCollectionInspector }

{ #category : #'*biopharo' }
OrderedCollectionInspector >> bioRemoveAll [
	" Remove all elements from the receiver's object contents "
	
	^ self object removeAll
]

{ #category : #'*biopharo' }
OrderedCollectionInspector >> fieldList [
	object ifNil: [ ^ OrderedCollection new].

	"Guard against incomplete object. You can not ask its size."
	[ object instVarAt: 3 ]
	on: SubscriptOutOfBounds 
	do: [ : ex | ^ self instVarFieldList ].
	
	(object instVarAt: 3) "lastIndex"
		ifNil: [ ^ self baseFieldList ].
		
	^ self instVarFieldList
"
OrderedCollection new inspect
(OrderedCollection newFrom: #(3 5 7 123)) inspect
(OrderedCollection newFrom: (1 to: 1000)) inspect
"
]

{ #category : #'*biopharo' }
OrderedCollectionInspector >> fieldListMenu: aMenu [
	"Arm the supplied menu with items for the field-list of the receiver"

	aMenu addStayUpItemSpecial.

	aMenu addList: #(
		('Inspect (i)'						inspectSelection 		nil #smallInspectItIcon)
		('Explore (I)'						exploreSelection 		nil #smallInspectItIcon)
		('Serialize'						bioSerializeSelection 	nil #smallExportIcon)
		('Reader'						bioReadSelection 		nil #smallForwardIcon)
		('Remove All'					bioRemoveAll			nil #smallDeleteIcon)
		).

	self addCollectionItemsTo: aMenu.
	self addSmalltalkItemsTo: aMenu.

	^ aMenu



]

{ #category : #'*biopharo' }
OrderedCollectionInspector >> instVarFieldList [

	^ self baseFieldList ,
		(object size <= (self i1 + self i2)
			ifTrue: [ (1 to: object size)
						collect: [ : i | i printString]]
			ifFalse: [ (1 to: self i1) , (object size - (self i2 - 1) to: object size)
						collect: [ : i | i printString]])
]
