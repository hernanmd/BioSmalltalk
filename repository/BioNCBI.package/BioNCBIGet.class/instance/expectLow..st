accessing
expectLow: aFloatString
	" Low expect value threshold for formatting "
	
	self clientUrl addParameters: 'EXPECT_LOW=' , aFloatString