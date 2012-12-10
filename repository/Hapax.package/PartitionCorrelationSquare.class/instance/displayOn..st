displaying
displayOn: graphicsContext

	| scheme |
	threshold ifNil: [ ^super asImage displayOn: graphicsContext ].

	scheme := ColorScheme gray.
	partitionMatrix items doWithIndex: [ :clusterA :row |
		partitionMatrix items doWithIndex: [ :clusterB :column |
			| rectangle |
			rectangle := ((clusterA startIndex @ clusterB startIndex) - 1) corner: (clusterA endIndex @ clusterB endIndex).
			graphicsContext paint: (scheme colorValue: (partitionMatrix at: row and: column)).
			graphicsContext displayRectangle: rectangle ]].