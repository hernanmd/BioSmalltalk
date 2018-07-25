testing
test03ParsingNodes

	| theHit theHsp |

	self saxParseBlastNodes: #hits03.						
	self assert: (result isKindOf: BioBlastRootNode).
	self assert: result nodes isCollection.
	self assert: result nodes size equals: 1.
	self assert: result nodes size equals: result size.
	
	self assert: result hits isCollection.
	self deny: result hits isEmpty.
	self assert: result hits size equals: 1.
	
	theHit := result hits anyOne.
	self assert: theHit hitIdentifier blastValue equals: 'gi|306977463|gb|HQ184044.1|' asLowercase.
	self assert: theHit hitDefinition blastValue equals: 'Bos taurus isolate Rom600 mitochondrion, complete genome' asLowercase.
	self assert: theHit hitAccession blastValue equals: 'HQ184044' asLowercase.
	self assert: theHit hitLength blastValue equals: 16342.
	self assert: (theHit hitHsps isKindOf: BioBlastParentNode).
	self assert: theHit hitHsps size equals: 1.
	
	theHsp := theHit hitHsps nodes anyOne.
	self assert: theHsp hspBitScore blastValue equals: 646.892.
	self assert: theHsp hspScore blastValue equals: 716.
	self assert: theHsp hspEValue blastValue equals: 0.
	self assert: theHsp hspQueryFrom blastValue equals: 1.
	self assert: theHsp hspQueryTo blastValue equals: 358.	
	self assert: theHsp hspHitFrom blastValue equals: 14586.
	self assert: theHsp hspHitTo blastValue equals: 14943.
	self assert: theHsp hspQueryFrame blastValue equals: 1.
	self assert: theHsp hspHitFrame blastValue equals: 1.
	self assert: theHsp hspIdentity blastValue equals: 358.
	self assert: theHsp hspPositive blastValue equals: 358.
	self assert: theHsp hspGaps blastValue equals: 0.
	self assert: theHsp hspAlignLength blastValue equals: 358.
	self assert: theHsp hspQSeq blastValue equals: 'CCATCAAACATTTCATCATGATGAAATTTCGGTTCCCTCCTAGGAATCTGCCTAATCCTACAAATCCTCACAGGCCTATTCCTAGCAATACACTACACATCCGACACAACAACAGCATTCTCCTCTGTTACCCATATCTGCCGAGACGTGAACTACGGCTGAATCATCCGATACATACACGCAAACGGAGCTTCAATGTTTTTTATCTGCTTATATATGCACGTAGGACGAGGCTTATATTATGGGTCTTACACTTTTCTAGAAACATGAAATATTGGAGTAATCCTTCTGCTCACAGTAATAGCCACAGCATTTATAGGATATGTCCTACCATGAGGACAAATATCATTCTGAGGAG' asLowercase.
	self assert: theHsp hspHSeq blastValue equals: 'CCATCAAACATTTCATCATGATGAAATTTCGGTTCCCTCCTAGGAATCTGCCTAATCCTACAAATCCTCACAGGCCTATTCCTAGCAATACACTACACATCCGACACAACAACAGCATTCTCCTCTGTTACCCATATCTGCCGAGACGTGAACTACGGCTGAATCATCCGATACATACACGCAAACGGAGCTTCAATGTTTTTTATCTGCTTATATATGCACGTAGGACGAGGCTTATATTATGGGTCTTACACTTTTCTAGAAACATGAAATATTGGAGTAATCCTTCTGCTCACAGTAATAGCCACAGCATTTATAGGATATGTCCTACCATGAGGACAAATATCATTCTGAGGAG' asLowercase.
	self assert: theHsp hspMidLine blastValue equals: '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'.
	