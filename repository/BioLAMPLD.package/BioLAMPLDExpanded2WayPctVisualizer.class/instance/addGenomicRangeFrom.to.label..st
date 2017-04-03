accessing
addGenomicRangeFrom: start to: end label: labelString

	self grapher addDecorator: (
		RTRangeBelowXAxis new 
			startValue: start; 
			endValue: end; 
			label: labelString).