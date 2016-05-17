accessing - public
executeWS
	" Run the receiver for each value of window size "

	self windowSizes do: [ : ws | self execute: ws ]