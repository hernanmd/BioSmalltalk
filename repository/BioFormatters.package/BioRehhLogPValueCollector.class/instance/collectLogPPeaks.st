private
collectLogPPeaks

	| index |
	
	self gpeaks: OrderedCollection new.
	index := 1.
	[ index + 1 = self logpCol size ] whileFalse: [ 
		| pend pstart lpstart |
		pend := self logpCol at: index + 1.
		pstart := self logpCol at: index.
		(pend third asNumber - pstart third asNumber > self nbases)
			ifTrue: [ 
				lpstart ifNil: [ 
					self gpeaks add: pstart.
					lpstart := pstart second ].			
				self gpeaks add: pend ]
			ifFalse: [ lpstart := nil ].
		index := index + 1 ].