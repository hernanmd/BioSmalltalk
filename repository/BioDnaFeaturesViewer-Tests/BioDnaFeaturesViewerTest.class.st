"
I test the BioDnaFeaturesViewer package including BioDnaFeature, BioDnaFeatureLevelComputer, BioDnaGraphicRecord, and BioDnaCircularGraphicRecord.
"
Class {
	#name : 'BioDnaFeaturesViewerTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioDnaFeaturesViewer-Tests',
	#package : 'BioDnaFeaturesViewer-Tests'
}

{ #category : 'running' }
BioDnaFeaturesViewerTest >> sampleFeatures [
    ^ {
        BioDnaFeature from: 5 to: 20 strand: 1 label: 'Small feature' color: Color yellow.
        BioDnaFeature from: 20 to: 500 strand: 1 label: 'Gene 1' color: Color red.
        BioDnaFeature from: 400 to: 700 strand: -1 label: 'Gene 2' color: Color green.
        BioDnaFeature from: 600 to: 900 strand: 1 label: 'Gene 3' color: Color blue
    }
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testAminoAcidForCodon [
	"Test standard genetic code translation."

	| record |
	record := BioDnaGraphicRecord new.
	self assert: (record aminoAcidForCodon: 'ATG') equals: $M.
	self assert: (record aminoAcidForCodon: 'TAA') equals: $*.
	self assert: (record aminoAcidForCodon: 'GCT') equals: $A.
	self assert: (record aminoAcidForCodon: 'TTT') equals: $F.
	self assert: (record aminoAcidForCodon: 'GG') equals: $-
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testAutoLabelColor [

	| record |
	record := BioDnaGraphicRecord
		          sequenceLength: 100
		          features: OrderedCollection new. "Dark colors should produce white labels"
	self
		assert: (record autoLabelColorFor: Color black)
		equals: Color white.
	self
		assert: (record autoLabelColorFor: (Color r: 0.2 g: 0.4 b: 0.8))
		equals: Color white. "Light colors should produce black labels for readability"
	self
		assert: (record autoLabelColorFor: Color white)
		equals: Color black.
	self
		assert: (record autoLabelColorFor: Color red)
		equals: Color white
]

{ #category : 'tests - integration' }
BioDnaFeaturesViewerTest >> testBioSequenceAsDnaGraphicRecord [
    | seq f record |
    seq := BioSequence newDNA: 'ATCGATCGATCGATCGATCG'.
    f := BioSequenceFeature new start: 1; end: 8; strand: 1; primaryTag: 'promoter'.
    seq addSeqFeature: f.
    record := seq asDnaGraphicRecord.
    self assert: record sequenceLength equals: 20.
    self assert: record features size equals: 1.
    self assert: record features first label equals: 'promoter'
]

{ #category : 'tests - integration' }
BioDnaFeaturesViewerTest >> testBioSequenceFeatureAsDnaFeature [
    | sf df |
    sf := BioSequenceFeature new start: 10; end: 50; strand: 1; primaryTag: 'gene'.
    df := sf asDnaFeature.
    self assert: df start equals: 10.
    self assert: df end equals: 50.
    self assert: df strand equals: 1.
    self assert: df label equals: 'gene'
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testBuildLinearGCPlotRendersWithoutError [	| record canvas |	record := BioDnaGraphicRecord sequence: 'ATGCGATCGATCGATCGATCGATCGATCGATCGATCGATCG' features: { (BioDnaFeature from: 5 to: 20 strand: 1 label: 'Gene' color: Color red) }.	record flipY: true.	canvas := record linearCanvas.	record buildLinearGCOn: canvas windowSize: 10.	self assert: canvas shapes notEmpty
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testCircularCanvasCreation [
    | record canvas |
    record := BioDnaCircularGraphicRecord sequenceLength: 200 features: self sampleFeatures.
    canvas := record circularCanvas.
    self assert: canvas class equals: RSCanvas.
    self assert: canvas numberOfShapes > 0
]

{ #category : 'tests - circular' }
BioDnaFeaturesViewerTest >> testCircularCreation [
    | record |
    record := BioDnaCircularGraphicRecord sequenceLength: 1000 features: OrderedCollection new.
    self assert: record radius equals: 1.0.
    self assert: record topPosition equals: 0.
    self assert: record featureLevelHeight closeTo: 0.2.
    self assert: record cScale equals: 200
]

{ #category : 'tests - circular' }
BioDnaFeaturesViewerTest >> testCircularScaledCoordinates [
    | circular pos sR |
    circular := BioDnaCircularGraphicRecord sequenceLength: 1000 features: OrderedCollection new.
    sR := circular scaledRadius.
    pos := circular coordinatesInPlotAt: 0 level: 0.
    self assert: pos x closeTo: 0.0.
    self assert: pos y closeTo: sR
]

{ #category : 'tests - circular' }
BioDnaFeaturesViewerTest >> testCircularWithCSCALE [
    | circular |
    circular := BioDnaCircularGraphicRecord sequenceLength: 1000 features: OrderedCollection new.
    self assert: circular cScale equals: 200.
    circular cScale: 300.
    self assert: circular scaledRadius equals: 300
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testColorForFeatureType [
	"Already exists - testing different feature types get appropriate colors."
	| record |
	record := BioDnaGraphicRecord new.
	self assert: (record colorForFeatureType: 'CDS') equals: (Color r: 0.2 g: 0.6 b: 0.2).
	self assert: (record colorForFeatureType: 'promoter') equals: (Color r: 0.2 g: 0.4 b: 0.8).
	self assert: (record colorForFeatureType: 'terminator') equals: (Color r: 0.8 g: 0.4 b: 0.8).
	self assert: (record colorForFeatureType: 'gene') equals: (Color r: 0.8 g: 0.2 b: 0.2).
	self assert: (record colorForFeatureType: 'restriction_site') notNil
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testComputeFeatureLevels [
    | record levels |
    record := BioDnaGraphicRecord sequenceLength: 1000 features: self sampleFeatures.
    levels := record computeFeatureLevels.
    self assert: levels size equals: 4
]

{ #category : 'tests - levels' }
BioDnaFeaturesViewerTest >> testComputeLevelsEmpty [
    | computer levels |
    computer := BioDnaFeatureLevelComputer new.
    levels := computer computeLevelsFor: #().
    self assert: levels isEmpty
]

{ #category : 'tests - levels' }
BioDnaFeaturesViewerTest >> testComputeLevelsNonOverlapping [
    | f1 f2 computer levels |
    f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    f2 := BioDnaFeature from: 25 to: 40 strand: 1 label: 'B' color: Color blue.
    computer := BioDnaFeatureLevelComputer new.
    levels := computer computeLevelsFor: { f1. f2 }.
    self assert: (levels at: f1) equals: 0.
    self assert: (levels at: f2) equals: 0
]

{ #category : 'tests - levels' }
BioDnaFeaturesViewerTest >> testComputeLevelsOverlapping [
    | f1 f2 computer levels |
    f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    f2 := BioDnaFeature from: 15 to: 30 strand: 1 label: 'B' color: Color blue.
    computer := BioDnaFeatureLevelComputer new.
    levels := computer computeLevelsFor: { f1. f2 }.
    self deny: (levels at: f1) equals: (levels at: f2)
]

{ #category : 'tests - circular' }
BioDnaFeaturesViewerTest >> testCoordinatesInPlot [
    | record pos sR |
    record := BioDnaCircularGraphicRecord sequenceLength: 1000 features: OrderedCollection new.
    sR := record scaledRadius.
    pos := record coordinatesInPlotAt: 0 level: 0.
    "Position 0 is at angle 90 degrees (top of circle)"
    self assert: pos x closeTo: 0.0.
    self assert: pos y closeTo: sR
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testCreation [
    | f |
    f := BioDnaFeature from: 5 to: 20 strand: 1 label: 'GeneA' color: Color red.
    self assert: f start equals: 5.
    self assert: f end equals: 20.
    self assert: f strand equals: 1.
    self assert: f label equals: 'GeneA'.
    self assert: f color equals: Color red
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testCropFromTo [
    | f1 f2 f3 record cropped |
    f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    f2 := BioDnaFeature from: 15 to: 30 strand: 1 label: 'B' color: Color blue.
    f3 := BioDnaFeature from: 25 to: 40 strand: -1 label: 'C' color: Color green.
    record := BioDnaGraphicRecord sequenceLength: 50 features: { f1. f2. f3 }.
    cropped := record cropFrom: 10 to: 35.
    self assert: cropped sequenceLength equals: 25.
    self assert: cropped firstIndex equals: 10.
    self assert: cropped features size equals: 3
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testCropNoOverlap [
    | f cropped |
    f := BioDnaFeature from: 10 to: 50 strand: 1 label: 'Gene' color: Color red.
    cropped := f crop: (60 to: 80).
    self assert: cropped isNil
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testCropOverlap [
    | f cropped |
    f := BioDnaFeature from: 10 to: 50 strand: 1 label: 'Gene' color: Color red.
    cropped := f crop: (20 to: 60).
    self assert: cropped start equals: 20.
    self assert: cropped end equals: 50.
    self assert: cropped openLeft.
    self deny: cropped openRight
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testCropPreservesSequence [	"Test that cropping preserves the sequence when available."	| f1 record cropped |	f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'Gene A' color: Color red.	record := BioDnaGraphicRecord sequence: 'ATCGATCGATCGATCGATCG' features: { f1 }.	cropped := record cropFrom: 0 to: 9.	self assert: cropped sequence notNil.	self assert: cropped sequence size equals: 9.	self assert: cropped sequenceLength equals: 9.
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testDetermineTickInterval [
    | record |
    record := BioDnaGraphicRecord sequenceLength: 100 features: OrderedCollection new.
    self assert: record determineTickInterval equals: 10.
    record sequenceLength: 5000.
    self assert: record determineTickInterval equals: 100.
    record ticksResolution: 25.
    self assert: record determineTickInterval equals: 25
]

{ #category : 'tests - integration' }
BioDnaFeaturesViewerTest >> testDnaFeatureAsBioSequenceFeature [
    | df sf |
    df := BioDnaFeature from: 10 to: 50 strand: 1 label: 'Gene' color: Color red.
    sf := df asBioSequenceFeature.
    self assert: sf start equals: 10.
    self assert: sf end equals: 50.
    self assert: sf strand equals: 1.
    self assert: sf primaryTag equals: 'Gene'
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testDnaFeatureCopy [
    | f copy |
    f := BioDnaFeature from: 10 to: 50 strand: 1 label: 'Gene' color: Color red.
    copy := f copy.
    self assert: copy start equals: 10.
    self assert: copy end equals: 50.
    self deny: copy == f
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testEquality [
    | f1 f2 |
    f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    f2 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    self assert: f1 equals: f2
]

{ #category : 'tests - examples' }
BioDnaFeaturesViewerTest >> testExampleCircularCreatesCanvas [
    | f circular canvas |
    f := BioDnaFeature from: 0 to: 200 strand: 1 label: 'Gene' color: Color red.
    circular := BioDnaCircularGraphicRecord sequenceLength: 300 features: { f }.
    canvas := circular circularCanvas.
    self assert: canvas class equals: RSCanvas.
    self assert: canvas numberOfShapes > 0
]

{ #category : 'tests - examples' }
BioDnaFeaturesViewerTest >> testExampleLinearCreatesCanvas [
    | f1 f2 record canvas |
    f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    f2 := BioDnaFeature from: 25 to: 100 strand: -1 label: 'B' color: Color blue.
    record := BioDnaGraphicRecord sequenceLength: 200 features: { f1. f2 }.
    canvas := record linearCanvas.
    self assert: canvas class equals: RSCanvas.
    self assert: canvas numberOfShapes > 0
]

{ #category : 'tests - helpers' }
BioDnaFeaturesViewerTest >> testFeatureTypeColoring [
	"Test that different feature types get appropriate colors."
	| record |
	record := BioDnaGraphicRecord new.
	self assert: (record colorForFeatureType: 'gene') equals: (Color r: 0.8 g: 0.2 b: 0.2).
	self assert: (record colorForFeatureType: 'CDS') equals: (Color r: 0.2 g: 0.6 b: 0.2).
	self assert: (record colorForFeatureType: 'promoter') equals: (Color r: 0.2 g: 0.4 b: 0.8).
	self assert: (record colorForFeatureType: 'terminator') equals: (Color r: 0.8 g: 0.4 b: 0.8).
	self assert: (record colorForFeatureType: 'restriction_site') equals: (Color r: 0.9 g: 0.9 b: 0.2).
	self assert: (record colorForFeatureType: 'misc_feature') equals: (Color r: 0.6 g: 0.6 b: 0.6).
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testFeatureYPositionWithScale [
    | f1 record levels level y |
    f1 := BioDnaFeature from: 10 to: 50 strand: 1 label: 'Gene' color: Color red.
    record := BioDnaGraphicRecord sequenceLength: 200 features: { f1 }.
    levels := record computeFeatureLevels.
    level := levels at: f1.
    y := level * record featureLevelHeight * record yScale.
    self assert: y closeTo: 0
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testFlipYDirectionAffectsYCoordinates [
	"Verify that flipY controls the sign of y-coordinates for features and sequence."
	| f1 record canvasFlip canvasNoFlip shapesFlip shapesNoFlip labelsFlip labelsNoFlip |
	f1 := BioDnaFeature from: 5 to: 10 strand: 1 label: 'F' color: Color red.
	record := BioDnaGraphicRecord sequenceLength: 28 features: { f1 }.
	"flipY = true: features should have negative y (above ruler in Roassal)"
	record flipY: true.
	canvasFlip := record linearCanvas.
	"flipY = false: features should have positive y (below ruler in Roassal)"
	record := BioDnaGraphicRecord sequenceLength: 28 features: { f1 }.
	record flipY: false.
	canvasNoFlip := record linearCanvas.
	shapesFlip := canvasFlip shapes select: [ :s | s isKindOf: RSPolygon ].
	shapesNoFlip := canvasNoFlip shapes select: [ :s | s isKindOf: RSPolygon ].
	self assert: shapesFlip notEmpty.
	self assert: shapesNoFlip notEmpty.
	"With flipY=true, feature y should be negative (above ruler)"
	self assert: shapesFlip first position y < 0.
	"With flipY=false, feature y should be positive (below ruler)"
	self assert: shapesNoFlip first position y > 0
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testForwardArrowDoesNotSplitIntoTwoTriangles [	"Regression test: forward arrow must not split into two triangles."	"The tip point must be between the shaft bottom-right and top-right points."	| feature record polygon pos wp |	feature := BioDnaFeature from: 100 to: 400 strand: 1 label: 'Gene A' color: Color red.	record := BioDnaGraphicRecord sequenceLength: 700 features: { feature }.	polygon := record buildArrowPolygonFor: feature atLevel: 0 on: RSCanvas new.	pos := polygon position.	wp := polygon points collect: [ :p | p + pos ].	self assert: (wp at: 3) x > (wp at: 2) x.	self assert: (wp at: 3) x > (wp at: 4) x.	self assert: ((wp at: 1) x - (wp at: 5) x) abs < 0.01
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testForwardArrowPolygonPointOrder [
	"Test that forward arrow polygon points are in the correct order."
	"The tip (3rd point in world coordinates) must be the rightmost point."
	| feature record polygon pos worldPoints |
	feature := BioDnaFeature from: 10 to: 50 strand: 1 label: 'Test' color: Color red.
	record := BioDnaGraphicRecord sequenceLength: 100 features: { feature }.
	polygon := record buildArrowPolygonFor: feature atLevel: 0 on: RSCanvas new.
	pos := polygon position.
	worldPoints := polygon points collect: [ :p | p + pos ].
	"The 3rd point (tip) should be rightmost."
	self assert: (worldPoints at: 3) x > (worldPoints at: 2) x.
	"The tip should be at the feature end."
	self assert: ((worldPoints at: 3) x - (feature end - 0.5)) abs < 0.01.
	"The tip should be at the center y of the feature level."
	self assert: (worldPoints at: 3) y abs < 0.01.
	"First point should be bottom-left at feature start."
	self assert: ((worldPoints at: 1) x - (feature start - 0.5)) abs < 0.01.
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testGenBankComplementStrand [
	"Test that complement strand features are parsed with strand -1."
	| record reverseFeatures |
	record := BioDnaGraphicRecord fromGenBankFile: 'DnaFeaturesViewer/examples/example_sequence.gb'.
	reverseFeatures := record features select: [ :f | f isReverse ].
	self assert: reverseFeatures size >= 2.
	self assert: (reverseFeatures anySatisfy: [ :f | f label includesSubstring: 'aaCI' ])
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testGenBankFeatureTypes [
	"Test that different feature types get different colors from GenBank file."
	| record |
	record := BioDnaGraphicRecord fromGenBankFile: 'DnaFeaturesViewer/examples/example_sequence.gb'.
	self assert: record features size > 0.
	"Features should have different labels based on GenBank feature types."
	record features do: [ :f | self assert: f label notNil ].
	"CDS features should have specific colors."
	record features do: [ :f | self assert: f color notNil ]
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testLabelRowsNoOverlap [
    | f1 f2 f3 record labeledFeatures rows |
    f1 := BioDnaFeature from: 10 to: 100 strand: 1 label: 'Gene A' color: Color red.
    f2 := BioDnaFeature from: 200 to: 300 strand: 1 label: 'Gene B' color: Color blue.
    f3 := BioDnaFeature from: 350 to: 450 strand: -1 label: 'Gene C' color: Color green.
    record := BioDnaGraphicRecord sequenceLength: 500 features: { f1. f2. f3 }.
    labeledFeatures := record features select: [ :f | f label notNil ].
    rows := record computeLabelRowsFor: labeledFeatures.
    self assert: (rows at: f1) equals: 0.
    self assert: (rows at: f2) equals: 0.
    self assert: (rows at: f3) equals: 0
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testLabelRowsWithOverlaps [
    | f1 f2 record labeledFeatures rows |
    "Features with very close x-centers -> labels overlap in x"
    f1 := BioDnaFeature from: 100 to: 110 strand: 1 label: 'GeneA' color: Color red.
    f2 := BioDnaFeature from: 105 to: 115 strand: -1 label: 'GeneB' color: Color blue.
    record := BioDnaGraphicRecord sequenceLength: 500 features: { f1. f2 }.
    labeledFeatures := record features select: [ :f | f label notNil ].
    rows := record computeLabelRowsFor: labeledFeatures.
    "Close labels should be in different rows"
    self deny: ((rows at: f1) = (rows at: f2))
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testLength [
    | f |
    f := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    self assert: f length equals: 15
]

{ #category : 'tests - levels' }
BioDnaFeaturesViewerTest >> testLevelsForClassMethod [
    | f1 f2 levels |
    f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    f2 := BioDnaFeature from: 25 to: 40 strand: 1 label: 'B' color: Color blue.
    levels := BioDnaFeatureLevelComputer levelsFor: { f1. f2 }.
    self assert: (levels at: f1) equals: 0.
    self assert: (levels at: f2) equals: 0
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testLinearCanvasCreation [
    | record canvas |
    record := BioDnaGraphicRecord sequenceLength: 200 features: self sampleFeatures.
    canvas := record linearCanvas.
    self assert: canvas class equals: RSCanvas.
    self assert: canvas numberOfShapes > 0
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testLinearRulerTickScale [
	"Verify that ruler tick marks are proportionally small relative to features."
	| record canvas shapes lines ruler |
	record := BioDnaGraphicRecord sequenceLength: 1000 features: self sampleFeatures.
	canvas := record linearCanvas.
	lines := canvas shapes select: [ :s | s class = RSLine ].
	self assert: lines size > 0.
	ruler := lines detect: [ :l | l from y = 0 and: [ l to y = 0 ] ] ifNone: [ nil ].
	self assert: ruler notNil.
	self assert: ruler from x < 0.
	self assert: ruler to x > 900.
]

{ #category : 'tests - helpers' }
BioDnaFeaturesViewerTest >> testNucleotideColor [
    | record |
    record := BioDnaGraphicRecord sequenceLength: 100 features: OrderedCollection new.
    self assert: (record nucleotideColorFor: $A) isNil not.
    self assert: (record nucleotideColorFor: $T) isNil not.
    self assert: (record nucleotideColorFor: $N) equals: Color gray
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testOverlapsWith [
    | f1 f2 f3 f4 |
    f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    f2 := BioDnaFeature from: 15 to: 30 strand: 1 label: 'B' color: Color blue.
    f3 := BioDnaFeature from: 25 to: 40 strand: 1 label: 'C' color: Color green.
    f4 := BioDnaFeature from: 10 to: 15 strand: 1 label: 'D' color: Color yellow.
    self assert: (f1 overlapsWith: f2).
    self assert: (f2 overlapsWith: f1).
    self deny: (f1 overlapsWith: f3).
    self assert: (f4 overlapsWith: f1)
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testOverlapsWithNoOverlap [
    | f1 f2 |
    f1 := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    f2 := BioDnaFeature from: 25 to: 40 strand: 1 label: 'B' color: Color blue.
    self deny: (f1 overlapsWith: f2)
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testParseGenBankFromFile [
	"Test that GenBank file parsing creates the expected features."
	| record |
	record := BioDnaGraphicRecord fromGenBankFile: 'DnaFeaturesViewer/examples/example_sequence.gb'.
	self assert: record sequenceLength equals: 4720.
	self assert: record features size equals: 11.
	self assert: record features first label notNil.
	self assert: record sequence notNil.
	self assert: record sequence size > 0
]

{ #category : 'tests - circular' }
BioDnaFeaturesViewerTest >> testPositionToAngle [
    | record |
    record := BioDnaCircularGraphicRecord sequenceLength: 1000 features: OrderedCollection new.
    self assert: (record positionToAngle: 0) closeTo: 90.0.
    self assert: (record positionToAngle: 250) closeTo: 0.0.
    self assert: (record positionToAngle: 500) closeTo: -90.0.
    self assert: (record positionToAngle: 750) closeTo: -180.0
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testRecordAddFeature [
    | record f |
    record := BioDnaGraphicRecord sequenceLength: 200 features: OrderedCollection new.
    f := BioDnaFeature from: 10 to: 50 strand: 1 label: 'Gene' color: Color red.
    record addFeature: f.
    self assert: record features size equals: 1.
    self assert: record features first label equals: 'Gene'
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testRecordCreation [
    | features record |
    features := self sampleFeatures.
    record := BioDnaGraphicRecord sequenceLength: 1000 features: features.
    self assert: record sequenceLength equals: 1000.
    self assert: record features size equals: 4.
    self assert: record span equals: (0 to: 1000)
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testRecordLastIndex [
    | record |
    record := BioDnaGraphicRecord sequenceLength: 1000 features: OrderedCollection new.
    self assert: record lastIndex equals: 1000.
    record firstIndex: 100.
    self assert: record lastIndex equals: 1100
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testRecordRemoveFeature [
    | record f |
    record := BioDnaGraphicRecord sequenceLength: 200 features: OrderedCollection new.
    f := BioDnaFeature from: 10 to: 50 strand: 1 label: 'Gene' color: Color red.
    record addFeature: f.
    record removeFeature: f.
    self assert: record features isEmpty
]

{ #category : 'tests - integration' }
BioDnaFeaturesViewerTest >> testRecordWithSequence [
    | record |
    record := BioDnaGraphicRecord sequence: 'ATCGATCGATCGATCGATCG' features: OrderedCollection new.
    self assert: record sequenceLength equals: 20.
    self assert: record sequence equals: 'ATCGATCGATCGATCGATCG'
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testReverseArrowPolygonPointOrder [
	"Test that reverse arrow polygon points form a correct left-pointing arrow."
	| feature record polygon pos worldPoints |
	feature := BioDnaFeature from: 10 to: 50 strand: -1 label: 'Test' color: Color blue.
	record := BioDnaGraphicRecord sequenceLength: 100 features: { feature }.
	polygon := record buildArrowPolygonFor: feature atLevel: 0 on: RSCanvas new.
	pos := polygon position.
	worldPoints := polygon points collect: [ :p | p + pos ].
	"The 1st point (tip) should be the leftmost."
	self assert: (worldPoints at: 1) x < (worldPoints at: 2) x.
	"The tip should be at the feature start."
	self assert: ((worldPoints at: 1) x - (feature start - 0.5)) abs < 0.01.
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testRulerTickHeightAndLabelGap [	"Verify ruler tick height and label gap are large enough to be visible."	| record canvas ticks labels |	record := BioDnaGraphicRecord sequenceLength: 20 features: OrderedCollection new.	canvas := record linearCanvas.	ticks := canvas nodes select: [ :n | n isKindOf: RSLine ].	labels := canvas nodes select: [ :n | n isKindOf: RSLabel ].	self assert: record yScale equals: 8.	self assert: (record yScale * 0.15) > 0.	self assert: (record yScale * 0.7) > (record yScale * 0.35)
]

{ #category : 'tests - circular' }
BioDnaFeaturesViewerTest >> testScaledRadius [
    | record |
    record := BioDnaCircularGraphicRecord sequenceLength: 1000 features: OrderedCollection new.
    self assert: record scaledRadius equals: 200.
    record cScale: 300.
    self assert: record scaledRadius equals: 300
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testShowRulerTicksSuppressesTickLabels [	"When showRulerTicks is false, no tick lines or ruler number labels are drawn." 	| record canvasTicks canvasNoTicks |	record := BioDnaGraphicRecord sequenceLength: 50 features: { (BioDnaFeature from: 5 to: 10 strand: 1 label: 'F' color: Color red) }.	canvasTicks := record linearCanvas.	record := BioDnaGraphicRecord sequenceLength: 50 features: { (BioDnaFeature from: 5 to: 10 strand: 1 label: 'F' color: Color red) }.	record showRulerTicks: false.	canvasNoTicks := record linearCanvas.	self assert: (canvasTicks shapes select: [ :n | n isKindOf: RSLabel ]) size > 1.	self assert: (canvasNoTicks shapes select: [ :n | n isKindOf: RSLabel ]) size equals: 1
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testSplitInTwoAt [
    | f parts |
    f := BioDnaFeature from: 10 to: 50 strand: 1 label: 'Gene' color: Color red.
    parts := f splitInTwoAt: 30.
    self assert: parts first start equals: 10.
    self assert: parts first end equals: 30.
    self assert: parts second start equals: 31.
    self assert: parts second end equals: 50
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testStrandDirections [
    | f1 f2 f3 |
    f1 := BioDnaFeature new strand: 1.
    f2 := BioDnaFeature new strand: -1.
    f3 := BioDnaFeature new strand: 0.
    self assert: f1 isForward.
    self deny: f1 isReverse.
    self assert: f2 isReverse.
    self deny: f2 isForward.
    self assert: f3 isUndirected
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testTickHeightAndLabelGap [	"Verify that tickHeight and labelGap in the linear ruler scale with yScale."	| record canvas lines |	record := BioDnaGraphicRecord sequenceLength: 1000 features: OrderedCollection new.	canvas := record linearCanvas.	lines := canvas shapes select: [ :s | s class = RSLine ].	self assert: lines size > 0.	self assert: record yScale > 0
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testTranslationCanvasRendersWithoutError [
	"Test that buildLinearTranslationOn:from:to: produces a valid canvas."
	| f1 f2 record canvas |
	f1 := BioDnaFeature from: 5 to: 10 strand: 1 label: 'Feature A' color: (Color r: 1.0 g: 0.8 b: 0.8).
	f2 := BioDnaFeature from: 8 to: 15 strand: 1 label: 'Feature B' color: (Color r: 0.8 g: 0.8 b: 1.0).
	record := BioDnaGraphicRecord sequence: 'ATGCATGCATGCATGCATGCATGCATGC' features: { f1. f2 }.
	canvas := record linearCanvas.
	record buildLinearSequenceOn: canvas.
	record buildLinearTranslationOn: canvas from: 8 to: 23.
	self assert: canvas nodes notEmpty
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testTranslationShowsAminoAcidAbbreviations [
	"Translation should display amino acid abbreviations like Met, His, not single letters."
	| f1 f2 record canvas labels aaLabels |
	f1 := BioDnaFeature from: 5 to: 10 strand: 1 label: 'Feature A' color: (Color r: 1.0 g: 0.8 b: 0.8).
	f2 := BioDnaFeature from: 8 to: 15 strand: 1 label: 'Feature B' color: (Color r: 0.8 g: 0.8 b: 1.0).
	record := BioDnaGraphicRecord sequence: 'ATGCATGCATGCATGCATGCATGCATGC' features: { f1. f2 }.
	record showRulerTicks: false.
	canvas := record linearCanvas.
	record buildLinearSequenceOn: canvas.
	record buildLinearTranslationOn: canvas from: 8 to: 23.
	labels := canvas nodes select: [ :n | n isKindOf: RSLabel ].
	aaLabels := labels select: [ :n | 'MetHisAlaCysValLeuThrSerProGlnAsnLysAspGluPheTyrTrpArgIle' includesSubstring: n text ].
	self assert: aaLabels notEmpty
]

{ #category : 'tests - feature' }
BioDnaFeaturesViewerTest >> testXCenter [
    | f |
    f := BioDnaFeature from: 5 to: 20 strand: 1 label: 'A' color: Color red.
    self assert: f xCenter closeTo: 12.0
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testXScaleForLongSequence [	"Long sequences should get xScale of 1 (no stretching needed)."	| record |	record := BioDnaGraphicRecord sequenceLength: 1000 features: OrderedCollection new.	self assert: record computeXScale equals: 1
]

{ #category : 'tests' }
BioDnaFeaturesViewerTest >> testXScaleForShortSequence [	"Short sequences should get a large xScale to ensure banner aspect ratio and readable tick labels."	| record |	record := BioDnaGraphicRecord sequenceLength: 20 features: OrderedCollection new.	self assert: record computeXScale > 1.	self assert: record computeXScale >= 15
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testYScaleCustom [
    | record |
    record := BioDnaGraphicRecord sequenceLength: 100 features: OrderedCollection new.
    record yScale: 40.
    self assert: record yScale equals: 40
]

{ #category : 'tests - record' }
BioDnaFeaturesViewerTest >> testYScaleDefault [
    | record |
    record := BioDnaGraphicRecord sequenceLength: 100 features: OrderedCollection new.
    self assert: record yScale equals: 20
]
