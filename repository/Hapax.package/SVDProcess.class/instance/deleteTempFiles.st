private
deleteTempFiles

	self inputFilename exists ifTrue: [ self inputFilename delete ].
	self outputSFilename exists ifTrue: [ self outputSFilename delete ].
	self outputUtFilename exists ifTrue: [ self outputUtFilename delete ].
	self outputVtFilename exists ifTrue: [ self outputVtFilename delete ].