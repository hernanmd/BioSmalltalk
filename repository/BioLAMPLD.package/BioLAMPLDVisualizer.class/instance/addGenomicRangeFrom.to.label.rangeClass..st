accessing
addGenomicRangeFrom: start to: end label: labelString rangeClass: aRTRangeClass
	" Add a genomic range to the receiver. The start and end positions <Number> must match the bases format choosen for the positions file "
	
	self grapher addDecorator: (
		aRTRangeClass new 
			startValue: start; 
			endValue: end; 
			label: labelString).