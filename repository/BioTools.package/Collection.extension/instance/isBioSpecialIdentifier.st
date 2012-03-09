*BioTools
isBioSpecialIdentifier
	" Answer <true> if receiver is any of the common biological identifiers "

	^  #('pdb' 'bbs' 'gi' 'gnl' 'lcl' 'pat' 'pir' 'prf' 'sp' 'dbj' 'emb' 'gb' 'ref') includes: self