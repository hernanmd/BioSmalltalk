converting
asNumber
	" Interpret the receiver as a k-mer pattern and answer the <Number> at the index array defined by the receiver's size (PatternToNumber)  "
	
	| map |
	map := Dictionary new
		at: $A put: '00';
		at: $C put: '01';
		at: $G put: '10';
		at: $T put: '11';
		yourself.
	^ (Number 
			readFrom: (String streamContents: [ : stream | self sequence do: [ : n | stream nextPutAll: (map at: n) ] ]) 
			base: 2) + 1

