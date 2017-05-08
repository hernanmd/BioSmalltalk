accessing - private
buildProperties: stream
	" Private - Append receiver's properties to stream "

	self properties
		ifNotNil: [ :arg | 
			self properties
				associationsDo: [ :assoc | 
					stream space.
					self buildPropertySeparator: assoc into: stream.
					self buildPropertyValue: assoc into: stream ] ]