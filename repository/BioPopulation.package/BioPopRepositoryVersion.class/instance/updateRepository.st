accessing
updateRepository

	importer := BioPopImporter versionImporterAt: self name.
	self bioSpecies: nil.
	self locatedBioSpecies: nil.
	importer importFromCsvFile: self requestOpenCSVFile.
	importer initializeLocatedSpecies.