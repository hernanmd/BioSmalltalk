*BioPharo4
serviceBioMaterialize

	^ (SimpleServiceEntry 
		provider: self 
		label: 'BioSmalltalk: Materialize' 
		selector: #bioMaterialize 
		description: 'Materialize and Explore this file' )