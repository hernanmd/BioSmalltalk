as yet unclassified
setUp

	tempDir := FileDirectory default directoryNamed: 'graphVizTestTemp'.
	tempDir assureExistence.
	graph := GraphViz new.
	graph generator outputPath: tempDir fullName