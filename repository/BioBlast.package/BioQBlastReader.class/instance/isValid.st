accessing-get
isValid
	" Answer <true> if receiver's remote response is valid for reading
	i.e. not UNKNOWN "

	( ( self results beginsWith: '<?xml' ) or: [ self results beginsWith: 'Seq-annot' ] )
			ifFalse: [ 
				| resultType |
				resultType := self statusParser results.
				self gtLog: 'Result Type: ' , resultType.
				^ resultType ~= 'UNKNOWN' ].
	^ true