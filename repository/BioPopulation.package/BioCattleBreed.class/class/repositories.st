accessing
repositories
	" Answer a <Collection> with receiver's subclasses acting as repositories "
	
	^ self subclasses collect: #isRepository