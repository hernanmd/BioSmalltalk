accessing
materialize: aLocationString

	| materialization |
	
	self gtLog: 'Materializing...' translated.
	materialization := ( self for: aLocationString ) materialize.
	self gtLog: 'done' translated.
	^ materialization
