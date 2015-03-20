accessing hit individually
hspHitFrame
	" Answer a <Number> of receiver's number of frames of the database sequence if applicable "
	
	^ self selectNodeNamed: 'Hsp_hit-frame'.
