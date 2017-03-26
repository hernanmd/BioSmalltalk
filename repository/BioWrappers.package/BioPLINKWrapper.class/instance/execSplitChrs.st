executing
execSplitChrs
	" Execute the receiver for each chromosome from the first chromosome to last chromosome accordingly to the receiver's configured organism "
	
	1 to: self findMaxChrNum do: [ : chrNum |
		self 
			chr: chrNum;
			execute ]