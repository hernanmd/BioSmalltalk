testing
test05ParsingNodes

	| firstHit secondHit theHsp |

	self saxParseBlastNodes: #hits05.						
	self assert: ( result isKindOf: BioBlastRootNode ).
	self assert: result nodes isCollection.
	self assert: result nodes size = 2.
	self assert: result nodes size = result size.
	
	self assert: result hits isCollection.
	self deny: result hits isEmpty.
	self assert: result hits size = 2.
	
	firstHit := result hits first.
	self assert: firstHit hitIdentifier blastValue = 'gi|294959984|gb|GU947019.1|'.
	self assert: firstHit hitDefinition blastValue = 'Bos taurus isolate CB86 mitochondrion, complete genome'.
	self assert: firstHit hitAccession blastValue = 'GU947019'.
	self assert: firstHit hitLength blastValue = 16339.
	self assert: ( firstHit hitHsps isKindOf: BioBlastParentNode ).
	self assert: firstHit hitHsps size = 1.
	
	theHsp := firstHit hitHsps nodes first.
	self assert: theHsp hspBitScore blastValue = 434.095.
	self assert: theHsp hspScore blastValue = 480.
	self assert: theHsp hspEValue blastValue = 8.75206e-121.
	self assert: theHsp hspQueryFrom blastValue = 1.
	self assert: theHsp hspQueryTo blastValue = 240.	
	self assert: theHsp hspHitFrom blastValue = 16024.
	self assert: theHsp hspHitTo blastValue = 16263.
	self assert: theHsp hspQueryFrame blastValue = 1.
	self assert: theHsp hspHitFrame blastValue = 1.
	self assert: theHsp hspIdentity blastValue = 240.
	self assert: theHsp hspPositive blastValue = 240.
	self assert: theHsp hspGaps blastValue = 0.
	self assert: theHsp hspAlignLength blastValue = 240.
	self assert: theHsp hspQSeq blastValue = 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'.
	self assert: theHsp hspHSeq blastValue = 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'.
	self assert: theHsp hspMidLine blastValue = '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'.

	secondHit := result hits second.
	self assert: secondHit hitIdentifier blastValue = 'gi|311323927|gb|HM626093.1|'.
	self assert: secondHit hitDefinition blastValue = 'Bos taurus breed Jutland breed clone 38 D-loop, partial sequence; mitochondrial'.
	self assert: secondHit hitAccession blastValue = 'HM626093'.
	self assert: secondHit hitLength blastValue = 789.
	self assert: ( secondHit hitHsps isKindOf: BioBlastParentNode ).
	self assert: secondHit hitHsps size = 1.
	
	theHsp := secondHit hitHsps nodes first.
	self assert: theHsp hspBitScore blastValue = 434.095.
	self assert: theHsp hspScore blastValue = 480.
	self assert: theHsp hspEValue blastValue = 8.75206e-121.
	self assert: theHsp hspQueryFrom blastValue = 1.
	self assert: theHsp hspQueryTo blastValue = 240.	
	self assert: theHsp hspHitFrom blastValue = 196.
	self assert: theHsp hspHitTo blastValue = 435.
	self assert: theHsp hspQueryFrame blastValue = 1.
	self assert: theHsp hspHitFrame blastValue = 1.
	self assert: theHsp hspIdentity blastValue = 240.
	self assert: theHsp hspPositive blastValue = 240.
	self assert: theHsp hspGaps blastValue = 0.
	self assert: theHsp hspAlignLength blastValue = 240.
	self assert: theHsp hspQSeq blastValue = 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'.
	self assert: theHsp hspHSeq blastValue = 'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'.
	self assert: theHsp hspMidLine blastValue = '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'.
	