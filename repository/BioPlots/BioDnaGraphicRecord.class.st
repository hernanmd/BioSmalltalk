"
I represent a set of genetic features on a DNA sequence, rendered as a linear map using Roassal.

I create interactive Roassal visualizations showing DNA features as colored arrows (forward/reverse strand) or boxes (undirected), with labels positioned above features connected by thin lines.

Example:
    features := {
        BioDnaFeature from: 5 to: 20 strand: 1 label: 'Small feature' color: Color yellow.
        BioDnaFeature from: 20 to: 500 strand: 1 label: 'Gene 1' color: Color red.
        BioDnaFeature from: 400 to: 700 strand: -1 label: 'Gene 2' color: Color green.
        BioDnaFeature from: 600 to: 900 strand: 1 label: 'Gene 3' color: Color blue }.
    
    record := BioDnaGraphicRecord sequenceLength: 1000 features: features.
    record openLinear.        ""Open in a window""
    record openLinearTitled: 'My Sequence'.  ""Open with title""

You can also create me from a BioSequence:
    seq := BioSequence newDNA: 'ATCGATCGATCGATCGATCG'.
    seq addSeqFeature: (BioSequenceFeature new start: 1; end: 8; strand: 1; primaryTag: 'promoter').
    seq asDnaGraphicRecord openLinear.

Instance Variables:
    sequenceLength          <Integer>           Length of the DNA sequence in bp
    sequence               <String|nil>        Optional nucleotide sequence
    features               <OrderedCollection> Collection of BioDnaFeature objects
    featureLevelHeight     <Number>            Height of one level in plot units (default: 1)
    firstIndex              <Integer>           Starting index (default: 0)
    plotsIndexing           <Symbol>            #biopython (0-based) or #genbank (1-based)
    labelsSpacing           <Number>            Pixel spacing between labels
    ticksResolution         <Number|#auto>      Tick interval or #auto
    defaultRulerColor       <Color>             Color of the ruler line and ticks
    defaultBoxColor         <Object>            Default label box color
    elevateOutlineAnnotations <Boolean>         Whether labels are above all features
"
Class {
	#name : 'BioDnaGraphicRecord',
	#superclass : 'Object',
	#instVars : [
		'sequenceLength',
		'sequence',
		'features',
		'featureLevelHeight',
		'firstIndex',
		'plotsIndexing',
		'labelsSpacing',
		'ticksResolution',
		'defaultRulerColor',
		'defaultBoxColor',
		'elevateOutlineAnnotations',
		'yScale',
		'yScaleIsCustom',
		'xScale',
		'showRulerTicks',
		'flipY'
	],
	#category : 'BioPlots-FeaturesViewer',
	#package : 'BioPlots',
	#tag : 'FeaturesViewer'
}

