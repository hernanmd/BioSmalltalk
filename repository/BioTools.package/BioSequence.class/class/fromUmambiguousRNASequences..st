instance creation - rna
fromUmambiguousRNASequences: aCollection
	" Answer a <Collection> of receivers taking each <BioSequence> from aCollection "
	
	^ aCollection collect: [ : seqString | self newUnambiguousRNA: seqString ]