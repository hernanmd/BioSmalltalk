executing
execSplitChrs
	" Execute the receiver for each chromosome from the first chromosome to last chromosome accordingly to the receiver's configured organism "
	
	| filenamePrefix |
	
	filenamePrefix := self out.
	(1 to: self findMaxChrNum) 
		do: [ : chrNum |
			self 
				out: (self cwd , filenamePrefix , chrNum asString);
				chr: chrNum;
				execute ]
		displayingProgress: 'Splitting chromosomes...'