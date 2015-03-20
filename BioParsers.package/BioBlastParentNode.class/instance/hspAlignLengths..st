accessing hsps
hspAlignLengths: aBlock
	" Possibly deprecated "
	" Answer a Collection of hits satisfying conditions specified in aBlock for align lengths in each HSP node for each HIT "
	
	| hits |
	
	hits := OrderedCollection new.
	self hits do: [: pHit | 
		( pHit hspsNode hspAlignLengths anySatisfy: [ : v | aBlock value: v ] )
			ifTrue: [ hits add: pHit ] ].
	^ hits