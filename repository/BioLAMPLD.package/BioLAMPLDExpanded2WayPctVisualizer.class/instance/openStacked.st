opening
openStacked
	" Open the receiver's window "

	| c |
	c := RTComposer new.
	self graphers
		keysAndValuesDo: [ :index :g | 
			g view: c view.
			g build.
			c group: index greaseString ].
	c layout: (RTVerticalLineLayout new gapSize: 20).
	self graphers
		keysAndValuesDo: [ :index :g | c nameGroup: index greaseString as: g title ].
	^ c view