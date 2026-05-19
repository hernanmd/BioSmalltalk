"
I represent a set of genetic features on a circular DNA sequence (plasmid map), rendered using Roassal.

I extend BioDnaGraphicRecord to render features as arc segments on a circular plot. Features are shown as wedge-shaped arcs pointing in the direction of their strand.

Example:
    features := { ... }.
    record := BioDnaCircularGraphicRecord sequenceLength: 1000 features: features.
    record openCircular.      ""Open in a window""
    record openCircularTitled: 'Plasmid Map'.

Instance Variables:
    topPosition     <Number>    The sequence position that appears at the top of the circle (default: 0)
    radius          <Number>    Radius of the circular backbone (default: 1.0)
"
Class {
	#name : 'BioDnaCircularGraphicRecord',
	#superclass : 'BioDnaGraphicRecord',
	#instVars : [
		'topPosition',
		'radius',
		'cScale'
	],
	#category : 'BioDnaFeaturesViewer',
	#package : 'BioDnaFeaturesViewer'
}

{ #category : 'instance creation' }
BioDnaCircularGraphicRecord class >> sequenceLength: anInteger features: aCollection [
    ^ self new
        sequenceLength: anInteger;
        features: aCollection;
        yourself
]

{ #category : 'visualization - circular' }
BioDnaCircularGraphicRecord >> buildArcFor: aFeature atLevel: aLevel on: canvas [
    | startAngle endAngle outerPoints innerPoints arcPoints r innerR outerR sR step angularSpan |
    sR := self scaledRadius.
    startAngle := self positionToAngle: aFeature start.
    endAngle := self positionToAngle: aFeature end.
    
    aFeature isUndirected ifTrue: [ 
        ^ self buildArcSegmentFor: aFeature atLevel: aLevel on: canvas ].
    
    r := sR + (aLevel * featureLevelHeight * cScale).
    innerR := r - (cScale * featureLevelHeight * 0.35).
    outerR := r + (cScale * featureLevelHeight * 0.35).
    step := 2.0.
    
    "Calculate clockwise angular span"
    angularSpan := startAngle - endAngle.
    angularSpan < 0 ifTrue: [ angularSpan := angularSpan + 360 ].
    
    "Outer arc: clockwise from startAngle to endAngle"
    outerPoints := OrderedCollection new.
    startAngle to: startAngle - angularSpan by: step negated do: [ :angle |
        | radAngle |
        radAngle := angle degreesToRadians.
        outerPoints add: (radAngle cos * outerR) @ (radAngle sin * outerR) ].
    outerPoints add: (endAngle degreesToRadians cos * outerR) @ (endAngle degreesToRadians sin * outerR).
    
    "Inner arc: counterclockwise from endAngle back to startAngle"
    innerPoints := OrderedCollection new.
    endAngle to: startAngle by: step do: [ :angle |
        | radAngle |
        radAngle := angle degreesToRadians.
        innerPoints add: (radAngle cos * innerR) @ (radAngle sin * innerR) ].
    
    "Assemble polygon: the arrow tip must be adjacent to same-angle arc points"
    arcPoints := outerPoints copy.
    
    aFeature isForward ifTrue: [
        "Forward: arrow tip at endAngle, between outer arc end and inner arc start"
        | arrowR radAngle |
        radAngle := endAngle degreesToRadians.
        arrowR := r + (cScale * featureLevelHeight * 0.55).
        arcPoints add: (radAngle cos * arrowR) @ (radAngle sin * arrowR) ].
    
    arcPoints addAll: innerPoints.
    
    aFeature isReverse ifTrue: [
        "Reverse: arrow tip at startAngle, after inner arc end (same angle as first outer point)"
        | arrowR radAngle |
        radAngle := startAngle degreesToRadians.
        arrowR := r + (cScale * featureLevelHeight * 0.55).
        arcPoints add: (radAngle cos * arrowR) @ (radAngle sin * arrowR) ].
    
    ^ RSPolygon new
        points: arcPoints;
        color: aFeature color;
        border: (RSBorder new color: aFeature lineColor; width: aFeature lineWidth);
        yourself
]

{ #category : 'visualization - circular' }
BioDnaCircularGraphicRecord >> buildArcSegmentFor: aFeature atLevel: aLevel on: canvas [
    | startAngle endAngle outerPoints innerPoints arcPoints r innerR outerR sR step angularSpan |
    sR := self scaledRadius.
    startAngle := self positionToAngle: aFeature start.
    endAngle := self positionToAngle: aFeature end.
    
    r := sR + (aLevel * featureLevelHeight * cScale).
    innerR := r - (cScale * featureLevelHeight * 0.35).
    outerR := r + (cScale * featureLevelHeight * 0.35).
    step := 2.0.
    
    angularSpan := startAngle - endAngle.
    angularSpan < 0 ifTrue: [ angularSpan := angularSpan + 360 ].
    
    outerPoints := OrderedCollection new.
    startAngle to: startAngle - angularSpan by: step negated do: [ :angle |
        | radAngle |
        radAngle := angle degreesToRadians.
        outerPoints add: (radAngle cos * outerR) @ (radAngle sin * outerR) ].
    outerPoints add: (endAngle degreesToRadians cos * outerR) @ (endAngle degreesToRadians sin * outerR).
    
    innerPoints := OrderedCollection new.
    endAngle to: startAngle by: step do: [ :angle |
        | radAngle |
        radAngle := angle degreesToRadians.
        innerPoints add: (radAngle cos * innerR) @ (radAngle sin * innerR) ].
    
    arcPoints := outerPoints copy.
    arcPoints addAll: innerPoints.
    
    ^ RSPolygon new
        points: arcPoints;
        color: aFeature color;
        border: (RSBorder new color: aFeature lineColor; width: aFeature lineWidth);
        yourself
]

{ #category : 'visualization - circular' }
BioDnaCircularGraphicRecord >> buildCircularOn: canvas [
    | levels maxLevel featuresSorted sR |
    levels := self computeFeatureLevels.
    levels ifEmpty: [ ^ self buildCircularRulerOn: canvas ].
    maxLevel := 1 max: levels values max.
    sR := self scaledRadius.
    
    self buildCircularRulerOn: canvas.
    
    featuresSorted := features asArray sort: [ :a :b | a length < b length ].
    canvas addAll: (featuresSorted collect: [ :feature |
        | level |
        level := levels at: feature ifAbsent: [ 0 ].
        self buildArcFor: feature atLevel: level on: canvas ]).
    
    featuresSorted do: [ :feature |
        | level pos |
        feature label ifNotNil: [
            level := levels at: feature ifAbsent: [ 0 ].
            pos := self coordinatesInPlotAt: feature xCenter level: maxLevel + 1.5.
            canvas add: (RSLabel new
                text: feature label;
                fontSize: 10;
                color: Color black;
                position: pos;
                yourself) ] ]
]

{ #category : 'visualization - circular' }
BioDnaCircularGraphicRecord >> buildCircularRulerOn: canvas [
    | circle sR tickInnerR tickOuterR labelR tickInterval |
    sR := self scaledRadius.
    
    circle := RSEllipse new
        extent: (sR * 2) @ (sR * 2);
        color: Color transparent;
        border: (RSBorder new color: defaultRulerColor; width: 1);
        position: 0 @ 0;
        yourself.
    canvas add: circle.
    
    tickInnerR := sR - (cScale * 0.02).
    tickOuterR := sR + (cScale * 0.02).
    labelR := sR + (cScale * 0.09).
    
    tickInterval := self determineTickInterval.
    firstIndex to: self lastIndex - 1 by: tickInterval do: [ :pos |
        | angle radAngle |
        angle := self positionToAngle: pos.
        radAngle := angle degreesToRadians.
        canvas add: (RSLine new
            from: (radAngle cos * tickInnerR) @ (radAngle sin * tickInnerR);
            to: (radAngle cos * tickOuterR) @ (radAngle sin * tickOuterR);
            color: defaultRulerColor;
            width: 1;
            yourself).
        canvas add: (RSLabel new
            text: (plotsIndexing = #genbank ifTrue: [ pos + 1 ] ifFalse: [ pos ]) asString;
            fontSize: 8;
            color: defaultRulerColor;
            position: (radAngle cos * labelR) @ (radAngle sin * labelR);
            yourself) ]
]

{ #category : 'accessing' }
BioDnaCircularGraphicRecord >> cScale [
    ^ cScale
]

{ #category : 'accessing' }
BioDnaCircularGraphicRecord >> cScale: aNumber [
    cScale := aNumber
]

{ #category : 'visualization - circular' }
BioDnaCircularGraphicRecord >> circularCanvas [

	| canvas |
	canvas := RSCanvas new.
	canvas nodes @ RSDraggable new.
	canvas @ RSCanvasController new.
	self buildCircularOn: canvas.
	canvas zoomToFit.
	^ canvas
]

{ #category : 'visualization - circular' }
BioDnaCircularGraphicRecord >> coordinatesInPlotAt: aPosition level: aLevel [
    | r angle radAngle sR |
    sR := self scaledRadius.
    r := sR + (aLevel * featureLevelHeight * cScale).
    angle := self positionToAngle: aPosition.
    radAngle := angle degreesToRadians.
    ^ (radAngle cos * r) @ (radAngle sin * r)
]

{ #category : 'initialization' }
BioDnaCircularGraphicRecord >> initialize [
    super initialize.
    topPosition := 0.
    radius := 1.0.
    featureLevelHeight := 0.2.
    cScale := 200
]

{ #category : 'visualization - circular' }
BioDnaCircularGraphicRecord >> openCircular [
    | canvas |
    canvas := self circularCanvas.
    ^ canvas open
]

{ #category : 'visualization - circular' }
BioDnaCircularGraphicRecord >> openCircularTitled: aString [
    | canvas |
    canvas := self circularCanvas.
    ^ canvas openWithTitle: aString
]

{ #category : 'visualization - circular' }
BioDnaCircularGraphicRecord >> positionToAngle: aPosition [
    | a |
    a := 360.0 * (aPosition - topPosition) / sequenceLength.
    ^ 90 - a
]

{ #category : 'accessing' }
BioDnaCircularGraphicRecord >> radius [
    ^ radius
]

{ #category : 'accessing' }
BioDnaCircularGraphicRecord >> radius: anObject [
    radius := anObject
]

{ #category : 'accessing - computed' }
BioDnaCircularGraphicRecord >> scaledRadius [
    ^ radius * cScale
]

{ #category : 'accessing' }
BioDnaCircularGraphicRecord >> topPosition [
    ^ topPosition
]

{ #category : 'accessing' }
BioDnaCircularGraphicRecord >> topPosition: anObject [
    topPosition := anObject
]
