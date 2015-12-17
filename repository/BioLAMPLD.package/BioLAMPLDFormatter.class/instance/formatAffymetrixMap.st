accessing
formatAffymetrixMap
	" Answer a <String> representing a .map file without headers and sorted by physical position. Interpret aFilename as a .map file exported from Affymetrix Suite. Add the following fields: chromosome, marker ID, centimorgan, physical position "

	^ (BioMAPFormatter newFromInputFile: self mapFile) sortByPosition.