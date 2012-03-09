initialize-release
initialize

	parser := self parserForIdentifier , 
				$| asParser , 
				self countryParser , 
				$| asParser , 
				self parserForNumber.