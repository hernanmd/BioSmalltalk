testing
testSettingSerializationAdapter

	self assert: ( BioSerializationEngine hasAnyProvider isKindOf: Boolean ).
	
	( BioSerializationEngine hasAnyProvider isKindOf: Boolean )
		ifFalse: [ self inform: 'Cannot test serialization engine, no providers available' translated ]
		ifTrue: [ 
			adapter := BioSerializationEngine for: 'testSerialize.obj'.

			self deny: adapter location isNil.
			self deny: adapter provider isNil.
			
			self assert: adapter provider isBehavior
				description: 'Adapter is not set with a location yet' ]

			

