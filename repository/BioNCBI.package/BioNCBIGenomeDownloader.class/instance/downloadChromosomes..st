downloading
downloadChromosomes: chrInterval
	" Download the chromosome number chrNumber in the current directory "

	[ 
		chrInterval 
			do: [ : chrId | 		
				self chr: chrId.			
				self connectionSettings serverDirectory: self defaultDirectory.
				self download  ]
			displayingProgress: 'Downloading ' , self organismName , ' chromosomes...' 
	]
 		forkAt: Processor userBackgroundPriority 
		named: 'Downloading ' , self organismName , ' chromosome '