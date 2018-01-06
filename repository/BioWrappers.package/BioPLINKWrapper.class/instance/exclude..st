properties - filtering
exclude: aFilename
	" Accepts aFilename text file with a list of variant IDs (usually one per line, but it's okay for them to just be separated by spaces), and exclude all unlisted variants from the current analysis. Note that this is slightly different from PLINK 1.07's behavior when the main input fileset contains duplicate variant IDs: PLINK 1.9 removes all matches, while PLINK 1.07 just removes one of the matching variants. If your intention is to resolve duplicates, you should now use --bmerge instead of --exclude. "

	self propertyAt: 'exclude' ifAbsentPut: [ self buildPath: aFilename ]