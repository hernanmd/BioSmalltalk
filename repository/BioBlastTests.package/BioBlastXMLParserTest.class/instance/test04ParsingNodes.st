testing
test04ParsingNodes

	| theHit firstHsp secondHsp |

	self saxParseBlastNodes: #hits04.						
	self assert: ( result isKindOf: BioBlastRootNode ).
	self assert: result nodes isCollection.
	self assert: result nodes size = 1.
	self assert: result nodes size = result size.
	
	self assert: result hits isCollection.
	self deny: result hits isEmpty.
	self assert: result hits size = 1.
	
	theHit := result hits anyOne.
	self assert: theHit hitIdentifier blastValue = 'gi|4097247|gb|U50941.1|BTU50941'.
	self assert: theHit hitDefinition blastValue = 'Bos taurus mitochondrial D-loop DNA'.
	self assert: theHit hitAccession blastValue = 'U50941'.
	self assert: theHit hitLength blastValue = 213.
	self assert: ( theHit hitHsps isKindOf: BioBlastParentNode ).
	self assert: theHit hitHsps size = 2.
	
	firstHsp := theHit hitHsps nodes first.
	self assert: firstHsp hspBitScore blastValue = 210.477.
	self assert: firstHsp hspScore blastValue = 232.
	self assert: firstHsp hspEValue blastValue = 1.81032e-53.
	self assert: firstHsp hspQueryFrom blastValue = 20.
	self assert: firstHsp hspQueryTo blastValue = 135.	
	self assert: firstHsp hspHitFrom blastValue = 1.
	self assert: firstHsp hspHitTo blastValue = 116.
	self assert: firstHsp hspQueryFrame blastValue = 1.
	self assert: firstHsp hspHitFrame blastValue = 1.
	self assert: firstHsp hspIdentity blastValue = 116.
	self assert: firstHsp hspPositive blastValue = 116.
	self assert: firstHsp hspGaps blastValue = 0.
	self assert: firstHsp hspAlignLength blastValue = 116.
	self assert: firstHsp hspQSeq blastValue = 'TACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGA'.
	self assert: firstHsp hspHSeq blastValue = 'TACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGA'.
	self assert: firstHsp hspMidLine blastValue = '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'.

	secondHsp := theHit hitHsps nodes second.
	self assert: secondHsp hspBitScore blastValue = 64.4042.
	self assert: secondHsp hspScore blastValue = 70.
	self assert: secondHsp hspEValue blastValue = 1.69852e-09.
	self assert: secondHsp hspQueryFrom blastValue = 206.
	self assert: secondHsp hspQueryTo blastValue = 240.	
	self assert: secondHsp hspHitFrom blastValue = 116.
	self assert: secondHsp hspHitTo blastValue = 150.
	self assert: secondHsp hspQueryFrame blastValue = 1.
	self assert: secondHsp hspHitFrame blastValue = 1.
	self assert: secondHsp hspIdentity blastValue = 35.
	self assert: secondHsp hspPositive blastValue = 35.
	self assert: secondHsp hspGaps blastValue = 0.
	self assert: secondHsp hspAlignLength blastValue = 35.
	self assert: secondHsp hspQSeq blastValue = 'AAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'.
	self assert: secondHsp hspHSeq blastValue = 'AAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'.
	self assert: secondHsp hspMidLine blastValue = '|||||||||||||||||||||||||||||||||||'.
	