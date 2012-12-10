application
convertCollection: aSequencableCollection 

	| collection |
	collection := aSequencableCollection species new.
	self do: [:index | collection add: (aSequencableCollection at: index)].
	^collection