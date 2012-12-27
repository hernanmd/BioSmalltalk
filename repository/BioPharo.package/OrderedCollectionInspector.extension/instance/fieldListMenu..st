*biopharo
fieldListMenu: aMenu
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


