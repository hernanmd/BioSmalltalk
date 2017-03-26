properties
missingGenotype: aCharacter  
	" Missing genotype calls are normally assumed to be represented by '0' in .ped and similar files; you can change this to most other (nonspace) characters with --missing-genotype. However,  "

	self deny: [ { $A . $C . $G . $T . $1 . $2 . $3 . $4 } includes: aCharacter ] description: '1, 2, 3, 4, A, C, G, and T are disallowed'.
	self propertyAt: 'missing-genotype' ifAbsentPut: [ aCharacter ]