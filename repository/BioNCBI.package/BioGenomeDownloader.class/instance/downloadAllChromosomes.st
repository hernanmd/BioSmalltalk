downloading
downloadAllChromosomes
	" Download all chromosomes found for the receiver "

	[ 
		self chromosomes
			do: [ : chrNum | 
				self chr: chrNum.
				self connectionSettings serverDirectory: self defaultDirectory.
				self download ]
			displayingProgress: 'Downloading all chromosomes for ' , self organismName
	]
		forkAt: Processor userBackgroundPriority 
		named: 'Downloading all chromosomes...' 