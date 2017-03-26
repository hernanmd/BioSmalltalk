executing
execSplitChrsFrom: chrStart
	" Execute the receiver for each chromosome from chrStart to last chromosome accordingly to the receiver's configured organism "

	chrStart to: self findMaxChrNum do: [ : chrNum |
		self 
			chr: chrNum;
			execute ]