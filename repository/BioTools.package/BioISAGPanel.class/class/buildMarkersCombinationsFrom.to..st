private
buildMarkersCombinationsFrom: startNumber to: endNumber
	" Answer a <Collection> with "
	
	| combinations |
	
	combinations := OrderedCollection new.
	(startNumber to: endNumber by: 2) 
			enumerationsOfSize: 2 
			do: [ : combination | combinations add: combination copy ].
	^ combinations 