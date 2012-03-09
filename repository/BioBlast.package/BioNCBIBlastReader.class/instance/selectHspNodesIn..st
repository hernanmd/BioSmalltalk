private
selectHspNodesIn: anObject
	" Answer a BioBlastRootNode with HSP nodes parsed from anObject "

	^ BioParser parseNcbiXmlBlastNodes: anObject