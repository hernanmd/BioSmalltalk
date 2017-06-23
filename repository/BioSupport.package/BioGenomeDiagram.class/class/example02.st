examples
example02

	| gdDiagram record gdTrackForFeatures gdFeatureSet |

	record := nil. " ?? "
	gdDiagram := BioGenome new title: 'Yesinia ...'.
	gdTrackForFeatures := gdDiagram newTrackNamed: 'Annotated Track...' number: 1.
	gdFeatureSet := gdTrackForFeatures newSet.
	gdFeatureSet color: { Color blue . Color green }.

	record featuresDo: [ : feature |
		gdFeatureSet 
			addFeature: feature;
			addFeature: feature named: 'My Gene' ].

	gdDiagram drawLinear.
	gdDiagram drawCircular.
	gdDiagram writeAsPDFNamed: 'ExportGD.pdf'.
	gdDiagram writeAsSVGNamed: 'ExportSVG.svg'.