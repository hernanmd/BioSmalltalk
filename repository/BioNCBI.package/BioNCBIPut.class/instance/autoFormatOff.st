accessing
autoFormatOff
	" Determines whether to format results automatically "
	
	self clientUrl queryAt: 'AUTO_FORMAT' put: 'Off'