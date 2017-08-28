opening
openStacked: aGapSize
	" Open the receiver's window with gapSize <Number> between each grapher "

	| c |
	c := RTComposer new.
	self graphers keysAndValuesDo: [ : index : g | 
		g view: c view.
		g build.
		c group: index asString ].
	c layout: (RTVerticalLineLayout new gapSize: aGapSize).	
	self graphers keysAndValuesDo: [ : index : g | 
		c
			 nameGroup: index asString 
			as: g title ].
	c view inspect.
