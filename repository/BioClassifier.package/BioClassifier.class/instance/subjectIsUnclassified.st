testing
subjectIsUnclassified
	" Answer <true> if receiver's subject is not found in any organization/cluster "
	
	^ ( self organization includes: self subject ) not