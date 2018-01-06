executing
execSplitChrsFrom: chrStart to: chrEnd
	" Execute the receiver for each chromosome from chrStart to chrEnd "

	| filenamePrefix |
	
	filenamePrefix := self out.
	(chrStart to: chrEnd) do: [ : chrNum |
		self 
			out: (self cwd , filenamePrefix , chrNum asString);		
			chr: chrNum;
			execute ]
		displayingProgress: 'Splitting chromosomes...'