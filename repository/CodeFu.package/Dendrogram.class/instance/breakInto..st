break into clusters
breakInto: numberOfClusters

	| all candidates |
	all := self nodes reverseSort: #threshold.
	candidates := IdentitySet with: all first.
	all do: [ :each |
		candidates remove: each.
		candidates add: each left.
		candidates add: each right.
		candidates size >= numberOfClusters ifTrue: [ ^candidates asArray ]].