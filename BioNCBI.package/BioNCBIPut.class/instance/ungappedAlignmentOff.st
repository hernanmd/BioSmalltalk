accessing
ungappedAlignmentOff
	" Should the ungapped alignment be performed ? "
	
	self clientUrl queryAt: 'UNGAPPED_ALIGNMENT' put: 'no'
