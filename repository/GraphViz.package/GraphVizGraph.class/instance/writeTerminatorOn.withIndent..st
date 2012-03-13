streaming
writeTerminatorOn: stream withIndent: aNumber

	stream cr.
	self indent: aNumber on: stream.
	stream nextPut: $}