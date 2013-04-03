accessing
materialize: aLocationString

	| materialization |
	
	self bioLog: 'Materializing...' translated.
	materialization := (self for: aLocationString) materialize.
	self bioLog: 'done' translated.
	^ materialization
