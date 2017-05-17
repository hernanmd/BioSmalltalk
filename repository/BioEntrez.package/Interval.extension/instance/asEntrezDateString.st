*BioEntrez
asEntrezDateString
	" Answer a <String> representing a Molecular Weight for an Entrez query "
	
	^ self first asEntrezDateString , ':' , self last asEntrezDateString