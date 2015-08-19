accessing
hits
	" Answer a Collection with the receiver hits. If we have already filtered results, then use the hits from the last filter "
	
	^ self reader filters isEmpty
		ifTrue: [ self reader hitHspsNodes hits ]
		ifFalse: [ 
			self composeOr 
				ifTrue: [ self reader hitHspsNodes hits ]
				ifFalse: [ self reader contents result ] ]