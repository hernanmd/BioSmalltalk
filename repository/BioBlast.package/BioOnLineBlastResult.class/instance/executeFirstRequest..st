private
executeFirstRequest: aClient
	" Private - The first BLAST request is used to get the RID and RTOE "

	| rid |
	
	requestCount := 0.
	self gtLog: 'Fetching NCBI BLAST request identifier...'.
	self reader 
			results: aClient url activate.

	rid := self reader rid	.
	self gtLog: 'RTOE = ' , self reader rtoe.
	self gtLog: 'RID = ' , rid.

	aClient 
		rid: rid;
		fetch. 