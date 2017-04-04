accessing
gapSize
	" Answer a <Number> of points between graphers in stacked visualization view "

	^ gapSize
		ifNil: [ gapSize := self defaultGapSize ]