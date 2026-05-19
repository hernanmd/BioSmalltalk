Class {
	#name : 'BioPathwayTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioPathway-Tests',
	#package : 'BioPathway-Tests'
}

{ #category : 'tests' }
BioPathwayTest >> testBioCompartment [

	| c |
	c := BioCompartment id: 'c' name: 'cytosol'.
	self assert: c id equals: 'c'.
	self assert: c name equals: 'cytosol'
]

{ #category : 'tests' }
BioPathwayTest >> testBioComplex [

	| cx s1 s2 |
	s1 := BioSpecies protein: 'subA'.
	s2 := BioSpecies protein: 'subB'.
	cx := BioComplex new
		      name: 'ComplexAB';
		      type: #complex.
	self assert: cx isComplex.
	cx
		addSubunit: s1 stoichiometry: 2;
		addSubunit: s2 stoichiometry: 1.
	self assert: cx subunits size equals: 2
]

{ #category : 'tests' }
BioPathwayTest >> testBioInteraction [

	| src tgt i |
	src := BioSpecies gene: 'TF'.
	tgt := BioSpecies gene: 'target'.
	i := BioInteraction source: src target: tgt type: #activation.
	self assert: i source equals: src.
	self assert: i target equals: tgt.
	self assert: i isActivation.
	self deny: i isInhibition
]

{ #category : 'tests' }
BioPathwayTest >> testBioPathwayAddReactions [

	| p r glc pyr |
	p := BioPathway id: 'p1' name: 'test'.
	glc := BioSpecies metabolite: 'glucose'.
	pyr := BioSpecies metabolite: 'pyruvate'.
	r := BioReaction id: 'R1' name: 'step1'.
	r
		addReactant: glc;
		addProduct: pyr.
	p addReaction: r.
	self assert: p reactions size equals: 1.
	p removeReaction: r.
	self assert: p reactions isEmpty
]

{ #category : 'tests' }
BioPathwayTest >> testBioPathwayCompartment [

	| p c |
	p := BioPathway id: 'p1' name: 'test'.
	c := BioCompartment id: 'c' name: 'cytosol'.
	p addCompartment: c.
	self assert: p compartments size equals: 1
]

{ #category : 'tests' }
BioPathwayTest >> testBioPathwayCreation [

	| p |
	p := BioPathway
		     id: 'hsa00010'
		     name: 'Glycolysis / Gluconeogenesis'
		     organism: 'Homo sapiens'.
	self assert: p id equals: 'hsa00010'.
	self assert: p name equals: 'Glycolysis / Gluconeogenesis'.
	self assert: p organism equals: 'Homo sapiens'
]

{ #category : 'tests' }
BioPathwayTest >> testBioPathwayCrossReferences [

	| p |
	p := BioPathway id: 'p1' name: 'test'.
	p crossRefAt: 'KEGG' put: 'hsa00010'.
	p crossRefAt: 'MetaCyc' put: 'GLYCOLYSIS'.
	self assert: (p crossRefAt: 'KEGG') equals: 'hsa00010'.
	self assert: (p crossRefAt: 'MetaCyc') equals: 'GLYCOLYSIS'
]

{ #category : 'tests' }
BioPathwayTest >> testBioPathwayEquality [

	| p1 p2 |
	p1 := BioPathway id: 'hsa00010' name: 'Glycolysis'.
	p2 := BioPathway id: 'hsa00010' name: 'Other name'.
	self assert: p1 equals: p2.
	p2 id: 'different'.
	self deny: p1 equals: p2
]

{ #category : 'tests' }
BioPathwayTest >> testBioPathwayHierarchy [

	| superP subP |
	superP := BioPathway id: 'meta' name: 'Metabolism'.
	subP := BioPathway id: 'gly' name: 'Glycolysis'.
	superP addSubPathway: subP.
	self assert: superP subPathways size equals: 1.
	self assert: subP superPathway equals: superP
]

{ #category : 'tests' }
BioPathwayTest >> testBioPathwayMetadata [

	| p |
	p := BioPathway id: 'p1' name: 'test'.
	p description: 'A test pathway'.
	p version: '1.0'.
	self assert: p description equals: 'A test pathway'.
	self assert: p version equals: '1.0'
]

{ #category : 'tests' }
BioPathwayTest >> testBioPathwayPrintOn [

	| p str |
	p := BioPathway id: 'p1' name: 'Glycolysis'.
	str := String streamContents: [ :s | p printOn: s ].
	self assert: (str includesSubstring: 'Glycolysis')
]

{ #category : 'tests' }
BioPathwayTest >> testBioReactionAllSpecies [

	| r glc pyr atp |
	glc := BioSpecies metabolite: 'glc'.
	pyr := BioSpecies metabolite: 'pyr'.
	atp := BioSpecies metabolite: 'ATP'.
	r := BioReaction id: 'R1' name: 'step1'.
	r
		addReactant: glc;
		addReactant: atp;
		addProduct: pyr.
	self assert: r allSpecies size equals: 3
]

{ #category : 'tests' }
BioPathwayTest >> testBioReactionBounds [

	| r |
	r := BioReaction id: 'R1' name: 'test'.
	self assert: r lowerBound equals: 0.0.
	self assert: r upperBound > 1000.
	r lowerBound: -10.0.
	r upperBound: 100.0.
	self assert: r lowerBound equals: -10.0.
	self assert: r upperBound equals: 100.0
]

{ #category : 'tests' }
BioPathwayTest >> testBioReactionCatalyst [

	| r enz |
	enz := BioSpecies protein: 'hexokinase'.
	r := BioReaction id: 'R1' name: 'HK'.
	r addCatalyst: enz.
	self assert: r catalysts size equals: 1s
]

{ #category : 'tests' }
BioPathwayTest >> testBioReactionCreation [

	| r glc pyr |
	glc := BioSpecies metabolite: 'glucose'.
	pyr := BioSpecies metabolite: 'pyruvate'.
	r := BioReaction id: 'R1' name: 'glycolysis_step'.
	r addReactant: glc stoichiometry: 1.
	r addProduct: pyr stoichiometry: 2.
	self assert: r id equals: 'R1'.
	self assert: r reactants size equals: 1.
	self assert: r products size equals: 1.
	self assert: r products first value equals: 2.
	self deny: r isReversible.
	r reversible: true.
	self assert: r isReversible
]

{ #category : 'tests' }
BioPathwayTest >> testBioReactionGeneAssociation [

	| r |
	r := BioReaction id: 'R1' name: 'test'.
	r geneAssociation: '(geneA and geneB) or geneC'.
	self assert: r geneAssociation equals: '(geneA and geneB) or geneC'
]

{ #category : 'tests' }
BioPathwayTest >> testBioReactionKinetics [

	| r |
	r := BioReaction id: 'R1' name: 'test'.
	r kineticLaw: 'Vmax * S / (Km + S)'.
	r parameterAt: 'Vmax' put: 10.0.
	r parameterAt: 'Km' put: 0.5.
	self assert: r kineticLaw equals: 'Vmax * S / (Km + S)'.
	self assert: (r parameterAt: 'Vmax') equals: 10.0
]

{ #category : 'tests' }
BioPathwayTest >> testBioSpeciesCompartment [

	| s c |
	c := BioCompartment id: 'c' name: 'cytosol'.
	s := BioSpecies metabolite: 'glc'.
	s compartment: c.
	self assert: s compartment equals: c
]

{ #category : 'tests' }
BioPathwayTest >> testBioSpeciesConvenience [

	| s |
	s := BioSpecies metabolite: 'glucose'.
	self assert: s isMetabolite.
	s := BioSpecies gene: 'lacZ'.
	self assert: s isGene.
	s := BioSpecies protein: 'LacZ'.
	self assert: s isProtein
]

{ #category : 'tests' }
BioPathwayTest >> testBioSpeciesCreation [

	| s |
	s := BioSpecies id: 'glc' name: 'glucose' type: #metabolite.
	self assert: s id equals: 'glc'.
	self assert: s name equals: 'glucose'.
	self assert: s isMetabolite.
	self deny: s isGene.
	self deny: s isComplex
]

{ #category : 'tests' }
BioPathwayTest >> testBioSpeciesFormulaAndCharge [

	| s |
	s := BioSpecies metabolite: 'H2O'.
	s
		formula: 'H2O';
		charge: 0.
	self assert: s formula equals: 'H2O'.
	self assert: s charge equals: 0
]

{ #category : 'tests' }
BioPathwayTest >> testExample01Glycolysis [
	| p |
	p := BioPathway example01.
	self assert: p reactions size equals: 7.
	self assert: p species size equals: 13.
	self assert: p name equals: 'Glycolysis / Gluconeogenesis'.
	self assert: p organism equals: 'Homo sapiens'.
	self assert: (p crossRefAt: 'KEGG') equals: 'hsa00010'
]

{ #category : 'tests' }
BioPathwayTest >> testExample02TCACycle [
	| p |
	p := BioPathway example02.
	self assert: p reactions size equals: 8.
	self assert: p compartments size equals: 1.
	self assert: p compartments first name equals: 'mitochondrial matrix'
]

{ #category : 'tests' }
BioPathwayTest >> testExample03LacOperon [
	| p |
	p := BioPathway example03.
	self assert: p reactions size equals: 2.
	self assert: p network notNil.
	self assert: p network edgeCount equals: 4
]

{ #category : 'tests' }
BioPathwayTest >> testExample04Hierarchy [
	| p |
	p := BioPathway example04.
	self assert: p name equals: 'Carbohydrate Metabolism'.
	self assert: p subPathways size equals: 1.
	self assert: p subPathways first name equals: 'Energy Metabolism'.
	self assert: p subPathways first subPathways size equals: 2
]

{ #category : 'tests' }
BioPathwayTest >> testExample06Analysis [
	| result species |
	result := BioPathway example06.
	species := (result detect: [ :a | a key = 'species' ]) value.
	self assert: species size equals: 8.
	self assert: ((result detect: [ :a | a key = 'connectedComponents' ]) value) size >= 1
]

{ #category : 'tests' }
BioPathwayTest >> testExample07Kinetics [
	| p r |
	p := BioPathway example07.
	self assert: p reactions size equals: 2.
	r := p reactions first.
	self assert: r kineticLaw notNil.
	self assert: (r parameterAt: 'Vmax') equals: 100.0.
	self deny: r isReversible.
	self assert: r lowerBound equals: 0.0
]
