testing
isExcludedFeature: featureName

	^ featureName = 'Recognized Region' or: [ featureName = 'BlastNode' ]