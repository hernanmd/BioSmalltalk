accessing
atMismatchesPut: anObject
	" Take an action when the receiver's subect cannot be classified "
	
	self mismatches 
		at: #all
		ifPresent: [ : elem | (mismatches at: #all) add: anObject ]
		ifAbsent: [
			mismatches 
				at: #all 
				put: (OrderedCollection new add: anObject; yourself) ].