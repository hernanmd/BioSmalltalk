accessing
exportFromAffymetrixMap
	" Answer a <String> representing a .map file without headers and sorted by physical position. Interpret aFilename as a .map file exported from Affymetrix Suite. Add the following fields: chromosome, marker ID, centimorgan, physical position "

	(NeoCSVWriter on: self outputFile)
		separator: Character tab;
		fieldWriter: #raw;
		nextPutAll: (BioMAPFormatter newFromInputFile: self mapFile) sortByPosition;
		flush