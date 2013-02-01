instance creation
readFrom: aFile
	" Answer a <Collection> of SNP objects "

	| snpCollection parser |

	parser := STextParser on: (self openFullFileNamed: aFile).
	parser delimiter: Character tab; ignoreHeadersCount: 10.
	snpCollection := OrderedCollection new.
	parser rowsDo: [ : row |
        | snp |
        snp := BioIlluminaSNPObject new
                name: row first;
                sampleId: row second;
                allele1Forward: row third first;
                allele2Forward: row fourth first;
                allele1Top: row fifth first;
                allele2Top: row sixth first;
                allele2AB: row seventh first;
                allele1AB: row eighth first;
                gcScore: row ninth;
                x: (row at: 10);
                y: (row at: 11);
                yourself.
        snpCollection add: snp ].