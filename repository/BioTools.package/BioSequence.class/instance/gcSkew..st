accessing
gcSkew: wLength
	" Answer a <Collection> with ratios <Float>. Calculate receiver's GC skew (G-C)/(G+C) for windows of size wLength.
	Set 0 for windows without any G/C by handling zero division errors. Does NOT look at any ambiguous nucleotides. "
	
	| ranges index |
	ranges := OrderedCollection new: wLength.
	index := 1.
	[ (index + wLength) < self size ] whileTrue: [ 
		| cCount gCount skew |		
		cCount := 0.
		gCount := 0.	
		self from: index to: index + wLength do: [ : each |
			each asUppercase = $C 
				ifTrue: [ cCount := cCount + 1 ]
				ifFalse: [ each asUppercase = $G 
					ifTrue: [ gCount := gCount + 1 ] ] ].
		skew := [ (gCount - cCount) / (gCount + cCount) ]			
			on: ZeroDivide
			do: [ : ex | 0.0 ].			
		ranges add: ((skew * 100) round: 6).
		index := index + wLength ].
	^ ranges	

