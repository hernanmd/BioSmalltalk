Writer for Admixed Genotype Sample (.geno or .gen) file. This is a file which contains one sample per row with the following codes:

Internal Representation and Key Implementation Points.

    Instance Variables
	bimFilePath:		<String>
	pedFilePath:		<String>

Example

BioLAMPLDGenotypeFormatter new 
	bimFilePath: 'file.bim';
	pedFilePath: 'file.ped';
	export.
