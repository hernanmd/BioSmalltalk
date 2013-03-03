menu
fieldListMenu: aMenu

	aMenu addStayUpItemSpecial.
	aMenu addList: #(
		('Inspect (i)'						inspectSelection 		nil #smallInspectItIcon)
		('Explore (I)'						exploreSelection 		nil #smallInspectItIcon)
		-
		('Serialize'						bioSerializeSelection 	nil #smallExportIcon)
		('Reader'						bioReadSelection 		nil #smallForwardIcon)
		('Remove...'						bioRemoveSelection 	nil #smallDeleteIcon)											
		).

	self addCollectionItemsTo: aMenu.
	^ aMenu
