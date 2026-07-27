"
Build Roassal 3 (RSCanvas) visualizations of a `BioPhyloTree`, modelled on R ggtree grammar of layers. Fluent API:

```
(BioPhyloPlotBuilder on: tree) tipLabels; tipPoints; nodePoints; scaleBar; open.
BioPhyloPlotBuilder on: tree) circular; tipLabels; open.
```

Layers (ggtree analogues): rectangular/circular (layout), tipLabels (geom_tiplab), tipPoints (geom_tippoint), nodePoints (geom_nodepoint), scaleBar (theme_tree2).

Coordinates: x = cumulative branch length from the root (phylogram); tip y = leaf index, internal y = midpoint of children; circular maps tip index -> angle and branch length -> radius. 

See `AIDendrogram` class-side examples for the clustering-dendrogram Roassal 3 style.
"
Class {
	#name : 'BioPhyloPlotBuilder',
	#superclass : 'Object',
	#instVars : [
		'tree',
		'layout',
		'showTipLabels',
		'showTipPoints',
		'showNodePoints',
		'showScaleBar',
		'tipColor',
		'nodeColor',
		'branchColor'
	],
	#category : 'BioPhylogenetics-Visualization',
	#package : 'BioPhylogenetics',
	#tag : 'Visualization'
}

