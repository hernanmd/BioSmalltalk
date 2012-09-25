testing
test03Adapters

	self adapterEngines do: [: sCls | 
		self assert: sCls adapterClass isBehavior.
		self deny: sCls adapter isBehavior ].

