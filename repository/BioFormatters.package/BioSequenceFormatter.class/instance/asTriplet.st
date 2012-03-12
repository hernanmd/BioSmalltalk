accessing
asTriplet
	" Answer a String with the receiver's DNA or RNA sequence decoded by triplets "
	
	^ String streamContents: [: stream |
		1 to: self sequence size by: 3 do: [: startIndex |
			self sequence size >= ( startIndex + 2 )
				ifFalse: [ 
					stream 
						nextPutAll: ( self sequence copyFrom: startIndex to: startIndex + 2 );
						space ] 
			].
		self sequence size \\ 3 ~= 0 
			ifTrue: [ stream nextPutAll: ( self sequence last: self sequence size \\ 3 ) ]
		].
