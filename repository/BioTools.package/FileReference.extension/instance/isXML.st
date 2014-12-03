*BioTools
isXML
	" See superimplementor's comment "
	
	^ self isDirectory not and: [ self contents isXML ]