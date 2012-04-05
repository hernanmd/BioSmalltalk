accessing
nucleotideReward: aSmallIntegerString
	" Reward for a nucleotide match (blastn only) "
	
	self clientUrl addParameters: 'NUCL_REWARD=' , aSmallIntegerString