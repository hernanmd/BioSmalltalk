instance creation - dna
fromUmambiguousDNASequences: aCollection
	" Answer a <Collection> of receivers taking each <BioSequence> from aCollection "
	
	^ aCollection collect: [ : seqString | self newUnambiguousDNA: seqString ]