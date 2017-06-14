downloading
downloadChromosome: chrString
	" Download the chromosome number chrNumber in the current directory "

	self chr: chrString.
	[ 
		self connectionSettings serverDirectory: self defaultDirectory.
		self download 
	]
	 	forkAt: Processor userBackgroundPriority 
 		named: 'Downloading ' , self organismName , ' chromosome ' , self chrAsString.
