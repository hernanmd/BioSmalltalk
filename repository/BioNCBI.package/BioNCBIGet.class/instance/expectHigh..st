accessing
expectHigh: aFloatString
	" High expect value threshold for formatting "
	
	self clientUrl addParameters: 'EXPECT_HIGH=' , aFloatString