accessing
updateRepository

	| importer |
	
	importer := BioImporter versionImporterAt: self name.
	self bioSpecies: nil.
	self locatedBioSpecies: nil.
	importer importFromCsvFile: self requestCsvFile.
	importer initializeBioSpecies.