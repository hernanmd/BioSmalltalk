testing
testUsingOSInterfaceAdapter

	self assert: ( BioOSInterfaceEngine hasAnyProvider isKindOf: Boolean ).
	
	( BioOSInterfaceEngine hasAnyProvider isKindOf: Boolean )
		ifFalse: [ self inform: 'Cannot test OS interface engine, no providers available' translated ]
		ifTrue: [ 
			adapter := BioOSInterfaceEngine adapter.
			self deny: adapter isNil.].

	self assert: ( adapter isRunningInWindows isKindOf: Boolean ).
	self assert: ( adapter isRunningInUnix isKindOf: Boolean ).
	self assert: ( adapter isRunningInMac isKindOf: Boolean)
			

