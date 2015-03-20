accessing
atMatchClass: className put: instanceObject
	" Classify instanceObject into the receiver's matches at className "
	
	self matches 
		at: className
		ifPresent: [ : elem | (matches at: className) add: instanceObject ]
		ifAbsent: [
			matches 
				at: className
				put: (OrderedCollection new add: instanceObject; yourself) ].