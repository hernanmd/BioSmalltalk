hsps accessing
hspHitFrames
	" Answer a Collection of receiver's number of frames of the database sequence if applicable "
	
	^ self selectNodesNamed: 'Hsp_hit-frame'.
