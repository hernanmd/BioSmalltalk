Class {
	#name : #BioExplorer,
	#superclass : #ObjectExplorer,
	#instVars : [
		'classifierModel',
		'searchingString',
		'useExactMatch'
	],
	#category : 'BioPharo-Platform'
}

{ #category : #'user interface' }
BioExplorer >> buildExactMatchChooser [

	| string btnHeight btnWidth |
	string := 'Exact Match' translated.
	btnHeight := StandardFonts buttonFont height + 8.
	btnWidth := 0.
	string do: [:c | btnWidth := btnWidth + (StandardFonts buttonFont widthOf: c)].
	^ ( CheckboxMorph 
			on: self
			selected: #useExactMatch
			changeSelected: #useExactMatch: )
			beCheckbox;
			vResizing: #rigid;
			height: btnHeight;
			width: btnWidth + 30;
			label: string
]

{ #category : #'user interface' }
BioExplorer >> buildSearchModeToolBar: aWindow [

	^ aWindow newToolbar: {
		self buildSearchTextMorph.
		self buildExactMatchChooser }.
]

{ #category : #'user interface' }
BioExplorer >> buildSearchTextMorph [

	^ ( EditableDropListMorph
		on: self
		list: Array empty
		selected: nil
		changeSelected: nil ) 
			addToListSel: #searchCallback:;
			hResizing: #spaceFill; 
			ghostText: 'Hit return to accept' translated.

]

{ #category : #'user interface' }
BioExplorer >> buildWindowFor: anObject label: label [

	| window listMorph toolbar |
	
	window := (self windowHost labelled: label) model: self.
	toolbar := self buildSearchModeToolBar: window.
	window 
		addMorph: toolbar
		frame: (0@0 corner: 1@0.05).
	window 
		addMorph: (listMorph := self explorerListMorph)
		frame: (0@0.05 corner: 1@0.8).
	window 
		addMorph: self explorerCodeMorph
		frame: (0@0.8 corner: 1@1).
	listMorph autoDeselect: false.
     ^ window
]

{ #category : #accessing }
BioExplorer >> classifierModel [

	^ classifierModel
]

{ #category : #accessing }
BioExplorer >> classifierModel: anObject [
	classifierModel := anObject
]

{ #category : #menus }
BioExplorer >> genericMenu: aMenu [ 
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
			inspector
				ifNil: [inspector := self inspectorClass new].
			inspector 
				classifier: self classifierModel;
				inspect: parentObject;
				object: insideObject.
			aMenu defaultTarget: inspector.
			inspector fieldListMenu: aMenu.
			aMenu items
				do: [:i | (#(#inspectSelection #exploreSelection #referencesToSelection #defsOfSelection #objectReferencesToSelection #explorePointers) includes: i selector)
						ifTrue: [i target: self]]].
	^ aMenu
]

{ #category : #accessing }
BioExplorer >> inspectorClass [
	"Answer the class of the inspector to be used on the receiver.  Called by inspect; 
	use basicInspect to get a normal (less useful) type of inspector."

	^ BioClassificationInspector
]

{ #category : #'user interface' }
BioExplorer >> searchCallback: searchString [

	| searchMethod newMismatches title |

	searchMethod := self selectSearchMethod.
	newMismatches := rootObject select: [: dict | dict perform: searchMethod with: searchString ].
	title := 'Exploring {1} mismatches for {2}' format: { newMismatches size . searchString }.
	self class new
		classifierModel: self classifierModel;
		openExplorerFor: newMismatches
		withLabel: title
]

{ #category : #accessing }
BioExplorer >> searchingString [
	^ searchingString
]

{ #category : #accessing }
BioExplorer >> searchingString: anObject [
	searchingString := anObject
]

{ #category : #'user interface' }
BioExplorer >> selectSearchMethod [
	" Private - Answer a <Symbol> to be used for selecting in sub-searches "
	
	^ self useExactMatch 
		ifTrue: [ #includes: ]
		ifFalse: [ #includesLike: ]
]

{ #category : #accessing }
BioExplorer >> useExactMatch [
	^ useExactMatch
		ifNil: [ useExactMatch := false ]
]

{ #category : #accessing }
BioExplorer >> useExactMatch: anObject [
	useExactMatch := anObject
]
