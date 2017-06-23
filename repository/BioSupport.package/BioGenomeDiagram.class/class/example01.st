examples
example01

	| gdFeatureSet gdTrackForFeatures gdDiagram |

	gdFeatureSet := BioGenomeDiagram newFeatureSet.
	gdTrackForFeatures := BioGenomeDiagram newTrackNamed: 'Annotated diagram 1'.
	gdDiagram := BioGenomeDiagram newDiagramNamed: 'Yesinia ...'.

	gdTrackForFeatures addSet: gdFeatureSet.
	gdDiagram addTrack: gdTrackForFeatures.
