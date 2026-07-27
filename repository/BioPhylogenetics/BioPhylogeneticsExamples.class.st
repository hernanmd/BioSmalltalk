"
I hold executable <example> methods for the BioPhylogenetics package (run from the Playground / Examples browser):

  BioPhylogeneticsExamples exampleFromNewick.
  BioPhylogeneticsExamples exampleLadderize.
  BioPhylogeneticsExamples exampleRectangularPlot.   ""opens a Roassal window""
  BioPhylogeneticsExamples exampleCircularPlot.
  BioPhylogeneticsExamples exampleFromNexus.          ""two trees from a Nexus TREES block""
  BioPhylogeneticsExamples exampleMRCA.                ""most recent common ancestor""
  BioPhylogeneticsExamples examplePatristicDistance.
  BioPhylogeneticsExamples exampleSmaCCParser.        ""exercises the SmaCC Newick parser""

sampleTree / sampleNexus answer canonical fixtures used by the examples and tests.
"
Class {
	#name : 'BioPhylogeneticsExamples',
	#superclass : 'Object',
	#category : 'BioPhylogenetics-Examples',
	#package : 'BioPhylogenetics',
	#tag : 'Examples'
}

{ #category : 'examples' }
BioPhylogeneticsExamples class >> exampleCircularPlot [

	<example>
	^ (BioPhyloPlotBuilder on: self sampleTree)
		  circular;
		  tipLabels;
		  open
]

{ #category : 'examples' }
BioPhylogeneticsExamples class >> exampleFromNewick [

	<example>
	^ self sampleTree inspect
]

{ #category : 'examples' }
BioPhylogeneticsExamples class >> exampleFromNexus [
	"Parse the two trees embedded in the sample Nexus TREES block."

	<example>

	^ (Array streamContents: [ :s |
			s 
				nextPut: (#'t1' -> (BioPhyloTree readFromNewick: #'((A:0.1,B:0.2):0.3,(C:0.4,D:0.5):0.6)'));
	  			nextPut: (#'t2' -> (BioPhyloTree readFromNewick: #'(A,B,(C,D))')) ]) inspect
]

{ #category : 'examples' }
BioPhylogeneticsExamples class >> exampleLadderize [

	<example>
	| t |
	t := self sampleTree.
	t ladderize.
	^ t inspect
]

{ #category : 'examples' }
BioPhylogeneticsExamples class >> exampleLadderizeAndPlot [

	<example>
	^ (BioPhyloPlotBuilder on: self sampleTree)
		  tipPoints;
		  nodePoints;
		  tipLabels;
		  scaleBar;
		  open
]

{ #category : 'examples' }
BioPhylogeneticsExamples class >> exampleMRCA [

	<example>
	| t |
	t := self sampleTree.
	^ (t commonAncestor: #( 'A' 'D' )) inspect
]

{ #category : 'examples' }
BioPhylogeneticsExamples class >> examplePatristicDistance [

	<example>
	^ self sampleTree distanceBetween: 'A' and: 'E'
]

{ #category : 'examples' }
BioPhylogeneticsExamples class >> exampleRectangularPlot [

	<example>
	^ (BioPhyloPlotBuilder on: self sampleTree)
		  tipPoints;
		  nodePoints;
		  scaleBar;
		  open
]

{ #category : 'examples' }
BioPhylogeneticsExamples class >> exampleSmaCCParser [
	"Show that parsing is driven by the SmaCC-generated parser when present."

	<example>
	^ ((Smalltalk at: #BioNewickSmaCCParser ifAbsent: [ nil ])
		  ifNil: [ 'SmaCC parser not loaded' ]
		  ifNotNil: [ :p | p parse: '((A,B),(C,D));' ]) inspect
]

{ #category : 'examples' }
BioPhylogeneticsExamples class >> sampleNexus [
	"A minimal Nexus TREES block with two trees."

	^ String streamContents: [ :s |
			  s
				  nextPutAll: #'#NEXUS';
				  cr;
				  cr.
			  s
				  nextPutAll: #'BEGIN TREES;';
				  cr.
			  s
				  nextPutAll: #'	tree t1 = ((A:0.1,B:0.2):0.3,(C:0.4,D:0.5):0.6);';
				  cr.
			  s
				  nextPutAll: #'	tree t2 = (A,B,(C,D));';
				  cr.
			  s nextPutAll: #'END;' ]
]

{ #category : 'examples' }
BioPhylogeneticsExamples class >> sampleTree [

	^ BioPhyloTree readFromNewick:
		  '((A:0.1,B:0.2):0.3,(C:0.4,(D:0.5,E:0.6):0.2):0.4);'
]
