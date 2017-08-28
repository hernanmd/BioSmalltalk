accessing
availablePanels
	" Answer a <Collection> of <String> of available panels "

	^ self subclasses collect: #panelName