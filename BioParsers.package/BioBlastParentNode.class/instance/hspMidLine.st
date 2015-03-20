accessing hit individually
hspMidLine
	" Answer a <String> of receiver's formatting middle line as normally seen in BLAST report "
	
	^ self selectNodeNamed: 'Hsp_midline'.
