private-algorithm
step3
	#(#(#ative #'') #(#icate #ic) #(#alize #al) #(#iciti #ic) #(#ical #ic) #(#ness #'') #(#ful #'')) 
		do: 
			[:rule | 
			(self endsWith: (rule first)) 
				ifTrue: 
					[cursor >= r1 ifTrue: [self setSuffix: (rule last)].
					^nil]]