{ #category : 'instance creation' }
BioDnaGraphicRecord class >> fromGenBankFile: aFilename [
	"Parse a GenBank format file and create a graphic record with features."
	| stream |
	stream := aFilename asFileReference readStream.
	[ ^ self new
		parseGenBankFeaturesFrom: stream;
		yourself ] ensure: [ stream close ]
]

{ #category : 'instance creation' }
BioDnaGraphicRecord class >> sequence: aString features: aCollection [
    ^ self new
        sequence: aString;
        sequenceLength: aString size;
        features: aCollection;
        yourself
]

{ #category : 'instance creation' }
BioDnaGraphicRecord class >> sequenceLength: anInteger features: aCollection [
    ^ self new
        sequenceLength: anInteger;
        features: aCollection;
        yourself
]

{ #category : 'as yet unclassified' }
BioDnaGraphicRecord >> aboveDirection [

	^ flipY
		  ifTrue: [ -1 ]
		  ifFalse: [ 1 ]
]

{ #category : 'features' }
BioDnaGraphicRecord >> addFeature: aBioDnaFeature [
    features add: aBioDnaFeature.
    ^ aBioDnaFeature
]

{ #category : 'as yet unclassified' }
BioDnaGraphicRecord >> aminoAcidForCodon: aString [
	"Look up the amino acid for a DNA codon string using BioCodonTable."
	| codon aa |
	codon := aString asUppercase.
	codon size < 3 ifTrue: [ ^ $- ].
	(BioCodonTables currentCodonTable isStopCodon: codon)
		ifTrue: [ ^ $* ].
	aa := BioCodonTables currentCodonTable at: codon ifAbsent: [ nil ].
	aa ifNil: [ ^ $? ].
	aa isCharacter ifTrue: [ ^ aa ].
	^ aa first
]

{ #category : 'visualization - helpers' }
BioDnaGraphicRecord >> autoLabelColorFor: aColor [

	| luminosity |
	luminosity := 0.299 * aColor red + (0.587 * aColor green)
	              + (0.114 * aColor blue).
	^ luminosity >= 0.45
		  ifTrue: [ Color black ]
		  ifFalse: [ Color veryDarkGray ]
]

{ #category : 'as yet unclassified' }
BioDnaGraphicRecord >> belowDirection [

	^ flipY
		  ifTrue: [ 1 ]
		  ifFalse: [ -1 ]
]

{ #category : 'as yet unclassified' }
BioDnaGraphicRecord >> boxColorFor: aFeature [
	"Return the background color for a feature's label box.
	If the feature has an explicit boxColor (not #auto), use it.
	Otherwise, use a lightened version of the feature color (min luminosity 0.95)."
	| bc |
	bc := aFeature boxColor.
	bc ifNil: [ ^ self lightenColor: aFeature color toMinLuminosity: 0.95 ].
	bc == #auto ifTrue: [ ^ self lightenColor: aFeature color toMinLuminosity: 0.95 ].
	^ bc
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> buildArrowPolygonFor: aFeature atLevel: aLevel on: canvas [
    | x1 x2 y featureHeight halfHeight headLength baselineY topLineY points borderWidth above |
    x1 := (aFeature start - 0.5) * xScale.
    x2 := (aFeature end - 0.5) * xScale.
    aFeature openLeft ifTrue: [ x1 := x1 - xScale ].
    aFeature openRight ifTrue: [ x2 := x2 + xScale ].
    above := self aboveDirection.
    y := above * (aLevel * featureLevelHeight * yScale).
    featureHeight := featureLevelHeight * yScale * 0.55.
    halfHeight := featureHeight / 2.
    baselineY := y - (above * halfHeight).
    topLineY := y + (above * halfHeight).
    borderWidth := aFeature lineWidth * (yScale / 20 max: 0.3).

    aFeature isUndirected ifTrue: [ 
        ^ self buildBoxFor: aFeature atLevel: aLevel on: canvas ].

    headLength := (aFeature length * 0.12 * xScale min: aFeature length * xScale - xScale) min: featureHeight * 1.5.
    headLength := headLength max: yScale * 0.3.

    aFeature isForward
        ifTrue: [
            points := {
                x1 @ baselineY .
                (x2 - headLength) @ baselineY .
                x2 @ y .
                (x2 - headLength) @ topLineY .
                x1 @ topLineY } ]
        ifFalse: [
            points := {
                x1 @ y .
                (x1 + headLength) @ baselineY .
                x2 @ baselineY .
                x2 @ topLineY .
                (x1 + headLength) @ topLineY } ].

    ^ RSPolygon new
        points: points;
        color: aFeature color;
        border: (RSBorder new color: aFeature lineColor; width: borderWidth);
        yourself
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> buildBoxFor: aFeature atLevel: aLevel on: canvas [
    | x1 x2 y featureHeight halfHeight baselineY topLineY borderWidth above |
    x1 := (aFeature start - 0.5) * xScale.
    x2 := (aFeature end - 0.5) * xScale.
    aFeature openLeft ifTrue: [ x1 := x1 - xScale ].
    aFeature openRight ifTrue: [ x2 := x2 + xScale ].
    above := self aboveDirection.
    y := above * (aLevel * featureLevelHeight * yScale).
    featureHeight := featureLevelHeight * yScale * 0.55.
    halfHeight := featureHeight / 2.
    baselineY := y - (above * halfHeight).
    topLineY := y + (above * halfHeight).
    borderWidth := aFeature lineWidth * (yScale / 20 max: 0.3).

    ^ RSBox new
        extent: (x2 - x1) @ (topLineY - baselineY) abs;
        color: aFeature color;
        border: (RSBorder new color: aFeature lineColor; width: borderWidth);
        position: ((x1 + x2) / 2) @ y;
        cornerRadius: 2;
        yourself
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> buildLinearGCOn: canvas windowSize: windowSize [
	"Plot GC content as a filled area below the features.
	Higher GC% appears closer to the ruler (toward the features).
	The baseline (0% GC) is at the far edge from the ruler."
	| below gcHeight baseY farEdge result gcPositions gcValues stepPoints gcLabelY |
	sequence ifNil: [ ^ self ].
	below := self belowDirection.
	gcHeight := yScale * 3.
	"Place GC plot after sequence row with a gap"
	baseY := below * (self rulerGapBelow + (yScale * 1.5)).
	farEdge := baseY + (below * gcHeight).
	result := self gcContentOf: sequence windowSize: windowSize.
	gcPositions := result first.
	gcValues := result second.
	gcValues ifEmpty: [ ^ self ].
	"Build the filled area polygon:
	 baseline (0%) at farEdge, peaks toward baseY (closer to ruler)"
	stepPoints := OrderedCollection new.
	stepPoints add: ((gcPositions first - 0.5) * xScale) @ farEdge.
	gcPositions with: gcValues do: [ :pos :gc |
		| yVal |
		"Higher GC% = closer to ruler = toward baseY"
		yVal := farEdge - (below * (gcHeight * gc / 100)).
		stepPoints add: (pos * xScale) @ yVal ].
	stepPoints add: ((gcPositions last + 0.5) * xScale) @ farEdge.
	canvas add: (RSPolygon new
		points: stepPoints;
		color: (Color r: 0.6 g: 0.8 b: 1.0 alpha: 0.4);
		border: (RSBorder new color: (Color r: 0.4 g: 0.6 b: 0.9); width: 1.0);
		yourself).
	"Y-axis label for GC%"
	gcLabelY := farEdge - (below * (gcHeight / 2)).
	canvas add: (RSLabel new
		text: 'GC%';
		fontSize: (yScale < 10 ifTrue: [ 7 ] ifFalse: [ 9 ]);
		color: (Color r: 0.3 g: 0.3 b: 0.3);
		position: (firstIndex - 1) * xScale @ gcLabelY;
		yourself)
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> buildLinearOn: canvas [
    | levels maxLevel featuresSorted annotationBase labeledFeatures labelRows labelFontSize above |
    self buildLinearRulerOn: canvas.
    levels := self computeFeatureLevels.
    levels ifEmpty: [ ^ canvas ].
    above := self aboveDirection.
    "Shift levels so features sit above the ruler line"
    levels keysAndValuesDo: [ :f :l | levels at: f put: l + 0.5 ].
    maxLevel := 1 max: levels values max.
    labelFontSize := yScale < 10
        ifTrue: [ 8 ]
        ifFalse: [ 10 ].

    featuresSorted := features asArray sort: [ :a :b | a length > b length ].
    canvas addAll: (featuresSorted collect: [ :feature |
        | level |
        level := levels at: feature ifAbsent: [ 0.5 ].
        self buildArrowPolygonFor: feature atLevel: level on: canvas ]).

    labeledFeatures := features select: [ :f | f label notNil ].
    labeledFeatures ifEmpty: [ ^ canvas ].

    labelRows := self computeLabelRowsFor: labeledFeatures.
    annotationBase := (maxLevel + 1) * featureLevelHeight * yScale + (yScale * 0.5).

    canvas addAll: (labeledFeatures collect: [ :feature |
        | level x featureY labelY rowIndex labelColor linkColor labelText labelExtent boxWidth boxHeight boxColor |
        level := levels at: feature ifAbsent: [ 0.5 ].
        x := feature xCenter * xScale.
        featureY := above * (level * featureLevelHeight * yScale).
        rowIndex := labelRows at: feature ifAbsent: [ 0 ].
        labelY := above * (annotationBase + (rowIndex * yScale * 0.8)).
        labelColor := self autoLabelColorFor: feature color.
        linkColor := feature labelLinkColor alpha < 1.0
            ifTrue: [ feature labelLinkColor alpha: 1.0 ]
            ifFalse: [ feature labelLinkColor ].
        labelText := feature label.
        "Determine if this feature should have a rounded box behind its label"
        (self shouldShowLabelBoxFor: feature)
            ifTrue: [
                boxColor := self boxColorFor: feature.
                labelExtent := (RSLabel new text: labelText; fontSize: labelFontSize) extent.
                boxWidth := labelExtent x + 10.
                boxHeight := labelExtent y + 6.
                canvas add: (RSBox new
                    extent: boxWidth @ boxHeight;
                    position: x @ labelY;
                    color: boxColor;
                    cornerRadius: 3;
                    border: (RSBorder new color: (Color r: 0.5 g: 0.5 b: 0.5); width: 0.5);
                    yourself).
                canvas add: (RSLabel new
                    text: labelText;
                    fontSize: labelFontSize;
                    color: labelColor;
                    position: x @ labelY;
                    yourself) ]
            ifFalse: [
                canvas add: (RSLabel new
                    text: labelText;
                    fontSize: labelFontSize;
                    color: labelColor;
                    position: x @ labelY;
                    yourself) ].
        RSLine new
            from: x @ (above * ((annotationBase + (rowIndex * yScale * 0.8)) - (yScale * 0.3)));
            to: x @ (above * ((level * featureLevelHeight * yScale) + (featureLevelHeight * yScale * 0.3)));
            color: linkColor;
            width: (yScale / 20 max: 0.5) * 1.5;
            yourself ] )
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> buildLinearRulerOn: canvas [
    | startX endX y tickHeight labelGap lineWidth fontSize below |
    startX := (firstIndex - 0.8) * xScale.
    endX := (self lastIndex - 0.2) * xScale.
    below := self belowDirection.
    y := 0.
    tickHeight := yScale * 0.15.
    labelGap := yScale * 1.0.
    lineWidth := yScale / 20 max: 0.3.

    canvas add: (RSLine new
        from: startX @ y;
        to: endX @ y;
        color: defaultRulerColor;
        width: lineWidth;
        yourself).

    showRulerTicks ifTrue: [
        | tickInterval |
        fontSize := yScale < 10 ifTrue: [ 9 ] ifFalse: [ 10 ].
        tickInterval := self determineTickInterval.
        firstIndex to: self lastIndex - 1 by: tickInterval do: [ :pos |
            | tickX |
            tickX := (pos - 0.5) * xScale.
            canvas add: (RSLine new
                from: tickX @ (below * tickHeight negated);
                to: tickX @ (below * tickHeight);
                color: defaultRulerColor;
                width: lineWidth * 0.5;
                yourself).
            canvas add: (RSLabel new
                text: (plotsIndexing = #genbank ifTrue: [ pos + 1 ] ifFalse: [ pos ]) asString;
                fontSize: fontSize;
                color: defaultRulerColor;
                position: tickX @ (below * labelGap);
                yourself) ] ]
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> buildLinearSequenceOn: canvas [
    | y fontSize labelGap below |
    sequence ifNil: [ ^ self ].
    below := self belowDirection.
    labelGap := yScale * 1.0.
    y := below * (labelGap + (yScale * 1.2)).
    fontSize := yScale < 10 ifTrue: [ 8 ] ifFalse: [ 10 ].
    firstIndex to: self lastIndex - 1 do: [ :pos |
        | nucleotide x |
        pos <= sequence size ifTrue: [
            nucleotide := sequence at: (pos - firstIndex + 1).
            x := (pos - 0.5) * xScale.
            canvas add: (RSLabel new
                text: nucleotide asString;
                fontSize: fontSize;
                color: (self nucleotideColorFor: nucleotide);
                position: x @ y;
                yourself) ] ]
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> buildLinearTranslationOn: canvas from: start to: end [
	"Display amino acid translation for codons in the given range.
	Draws layout (from ruler outward):
	  - nucleotide row
	  - amino acid abbreviation row
	  - codon tick marks
	  - codon position numbers
	with vertical guide lines at codon boundaries."
	| nucY aaY tickY numY labelGap fontSize guideColor seqStart codonStart below |
	sequence ifNil: [ ^ self ].
	showRulerTicks := false.
	below := self belowDirection.
	labelGap := yScale * 1.0.
	nucY := below * (labelGap + (yScale * 1.2)).
	aaY := below * (labelGap + (yScale * 1.2) + (yScale * 1.3)).
	tickY := below * (labelGap + (yScale * 1.2) + (yScale * 1.3) + (yScale * 0.6)).
	numY := below * (labelGap + (yScale * 1.2) + (yScale * 1.3) + (yScale * 0.6) + (yScale * 0.7)).
	fontSize := yScale < 10 ifTrue: [ 8 ] ifFalse: [ 10 ].
	guideColor := Color gray muchLighter.
	seqStart := start max: firstIndex.
	codonStart := seqStart + ((3 - (seqStart \\ 3)) \\ 3).
	codonStart to: (end min: self lastIndex) - 2 by: 3 do: [ :codonPos |
		| codonEnd codonCenter aa tickX codonStr aaLabel |
		codonEnd := codonPos + 2 min: self lastIndex.
		codonCenter := (codonPos + codonEnd - 1) / 2.0.
		tickX := codonCenter * xScale.
		codonStr := String withAll: ((codonPos to: codonEnd) collect: [ :i |
			i - firstIndex + 1 <= sequence size
				ifTrue: [ sequence at: (i - firstIndex + 1) ]
				ifFalse: [ $N ] ]).
		aa := self aminoAcidForCodon: codonStr.
		aaLabel := aa asAminoacidAbbreviation.
		canvas add: (RSLabel new
			text: aaLabel;
			fontSize: fontSize;
			color: Color black;
			position: tickX @ aaY;
			yourself).
		canvas add: (RSLine new
			from: tickX @ (tickY - (below * (yScale * 0.1)));
			to: tickX @ (tickY + (below * (yScale * 0.1)));
			color: defaultRulerColor;
			width: 0.3;
			yourself).
		canvas add: (RSLabel new
			text: (plotsIndexing = #genbank
				ifTrue: [ codonPos + 1 ]
				ifFalse: [ codonPos ]) asString;
			fontSize: fontSize - 1;
			color: defaultRulerColor;
			position: tickX @ numY;
			yourself).
		canvas add: (RSLine new
			from: ((codonPos - 0.5) * xScale) @ (nucY + (below * (yScale * 0.35)));
			to: ((codonPos - 0.5) * xScale) @ (aaY - (below * (yScale * 0.35)));
			color: guideColor;
			width: 0.3;
			yourself).
		canvas add: (RSLine new
			from: ((codonEnd - 0.5 + 1) * xScale) @ (nucY + (below * (yScale * 0.35)));
			to: ((codonEnd - 0.5 + 1) * xScale) @ (aaY - (below * (yScale * 0.35)));
			color: guideColor;
			width: 0.3;
			yourself) ]
]

{ #category : 'visualization - helpers' }
BioDnaGraphicRecord >> colorForFeatureType: aString [
	aString = 'gene' ifTrue: [ ^ Color r: 0.8 g: 0.2 b: 0.2 ].
	aString = 'CDS' ifTrue: [ ^ Color r: 0.2 g: 0.6 b: 0.2 ].
	aString = 'promoter' ifTrue: [ ^ Color r: 0.2 g: 0.4 b: 0.8 ].
	aString = 'terminator' ifTrue: [ ^ Color r: 0.8 g: 0.4 b: 0.8 ].
	aString = 'restriction_site' ifTrue: [ ^ Color r: 0.9 g: 0.9 b: 0.2 ].
	aString = 'misc_feature' ifTrue: [ ^ Color r: 0.6 g: 0.6 b: 0.6 ].
	aString = 'rep_origin' ifTrue: [ ^ Color r: 0.8 g: 0.6 b: 0.2 ].
	^ Color r: 0.4 g: 0.4 b: 0.8
]

{ #category : 'computing' }
BioDnaGraphicRecord >> computeFeatureLevels [

	^ BioDnaFeatureLevelComputer new computeLevelsFor: features
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> computeLabelRowsFor: labeledFeatures [
    "Assign labels to rows so they don't overlap horizontally.
    Returns a Dictionary mapping each feature to its row number.
    All x-coordinates are scaled by xScale to match the rendered positions."
    | rows result sortedFeatures scaledSpacing |
    result := Dictionary new.
    sortedFeatures := labeledFeatures asArray sort: [ :a :b | a xCenter < b xCenter ].
    rows := OrderedCollection new.
    scaledSpacing := labelsSpacing * xScale.

    sortedFeatures do: [ :feature |
        | placed xCenter estWidth |
        xCenter := feature xCenter * xScale.
        estWidth := (feature label size * 0.7 max: 5) * xScale.
        placed := false.

        rows doWithIndex: [ :row :rowIndex |
            | canPlace |
            canPlace := true.
            row do: [ :existing |
                | existingX existingWidth spacing |
                existingX := existing key.
                existingWidth := existing value.
                spacing := (estWidth / 2) + (existingWidth / 2) + scaledSpacing.
                ((xCenter - existingX) abs) < spacing ifTrue: [ canPlace := false ] ].
            canPlace ifTrue: [
                row add: xCenter -> estWidth.
                result at: feature put: rowIndex - 1.
                placed := true ] ].

        placed ifFalse: [
            | newRow |
            newRow := OrderedCollection with: xCenter -> estWidth.
            rows add: newRow.
            result at: feature put: rows size - 1 ] ].

    ^ result
]

{ #category : 'computing' }
BioDnaGraphicRecord >> computeXScale [

	| span minCanvasWidth |

	"For sequences with tickInterval 1, ensure xScale gives at least 15 units per tick to avoid label overlap." 
	"For longer sequences with tickInterval > 1, 600 units is plenty."
	span := self lastIndex - firstIndex max: 1. 
	minCanvasWidth := self determineTickInterval = 1
		                  ifTrue: [ 15 * span ]
		                  ifFalse: [ 600 ].
	^ minCanvasWidth asFloat / span max: 1.0
]

{ #category : 'computing' }
BioDnaGraphicRecord >> computeYScale [
	"Auto-compute a yScale that keeps reasonable proportions for any sequence length."

	"For sequences under 500bp, scale yScale down proportionally (minimum 8)."

	"For sequences 500bp and above, use the default yScale of 20."

	"Minimum 8 ensures feature arrows are never disproportionally thick or thin."

	| span |
	span := self lastIndex - firstIndex max: 1.
	^ (span * 0.04 max: 8) min: 20
]

{ #category : 'operations' }
BioDnaGraphicRecord >> cropFrom: start to: end [

	| newFeatures |
	(start < firstIndex or: [ end > self lastIndex ]) 
		ifTrue: [ self error: 'Out-of-bound cropping' ].
	newFeatures := features
		               collect: [ :f | f crop: (start to: end) ]
		               thenSelect: [ :f | f notNil ].
	^ self class new
		  sequenceLength: end - start;
		  sequence: (sequence
				   ifNotNil: [
					   sequence copyFrom: start - firstIndex + 1 to: end - firstIndex ]
				   ifNil: [ nil ]);
		  features: newFeatures;
		  featureLevelHeight: featureLevelHeight;
		  firstIndex: start;
		  plotsIndexing: plotsIndexing;
		  labelsSpacing: labelsSpacing;
		  ticksResolution: ticksResolution;
		  yourself
]

{ #category : 'accessing - defaults' }
BioDnaGraphicRecord >> defaultBoxColor [
    ^ defaultBoxColor
]

{ #category : 'accessing - defaults' }
BioDnaGraphicRecord >> defaultBoxColor: anObject [
    defaultBoxColor := anObject
]

{ #category : 'accessing - defaults' }
BioDnaGraphicRecord >> defaultRulerColor [
    ^ defaultRulerColor
]

{ #category : 'accessing - defaults' }
BioDnaGraphicRecord >> defaultRulerColor: anObject [
    defaultRulerColor := anObject
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> determineTickInterval [
	"Determine the interval between ruler tick marks.		Returns a number that divides the range into at most ~10-15 nicely-spaced ticks."

	ticksResolution = #auto ifTrue: [
			| range |
			range := self lastIndex - firstIndex.
			range <= 14 ifTrue: [ ^ 1 ].
			range <= 50 ifTrue: [ ^ 5 ].
			range <= 200 ifTrue: [ ^ 10 ].
			range <= 1000 ifTrue: [ ^ 50 ].
			range <= 5000 ifTrue: [ ^ 100 ].
			range <= 20000 ifTrue: [ ^ 500 ].
			range <= 100000 ifTrue: [ ^ 1000 ].
			^ range // 10 roundUpTo: 1000 ].
	^ ticksResolution
]

{ #category : 'accessing - defaults' }
BioDnaGraphicRecord >> elevateOutlineAnnotations [
    ^ elevateOutlineAnnotations
]

{ #category : 'accessing - defaults' }
BioDnaGraphicRecord >> elevateOutlineAnnotations: anObject [
    elevateOutlineAnnotations := anObject
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> featureLevelHeight [
    ^ featureLevelHeight
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> featureLevelHeight: anObject [
    featureLevelHeight := anObject
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> features [
    ^ features
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> features: anObject [
    features := anObject
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> firstIndex [
    ^ firstIndex
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> firstIndex: anObject [
    firstIndex := anObject
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> flipY [

	^ flipY ifNil: [ flipY := true ]
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> flipY: aBoolean [

	flipY := aBoolean
]

{ #category : 'as yet unclassified' }
BioDnaGraphicRecord >> gcContentOf: aString windowSize: windowSize [
	"Compute windowed GC content as percentages."

	| values positions step |
	values := OrderedCollection new.
	positions := OrderedCollection new.
	step := windowSize // 4 max: 1.
	1 to: aString size - windowSize + 1 by: step do: [ :i |
			| window gcCount |
			window := aString
				          copyFrom: i
				          to: (i + windowSize - 1 min: aString size).
			gcCount := window inject: 0 into: [ :sum :c |
					           (#( $G $C ) includes: c asUppercase)
						           ifTrue: [ sum + 1 ]
						           ifFalse: [ sum ] ].
			values add: (gcCount / window size * 100) asFloat.
			positions add: i + (windowSize / 2) - 0.5 + firstIndex ].
	^ {
		  positions.
		  values }
]

{ #category : 'initialization' }
BioDnaGraphicRecord >> initialize [

	super initialize.
	sequenceLength := 0.
	features := OrderedCollection new.
	featureLevelHeight := 1.
	yScale := 20.
	yScaleIsCustom := false.
	xScale := 1.
	flipY := true.
	showRulerTicks := true.
	firstIndex := 0.
	plotsIndexing := #biopython.
	labelsSpacing := 8.
	ticksResolution := #auto.
	defaultRulerColor := Color gray.
	defaultBoxColor := #auto.
	elevateOutlineAnnotations := false
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> labelsSpacing [
    ^ labelsSpacing
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> labelsSpacing: anObject [
    labelsSpacing := anObject
]

{ #category : 'accessing - computed' }
BioDnaGraphicRecord >> lastIndex [
    ^ firstIndex + sequenceLength
]

{ #category : 'as yet unclassified' }
BioDnaGraphicRecord >> lightenColor: aColor toMinLuminosity: minLum [

	| r g b lum factor |
	r := aColor red.
	g := aColor green.
	b := aColor blue.
	lum := 0.299 * r + (0.587 * g) + (0.114 * b).
	lum >= minLum ifTrue: [
			^ Color
				  r: r
				  g: g
				  b: b
				  alpha: aColor alpha ].
	factor := 1 - (minLum - lum / (1.0 - lum max: 0.001) max: 0).
	^ Color
		  r: r + (1 - r * factor)
		  g: g + (1 - g * factor)
		  b: b + (1 - b * factor)
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> linearCanvas [

	| canvas |
	yScaleIsCustom ifNil: [ yScaleIsCustom := false ].
	yScaleIsCustom ifFalse: [ yScale := self computeYScale ].
	xScale := self computeXScale.
	canvas := RSCanvas new.
	canvas nodes @ RSDraggable new.
	canvas @ RSCanvasController new.
	self buildLinearOn: canvas.
	canvas zoomToFit.
	^ canvas
]

{ #category : 'visualization - helpers' }
BioDnaGraphicRecord >> nucleotideColorFor: aCharacter [
    aCharacter = $A ifTrue: [ ^ Color r: 0.0 g: 0.5 b: 0.0 ].
    aCharacter = $T ifTrue: [ ^ Color r: 0.8 g: 0.0 b: 0.0 ].
    aCharacter = $G ifTrue: [ ^ Color r: 0.4 g: 0.4 b: 1.0 ].
    aCharacter = $C ifTrue: [ ^ Color r: 1.0 g: 0.6 b: 0.0 ].
    ^ Color gray
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> openLinear [

	| canvas |
	canvas := self linearCanvas.
	^ canvas open
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> openLinearTitled: aString [

	| canvas |
	canvas := self linearCanvas.
	^ canvas openWithTitle: aString
]

{ #category : 'as yet unclassified' }
BioDnaGraphicRecord >> openLinearWithGCTitled: aString windowSize: windowSize [
	"Open a linear view with features (labels above ruler) and GC content below.
	No sequence row, no ruler tick numbers — matches Python with_gc_plot.py layout."

	| canvas |
	flipY := true.
	showRulerTicks := false.
	canvas := self linearCanvas.
	self buildLinearGCOn: canvas windowSize: windowSize.
	^ canvas openWithTitle: aString
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> openLinearWithSequence [
    | canvas |
    canvas := self linearCanvas.
    self buildLinearSequenceOn: canvas.
    ^ canvas open
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> openLinearWithSequenceAndGCTitled: aString windowSize: windowSize [

	| canvas |
	flipY := true.
	canvas := self linearCanvas.
	self buildLinearSequenceOn: canvas.
	self buildLinearGCOn: canvas windowSize: windowSize.
	^ canvas openWithTitle: aString
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> openLinearWithSequenceAndTranslationTitled: aString from: start to: end [
	| canvas |
	showRulerTicks := false.
	canvas := self linearCanvas.
	self buildLinearSequenceOn: canvas.
	self buildLinearTranslationOn: canvas from: start to: end.
	^ canvas openWithTitle: aString
]

{ #category : 'visualization - linear' }
BioDnaGraphicRecord >> openLinearWithSequenceTitled: aString [

	| canvas |
	canvas := self linearCanvas.
	self buildLinearSequenceOn: canvas.
	^ canvas openWithTitle: aString
]

{ #category : 'parsing' }
BioDnaGraphicRecord >> parseGenBankFeaturesFrom: aStream [
	"Parse features from a GenBank format stream."

	| line seqLength inFeatures currentType currentStart currentEnd currentStrand currentLabel newFeature locStr nums labelValue eqPos |
	features := OrderedCollection new.
	seqLength := 0.
	sequence := nil.
	inFeatures := false.
	currentStart := nil.
	currentType := nil.
	currentStrand := 1.
	currentLabel := nil.
	[ aStream atEnd ] whileFalse: [
			line := aStream nextLine.
			(line beginsWith: 'LOCUS') ifTrue: [
					| parts |
					parts := line findTokens: Character space.
					parts do: [ :p |
						(p isString and: [ p isAllDigits ]) ifTrue: [
							seqLength := p asNumber ] ] ].
			(line beginsWith: 'FEATURES') ifTrue: [ inFeatures := true ].
			((line beginsWith: 'ORIGIN') and: [
				 inFeatures or: [ currentStart notNil ] ]) ifTrue: [
					(currentStart notNil and: [ currentType notNil ]) ifTrue: [
							newFeature := BioDnaFeature
								              from: currentStart
								              to: currentEnd
								              strand: currentStrand
								              label: currentLabel
								              color: (self colorForFeatureType: currentType).
							features add: newFeature ].
					inFeatures := false.
					sequence := String new writeStream.
					[ aStream atEnd ] whileFalse: [
							line := aStream nextLine.
							(line beginsWith: '//')
								ifTrue: [ sequence := sequence contents ]
								ifFalse: [
									line
										select: [ :c | c isLetter ]
										thenDo: [ :c | sequence nextPut: c ] ] ] ].
			inFeatures ifTrue: [
					((line beginsWith: '     CDS') or: [
							 (line beginsWith: '     promoter') or: [
									 (line beginsWith: '     terminator') or: [
											 (line beginsWith: '     restriction_site') or: [
													 (line beginsWith: '     misc_feature') or: [
														 line beginsWith: '     gene' ] ] ] ] ]) ifTrue: [
							(currentStart notNil and: [ currentType notNil ]) ifTrue: [
									features add: (BioDnaFeature
											 from: currentStart
											 to: currentEnd
											 strand: currentStrand
											 label: currentLabel
											 color: (self colorForFeatureType: currentType)) ].
							currentType := (line copyFrom: 6 to: (line
									                 indexOf: Character space
									                 startingAt: 7
									                 ifAbsent: [ line size + 1 ]) - 1) trimmed.
							locStr := (line
								           copyFrom:
								           (line
									            indexOf: Character space
									            startingAt: 7
									            ifAbsent: [ line size ])
								           to: line size) trimmed.
							currentStrand := 1.
							(locStr beginsWith: 'complement') ifTrue: [
									currentStrand := -1.
									locStr := (locStr copyReplaceAll: 'complement(' with: '')
										          copyReplaceAll: ')'
										          with: '' ].
							nums := locStr findTokens: '..>'.
							nums := nums select: [ :n |
								        n notEmpty and: [ n first isDigit ] ].
							nums size >= 2 ifTrue: [
									currentStart := nums first asNumber.
									currentEnd := nums last asNumber ].
							currentLabel := currentType ].
					((line includesSubstring: '/label=') and: [ line size > 20 ])
						ifTrue: [
								eqPos := line indexOf: $= ifAbsent: [ 0 ].
								labelValue := (line copyFrom: eqPos + 1 to: line size)
									              copyReplaceAll: '"'
									              with: ''.
								currentLabel := labelValue ] ] ].
	sequenceLength := seqLength max:
		                  (sequence ifNil: [ 0 ] ifNotNil: [ sequence size ]).
	self features: features.
	self sequence: sequence
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> plotsIndexing [
    ^ plotsIndexing
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> plotsIndexing: anObject [
    plotsIndexing := anObject
]

{ #category : 'printing' }
BioDnaGraphicRecord >> printOn: aStream [
    aStream nextPutAll: 'BioDnaGraphicRecord('.
    sequenceLength printOn: aStream.
    aStream nextPutAll: ' bp, '.
    features size printOn: aStream.
    aStream nextPutAll: ' features)'
]

{ #category : 'features' }
BioDnaGraphicRecord >> removeFeature: aBioDnaFeature [
    features remove: aBioDnaFeature ifAbsent: [ nil ].
    ^ aBioDnaFeature
]

{ #category : 'as yet unclassified' }
BioDnaGraphicRecord >> rulerGapBelow [
	"Distance from ruler to the first element below it."

	^ yScale * 1.0
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> sequence [
    ^ sequence
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> sequence: anObject [
    sequence := anObject
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> sequenceLength [
    ^ sequenceLength
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> sequenceLength: anObject [
    sequenceLength := anObject
]

{ #category : 'as yet unclassified' }
BioDnaGraphicRecord >> shouldShowLabelBoxFor: aFeature [
	"Features that should display a rounded box behind their label.
	Restriction sites, terminators, and undirected features get boxes.
	Gene features and other directed features with inline labels do not."
	aFeature isUndirected ifTrue: [ ^ true ].
	aFeature label ifNil: [ ^ false ].
	(aFeature label asLowercase includesSubstring: 'site') ifTrue: [ ^ true ].
	(aFeature label asLowercase includesSubstring: 'terminator') ifTrue: [ ^ true ].
	(aFeature data at: #type ifAbsent: '') = 'restriction_site' ifTrue: [ ^ true ].
	^ false
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> showRulerTicks [

	^ showRulerTicks
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> showRulerTicks: aBoolean [

	showRulerTicks := aBoolean
]

{ #category : 'accessing - computed' }
BioDnaGraphicRecord >> span [
    ^ firstIndex to: self lastIndex
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> ticksResolution [
    ^ ticksResolution
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> ticksResolution: anObject [
    ticksResolution := anObject
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> xScale [

	^ xScale
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> yScale [
    ^ yScale
]

{ #category : 'accessing' }
BioDnaGraphicRecord >> yScale: aNumber [

	yScale := aNumber.
	yScaleIsCustom := true
]
