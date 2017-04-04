accessing
addGenomicRangeBelowXFrom: start to: end label: labelString

	self assert: [ Smalltalk hasClassNamed: #RTRangeBelowXAxis  ] description: 'Class must be available'.
	self 
		addGenomicRangeFrom: start 
		to: end 
		label: labelString 
		rangeClass: (Smalltalk at: #RTRangeBelowXAxis)
