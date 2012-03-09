accessing
materialize

	self provider: ( self provider readOnlyFileNamed: self location ).
	^ self provider fileInObjectAndCode