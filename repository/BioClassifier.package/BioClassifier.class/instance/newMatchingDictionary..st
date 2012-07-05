accessing
newMatchingDictionary: keySymbol

	^ ( Dictionary new 
				at: keySymbol put: OrderedCollection new;
				yourself )