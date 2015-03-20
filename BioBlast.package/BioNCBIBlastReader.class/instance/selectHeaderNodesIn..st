private
selectHeaderNodesIn: aDocumentString
	" Private - Answer a Collection with meta-information about the current document aDocumentStringOrLocation "
	
	^ BioParser tokenizeNcbiXmlBlastHeader: aDocumentString