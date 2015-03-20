instance creation
newSNPRowFrom: row

	^ BioIlluminaSNPObject new
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
                yourself