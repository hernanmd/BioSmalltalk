accessing
addRelation: aBioRelation changed: aBoolean
	" Add aBioRelation to the receiver's graph and relations. If aBoolean is <false> then relations is not modified "

	aBoolean
		ifTrue: [ self relations add: aBioRelation ].
	(self graph at: aBioRelation from)
		ifNil: [ self graph 
							at: aBioRelation from 
							put: Dictionary new ].
	(self graph at: aBioRelation to)
		ifNil: [ self graph 
							at: aBioRelation to 
							put: Dictionary new ].
	(self graph at: aBioRelation from) 
		at: aBioRelation to 
		put: aBioRelation relation.
	self isUndirected 
		ifTrue: [ 
			(self graph at: aBioRelation to)
				at: aBioRelation from
				put: aBioRelation relation ]
