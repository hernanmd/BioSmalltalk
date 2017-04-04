accessing
addGenomicRangeAboveXFrom: start to: end label: labelString

	self assert: [ Smalltalk hasClassNamed: #RTRangeAboveXAxis  ] description: 'Class must be available'.
	self 
		addGenomicRangeFrom: start 
		to: end 
		label: labelString 
		rangeClass: (Smalltalk at: #RTRangeAboveXAxis)
