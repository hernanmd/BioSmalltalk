Class {
	#name : #BioGenomeDiagram,
	#superclass : #Object,
	#category : 'BioSupport-Visualization'
}

{ #category : #examples }
BioGenomeDiagram class >> example01 [

	| gdFeatureSet gdTrackForFeatures gdDiagram |

	gdFeatureSet := BioGenomeDiagram newFeatureSet.
	gdTrackForFeatures := BioGenomeDiagram newTrackNamed: 'Annotated diagram 1'.
	gdDiagram := BioGenomeDiagram newDiagramNamed: 'Yesinia ...'.

	gdTrackForFeatures addSet: gdFeatureSet.
	gdDiagram addTrack: gdTrackForFeatures.

]

{ #category : #examples }
BioGenomeDiagram class >> example02 [

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
]

{ #category : #accessing }
BioGenomeDiagram >> addFeature: aFeature [

	self shouldBeImplemented
]

{ #category : #accessing }
BioGenomeDiagram >> addFeature: aFeature color: aColor [

	self shouldBeImplemented
]

{ #category : #accessing }
BioGenomeDiagram >> addFeature: aFeature named: aString [

	self shouldBeImplemented
]

{ #category : #accessing }
BioGenomeDiagram >> addFeature: aFeature named: aString color: aColor [

	self shouldBeImplemented
]
