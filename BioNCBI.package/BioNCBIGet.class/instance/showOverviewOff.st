accessing
showOverviewOff
	" Show graphical overview "
	
	self clientUrl queryAt: 'SHOW_OVERVIEW' put: 'no'