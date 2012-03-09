accessing
nodesWithDescriptions
	" Answer a Collection of receiver nodes with corresponding description "
	
	| answer |
	
	answer := Dictionary new.
	self nodeNames 
		with: self nodeDescriptions 
		do: [ : nodeName : description |
				answer add: ( nodeName -> description ) ].
	^ answer