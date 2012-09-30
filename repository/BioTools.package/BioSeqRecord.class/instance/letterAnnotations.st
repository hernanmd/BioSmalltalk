accessing private
letterAnnotations

	^ letterAnnotations
		ifNil: [ letterAnnotations := (self letterAnnotationsClass new: self sequence size) yourself ]