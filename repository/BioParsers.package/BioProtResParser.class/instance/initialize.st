initialize-release
initialize

	parser := self parserForIdentifier , 
				( $| asParser times: 2 ) , 
				self nameParser.