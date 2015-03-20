accessing
materialize
	" See superimplementor comment "

	| srs object |

	Cursor read showWhile: [ 	
		srs := self provider readOnlyFileNamed: self location.
		object := srs next.
		srs close ].
	^ object.