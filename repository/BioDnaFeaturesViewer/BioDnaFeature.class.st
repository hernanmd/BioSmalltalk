"
I represent a genetic feature to be plotted on a DNA sequence map.

I model the visual properties of a feature: its position (start, end), strand direction, label, color, and styling. I am used by BioDnaGraphicRecord and BioDnaCircularGraphicRecord to visualize features on linear and circular sequence maps.

Example:
    feature := BioDnaFeature from: 5 to: 20 strand: 1 label: 'Gene A' color: Color red.
    feature length.             ""=> 15""
    feature isForward.          ""=> true""
    feature overlapsWith: otherFeature.

Instance Variables:
    start           <Integer>   Start position (0-based)
    end             <Integer>   End position
    strand          <Integer>   +1 (forward), -1 (reverse), 0 (undirected)
    label           <String>    Display label
    color           <Color>     Feature fill color
    thickness       <Number>    Visual thickness in plot units
    lineColor       <Color>     Border color
    lineWidth       <Number>    Border width
    openLeft        <Boolean>   Left side continues beyond view (cropped)
    openRight       <Boolean>   Right side continues beyond view (cropped)
    boxColor        <Object>    Label box background color (nil, #auto, or Color)
    boxLineWidth    <Number>    Label box border width
    legendText      <String>    Text for legend entries
    labelLinkColor  <Color>     Color of the line connecting label to feature
    data            <Dictionary> Optional data storage
"
Class {
	#name : 'BioDnaFeature',
	#superclass : 'Object',
	#instVars : [
		'start',
		'end',
		'strand',
		'label',
		'color',
		'thickness',
		'lineColor',
		'lineWidth',
		'openLeft',
		'openRight',
		'boxColor',
		'boxLineWidth',
		'legendText',
		'labelLinkColor',
		'data'
	],
	#category : 'BioDnaFeaturesViewer',
	#package : 'BioDnaFeaturesViewer'
}

