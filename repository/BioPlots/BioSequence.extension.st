Extension { #name : #BioSequence }

{ #category : #'*BioPlots' }
BioSequence >> addFromRSBuilder: aBioRSBaseBuilder [ 
	" Double dispatch to the Roassal builder "

	aBioRSBaseBuilder addSequenceString: self sequence
]

{ #category : #'*BioPlots' }
BioSequence >> plot [
	"Answer a <RSCanvas> which can be inspected to visualize the receiver's composition of nucleotides"

	| c nucs lb |
	c := RSChart new.
	c extent: 300@200.
	nucs := self occurrencesOfLetters values.
	c add: (RSAbstractChart barHeights: nucs).
	c addDecoration: (RSHorizontalTick new fromNames: self occurrencesOfLetters keys).
	c addDecoration: RSVerticalTick new integer.
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
		plotGcSkewInt: 800 @ 500 
		x: 'Position' 
		y: 'Skew'
]

{ #category : #'*BioPlots' }
BioSequence >> plotGcSkewInt: extentPoint x: xLabel y: yLabel [
	" Plot receiver's GC skew "

	| chart  positionsInSequence |

	positionsInSequence := (1 to: self sequence size) asArray.
	chart := RSCompositeChart new.
	chart horizontalTick integer.
	chart
		extent: extentPoint;
		title: 'GC Skew (' , self size asString , ' bp)';
		xlabel: xLabel;
		ylabel: yLabel;
		add: (RSLinePlot new 
			x: positionsInSequence y: self gcSkewInt allButFirst;
			color: Color blue);
		open
]
