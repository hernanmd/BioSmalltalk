accessing
gapCosts: spacedFloatString
	" Gap open and gap extend costs 
	
	The pull down menu shows the Gap Costs for the chosen Matrix. There can only be a limited number of options for these parameters. Increasing the Gap Costs will result in alignments which decrease the number of Gaps introduced.
	
	From: http://www.ncbi.nlm.nih.gov/BLAST/blastcgihelp.shtml#Reward-penalty"
	
	self clientUrl addParameters: 'GAPCOSTS=' , spacedFloatString
