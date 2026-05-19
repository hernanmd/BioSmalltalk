"
I provide example methods that demonstrate how to use BioDnaFeaturesViewer.

Open any example from a workspace or playground:

    BioDnaFeaturesViewerExamples exampleLinearOverlappingFeatures.
    BioDnaFeaturesViewerExamples exampleLinearCustomScale.
    BioDnaFeaturesViewerExamples exampleLinearWithSequence.
    BioDnaFeaturesViewerExamples exampleLinearFromBioSequence.
    BioDnaFeaturesViewerExamples exampleCircularPlasmid.
    BioDnaFeaturesViewerExamples exampleCircularSmallPlasmid.
    BioDnaFeaturesViewerExamples exampleCircularRotated.
    BioDnaFeaturesViewerExamples exampleFeatureOperations.

Each example opens a Roassal visualization window showing different aspects of the framework:
- Linear views with overlapping features, custom scales, sequence display
- Circular plasmid views with different configurations
- Feature operations (overlap detection, cropping, splitting)
"
Class {
	#name : 'BioDnaFeaturesViewerExamples',
	#superclass : 'Object',
	#category : 'BioPlots-FeaturesViewer',
	#package : 'BioPlots',
	#tag : 'FeaturesViewer'
}

{ #category : 'examples - circular' }
BioDnaFeaturesViewerExamples class >> exampleCircularBasic [
    | f1 f2 circular |
    f1 := BioDnaFeature from: 0 to: 300 strand: 1 label: 'Gene A' color: Color red.
    f2 := BioDnaFeature from: 200 to: 500 strand: -1 label: 'Gene B' color: Color blue.
    circular := BioDnaCircularGraphicRecord sequenceLength: 600 features: { f1. f2 }.
    ^ circular openCircular
]

{ #category : 'examples - circular' }
BioDnaFeaturesViewerExamples class >> exampleCircularDefinedByHand [
	"Define features by hand and display circular view."
	"Corresponds to Python: graphic_record_defined_by_hand.py (circular part)"
	| f1 f2 f3 f4 circular |
	f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'Small feature' color: (Color r: 1.0 g: 0.84 b: 0.0).
	f2 := BioDnaFeature from: 20 to: 500 strand: 1 label: 'Gene 1 with a very long name' color: (Color r: 1.0 g: 0.8 b: 0.8).
	f3 := BioDnaFeature from: 400 to: 700 strand: -1 label: 'Gene 2' color: (Color r: 0.8 g: 1.0 b: 0.8).
	f4 := BioDnaFeature from: 600 to: 900 strand: 1 label: 'Gene 3' color: (Color r: 0.8 g: 0.8 b: 1.0).
	circular := BioDnaCircularGraphicRecord sequenceLength: 1000 features: { f1. f2. f3. f4 }.
	^ circular openCircularTitled: self mainTitle , ' - Circular Defined By Hand'
]

{ #category : 'examples - circular' }
BioDnaFeaturesViewerExamples class >> exampleCircularFromGenBank [
	"Load features from a GenBank file and display in circular view."
	| record circular |
	record := BioDnaGraphicRecord fromGenBankFile: 'DnaFeaturesViewer/examples/example_sequence.gb'.
	circular := BioDnaCircularGraphicRecord sequenceLength: record sequenceLength features: record features.
	^ circular openCircularTitled: self mainTitle , ' - Circular from GenBank'
]

{ #category : 'examples - circular' }
BioDnaFeaturesViewerExamples class >> exampleCircularPlasmid [
    | f1 f2 f3 f4 circular |
    f1 := BioDnaFeature from: 0 to: 200 strand: 1 label: 'Gene A' color: (Color r: 1.0 g: 0.4 b: 0.4).
    f2 := BioDnaFeature from: 150 to: 400 strand: -1 label: 'Gene B' color: (Color r: 0.4 g: 0.8 b: 0.4).
    f3 := BioDnaFeature from: 350 to: 550 strand: 1 label: 'Gene C' color: (Color r: 0.4 g: 0.4 b: 1.0).
    f4 := BioDnaFeature from: 500 to: 750 strand: 0 label: 'Regulatory' color: (Color r: 1.0 g: 0.8 b: 0.2).
    circular := BioDnaCircularGraphicRecord sequenceLength: 800 features: { f1. f2. f3. f4 }.
    ^ circular openCircularTitled: self mainTitle , ' - Circular Plasmid Map'
]

{ #category : 'examples - circular' }
BioDnaFeaturesViewerExamples class >> exampleCircularRotated [
    | f1 f2 f3 circular |
    f1 := BioDnaFeature from: 0 to: 300 strand: 1 label: 'Gene A' color: Color red.
    f2 := BioDnaFeature from: 250 to: 550 strand: -1 label: 'Gene B' color: Color blue.
    f3 := BioDnaFeature from: 500 to: 800 strand: 1 label: 'Gene C' color: Color green.
    circular := BioDnaCircularGraphicRecord sequenceLength: 900 features: { f1. f2. f3 }.
    circular topPosition: 200.
    ^ circular openCircularTitled: self mainTitle , ' - Circular Map - Rotated (top=200)'
]

{ #category : 'examples - circular' }
BioDnaFeaturesViewerExamples class >> exampleCircularSmallPlasmid [
    | f1 f2 circular |
    f1 := BioDnaFeature from: 1 to: 50 strand: 1 label: 'ampR' color: Color red.
    f2 := BioDnaFeature from: 30 to: 80 strand: -1 label: 'lacZ' color: Color green.
    circular := BioDnaCircularGraphicRecord sequenceLength: 100 features: { f1. f2 }.
    ^ circular openCircularTitled: self mainTitle , ' - Small Plasmid (100bp)'
]

{ #category : 'examples - operations' }
BioDnaFeaturesViewerExamples class >> exampleFeatureOperations [

	| f1 f2 f3 |
	f1 := BioDnaFeature
		      from: 10
		      to: 50
		      strand: 1
		      label: 'Gene A'
		      color: Color red.
	f2 := BioDnaFeature
		      from: 40
		      to: 80
		      strand: -1
		      label: 'Gene B'
		      color: Color blue.
	f3 := BioDnaFeature
		      from: 100
		      to: 150
		      strand: 1
		      label: 'Gene C'
		      color: Color green.

	Transcript
		show: 'Gene A overlaps Gene B: ';
		show: (f1 overlapsWith: f2) asString;
		cr.
	Transcript
		show: 'Gene A overlaps Gene C: ';
		show: (f1 overlapsWith: f3) asString;
		cr.
	Transcript
		show: 'Gene A length: ';
		show: f1 length asString;
		cr.
	Transcript
		show: 'Crop Gene A to 30-60: ';
		show: (f1 crop: (30 to: 60)) printString;
		cr.
	Transcript
		show: 'Split Gene A at 30: ';
		show: (f1 splitInTwoAt: 30) printString;
		cr
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearBasic [

	| f1 f2 record |
	f1 := BioDnaFeature
		      from: 100
		      to: 400
		      strand: 1
		      label: 'Gene A'
		      color: Color red.
	f2 := BioDnaFeature
		      from: 300
		      to: 600
		      strand: -1
		      label: 'Gene B'
		      color: Color blue.
	record := BioDnaGraphicRecord sequenceLength: 700 features: {
			          f1.
			          f2 }.
	^ record openLinear
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearCropped [
	"Crop a record to a sub-region and display."
	"Corresponds to Python: multiline_plot.py cropping concept"
	| f1 f2 f3 record cropped |
	f1 := BioDnaFeature from: 20 to: 500 strand: 1 label: 'Gene 1' color: (Color r: 1.0 g: 0.8 b: 0.8).
	f2 := BioDnaFeature from: 400 to: 700 strand: -1 label: 'Gene 2' color: (Color r: 0.8 g: 1.0 b: 0.8).
	f3 := BioDnaFeature from: 600 to: 900 strand: 1 label: 'Gene 3' color: (Color r: 0.8 g: 0.8 b: 1.0).
	record := BioDnaGraphicRecord sequenceLength: 1000 features: { f1. f2. f3 }.
	cropped := record cropFrom: 300 to: 700.
	^ cropped openLinearTitled: self mainTitle , ' - Cropped Region'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearCustomColorsFromGenBank [
	"Load features from GenBank with custom color mapping by feature type."

	"Corresponds to Python: translator_with_cutom_colors.py"

	| record |
	record := BioDnaGraphicRecord fromGenBankFile: 'DnaFeaturesViewer/examples/example_sequence.gb'.
	record features do: [ :f |
			((f label includesSubstring: 'site') or: [
				 f label includesSubstring: 'Site' ]) ifTrue: [
				f color: Color yellow ] ].
	^ record openLinearTitled: self mainTitle , ' - Custom Colors from GenBank'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearCustomScale [

	| f1 f2 record |
	f1 := BioDnaFeature
		      from: 100
		      to: 300
		      strand: 1
		      label: 'Gene A'
		      color: Color red.
	f2 := BioDnaFeature
		      from: 250
		      to: 500
		      strand: -1
		      label: 'Gene B'
		      color: Color blue.
	record := BioDnaGraphicRecord sequenceLength: 600 features: {
			          f1.
			          f2 }.
	record yScale: 40.
	record featureLevelHeight: 1.2.
	^ record openLinearTitled: self mainTitle , ' - Custom Scale (yScale=40)'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearDefinedByHand [
	"Define features by hand and display linear view."
	"Corresponds to Python: graphic_record_defined_by_hand.py (linear part)"
	| f1 f2 f3 f4 record |
	f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'Small feature' color: (Color r: 1.0 g: 0.84 b: 0.0).
	f2 := BioDnaFeature from: 20 to: 500 strand: 1 label: 'Gene 1 with a very long name' color: (Color r: 1.0 g: 0.8 b: 0.8).
	f3 := BioDnaFeature from: 400 to: 700 strand: -1 label: 'Gene 2' color: (Color r: 0.8 g: 1.0 b: 0.8).
	f4 := BioDnaFeature from: 600 to: 900 strand: 1 label: 'Gene 3' color: (Color r: 0.8 g: 0.8 b: 1.0).
	record := BioDnaGraphicRecord sequenceLength: 1000 features: { f1. f2. f3. f4 }.
	^ record openLinearTitled: self mainTitle , ' - Defined By Hand'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearFromBioSequence [

	| seq f1 f2 record |
	seq := BioSequence newDNA: 'ATCGATCGATCGATCGATCGATCGATCGATCGATCG'.
	f1 := BioSequenceFeature new
		      start: 1;
		      end: 12;
		      strand: 1;
		      primaryTag: 'promoter'.
	f2 := BioSequenceFeature new
		      start: 10;
		      end: 30;
		      strand: -1;
		      primaryTag: 'gene'.
	seq
		addSeqFeature: f1;
		addSeqFeature: f2.
	record := seq asDnaGraphicRecord.
	record features first color: (Color r: 0.2 g: 0.4 b: 0.8).
	record features second color: (Color r: 0.4 g: 0.8 b: 0.4).
	^ record openLinearTitled: self mainTitle , ' - From BioSequence'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearFromGenBank [
	"Load features from a GenBank file and display them."
	"Corresponds to Python: from_genbank.py"
	| record |
	record := BioDnaGraphicRecord fromGenBankFile: 'DnaFeaturesViewer/examples/example_sequence.gb'.
	^ record openLinearTitled: self mainTitle , ' - From GenBank'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearInvertedAxis [
	"Display a linear DNA feature plot with an inverted X-axis (reads right to left)."
	"Corresponds to Python: example_with_inverted_x_axis.py"
	| f1 f2 record canvas |
	f1 := BioDnaFeature from: 100 to: 400 strand: 1 label: 'Gene A' color: Color red.
	f2 := BioDnaFeature from: 300 to: 600 strand: -1 label: 'Gene B' color: Color blue.
	record := BioDnaGraphicRecord sequenceLength: 700 features: { f1. f2 }.
	canvas := record linearCanvas.
	canvas camera scale: -1.
	^ canvas openWithTitle: self mainTitle , ' - Inverted Axis'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearLocallyHighlighted [
	"Highlight features in a specific region and fade features outside that region."
	"Corresponds to Python: locally_highlighted_record.py"
	| f1 f2 f3 record |
	f1 := BioDnaFeature from: 100 to: 300 strand: 1 label: 'Gene A' color: Color red.
	f2 := BioDnaFeature from: 250 to: 500 strand: -1 label: 'Gene B' color: Color blue.
	f3 := BioDnaFeature from: 600 to: 800 strand: 1 label: 'Gene C' color: Color green.
	record := BioDnaGraphicRecord sequenceLength: 1000 features: { f1. f2. f3 }.
	record elevateOutlineAnnotations: true.
	^ record openLinearTitled: self mainTitle , ' - Locally Highlighted'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearOverlappingFeatures [

	| f1 f2 f3 f4 record |
	f1 := BioDnaFeature
		      from: 5
		      to: 20
		      strand: 1
		      label: 'Promoter'
		      color: (Color r: 0.2 g: 0.4 b: 0.8).
	f2 := BioDnaFeature
		      from: 20
		      to: 500
		      strand: 1
		      label: 'Gene 1'
		      color: (Color r: 1.0 g: 0.4 b: 0.4).
	f3 := BioDnaFeature
		      from: 400
		      to: 700
		      strand: -1
		      label: 'Gene 2'
		      color: (Color r: 0.4 g: 0.8 b: 0.4).
	f4 := BioDnaFeature
		      from: 600
		      to: 900
		      strand: 0
		      label: 'Regulatory region'
		      color: (Color r: 0.8 g: 0.8 b: 1.0).
	record := BioDnaGraphicRecord sequenceLength: 1000 features: {
			          f1.
			          f2.
			          f3.
			          f4 }.
	^ record openLinearTitled: self mainTitle , ' - Overlapping Features'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearOverviewAndDetail [
	"Display an overview plot and a zoomed detail view side by side."
	"Corresponds to Python: overview_and_detail.py"

	| f1 f2 f3 f4 record cropped canvas |
	f1 := BioDnaFeature
		      from: 10
		      to: 20
		      strand: 1
		      label: 'Small feature'
		      color: (Color r: 1.0 g: 0.84 b: 0.0).
	f2 := BioDnaFeature
		      from: 20
		      to: 500
		      strand: 1
		      label: 'Gene 1 with a very long name'
		      color: (Color r: 1.0 g: 0.8 b: 0.8).
	f3 := BioDnaFeature
		      from: 400
		      to: 700
		      strand: -1
		      label: 'Gene 2'
		      color: (Color r: 0.8 g: 1.0 b: 0.8).
	f4 := BioDnaFeature
		      from: 600
		      to: 900
		      strand: 1
		      label: 'Gene 3'
		      color: (Color r: 0.8 g: 0.8 b: 1.0).
	record := BioDnaGraphicRecord sequenceLength: 1000 features: { f1 . f2 . f3 . f4 }.
	cropped := record cropFrom: 398 to: 428.
	canvas := record linearCanvas.
	^ canvas openWithTitle: self mainTitle , ' - Overview'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearSequenceAndTranslation [
	"Display a short DNA sequence with features and amino acid translation."
	"Features on top, sequence/translation below the ruler (Python-style)."
	"Corresponds to Python: sequence_and_translation.py"
	| f1 f2 record |
	f1 := BioDnaFeature
		from: 5
		to: 10
		strand: 1
		label: 'Feature A'
		color: (Color r: 1.0 g: 0.8 b: 0.8).
	f2 := BioDnaFeature
		from: 8
		to: 15
		strand: 1
		label: 'Feature B'
		color: (Color r: 0.8 g: 0.8 b: 1.0).
	record := BioDnaGraphicRecord
		sequence: 'ATGCATGCATGCATGCATGCATGCATGC'
		features: { f1. f2 }.
	record flipY: true.
	^ record
		openLinearWithSequenceAndTranslationTitled: self mainTitle , ' Features on top - Sequence and Translation'
		from: 8
		to: 23
]

{ #category : 'examples' }
BioDnaFeaturesViewerExamples class >> exampleLinearWithGCPlot [
	"Display features with labels above the ruler and GC content below.
	Corresponds to Python: with_gc_plot.py"
	| record |
	record := BioDnaGraphicRecord fromGenBankFile: 'DnaFeaturesViewer/examples/example_sequence.gb'.
	record flipY: true.
	^ record
		openLinearWithGCTitled: 'DNA Features Viewer - GC Plot'
		windowSize: 50
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearWithSequence [
	| f1 f2 record |
	f1 := BioDnaFeature
		      from: 1
		      to: 8
		      strand: 1
		      label: 'Promoter'
		      color: (Color r: 0.2 g: 0.4 b: 0.8).
	f2 := BioDnaFeature
		      from: 5
		      to: 15
		      strand: -1
		      label: 'Gene'
		      color: (Color r: 1.0 g: 0.4 b: 0.4).
	record := BioDnaGraphicRecord
		          sequence: 'ATCGATCGATCGATCGATCG'
		          features: {
				          f1.
				          f2 }.
	record flipY: true.
	^ record openLinearWithSequenceTitled: self mainTitle , ' - With Sequence'
]

{ #category : 'examples - linear' }
BioDnaFeaturesViewerExamples class >> exampleLinearWithSequenceNoTitle [
	| f1 f2 record |
	f1 := BioDnaFeature
		      from: 1
		      to: 8
		      strand: 1
		      label: 'Promoter'
		      color: (Color r: 0.2 g: 0.4 b: 0.8).
	f2 := BioDnaFeature
		      from: 5
		      to: 15
		      strand: -1
		      label: 'Gene'
		      color: (Color r: 1.0 g: 0.4 b: 0.4).
	record := BioDnaGraphicRecord
		          sequence: 'ATCGATCGATCGATCGATCG'
		          features: {
				          f1.
				          f2 }.
	record flipY: true.
	^ record openLinearWithSequence
]

{ #category : 'accessing' }
BioDnaFeaturesViewerExamples class >> mainTitle [

	^ 'Features Viewer'
]
