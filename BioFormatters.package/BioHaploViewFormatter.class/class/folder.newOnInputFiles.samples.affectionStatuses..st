instance creation
folder: aDirectoryString newOnInputFiles: inputFilenamesWithAffectedRows samples: aSamplesCollection affectionStatuses: affectionStatuses

	inputFilenamesWithAffectedRows associationsDo: [ : assoc |
		| exporter |
		( exporter := self new ) outputFilename: 'output - ' , assoc key.
		exporter
			initializeWithInputFile: aDirectoryString , assoc key " filename "
			samples: aSamplesCollection
			affectedRows: assoc value. " affectedRowsCount "
		exporter
			fillPedigreeNames: 1;
			fillIndividualIDs;
			fillFatherIDs: 0;
			fillMotherIDs: 0;
			fillSex: 1;
			fillAffectionStatus: affectionStatuses;
			fillMatrix;
			exportMatrix ]