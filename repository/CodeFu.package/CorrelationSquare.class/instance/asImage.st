converting
asImage

	| image |
	image := Image 
		extent: self dimension transpose 
		depth: 32
		palette: (FixedPalette rgb8Bit).
	1 to: self columnSize do: [:column | 
		1 to: self rowSize do: [:row | 
			| cosine temp |
			cosine := self at: row and: column.

	temp := cosine.
		temp := (temp max: 0) min: 1.
		temp := temp * temp.
		temp := temp < 0.1 ifTrue: [ 0 ] ifFalse: [ temp ].
	temp := (255 - (temp * 255)) asInteger.
	temp := (temp bitOr: (temp bitShift: 8)) bitOr: (temp bitShift: 16).

			image atX: column - 1 y: row - 1
				put: temp


		].
	].
	^image