*biopharo
addSmalltalkItemsTo: aMenu

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
