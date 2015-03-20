testing
test01TokenizeHeaders

	self tokenizeBlastHeaderNodes: ( self perform: #hits04 ).
	self assert: ( result isKindOf: OrderPreservingDictionary ).
	self assert: ( result includesKey: 'BlastOutput_db' ).
 	self assert: ( result includesKey: 'BlastOutput_query-ID'  ).
	self assert: ( result includesKey: 'BlastOutput_query-def' ).
	self assert: ( result includesKey: 'BlastOutput_version' ).
	self assert: ( result includesKey: 'BlastOutput_reference' ).
	self assert: ( result includesKey: 'Parameters_gap-open' ).
	self assert: ( result includesKey: 'Parameters_filter' ).
	self assert: ( result includesKey: 'Parameters_gap-extend' ).
	self assert: ( result includesKey: 'Parameters_sc-mismatch' ). 
	self assert: ( result includesKey: 'Parameters_sc-match' ). 
	self assert: ( result includesKey: 'Parameters_expect' ). 
	self assert: ( result includesKey: 'BlastOutput_query-len' ). 
	self assert: ( result includesKey: 'BlastOutput_program').

	self assert: ( result at:  'BlastOutput_db' ) = 'nr'.
 	self assert: ( result at: 'BlastOutput_query-ID' ) = '18205'.
	self assert: ( result at: 'BlastOutput_query-def' ) = 'No definition line'.
	self assert: ( result at: 'BlastOutput_version' ) = 'BLASTN 2.2.25+'.
	self assert: ( result at: 'BlastOutput_reference' ) = 'Stephen F. Altschul, Thomas L. Madden, Alejandro A. Sch&auml;ffer, Jinghui Zhang, Zheng Zhang, Webb Miller, and David J. Lipman (1997), "Gapped BLAST and PSI-BLAST: a new generation of protein database search programs", Nucleic Acids Res. 25:3389-3402.'.
	self assert: ( result at: 'Parameters_gap-open' ) = '5'.
	self assert: ( result at: 'Parameters_filter' ) = 'L;m;m;'.
	self assert: ( result at: 'Parameters_gap-extend' ) = '2'.
	self assert: ( result at: 'Parameters_sc-mismatch' ) = '-3'.
	self assert: ( result at: 'Parameters_sc-match' ) = '2'. 
	self assert: ( result at: 'Parameters_expect' ) = '10'.
	self assert: ( result at: 'BlastOutput_query-len' ) = '358'.
	self assert: ( result at: 'BlastOutput_program' ) = 'blastn'.