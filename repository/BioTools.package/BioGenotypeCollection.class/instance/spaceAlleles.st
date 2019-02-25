accessing
spaceAlleles

	^ self genotypes collect: [ : geno | 
		String streamContents: [ : stream |
			stream 
				nextPut: geno alleleA;
				space;
				nextPut: geno alleleB  ] ]