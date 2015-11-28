*BioPharo4
numRows
	" Answer how many lines contains the receiver "
	
	| count |
 
	count := 0.
	readStream 
		reset;
		binary.
	readStream contents do: [ :c | c = 10 ifTrue: [ count := count + 1 ] ].
	readStream reset.
	^ count