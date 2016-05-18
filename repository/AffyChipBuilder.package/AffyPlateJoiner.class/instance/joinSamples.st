accessing
joinSamples

	| joinedSamples joinedAffySamples |
	
	joinedAffySamples := (self affySamples joinUsing: Array new) reject: #isNil.
	joinedAffySamplesId := joinedAffySamples collect: #first.
	joinedSamples := OrderedCollection new: joinedAffySamples size.
	self readOrderedIndivs do: [ : i | 
		joinedAffySamples 
			detect: [ : s | s first = i ] 
			ifFound: [ : found | joinedSamples add: found ]
			ifNone: [ "joinedSamples add: (Array with: i with: self nullIdentifier with: self nullIdentifier)" ] ].
	^ joinedSamples 
