accessing
expectHigh: aFloat
	" High expect value threshold for formatting "
	
	self clientUrl queryAt: 'EXPECT_HIGH' put: aFloat asString