{ #category : 'instance creation' }
BioDnaFeature class >> from: startPosition to: endPosition [
    ^ self new
        start: startPosition;
        end: endPosition;
        yourself
]

{ #category : 'instance creation' }
BioDnaFeature class >> from: startPosition to: endPosition strand: aStrand label: aLabel color: aColor [
    ^ self new
        start: startPosition;
        end: endPosition;
        strand: aStrand;
        label: aLabel;
        color: aColor;
        yourself
]

{ #category : 'comparing' }
BioDnaFeature >> = anObject [
    self == anObject ifTrue: [ ^ true ].
    self class = anObject class ifFalse: [ ^ false ].
    ^ start = anObject start and: [
      end = anObject end and: [
      strand = anObject strand and: [
      label = anObject label and: [
      color = anObject color]]]]
]

{ #category : 'converting' }
BioDnaFeature >> asBioSequenceFeature [
    ^ BioSequenceFeature new
        start: self start;
        end: self end;
        strand: self strand;
        primaryTag: self label;
        yourself
]

{ #category : 'accessing' }
BioDnaFeature >> boxColor [
    ^ boxColor
]

{ #category : 'accessing' }
BioDnaFeature >> boxColor: anObject [
    boxColor := anObject
]

{ #category : 'accessing' }
BioDnaFeature >> boxLineWidth [
    ^ boxLineWidth
]

{ #category : 'accessing' }
BioDnaFeature >> boxLineWidth: anObject [
    boxLineWidth := anObject
]

{ #category : 'accessing' }
BioDnaFeature >> color [
    ^ color
]

{ #category : 'accessing' }
BioDnaFeature >> color: anObject [
    color := anObject
]

{ #category : 'copying' }
BioDnaFeature >> copy [
    ^ self shallowCopy
        data: self data copy;
        yourself
]

{ #category : 'operations' }
BioDnaFeature >> crop: window [
    | s e copy |
    s := window first.
    e := window last.
    (s > self end or: [ e < self start ]) ifTrue: [ ^ nil ].
    copy := self copy.
    s > self start ifTrue: [ copy start: s. copy openLeft: true ].
    e < self end ifTrue: [ copy end: e. copy openRight: true ].
    ^ copy
]

{ #category : 'accessing' }
BioDnaFeature >> data [
    ^ data
]

{ #category : 'accessing' }
BioDnaFeature >> data: anObject [
    data := anObject
]

{ #category : 'accessing' }
BioDnaFeature >> end [
    ^ end
]

{ #category : 'accessing' }
BioDnaFeature >> end: anObject [
    end := anObject
]

{ #category : 'comparing' }
BioDnaFeature >> hash [
    ^ ((start hash hashMultiply + end hash) hashMultiply + strand hash) hashMultiply + label hash
]

{ #category : 'initialization' }
BioDnaFeature >> initialize [
    super initialize.
    start := 0.
    end := 0.
    strand := 0.
    color := Color blue.
    thickness := 14.
    lineColor := Color black.
    lineWidth := 1.0.
    openLeft := false.
    openRight := false.
    boxColor := nil.
    boxLineWidth := 1.
    labelLinkColor := Color black.
    data := Dictionary new
]

{ #category : 'testing' }
BioDnaFeature >> isForward [
    ^ strand = 1
]

{ #category : 'testing' }
BioDnaFeature >> isReverse [
    ^ strand = -1
]

{ #category : 'testing' }
BioDnaFeature >> isUndirected [
    ^ strand = 0
]

{ #category : 'accessing' }
BioDnaFeature >> label [
    ^ label
]

{ #category : 'accessing' }
BioDnaFeature >> label: anObject [
    label := anObject
]

{ #category : 'accessing' }
BioDnaFeature >> labelLinkColor [
    ^ labelLinkColor
]

{ #category : 'accessing' }
BioDnaFeature >> labelLinkColor: anObject [
    labelLinkColor := anObject
]

{ #category : 'accessing' }
BioDnaFeature >> legendText [
    ^ legendText
]

{ #category : 'accessing' }
BioDnaFeature >> legendText: anObject [
    legendText := anObject
]

{ #category : 'accessing - computed' }
BioDnaFeature >> length [
    ^ end - start abs
]

{ #category : 'accessing' }
BioDnaFeature >> lineColor [
    ^ lineColor
]

{ #category : 'accessing' }
BioDnaFeature >> lineColor: anObject [
    lineColor := anObject
]

{ #category : 'accessing' }
BioDnaFeature >> lineWidth [
    ^ lineWidth
]

{ #category : 'accessing' }
BioDnaFeature >> lineWidth: anObject [
    lineWidth := anObject
]

{ #category : 'accessing' }
BioDnaFeature >> openLeft [
    ^ openLeft
]

{ #category : 'accessing' }
BioDnaFeature >> openLeft: anObject [
    openLeft := anObject
]

{ #category : 'accessing' }
BioDnaFeature >> openRight [
    ^ openRight
]

{ #category : 'accessing' }
BioDnaFeature >> openRight: anObject [
    openRight := anObject
]

{ #category : 'testing' }
BioDnaFeature >> overlapsWith: aBioDnaFeature [
    (self = aBioDnaFeature) ifTrue: [ ^ true ].
    (self start >= aBioDnaFeature start and: [ self end <= aBioDnaFeature end ]) ifTrue: [ ^ true ].
    (aBioDnaFeature start >= self start and: [ aBioDnaFeature end <= self end ]) ifTrue: [ ^ true ].
    (self start >= aBioDnaFeature start and: [ self start < aBioDnaFeature end ]) ifTrue: [ ^ true ].
    (self start < aBioDnaFeature start and: [ self end > aBioDnaFeature start ]) ifTrue: [ ^ true ].
    ^ false
]

{ #category : 'copying' }
BioDnaFeature >> postCopy [
    super postCopy.
    data := self data copy
]

{ #category : 'printing' }
BioDnaFeature >> printOn: aStream [

	aStream nextPutAll: 'BioDnaFeature('.
	aStream
		nextPutAll: self label;
		nextPutAll: ', '.
	self start printOn: aStream.
	aStream nextPutAll: '-'.
	self end printOn: aStream.
	self strand = 0 ifFalse: [
			aStream nextPutAll: '('.
			self strand printOn: aStream.
			aStream nextPutAll: ')' ].
	aStream nextPutAll: ')'
]

{ #category : 'operations' }
BioDnaFeature >> splitInTwoAt: xCoord [

	| copy1 copy2 |
	copy1 := self copy.
	copy2 := self copy.
	copy1 end: xCoord.
	copy2 start: xCoord + 1.
	^ Array with: copy1 with: copy2
]

{ #category : 'accessing' }
BioDnaFeature >> start [
    ^ start
]

{ #category : 'accessing' }
BioDnaFeature >> start: anObject [
    start := anObject
]

{ #category : 'accessing' }
BioDnaFeature >> strand [
    ^ strand
]

{ #category : 'accessing' }
BioDnaFeature >> strand: anObject [
    strand := anObject
]

{ #category : 'accessing' }
BioDnaFeature >> thickness [
    ^ thickness
]

{ #category : 'accessing' }
BioDnaFeature >> thickness: anObject [
    thickness := anObject
]

{ #category : 'accessing - computed' }
BioDnaFeature >> xCenter [
    ^ 0.5 * (start + end - 1)
]
