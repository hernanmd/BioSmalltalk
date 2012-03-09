initialize-release
initialize

	parser := self parserForIdentifier , 
				$| asParser , 
				self entry , 
				$| asParser ,
				self chain