properties - input/output
treeFileName: fileName  
	" Set the tree file containing the Newick string "

	self propertyAt: 'treeFileName' ifAbsentPut: [ fileName ]