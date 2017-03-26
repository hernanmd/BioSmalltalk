executing
execSplitFams
	" Execute the receiver splitting each family "
	
	self famNames do: [ : famName |
		self 
			keepFam: famName;
			execute ]