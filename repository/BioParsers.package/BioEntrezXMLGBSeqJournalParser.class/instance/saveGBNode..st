private
saveGBNode: collectionOfNodeAssociation

	| assoc |
	
	assoc := collectionOfNodeAssociation first.
"	self haltIf: [ assoc key = 'GBXref_id' ]."
	self matches 
		at: assoc key 
		ifPresent: [: match | self matches at: (self newIdForKey: assoc key) put: assoc value ]
		ifAbsent: [ self matches at: assoc key put: assoc value  ].
