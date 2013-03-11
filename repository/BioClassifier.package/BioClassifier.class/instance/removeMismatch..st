accessing
removeMismatch: anEvent
	" Private - needsWork, anEvent should be the real object to remove "

	self mismatches 
			remove: anEvent object
			ifAbsent: [ BioObject alert: 'Already removed' translated ]