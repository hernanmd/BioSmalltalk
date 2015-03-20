testing
test03Adapters

	self adapterEngines do: [: sCls | 
		sCls validAdapters isEmpty
			ifFalse: [ self assert: sCls adapterClass isBehavior.
					self deny: sCls adapter isBehavior ] ].

