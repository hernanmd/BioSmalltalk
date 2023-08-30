Class {
	#name : #BioFASTAParserTest,
	#superclass : #BioAbstractFASTAParserTest,
	#instVars : [
		'fastaRecord'
	],
	#category : #'BioParserTests-Core'
}

{ #category : #accessing }
BioFASTAParserTest >> multiFastaSeq01PlainText [

	^ '>YAL069W-1.334 Putative promoter sequence
CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACA
CATCCTAACACTACCCTAACACAGCCCTAATCTAACCCTGGCCAACCTGTCTCTCAACTT
ACCCTCCATTACCCTGCCTCCACTCGTTACCCTGTCCCATTCAACCATACCACTCCGAAC
CACCATCCATCCCTCTACTTACTACCACTCACCCACCGTTACCCTCCAATTACCCATATC
CAACCCACTGCCACTTACCCTACCATTACCCTACCATCCACCATGACCTACTCACCATAC
TGTTCTTCTACCCACCATATTGAAACGCTAACAA
>YAL068C-7235.2170 Putative promoter sequence
TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGA
GAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA
TAATATGCCTATGCCGCATAATTTTTATATCTTTCTCCTAACAAAACATTCGCTTGTAAA
GTATTATATTTAGGAAAAAAATAATCGATAAAGGCTCATCCGAAGATCAGTTAGATTCTT
TTTGCAAGTCCTGAAGAAATTTTCACACTACTACTATAAAAAAAAAATATCATAAAAAGG
TACATTACGTGCAACCAAAAGTGTAAAATGATTGGTTGCAATGTTTCACCTAAATTACTT'
]

{ #category : #accessing }
BioFASTAParserTest >> setUp [

	super setUp.
	parser := self parserClass new
]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseMultiFasta03 [

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord 
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq03Header01 sequence: self multiFastaSeq03Body01);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq03Header02 sequence: self multiFastaSeq03Body02).

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq03.
	self assert: (parseResult isKindOf: BioFastaMultiRecord).
	self deny: parseResult records isEmpty.		
	self assert: parseResult records size equals: 2.
	self assert: parseResult sequenceNames asArray equals: 
						(Array 
							with: self multiFastaSeq03Header01 allButFirst 
							with: self multiFastaSeq03Header02 allButFirst).
	self assert: parseResult sequenceStrings asArray equals: 
						(Array 
							with: self multiFastaSeq03Body01 asCondensedString
							with: self multiFastaSeq03Body02 asCondensedString).	
	
]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseMultiFasta07 [
	fastaRecord := BioFastaMultiRecord new
		addFastaRecord: (BioFastaRecord named: 'Sample sequence 1' sequence: 'garkbdctymvhu');
		addFastaRecord: (BioFastaRecord named: 'Sample sequence 2' sequence: 'ctymvhgarkbda');
		addFastaRecord: (BioFastaRecord named: 'Sample sequence 3' sequence: 'ccccccccccga');
		yourself.
	parseResult := self parserClass parseMultiFasta: self multiFastaSeq07.
	self assert: (parseResult isKindOf: BioFastaMultiRecord).
	self deny: parseResult sequences isEmpty.
	self assert: parseResult sequences size equals: 3.
	self assert: parseResult equals: fastaRecord
]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseMultiFastaThreeSequences [

	| seqString |
	
	seqString := self multiFastaSeq02.

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header01 sequence: self multiFastaSeq02Body01);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header02 sequence: self multiFastaSeq02Body02);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header03 sequence: self multiFastaSeq02Body03).		

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq02PlainText.
	
	self assert: parseResult records size equals: 3.

]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseMultiFastaTwoSequences [

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord 
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq01Header01 sequence: self multiFastaSeq01Body01);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq01Header02 sequence: self multiFastaSeq01Body02).

	parseResult := self parserClass parseMultiFasta: '>YAL069W-1.334 Putative promoter sequence
CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACA
CATCCTAACACTACCCTAACACAGCCCTAATCTAACCCTGGCCAACCTGTCTCTCAACTT
ACCCTCCATTACCCTGCCTCCACTCGTTACCCTGTCCCATTCAACCATACCACTCCGAAC
CACCATCCATCCCTCTACTTACTACCACTCACCCACCGTTACCCTCCAATTACCCATATC
CAACCCACTGCCACTTACCCTACCATTACCCTACCATCCACCATGACCTACTCACCATAC
TGTTCTTCTACCCACCATATTGAAACGCTAACAA
>YAL068C-7235.2170 Putative promoter sequence
TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGA
GAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA
TAATATGCCTATGCCGCATAATTTTTATATCTTTCTCCTAACAAAACATTCGCTTGTAAA
GTATTATATTTAGGAAAAAAATAATCGATAAAGGCTCATCCGAAGATCAGTTAGATTCTT
TTTGCAAGTCCTGAAGAAATTTTCACACTACTACTATAAAAAAAAAATATCATAAAAAGG
TACATTACGTGCAACCAAAAGTGTAAAATGATTGGTTGCAATGTTTCACCTAAATTACTT'.
	self assert: (parseResult isKindOf: BioFastaMultiRecord).

	self deny: parseResult sequences isEmpty.		
	self assert: parseResult sequences size equals: 2.	

]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseSingleFasta01 [

	| seqSelectors parseResults |
	
	seqSelectors := self class superclass organization listAtCategoryNamed: 'samples-single'.
	parseResults := seqSelectors collect: [: sel | self parserClass parseFasta: ( self perform: sel ) ].
		
	parseResults do:[: pResult | self assert: pResult isFastaRecord ].
]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseSingleFasta02 [
	fastaRecord := BioFastaRecord
		named: self multiFastaSeq01Header01
		sequence: self multiFastaSeq01Body01.
	parseResult := self parserClass parseFasta: self fastaSeq01.
	self assert: (parseResult isKindOf: BioFastaRecord).

	self assert: parseResult name equals: self multiFastaSeq01Header01.
	self
		assert: parseResult sequence asString
		equals: self multiFastaSeq01Body01 asCondensedString
]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseSingleFasta04 [
	| seqName seqString |
	seqName := 'YAL068C-7235.2170 Putative promoter sequence'.
	seqString := 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA'.
	fastaRecord := BioFastaRecord named: seqName sequence: seqString.
	parseResult := self parserClass parseFasta: self fastaSeq04.
	self assert: (parseResult isKindOf: BioFastaRecord).
	self assert: parseResult equals: fastaRecord.
	self assert: parseResult name equals: seqName.
	self
		assert: parseResult sequence asString
		equals: seqString asCondensedString
]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseSingleFasta07 [

	parseResult := self parserClass parseFasta: '>gi|6273291|emb|AF191665.1|AF191665
'.
	self deny: (parseResult isKindOf: BioFastaRecord).

]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseSingleFastaProteinSequenceIntoRecord [

	| seqName seqString |
	seqName := '>sp_ac|P02769_WOSIG0 \ID=ALBU_BOVIN \DE="Serum albumin precursor (Allergen Bos d 6) (BSA)" \NCBITAXID=9913 \MODRES=(1|Acetyl) \VARIANT=(196|A|T) \LENGTH=589'.
	seqString := 'RGVFRRDTHKSEIAHRFKDLGEEHFKGLVLIAFSQYLQQCPFDEHVKLVNELTEFAKTCVADESHAGCEKSLHTLFGDELCKVASLRETYGDMADCCEKQEPERNECFLSHKDDSPDLPKLKPDPNTLCDEFKADEKKFWGKYLYEIARRHPYFYAPELLYYANKYNGVFQECCQAEDKGACLLPKIETMREKVLASSARQRLRCASIQKFGERALKAWSVARLSQKFPKAEFVEVTKLVTDLTKVHKECCHGDLLECADDRADLAKYICDNQDTISSKLKECCDKPLLEKSHCIAEVEKDAIPENLPPLTADFAEDKDVCKNYQEAKDAFLGSFLYEYSRRHPEYAVSVLLRLAKEYEATLEECCAKDDPHACYSTVFDKLKHLVDEPQNLIKQNCDQFEKLGEYGFQNALIVRYTRKVPQVSTPTLVEVSRSLGKVGTRCCTKPESERMPCTEDYLSLILNRLCVLHEKTPVSEKVTKCCTESLVNRRPCFSALTPDETYVPKAFDEKLFTFHADICTLPDTEKQIKKQTALVELLKHKPKATEEQLKTVMENFVAFVDKCCAADDKEACFAVEGPKLVVSTQTALA'.

	fastaRecord := BioFastaRecord named: seqName sequence: seqString.

	parseResult := self parserClass parseFasta: self fastaSeq08.
	self assert: (parseResult isKindOf: BioFastaRecord).

]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseSingleFastaProteinSequenceName [

	| seqName seqString |
	seqName := 'sp_ac|P02769_WOSIG0 \ID=ALBU_BOVIN \DE="Serum albumin precursor (Allergen Bos d 6) (BSA)" \NCBITAXID=9913 \MODRES=(1|Acetyl) \VARIANT=(196|A|T) \LENGTH=589'.
	seqString := 'RGVFRRDTHKSEIAHRFKDLGEEHFKGLVLIAFSQYLQQCPFDEHVKLVNELTEFAKTCVADESHAGCEKSLHTLFGDELCKVASLRETYGDMADCCEKQEPERNECFLSHKDDSPDLPKLKPDPNTLCDEFKADEKKFWGKYLYEIARRHPYFYAPELLYYANKYNGVFQECCQAEDKGACLLPKIETMREKVLASSARQRLRCASIQKFGERALKAWSVARLSQKFPKAEFVEVTKLVTDLTKVHKECCHGDLLECADDRADLAKYICDNQDTISSKLKECCDKPLLEKSHCIAEVEKDAIPENLPPLTADFAEDKDVCKNYQEAKDAFLGSFLYEYSRRHPEYAVSVLLRLAKEYEATLEECCAKDDPHACYSTVFDKLKHLVDEPQNLIKQNCDQFEKLGEYGFQNALIVRYTRKVPQVSTPTLVEVSRSLGKVGTRCCTKPESERMPCTEDYLSLILNRLCVLHEKTPVSEKVTKCCTESLVNRRPCFSALTPDETYVPKAFDEKLFTFHADICTLPDTEKQIKKQTALVELLKHKPKATEEQLKTVMENFVAFVDKCCAADDKEACFAVEGPKLVVSTQTALA'.

	fastaRecord := BioFastaRecord named: seqName sequence: seqString.

	parseResult := self parserClass parseFasta: self fastaSeq08.

	self assert: parseResult name equals: seqName.

]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseSingleFastaProteinSequenceString [

	| seqName seqString |
	seqName := 'sp_ac|P02769_WOSIG0 \ID=ALBU_BOVIN \DE="Serum albumin precursor (Allergen Bos d 6) (BSA)" \NCBITAXID=9913 \MODRES=(1|Acetyl) \VARIANT=(196|A|T) \LENGTH=589'.
	seqString := 'RGVFRRDTHKSEIAHRFKDLGEEHFKGLVLIAFSQYLQQCPFDEHVKLVNELTEFAKTCVADESHAGCEKSLHTLFGDELCKVASLRETYGDMADCCEKQEPERNECFLSHKDDSPDLPKLKPDPNTLCDEFKADEKKFWGKYLYEIARRHPYFYAPELLYYANKYNGVFQECCQAEDKGACLLPKIETMREKVLASSARQRLRCASIQKFGERALKAWSVARLSQKFPKAEFVEVTKLVTDLTKVHKECCHGDLLECADDRADLAKYICDNQDTISSKLKECCDKPLLEKSHCIAEVEKDAIPENLPPLTADFAEDKDVCKNYQEAKDAFLGSFLYEYSRRHPEYAVSVLLRLAKEYEATLEECCAKDDPHACYSTVFDKLKHLVDEPQNLIKQNCDQFEKLGEYGFQNALIVRYTRKVPQVSTPTLVEVSRSLGKVGTRCCTKPESERMPCTEDYLSLILNRLCVLHEKTPVSEKVTKCCTESLVNRRPCFSALTPDETYVPKAFDEKLFTFHADICTLPDTEKQIKKQTALVELLKHKPKATEEQLKTVMENFVAFVDKCCAADDKEACFAVEGPKLVVSTQTALA'.

	fastaRecord := BioFastaRecord named: seqName sequence: seqString.

	parseResult := self parserClass parseFasta: self fastaSeq08.

	self
		assert: parseResult sequence asString
		equals: seqString asCondensedString

]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseThreeMultiFastaIntoRecord [

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header01 sequence: self multiFastaSeq02Body01);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header02 sequence: self multiFastaSeq02Body02);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header03 sequence: self multiFastaSeq02Body03).		

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq02PlainText.

	self assert: parseResult sequenceNames equals: fastaRecord sequenceNames.

]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseThreeMultiFastaSequenceNames [

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header01 sequence: self multiFastaSeq02Body01);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header02 sequence: self multiFastaSeq02Body02);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header03 sequence: self multiFastaSeq02Body03).		

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq02PlainText.

	self assert: parseResult equals: fastaRecord.

]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseThreeMultiFastaSequenceStrings [

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header01 sequence: self multiFastaSeq02Body01);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header02 sequence: self multiFastaSeq02Body02);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq02Header03 sequence: self multiFastaSeq02Body03).		

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq02PlainText.

	self 
		assert: parseResult sequenceStrings asArray 
		equals: (Array 
					with: self multiFastaSeq02Body01 asCondensedString
					with: self multiFastaSeq02Body02 asCondensedString
					with: self multiFastaSeq02Body03 asCondensedString).	

]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseTwoMultiFastaIntoRecord [

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq01Header01 sequence: self multiFastaSeq01Body01);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq01Header02 sequence: self multiFastaSeq01Body02).

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq01PlainText.

	self 
		assert: parseResult sequenceNames 
		equals: fastaRecord sequenceNames.


]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseTwoMultiFastaSequenceNames [

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq01Header01 sequence: self multiFastaSeq01Body01);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq01Header02 sequence: self multiFastaSeq01Body02).

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq01PlainText.
	self 
		assert: (parseResult sequenceNames 
			bioHasEqualElements: (OrderedCollection
				with: 	self multiFastaSeq01Header01 allButFirst
				with: self multiFastaSeq01Header02 allButFirst)).

]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testParseTwoMultiFastaSequenceStrings [

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq01Header01 sequence: self multiFastaSeq01Body01);
		addFastaRecord: (BioFastaRecord named: self multiFastaSeq01Header02 sequence: self multiFastaSeq01Body02).

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq01PlainText.
	self 
		assert: parseResult sequenceStrings asArray 
		equals: (
			Array 
				with: self multiFastaSeq01Body01 asCondensedString 
				with: self multiFastaSeq01Body02 asCondensedString).	

]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testSingleFasta01 [

	| seqSelectors parseResults |
	seqSelectors := self class superclass organization listAtCategoryNamed: 'samples-single'.
	parseResults := seqSelectors collect: [ :sel | self parserClass tokenizeFasta: (self perform: sel) ].

	parseResults do: [ :pResult |
		self assert: pResult isCollection.
		self assert: pResult size equals: 2 ]
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testSingleFasta02 [

	self 
		assert: ((self parserClass tokenizeFasta: self fastaSeq01) 
		bioHasEqualElements:  
			#('YAL069W-1.334 Putative promoter sequence' 'CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACACATCCTAACACTACCCTAACACAGCCCTAATCTAACCCTGGCCAACCTGTCTCTCAACTTACCCTCCATTACCCTGCCTCCACTCGTTACCCTGTCCCATTCAACCATACCACTCCGAACCACCATCCATCCCTCTACTTACTACCACTCACCCACCGTTACCCTCCAATTACCCATATCCAACCCACTGCCACTTACCCTACCATTACCCTACCATCCACCATGACCTACTCACCATACTGTTCTTCTACCCACCATATTGAAACGCTAACAA')).
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testSingleFasta03 [

	self 
		assert: ((self parserClass tokenizeFasta: self fastaSeq02)
		bioHasEqualElements: #('YAL068C-7235.2170 Putative promoter sequence' 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGATAATATGCCTATGCCGCATAATTTTTATATCTTTCTCCTAACAAAACATTCGCTTGTAAAGTATTATATTTAGGAAAAAAATAATCGATAAAGGCTCATCCGAAGATCAGTTAGATTCTTTTTGCAAGTCCTGAAGAAATTTTCACACTACTACTATAAAAAAAAAATATCATAAAAAGGTACATTACGTGCAACCAAAAGTGTAAAATGATTGGTTGCAATGTTTCACCTAAATTACTT'))
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testSingleFasta05 [

	self 
		assert: ((self parserClass tokenizeFasta: self fastaSeq05)
		bioHasEqualElements: #(
			'YAL068C-7235.2170 Putative promoter sequence' 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA') ).
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testSingleFasta06 [

	self 
		assert: ((self parserClass tokenizeFasta: self fastaSeq08) 
		bioHasEqualElements: #(
			'sp_ac|P02769_WOSIG0 \ID=ALBU_BOVIN \DE="Serum albumin precursor (Allergen Bos d 6) (BSA)" \NCBITAXID=9913 \MODRES=(1|Acetyl) \VARIANT=(196|A|T) \LENGTH=589'
			'RGVFRRDTHKSEIAHRFKDLGEEHFKGLVLIAFSQYLQQCPFDEHVKLVNELTEFAKTCVADESHAGCEKSLHTLFGDELCKVASLRETYGDMADCCEKQEPERNECFLSHKDDSPDLPKLKPDPNTLCDEFKADEKKFWGKYLYEIARRHPYFYAPELLYYANKYNGVFQECCQAEDKGACLLPKIETMREKVLASSARQRLRCASIQKFGERALKAWSVARLSQKFPKAEFVEVTKLVTDLTKVHKECCHGDLLECADDRADLAKYICDNQDTISSKLKECCDKPLLEKSHCIAEVEKDAIPENLPPLTADFAEDKDVCKNYQEAKDAFLGSFLYEYSRRHPEYAVSVLLRLAKEYEATLEECCAKDDPHACYSTVFDKLKHLVDEPQNLIKQNCDQFEKLGEYGFQNALIVRYTRKVPQVSTPTLVEVSRSLGKVGTRCCTKPESERMPCTEDYLSLILNRLCVLHEKTPVSEKVTKCCTESLVNRRPCFSALTPDETYVPKAFDEKLFTFHADICTLPDTEKQIKKQTALVELLKHKPKATEEQLKTVMENFVAFVDKCCAADDKEACFAVEGPKLVVSTQTALA') ).
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testSingleFasta07 [

	self 
		assert: ((self parserClass tokenizeFasta: self fastaSeq09) 
		bioHasEqualElements: #('gi|6273291|emb|AF191665.1|AF191665' 'actgtcgatatgctagct') )		
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testSingleFastaWithReturnLine [

	self 
		assert: ((self parserClass tokenizeFasta: self fastaSeq04) 
		bioHasEqualElements: #('YAL068C-7235.2170 Putative promoter sequence' 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA')).
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testTokenizeMultiFasta01 [

	self 
		assert: ((self parserClass tokenizeMultiFasta: self multiFastaSeq01PlainText) 
		bioHasEqualElements: #( 
		#('YAL069W-1.334 Putative promoter sequence' 'CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACACATCCTAACACTACCCTAACACAGCCCTAATCTAACCCTGGCCAACCTGTCTCTCAACTTACCCTCCATTACCCTGCCTCCACTCGTTACCCTGTCCCATTCAACCATACCACTCCGAACCACCATCCATCCCTCTACTTACTACCACTCACCCACCGTTACCCTCCAATTACCCATATCCAACCCACTGCCACTTACCCTACCATTACCCTACCATCCACCATGACCTACTCACCATACTGTTCTTCTACCCACCATATTGAAACGCTAACAA') 
		#('YAL068C-7235.2170 Putative promoter sequence' 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGATAATATGCCTATGCCGCATAATTTTTATATCTTTCTCCTAACAAAACATTCGCTTGTAAAGTATTATATTTAGGAAAAAAATAATCGATAAAGGCTCATCCGAAGATCAGTTAGATTCTTTTTGCAAGTCCTGAAGAAATTTTCACACTACTACTATAAAAAAAAAATATCATAAAAAGGTACATTACGTGCAACCAAAAGTGTAAAATGATTGGTTGCAATGTTTCACCTAAATTACTT') ) ).
	
	
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testTokenizeMultiFasta02 [

	self assert: ( ( self parserClass tokenizeMultiFasta: self multiFastaSeq02 ) bioHasEqualElements: #( 
		#( '>first sequence record' 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCA') 
		#( '>second sequence record' 'CAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA') 
		#( '>third sequence record' 'GAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGATAATATGCCTATGCCGCATAATTTTTATATCTTTCTCCTAACAAAACATTCGCTTGTAAA') ) ).
	
	
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testTokenizeMultiFasta03 [

	self assert: ( ( self parserClass tokenizeMultiFasta: self multiFastaSeq03 ) bioHasEqualElements: #( 
		#( 'SEQUENCE_1' 'MTEITAAMVKELRESTGAGMMDCKNALSETNGDFDKAVQLLREKGLGKAAKKADRLAAEGLVSVKVSDDFTIAAMRPSYLSYEDLDMTFVENEYKALVAELEKENEERRRLKDPNKPEHKIPQFASRKQLSDAILKEAEEKIKEELKAQGKPEKIWDNIIPGKMNSFIADNSQLDSKLTLMGQFYVMDDKKTVEQVIAEKEKEFGGKIKIVEFICFEVGEGLEKKTEDFAAEVAAQL') 
		#( 'SEQUENCE_2' 'SATVSEINSETDFVAKNDQFIALTKDTTAHIQSNSLQSVEELHSSTINGVKFEEYLKSQIATIGENLVVRRFATLKAGANGVVNGYIHTNGRVGVVIAAACDSAEVASKSRDLLRQICMH') ) ).
	
	
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testTokenizeMultiFasta04 [

	self assert: ( ( self parserClass tokenizeMultiFasta: self multiFastaSeq04 ) bioHasEqualElements: #( 
		#( '>HSBGPG Human gene for bone gla protein (BGP)' 'GGCAGATTCCCCCTAGACCCGCCCGCACCATGGTCAGGCATGCCCCTCCTCATCGCTGGGCACAGCCCAGAGGGTATAAACAGTGCTGGAGGCTGGCGGGGCAGGCCAGCTGAGTCCTGAGCAGCAGCCCAGCGCAGCCACCGAGACACCATGAGAGCCCTCACACTCCTCGCCCTATTGGCCCTGGCCGCACTTTGCATCGCTGGCCAGGCAGGTGAGTGCCCCCACCTCCCCTCAGGCCGCATTGCAGTGGGGGCTGAGAGGAGGAAGCACCATGGCCCACCTCTTCTCACCCCTTTGGCTGGCAGTCCCTTTGCAGTCTAACCACCTTGTTGCAGGCTCAATCCATTTGCCCCAGCTCTGCCCTTGCAGAGGGAGAGGAGGGAAGAGCAAGCTGCCCGAGACGCAGGGGAAGGAGGATGAGGGCCCTGGGGATGAGCTGGGGTGAACCAGGCTCCCTTTCCTTTGCAGGTGCGAAGCCCAGCGGTGCAGAGTCCAGCAAAGGTGCAGGTATGAGGATGGACCTGATGGGTTCCTGGACCCTCCCCTCTCACCCTGGTCCCTCAGTCTCATTCCCCCACTCCTGCCACCTCCTGTCTGGCCATCAGGAAGGCCAGCCTGCTCCCCACCTGATCCTCCCAAACCCAGAGCCACCTGATGCCTGCCCCTCTGCTCCACAGCCTTTGTGTCCAAGCAGGAGGGCAGCGAGGTAGTGAAGAGACCCAGGCGCTACCTGTATCAATGGCTGGGGTGAGAGAAAAGGCAGAGCTGGGCCAAGGCCCTGCCTCTCCGGGATGGTCTGTGGGGGAGCTGCAGCAGGGAGTGGCCTCTCTGGGTTGTGGTGGGGGTACAGGCAGCCTGCCCTGGTGGGCACCCTGGAGCCCCATGTGTAGGGAGAGGAGGGATGGGCATTTTGCACGGGGGCTGATGCCACCACGTCGGGTGTCTCAGAGCCCCAGTCCCCTACCCGGATCCCCTGGAGCCCAGGAGGGAGGTGTGTGAGCTCAATCCGGACTGTGACGAGTTGGCTGACCACATCGGCTTTCAGGAGGCCTATCGGCGCTTCTACGGCCCGGTCTAGGGTGTCGCTCTGCTGGCCTGGCCGGCAACCCCAGTTCTGCTCCTCTCCAGGCACCCTTCTTTCCTCTTCCCCTTGCCCTTGCCCTGACCTCCCAGCCCTATGGATGTGGGGTCCCCATCATCCCAGCTGCTCCCAAATAAACTCCAGAAG') 
		#( '>HSGLTH1 Human theta 1-globin gene' 'CCACTGCACTCACCGCACCCGGCCAATTTTTGTGTTTTTAGTAGAGACTAAATACCATATAGTGAACACCTAAGACGGGGGGCCTTGGATCCAGGGCGATTCAGAGGGCCCCGGTCGGAGCTGTCGGAGATTGAGCGCGCGCGGTCCCGGGATCTCCGACGAGGCCCTGGACCCCCGGGCGGCGAAGCTGCGGCGCGGCGCCCCCTGGAGGCCGCGGGACCCCTGGCCGGTCCGCGCAGGCGCAGCGGGGTCGCAGGGCGCGGCGGGTTCCAGCGCGGGGATGGCGCTGTCCGCGGAGGACCGGGCGCTGGTGCGCGCCCTGTGGAAGAAGCTGGGCAGCAACGTCGGCGTCTACACGACAGAGGCCCTGGAAAGGTGCGGCAGGCTGGGCGCCCCCGCCCCCAGGGGCCCTCCCTCCCCAAGCCCCCCGGACGCGCCTCACCCACGTTCCTCTCGCAGGACCTTCCTGGCTTTCCCCGCCACGAAGACCTACTTCTCCCACCTGGACCTGAGCCCCGGCTCCTCACAAGTCAGAGCCCACGGCCAGAAGGTGGCGGACGCGCTGAGCCTCGCCGTGGAGCGCCTGGACGACCTACCCCACGCGCTGTCCGCGCTGAGCCACCTGCACGCGTGCCAGCTGCGAGTGGACCCGGCCAGCTTCCAGGTGAGCGGCTGCCGTGCTGGGCCCCTGTCCCCGGGAGGGCCCCGGCGGGGTGGGTGCGGGGGGCGTGCGGGGCGGGTGCAGGCGAGTGAGCCTTGAGCGCTCGCCGCAGCTCCTGGGCCACTGCCTGCTGGTAACCCTCGCCCGGCACTACCCCGGAGACTTCAGCCCCGCGCTGCAGGCGTCGCTGGACAAGTTCCTGAGCCACGTTATCTCGGCGCTGGTTTCCGAGTACCGCTGAACTGTGGGTGGGTGGCCGCGGGATCCCCAGGCGACCTTCCCCGTGTTTGAGTAAAGCCTCTCCCAGGAGCAGCCTTCTTGCCGTGCTCTCTCGAGGTCAGGACGCGAGAGGAAGGCGC' ) ) ).
	
	
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testTokenizeMultiFasta05 [

	self assert: ( ( self parserClass tokenizeMultiFasta: self multiFastaSeq05 ) bioHasEqualElements: #( 
		#( '>sequence1' 'ACTCCCCGTGCGCGCCCGGCCCGTAGCGTCCTCGTCGCCGCCCCTCGTCTCGCAGCCGCAGCCCGCGTGGACGCTCTCGCCTGAGCGCCGCGGACTAGCCCGGGTGGCC') 
		#( '>sequence2' 'CAGTCCGGCAGCGCCGGGGTTAAGCGGCCCAAGTAAACGTAGCGCAGCGATCGGCGCCGGAGATTCGCGAACCCGACACTCCGCGCCGCCCGCCGGCCAGGACCCGCGGCGCGATCGCGGCGCCGCGCTACAGCCAGCCTCACTGGCGCGCGGGCGAGCGCACGGGCGCTC' ) 
		#( '>sequence3' 'CACGACAGGCCCGCTGAGGCTTGTGCCAGACCTTGGAAACCTCAGGTATATACCTTTCCAGACGCGGGATCTCCCCTCCCC') 		
		#( '>sequence4' 'CAGCAGACATCTGAATGAAGAAGAGGGTGCCAGCGGGTATGAGGAGTGCATTATCGTTAATGGGAACTTCAGTGACCAGTCCTCAGACACGAAGGATGCTCCCTCACCCCCAGTCTTGGAGGCAATCTGCACAGAGCCAGTCTGCACACC') 		
		) ).
	
	
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testTokenizeMultiFasta06 [

	self 
		assert: ((self parserClass tokenizeMultiFasta: self multiFastaSeq06) 
		bioHasEqualElements: #( 
			#('>YAL069W-1.334 Putative promoter sequence' 'CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACACATCCTAACACTACCCTAACACAGCCCTAATCTAACCCTGGCCAACCTGTCTCTCAACTTACCCTCCATTACCCTGCCTCCACTCGTTACCCTGTCCCATTCAACCATACCACTCCGAACCACCATCCATCCCTCTACTTACTACCACTCACCCACCGTTACCCTCCAATTACCCATATCCAACCCACTGCCACTTACCCTACCATTACCCTACCATCCACCATGACCTACTCACCATACTGTTCTTCTACCCACCATATTGAAACGCTAACAA') 
			#('>YAL068C-7235.2170 Putative promoter sequence' 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGATAATATGCCTATGCCGCATAATTTTTATATCTTTCTCCTAACAAAACATTCGCTTGTAAAGTATTATATTTAGGAAAAAAATAATCGATAAAGGCTCATCCGAAGATCAGTTAGATTCTTTTTGCAAGTCCTGAAGAAATTTTCACACTACTACTATAAAAAAAAAATATCATAAAAAGGTACATTACGTGCAACCAAAAGTGTAAAATGATTGGTTGCAATGTTTCACCTAAATTACTT') ) ).
	
	
]

{ #category : #'testing-tokenizer' }
BioFASTAParserTest >> testTokenizeMultiFasta07 [

	self 
		assert: ((self parserClass tokenizeMultiFasta: self multiFastaSeq07) 
		bioHasEqualElements: #( 
			#('>Sample sequence 1' 'garkbdctymvhu') 
			#('>Sample sequence 2' 'ctymvhgarkbda')
			#('>Sample sequence 3' 'ccccccccccga'))).
	
	
]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testTokenizeSingleFastaDescription01 [

	| seqHeader |
	seqHeader := '>gi|198282148|ref|NC_011206.1| Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome'.

	parseResult := self parserClass tokenizeFastaDescription: seqHeader.
	self assert: (parseResult isKindOf: Collection).
	self
		assert: parseResult
		equals:
		'Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome'
]

{ #category : #'testing-builder' }
BioFASTAParserTest >> testTokenizeSingleFastaHeader01 [

	| seqHeader |
	seqHeader := '>gi|198282148|ref|NC_011206.1| Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome'.

	parseResult := self parserClass tokenizeFastaHeader: seqHeader.
	self assert: (parseResult isKindOf: Collection).
	self
		assert: parseResult
		equals:
		#( '>gi' '198282148' 'ref' 'NC_011206.1' 'Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome' )
]
