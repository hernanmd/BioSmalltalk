accessing
length
	" Answer an Integer of the number of bases in the receiver "

	| count |	
	
	self reset.
	count := 0.
	[ self atEnd ]
		whileFalse: [
			count := count + 1.
			self next ].
	^ count