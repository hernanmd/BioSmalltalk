accessing
addGene: aBioObject
	" Store aBioObject as gene in the receiver's genes "
	
	^ aBioObject addToBioGenome: self