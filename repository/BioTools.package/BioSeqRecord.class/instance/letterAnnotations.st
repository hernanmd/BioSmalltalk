accessing - sequence annotations
letterAnnotations
	" Answer a <Dictionary> with per-letter annotations. "

	^ letterAnnotations
		ifNil: [ letterAnnotations := (self letterAnnotationsClass new: self sequence size) yourself ]