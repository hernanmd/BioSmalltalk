Extension { #name : #BioSequence }

{ #category : #'*BioPlots' }
BioSequence >> addFromRSBuilder: aBioRSBaseBuilder rowIndex: anInteger [ 

	aBioRSBaseBuilder addSequenceString: self sequence rowIndex: anInteger
]

{ #category : #'*BioPlots' }
BioSequence >> chartGcSkewInt [
	" Answer a chart of the receiver's GC skew "

	^ self 
		chartGcSkewInt: self defaultExtent
		x: 'Position' 
		y: 'Skew'
]

{ #category : #'*BioPlots' }
BioSequence >> chartGcSkewInt: extentPoint x: xLabel y: yLabel [
	" Answer a plot of the receiver's GC skew "

	| chart  positionsInSequence |

	positionsInSequence := (1 to: self sequence size) asArray.
	chart := RSCompositeChart new.
	chart horizontalTick integer.
	^ chart
		extent: extentPoint;
		title: 'GC Skew (' , self size asString , ' bp)';
		title: self name;
		xlabel: xLabel;
		ylabel: yLabel;
		add: (RSLinePlot new 
			x: positionsInSequence y: self gcSkewInt allButFirst;
			color: Color blue);
		yourself
]

{ #category : #'*BioPlots' }
BioSequence >> defaultExtent [
	" Answer a <Point> specifying the receiver's extent for plots "

	^ 800 @ 500
]

{ #category : #'*BioPlots' }
BioSequence >> plot [
	"Answer a <RSCanvas> which can be inspected to visualize the receiver's composition of nucleotides"

	| c nucs lb |

	nucs := self occurrencesOfLetters values.
	c := RSAbstractChart barHeights: nucs.
	c extent: self defaultExtent.

	c horizontalTick fromNames: self occurrencesOfLetters keys.
	c verticalTick integer.

	c ylabel: 'Nucleotide frequency'.
	c xlabel: 'Nucleotides'.
	c title: self name.
	lb := RSLegend new.
	lb layout horizontal.
	lb container: c canvas.
	lb build.
	c open.
	
	
]

{ #category : #'*BioPlots' }
BioSequence >> plotGcSkewInt [
	" Plot receiver's GC skew "

	^ self 
		plotGcSkewInt: self defaultExtent
		x: 'Position' 
		y: 'Skew'
]

{ #category : #'*BioPlots' }
BioSequence >> plotGcSkewInt: extentPoint x: xLabel y: yLabel [
	" Open a window with the receiver's GC skew plot "

	(self chartGcSkewInt: extentPoint x: xLabel y: yLabel) open
]
