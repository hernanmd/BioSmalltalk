testing
test03ParsingNodes

	| theHit theHsp |

	self saxParseBlastNodes: #hits03.						
	self assert: (result isKindOf: BioBlastRootNode).
	self assert: result nodes isCollection.
	self assert: result nodes size = 1.
	self assert: result nodes size = result size.
	
	self assert: result hits isCollection.
	self deny: result hits isEmpty.
	self assert: result hits size = 1.
	
	theHit := result hits anyOne.
	self assert: theHit hitIdentifier blastValue = 'gi|306977463|gb|HQ184044.1|'.
	self assert: theHit hitDefinition blastValue = 'Bos taurus isolate Rom600 mitochondrion, complete genome'.
	self assert: theHit hitAccession blastValue = 'HQ184044'.
	self assert: theHit hitLength blastValue = 16342.
	self assert: (theHit hitHsps isKindOf: BioBlastParentNode).
	self assert: theHit hitHsps size = 1.
	
	theHsp := theHit hitHsps nodes anyOne.
	self assert: theHsp hspBitScore blastValue = 646.892.
	self assert: theHsp hspScore blastValue = 716.
	self assert: theHsp hspEValue blastValue = 0.
	self assert: theHsp hspQueryFrom blastValue = 1.
	self assert: theHsp hspQueryTo blastValue = 358.	
	self assert: theHsp hspHitFrom blastValue = 14586.
	self assert: theHsp hspHitTo blastValue = 14943.
	self assert: theHsp hspQueryFrame blastValue = 1.
	self assert: theHsp hspHitFrame blastValue = 1.
	self assert: theHsp hspIdentity blastValue = 358.
	self assert: theHsp hspPositive blastValue = 358.
	self assert: theHsp hspGaps blastValue = 0.
	self assert: theHsp hspAlignLength blastValue = 358.
	self assert: theHsp hspQSeq blastValue = 'CCATCAAACATTTCATCATGATGAAATTTCGGTTCCCTCCTAGGAATCTGCCTAATCCTACAAATCCTCACAGGCCTATTCCTAGCAATACACTACACATCCGACACAACAACAGCATTCTCCTCTGTTACCCATATCTGCCGAGACGTGAACTACGGCTGAATCATCCGATACATACACGCAAACGGAGCTTCAATGTTTTTTATCTGCTTATATATGCACGTAGGACGAGGCTTATATTATGGGTCTTACACTTTTCTAGAAACATGAAATATTGGAGTAATCCTTCTGCTCACAGTAATAGCCACAGCATTTATAGGATATGTCCTACCATGAGGACAAATATCATTCTGAGGAG'.
	self assert: theHsp hspHSeq blastValue = 'CCATCAAACATTTCATCATGATGAAATTTCGGTTCCCTCCTAGGAATCTGCCTAATCCTACAAATCCTCACAGGCCTATTCCTAGCAATACACTACACATCCGACACAACAACAGCATTCTCCTCTGTTACCCATATCTGCCGAGACGTGAACTACGGCTGAATCATCCGATACATACACGCAAACGGAGCTTCAATGTTTTTTATCTGCTTATATATGCACGTAGGACGAGGCTTATATTATGGGTCTTACACTTTTCTAGAAACATGAAATATTGGAGTAATCCTTCTGCTCACAGTAATAGCCACAGCATTTATAGGATATGTCCTACCATGAGGACAAATATCATTCTGAGGAG'.
	self assert: theHsp hspMidLine blastValue = '||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'.
	