as yet unclassified
update

	min := Float infinity.
	1 to: self size do: [ :idx |
		(self at: idx ) < min 
			ifTrue: [ min := (self at: idx). found := idx ]].