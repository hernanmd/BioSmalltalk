accessing
addChromosome: aBioChromosome
	" Add aBioChromosome to the receiver's chromosomes "

	self chromosomes add: (aBioChromosome
		genome: self;
		yourself)