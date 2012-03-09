accessing-put
parserForErrorMsg
	" Private - This is for NCBI error messages encoded in the partial results responses. Examples 
	 Message ID#24 Error: Failed to read the Blast query: Nucleotide FASTA provided for protein sequence 
	 Message ID#24 Error: Failed to read the Blast query: Gi/accession mismatch: requested nucleotide, found protein	 "
		
	^ ( 'Message ID#' asParser negate plus , 'Message ID#' asParser ) ,
		( PPPredicateObjectParser anyExceptAnyOf: '</p>' ) plus flatten foldRight: [: a : b | b ]
