examples
example2
	" Export MAP file from Affymetrix Software Suite "

	BioLAMPLDFormatter new 
		inputFile: 'Exported-for-PLINK_by_Probe_Set_ID.map';
		outputFilename: 'Sorted_MAP-by_position.map';
		exportFromAffymetrixMap.