Class {
	#name : #BioClassificationInspector,
	#superclass : #BioInspector,
	#category : 'BioPharo-Platform'
}

{ #category : #accessing }
BioClassificationInspector >> announcer [
	^ self classifier announcer
]

{ #category : #menu }
BioClassificationInspector >> fieldListMenu: aMenu [

	aMenu addStayUpItemSpecial.
	aMenu addList: #(
		('Inspect (i)'						inspectSelection 			nil 		#smallInspectItIcon)
		('Explore (I)'						exploreSelection 			nil 		#smallInspectItIcon)
		-
		('Classify...'						bioClassifySelection: 		nil 		#smallForwardIcon)
		('Serialize'						bioSerializeSelection 		nil 		#smallExportIcon)
		('Remove...'						bioRemoveClassification 	nil 		#smallDeleteIcon)	
		).

	self addCollectionItemsTo: aMenu.

	^ aMenu

]

{ #category : #'message handling' }
BioClassificationInspector >> perform: selector orSendTo: otherTarget [
	"Selector was just chosen from a menu by a user.  If can respond, then
perform it on myself. If not, send it to otherTarget, presumably the
editPane from which the menu was invoked."

	selector isBinary
		ifTrue: [ otherTarget perform: selector with: self ]
		ifFalse: [ super perform: selector orSendTo: otherTarget ]
]
