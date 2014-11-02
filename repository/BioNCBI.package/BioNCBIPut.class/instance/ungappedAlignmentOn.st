accessing
ungappedAlignmentOn
	" Should the ungapped alignment be performed ? "
	
	self clientUrl queryAt: 'UNGAPPED_ALIGNMENT' put: 'yes'
