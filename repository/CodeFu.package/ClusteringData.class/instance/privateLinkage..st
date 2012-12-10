private
privateLinkage: aBlock

	indices := indices copyRemoveAtIndex: (indices indexOf: foundB0).
	indices do: [ :index0 |
		index0 = foundA0 ifFalse: [
			self at: foundA0 and: index0 put: (aBlock
				value: index0
				value: (self at: foundA0 and: index0) 
				value: (self at: foundB0 and: index0)) ].
		self unsetAt: foundB0 and: index0.
	].
	clusters at: foundA0 put: ((clusters at: foundA0) merge: (clusters at: foundB0) at: value).
	clusters at: foundB0 put: nil.