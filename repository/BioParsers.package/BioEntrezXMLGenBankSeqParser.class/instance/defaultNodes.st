accessing
defaultNodes
	" Add node names in your specific subclasses. Answer a Collection of Strings
	corresponding with the XML's DTD with the node names in which we are interested "
	
	^ #(
	" To distinguish a new record "
	'GBSeq'
	
	" Sample node names 
	'GBSeq_primary-accession'
	'GBSeq_accession-version'
	
	'GBSeq_sequence' " )