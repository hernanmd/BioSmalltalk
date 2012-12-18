*BioTools
includesDtd: aDtdFilename
	" Private - Answer <true> if receiver's first bytes in header includes aDtdFilename "

	^ ((self first: 150) findTokens: $") includes: aDtdFilename