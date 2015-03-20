testing
test01CompleteRequest

	self assert: ( self parserForRID parse: BioWebBlastSamples new qbreq1Html ) = 'HZ50WJZT01N'.
	self assert: ( self parserForRTOE parse: BioWebBlastSamples new qbreq1Html ) = '10'	