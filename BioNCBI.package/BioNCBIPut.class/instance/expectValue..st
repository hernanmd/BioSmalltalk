accessing
expectValue: aFloat
	" Expect value "
	
	self clientUrl queryAt: 'EXPECT' put: aFloat asString
