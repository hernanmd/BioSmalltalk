accessing
exportFromAffymetrixMap
	" Write a .map file (s exported from Affymetrix Suite) without headers and sorted by physical position. Add the following fields: chromosome, marker ID, centimorgan, physical position "

	(NeoCSVWriter on: self outputFileStream)
		separator: Character tab;
		fieldWriter: #raw;
		nextPutAll: (BioMAPFormatter newFromInputFile: self inputFile) sortByPosition;
		flush