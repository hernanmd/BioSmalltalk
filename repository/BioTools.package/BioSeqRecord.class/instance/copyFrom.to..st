accessing-sequence
copyFrom: start to: end

	| newInstance |
	
	self needsWork.
	newInstance := self class new: ( self sequence copyFrom: start to: end ).
	newInstance letterAnnotations