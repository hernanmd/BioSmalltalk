accessing public - commands
treeForGroup: groupString
	" Set ther receiver's node id for the tree structure service "

	self nodeId:  (self 
		groupName: groupString;
		groupSearch).
	self treeSearch
