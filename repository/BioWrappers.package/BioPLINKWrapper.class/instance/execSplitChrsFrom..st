executing
execSplitChrsFrom: chrStart
	" Execute the receiver for each chromosome from chrStart to last chromosome accordingly to the receiver's configured organism "

	| filenamePrefix |
	
	filenamePrefix := self out.
	(chrStart to: self findMaxChrNum) do: [ : chrNum |
		self 
			out: (self cwd , filenamePrefix , chrNum asString);		
			chr: chrNum;
			execute ]
		displayingProgress: 'Splitting chromosomes...'
