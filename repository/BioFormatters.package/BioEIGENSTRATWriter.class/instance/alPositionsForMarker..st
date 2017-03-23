accessing
alPositionsForMarker: a1
	" Answer a <Collection> of allele positions for marker position a1 "
	
	^ self markers at: (self markers keys at: a1).
		