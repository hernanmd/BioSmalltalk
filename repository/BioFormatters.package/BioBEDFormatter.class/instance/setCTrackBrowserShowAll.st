accessing - custom track browser
setCTrackBrowserShowAll
	" Add a description for custom tracks "

	self browser
		propertyAt: 'browser show' 
		put: 'all'