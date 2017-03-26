executing
execSplitChrsFrom: chrStart to: chrEnd
	" Execute the receiver for each chromosome from chrStart to chrEnd "

	chrStart to: chrEnd do: [ : chrNum |
		self 
			chr: chrNum;
			execute ]