{ #category : 'converting' }
BioPhyloPlotBuilder class >> on: aBioPhyloTree [	^ self new tree: aBioPhyloTree; yourself
]

{ #category : 'computing' }
BioPhyloPlotBuilder >> assignInternal: aClade in: coords [
	| ys |
	aClade isLeaf ifTrue: [ ^ coords at: aClade ].
	aClade children do: [ :c | self assignInternal: c in: coords ].
	ys := aClade children collect: [ :c | (coords at: c) y ].
	coords at: aClade put: aClade branchLengthToRoot @ ((ys min + ys max) / 2.0).
	^ coords at: aClade
]

{ #category : 'rendering' }
BioPhyloPlotBuilder >> build [
	"Build and answer an RSCanvas for the configured tree."
	| canvas coords |
	tree ifNil: [ self error: 'BioPhyloPlotBuilder has no tree (send tree:)' ].
	canvas := RSCanvas new.
	coords := self computeCoordinates.
	self drawBranchesOn: canvas using: coords.
	showNodePoints ifTrue: [ self drawNodePointsOn: canvas using: coords ].
	self drawTipsOn: canvas using: coords.
	showScaleBar ifTrue: [ self drawScaleBarOn: canvas using: coords ].
	^ canvas
]

{ #category : 'configuring' }
BioPhyloPlotBuilder >> circular [
	"Use a circular/radial phylogram layout. Answers self."
	layout := #circular.
	^ self
]

{ #category : 'computing' }
BioPhyloPlotBuilder >> computeCoordinates [
	"Answer a Dictionary mapping each clade to a Point (x = branch-length from root, y = leaf index / internal midpoint)."
	| coords leaves index |
	coords := Dictionary new.
	leaves := tree leaves.
	index := 0.
	leaves do: [ :leaf |
		coords at: leaf put: leaf branchLengthToRoot @ index.
		index := index + 1 ].
	self assignInternal: tree root in: coords.
	^ coords
]

{ #category : 'rendering' }
BioPhyloPlotBuilder >> drawBranchesOn: canvas using: coords [
	"Draw an L-shaped branch for each non-root clade."
	tree allClades do: [ :clade |
		clade parent ifNotNil: [
			| parentPt childPt |
			parentPt := self pointForClade: clade parent in: coords.
			childPt := self pointForClade: clade in: coords.
			layout = #circular
				ifTrue: [ canvas add: (RSLine new from: parentPt; to: childPt; color: branchColor) ]
			ifFalse: [
				canvas add: (RSLine new from: parentPt x @ parentPt y; to: parentPt x @ childPt y; color: branchColor).
				canvas add: (RSLine new from: parentPt x @ childPt y; to: childPt x @ childPt y; color: branchColor) ] ] ]
]

{ #category : 'rendering' }
BioPhyloPlotBuilder >> drawNodePointsOn: canvas using: coords [
	tree allClades do: [ :clade |
		clade isLeaf ifFalse: [
			canvas add: (RSBox new size: 6; position: (self pointForClade: clade in: coords); color: nodeColor) ] ]
]

{ #category : 'rendering' }
BioPhyloPlotBuilder >> drawScaleBarOn: canvas using: coords [
	| maxY barX barEnd barLabel |
	maxY := (tree leaves collect: [ :l | (coords at: l) y ]) max.
	barX := 0.
	barEnd := self xScale.
	canvas add: (RSLine new from: barX @ ((maxY + 1) * self yScale); to: barEnd @ ((maxY + 1) * self yScale); color: Color black).
	barLabel := RSLabel new text: '1.0'; position: (barEnd + 4) @ ((maxY + 1) * self yScale).
	canvas add: barLabel
]

{ #category : 'rendering' }
BioPhyloPlotBuilder >> drawTipsOn: canvas using: coords [
	tree leaves do: [ :leaf |
		| pt |
		pt := self pointForClade: leaf in: coords.
		showTipPoints ifTrue: [ canvas add: (RSCircle new size: 10; position: pt; color: tipColor) ].
		showTipLabels ifTrue: [
			canvas add: (RSLabel new
				text: (leaf name ifNil: [ '' ]);
				position: pt x + 10 @ pt y) ] ]
]

{ #category : 'initialization' }
BioPhyloPlotBuilder >> initialize [
	super initialize.
	layout := #rectangular.
	showTipLabels := true.
	showTipPoints := false.
	showNodePoints := false.
	showScaleBar := false.
	branchColor := Color black.
	tipColor := Color red.
	nodeColor := Color blue.
	^ self
]

{ #category : 'configuring' }
BioPhyloPlotBuilder >> nodePoints [
	"Show internal node points (ggtree geom_nodepoint). Answers self."
	showNodePoints := true.
	^ self
]

{ #category : 'opening' }
BioPhyloPlotBuilder >> open [
	"Build the canvas and open it in a Roassal window."
	^ self build open
]

{ #category : 'rendering' }
BioPhyloPlotBuilder >> pointForClade: aClade in: coords [
	"Apply layout transform: rectangular keeps (x,y); circular maps y to angle."
	| raw |
	raw := coords at: aClade.
	^ layout = #circular
		ifTrue: [ self polar: raw ]
		ifFalse: [ (raw x * self xScale) @ (raw y * self yScale) ]
]

{ #category : 'rendering' }
BioPhyloPlotBuilder >> polar: aPoint [
	"Map (x in branch units, y in tip-index) to a circular layout point."
	| radius angle nTips |
	nTips := tree countTerminals max: 1.
	angle := (aPoint y / nTips) * (2 * Float pi).
	radius := aPoint x * self xScale.
	^ (radius * angle cos) @ (radius * angle sin)
]

{ #category : 'configuring' }
BioPhyloPlotBuilder >> rectangular [
	"Use a rectangular phylogram layout (default). Answers self."
	layout := #rectangular.
	^ self
]

{ #category : 'configuring' }
BioPhyloPlotBuilder >> scaleBar [
	"Show a branch-length scale bar (ggtree theme_tree2). Answers self."
	showScaleBar := true.
	^ self
]

{ #category : 'configuring' }
BioPhyloPlotBuilder >> tipLabels [
	"Show tip labels (ggtree geom_tiplab). Answers self."
	showTipLabels := true.
	^ self
]

{ #category : 'configuring' }
BioPhyloPlotBuilder >> tipPoints [
	"Show tip points (ggtree geom_tippoint). Answers self."
	showTipPoints := true.
	^ self
]

{ #category : 'accessing' }
BioPhyloPlotBuilder >> tree [
	^ tree
]

{ #category : 'accessing' }
BioPhyloPlotBuilder >> tree: aBioPhyloTree [
	tree := aBioPhyloTree
]

{ #category : 'rendering' }
BioPhyloPlotBuilder >> xScale [
	"Pixels per branch-length unit."
	^ 80
]

{ #category : 'rendering' }
BioPhyloPlotBuilder >> yScale [
	"Pixels between adjacent tips."
	^ 30
]
