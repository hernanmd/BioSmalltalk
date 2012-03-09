initialize-release
initialize
	" Private - See superimplementor's comment "

	parser := self parserForIdentifier , 
				$| asParser , 
				self databaseParser ,
				$| asParser ,
				self localIdParser