Extension { #name : #BioSequence }

{ #category : #'*BioPlots' }
BioSequence >> addFromRSBuilder: aBioRSBaseBuilder [ 
	" Double dispatch to the Roassal builder "

	aBioRSBaseBuilder addSequenceString: self sequence
]

{ #category : #'*BioPlots' }
BioSequence >> plotBarChart [
	"Answer a <RSCanvas> which can be inspected to visualize the receiver's composition of nucleotides"

	| c nucs lb |
	c := RSChart new.
	c extent: 300@200.
	nucs := self occurrencesOfLetters values.
	c barHeights: nucs.
	c addDecoration: (RSHorizontalTick new fromNames: self occurrencesOfLetters keys).
	c addDecoration: RSVerticalTick new integer.
	c ylabel: 'Nucleotide frequency'.
	c xlabel: 'Nucleotides'.
	c title: self name.
	c build.
	lb := RSLegend new.
	lb layout horizontal.
	lb container: c canvas.
	lb build.
	^ c canvas
	
	
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

	| b values ds |
	b := RTGrapher new.
	values := self gcSkewInt.
	b 
		extent: extentPoint.
" if: [:value | value < 0 ] fillColor: (Color red alpha: 0.3). 
		if: [ :v | v < 0 ] fillColor: Color red;
		if: [ :v | v > 0 ] fillColor: Color green.
"
	ds := RTData new.
	ds interaction popup.
	ds points: values.
	ds connectColor: Color red.
"	ds y: #yourself."
	
	b add: ds.
	
	" Configure axis settings "
	b axisY 
		minValue: values min;
		title: yLabel;
		color: Color black;
		noDecimal.
	self size > 80
		ifTrue: [
			ds noDot. 
			b axisX 
				numberOfTicks: 10;
				noLabel ]
		ifFalse: [ 
			b axisX
				numberOfTicks: self size;
				numberOfLabels: self size ].
	b axisX
		noDecimal;
		color: Color black;
		title: xLabel.		
	
"	b build."
	b open
]
