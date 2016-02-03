opening
openStacked
	" Open the receiver's window "

	| c |
	
	c := RTComposer new.
	self graphers doWithIndex: [ : g : index | 
		g view: c view.
		g build.
		c group: index asString ].
	c layout: (RTVerticalLineLayout new gapSize: 20).
	self graphers doWithIndex: [ : g : index | 
		c nameGroup: index asString as: g title ].
	^ c view