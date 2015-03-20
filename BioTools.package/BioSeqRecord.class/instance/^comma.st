accessing-sequence
, aBioSeqRecord
	" Concatenate the receiver's sequences with aBioSeqRecord if their sequences are compatible. 
	Answer the receiver "
	
	self sequence: self sequence , aBioSeqRecord sequence