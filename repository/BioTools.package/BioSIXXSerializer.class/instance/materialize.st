accessing
materialize
	" See superimplementor comment "

	| srs object |

	srs := self provider readOnlyFileNamed: self location.
	object := srs next.
	srs close.
	^ object.