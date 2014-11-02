accessing
nucleotideReward: aSmallInteger
	" Reward for a nucleotide match (blastn only) "
	
	self clientUrl queryAt: 'NUCL_REWARD' put: aSmallInteger asString