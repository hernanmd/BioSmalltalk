instance creation
for: aBioObject
	" Answer a new instance of the receiver, initializing receiver's status and setting aBioObject as its client "
	
	^ self basicNew 
		client: aBioObject;
		initialize;
		yourself