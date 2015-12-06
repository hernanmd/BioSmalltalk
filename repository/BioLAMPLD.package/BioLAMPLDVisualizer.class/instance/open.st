opening
open
	" Open the receiver's window "

	| c |
	
	c := RTComposer new.
	self graphers doWithIndex: [ : g : index | 
		g view: c view.
		g build.
		c group: index asString.
		c nameGroup: index asString as: index asString ].
	c layout: RTVerticalLineLayout new.
	^ c view