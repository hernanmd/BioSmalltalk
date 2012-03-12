accessing private
buildResults: aCollection
	" Answer an identified object for the receiver's parsing output "

	^ ( aCollection first isString or: [ aCollection size <= 3 ] )
		ifTrue: [ self buildFastaRecord: aCollection first ]
		ifFalse: [ aCollection collect: [ : seq | self buildResults: seq ] ]