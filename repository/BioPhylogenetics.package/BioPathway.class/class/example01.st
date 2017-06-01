examples
example01

	^ BioPathway newUndirected
		list: (Array 
			with: (BioRelation node: 'a' edge: 1 node: 'b')
			with: (BioRelation node: 'a' edge: 5 node: 'c')
			with: (BioRelation node: 'b' edge: 3 node: 'c')
			);
		yourself