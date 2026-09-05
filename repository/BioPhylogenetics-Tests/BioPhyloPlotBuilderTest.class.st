Class {
	#name : 'BioPhyloPlotBuilderTest',
	#superclass : 'TestCase',
	#category : 'BioPhylogenetics-Tests-Tests',
	#package : 'BioPhylogenetics-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
BioPhyloPlotBuilderTest >> testBuildCircular [
	| t canvas |
	t := BioPhyloTree readFromNewick: '((A:0.1,B:0.2):0.3,(C:0.4,D:0.5):0.6);'.
	canvas := (BioPhyloPlotBuilder on: t) circular; tipLabels; build.
	self assert: canvas class equals: RSCanvas.
	self assert: canvas shapes notEmpty
]

{ #category : 'tests' }
BioPhyloPlotBuilderTest >> testBuildRectangular [
	| t canvas |
	t := BioPhyloTree readFromNewick: '((A:0.1,B:0.2):0.3,(C:0.4,D:0.5):0.6);'.
	canvas := (BioPhyloPlotBuilder on: t) tipPoints; nodePoints; scaleBar; build.
	self assert: canvas class equals: RSCanvas.
	self assert: canvas shapes notEmpty
]

{ #category : 'tests' }
BioPhyloPlotBuilderTest >> testNoTreeRaises [
	self should: [ BioPhyloPlotBuilder new build ] raise: Error
]
