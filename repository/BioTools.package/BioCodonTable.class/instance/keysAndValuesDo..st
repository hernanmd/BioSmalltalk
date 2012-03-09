accessing
keysAndValuesDo: aBlock
	"Enumerate the receiver with all the keys and values passed to the block"
	
	^ self table keysAndValuesDo: aBlock