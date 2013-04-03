*bioplatform
openTranscript
	" Private - Open the system Transcript if closed "

	(self allowOpenTranscript and: [ Transcript dependents isEmpty ])
		ifTrue: [ Transcript open ].