private
findBreakpoints

	^ (self dataPoints collect: #second) collect: #asNumber.
