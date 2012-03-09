accessing
values: aNodeName
	" Answer the receiver's value if aNodeName is the receiver's name "
	
	^ self nodeName = aNodeName
		ifTrue: [ self blastValue ]
