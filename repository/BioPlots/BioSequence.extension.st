Extension { #name : #BioSequence }

{ #category : #'*BioPlots' }
BioSequence >> plotBarChart [

	| c menMeans lb |
	c := RSChart new.
	c extent: 300@200.
	menMeans := self occurrencesOfLetters values.
	c barHeights: menMeans.
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
