accessing
hits
	" Answer the <Collection> of hits in the receiver's nodes "
	
	^ self nodes select: #isHitNode