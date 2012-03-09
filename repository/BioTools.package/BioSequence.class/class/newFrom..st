instance creation
newFrom: aPath
	" Answer a new instance of the receiver reading from aPath "
	
	^ self new initializeFrom: aPath