accessing
identifier
	" Answer a class appropiate for parsing a specified NCBI identifier String "
	
	^ ( ( 'gb' asParser / 'emb' asParser / 'dbj' asParser / 'pir' asParser / 'prf' asParser / 
		  'sp' asParser / 'pdb' asParser / 'pat' asParser / 'bbs' asParser / 'gnl' asParser / 
		  'ref' asParser / 'lcl' asParser ) ==> [: token | self classFor: token value ] ) end 
		