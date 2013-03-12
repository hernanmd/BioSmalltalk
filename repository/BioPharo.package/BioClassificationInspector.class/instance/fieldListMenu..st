menu
fieldListMenu: aMenu

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
