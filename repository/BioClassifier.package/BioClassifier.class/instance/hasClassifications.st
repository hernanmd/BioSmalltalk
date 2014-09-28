testing
hasClassifications 
	" Answer <true> if receiver has matches or mismatches from a classification "

	^ (self matches notNil and: [ self matches notEmpty ])
		or: [ self mismatches notNil and: [ self mismatches notEmpty ] ]