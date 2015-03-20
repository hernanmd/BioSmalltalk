accessing
showOverviewOn
	" Show graphical overview "
	
	self clientUrl queryAt: 'SHOW_OVERVIEW' put: 'yes'