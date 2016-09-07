accessing-blast
hits
	" Answer a <Collection> with all the HIT nodes from the receiver's results "

	^ self filters isEmpty
		ifTrue: [ self hitHspsNodes hits. ]
		ifFalse: [ self lastFilter lastResult ]
