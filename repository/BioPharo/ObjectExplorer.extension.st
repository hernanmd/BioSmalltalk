Extension { #name : #ObjectExplorer }

{ #category : #'*biopharo' }
ObjectExplorer >> buildWindowFor: anObject label: label [

	| window listMorph |
	
	window := (self windowHost labelled: label) model: self.
	window 
		addMorph: (listMorph := self explorerListMorph)
		frame: (0@0 corner: 1@0.8).
	window 
		addMorph: self explorerCodeMorph
		frame: (0@0.8 corner: 1@1).
	listMorph autoDeselect: false.
     ^ window
]

{ #category : #'*biopharo' }
ObjectExplorer >> explorerCodeMorph [

	^ ( PluggableTextMorph 
			on: self 
			text: #trash 
			accept: #trash:
			readSelection: #contentsSelection 
			menu: #codePaneMenu:shifted:)
				askBeforeDiscardingEdits: false
]

{ #category : #'*biopharo' }
ObjectExplorer >> explorerListMorph [

	^ SimpleHierarchicalListMorph 
			on: self
			list: #getList
			selected: #getCurrentSelection
			changeSelected: #noteNewSelection:
			menu: #genericMenu:
			keystroke: #explorerKey:from:
]

{ #category : #'*biopharo' }
ObjectExplorer >> genericMenu: aMenu [ 
	"Borrow a menu from my inspector"
	| insideObject menu parentObject |
	currentSelection
		ifNil: [menu := aMenu.
			menu
				add: '*nothing selected*'
				target: self
				selector: #yourself]
		ifNotNil: [insideObject := self object.
			parentObject := self parentObject.
			inspector := rootObject inspectorClass basicNew.
			inspector 
					inspect: parentObject;
				 	object: insideObject;
					initialize.
			aMenu defaultTarget: inspector.
			inspector fieldListMenu: aMenu.
			aMenu items
				do: [:i | (#(#inspectSelection #exploreSelection #referencesToSelection #defsOfSelection #objectReferencesToSelection #explorePointers) includes: i selector)
						ifTrue: [i target: self]].
			aMenu addLine;
				add: 'monitor changes'
				target: self
				selector: #monitor:
				argument: currentSelection].
	monitorList isEmptyOrNil
		ifFalse: [aMenu addLine;
				add: 'stop monitoring all'
				target: self
				selector: #stopMonitoring].
	^ aMenu
]

{ #category : #'*biopharo' }
ObjectExplorer >> windowHost [

	^ StandardWindow
]
