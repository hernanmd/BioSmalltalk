"
I represent a biological pathway: a structured collection of biochemical reactions, interactions, species and compartments that together describe a metabolic, signaling, regulatory or disease-related process.\\I generalize concepts from Biopython Bio.Pathway (reactions, systems, networks), BioPAX (provenance, complexes, regulatory interactions), libSBML (compartments, kinetic laws, parameters), Pathway Tools (hierarchical pathways, enzyme links), KEGG (pathway IDs, omics mapping), MetaCyc (super-pathways, EC links) and Reactome (evidence, cross-references).\\Key features:\- Reactions with stoichiometry, catalysts, enzymes, reversibility, kinetics, gene associations\- Species (metabolites, genes, proteins, RNAs, complexes) with compartments and ontology\- Interactions (directed edges: catalysis, inhibition, activation, transport, regulatory)\- Compartments (cellular locations with hierarchy)\- Ontology annotations (SBO, GO, ChEBI, KEGG, Evidence codes)\- Hierarchical organization (super-pathways, sub-pathways)\- Stoichiometry matrix and graph-theoretic analysis (choke points, dead ends, paths, connected components)\- Omics data mapping\- Cross-references to external databases (MIRIAM-compliant)\- Metadata and provenance (description, version, organism, citations)\- Extension points for SBML/KGML/BioPAX import/export, FBA, dynamic simulation, enrichment analysis and visualization
"
Class {
	#name : 'BioPathway',
	#superclass : 'Object',
	#instVars : [
		'id',
		'name',
		'organism',
		'reactions',
		'compartments',
		'superPathway',
		'subPathways',
		'ontologyTerms',
		'crossReferences',
		'metadata',
		'network'
	],
	#category : 'BioPathway',
	#package : 'BioPathway'
}

{ #category : 'examples' }
BioPathway class >> example01 [
	"BioPathway example01 inspect"

	| pathway glucose g6p f6p f16bp dhap g3p bpg pep pyruvate atp adp nad nadh r |
	glucose := BioPathwaySpecies metabolite: 'glucose'.
	glucose formula: 'C6H12O6'.
	g6p := BioPathwaySpecies metabolite: 'G6P'.
	f6p := BioPathwaySpecies metabolite: 'F6P'.
	f16bp := BioPathwaySpecies metabolite: 'F1,6BP'.
	dhap := BioPathwaySpecies metabolite: 'DHAP'.
	g3p := BioPathwaySpecies metabolite: 'G3P'.
	bpg := BioPathwaySpecies metabolite: '1,3-BPG'.
	pep := BioPathwaySpecies metabolite: 'PEP'.
	pyruvate := BioPathwaySpecies metabolite: 'pyruvate'.
	pyruvate formula: 'C3H4O3'.
	atp := BioPathwaySpecies metabolite: 'ATP'.
	adp := BioPathwaySpecies metabolite: 'ADP'.
	nad := BioPathwaySpecies metabolite: 'NAD+'.
	nadh := BioPathwaySpecies metabolite: 'NADH'.
	pathway := BioPathway
		           id: 'hsa00010'
		           name: 'Glycolysis / Gluconeogenesis'
		           organism: 'Homo sapiens'.
	r := BioReaction id: 'R_HEX1' name: 'Hexokinase'.
	r addReactant: glucose stoichiometry: 1.
	r addReactant: atp stoichiometry: 1.
	r addProduct: g6p stoichiometry: 1.
	r addProduct: adp stoichiometry: 1.
	pathway addReaction: r.
	r := BioReaction id: 'R_PGI' name: 'Phosphoglucose isomerase'.
	r addReactant: g6p stoichiometry: 1.
	r addProduct: f6p stoichiometry: 1.
	pathway addReaction: r.
	r := BioReaction id: 'R_PFK1' name: 'Phosphofructokinase-1'.
	r addReactant: f6p stoichiometry: 1.
	r addReactant: atp stoichiometry: 1.
	r addProduct: f16bp stoichiometry: 1.
	r addProduct: adp stoichiometry: 1.
	pathway addReaction: r.
	r := BioReaction id: 'R_ALDO' name: 'Aldolase'.
	r addReactant: f16bp stoichiometry: 1.
	r addProduct: dhap stoichiometry: 1.
	r addProduct: g3p stoichiometry: 1.
	pathway addReaction: r.
	r := BioReaction id: 'R_TPI' name: 'Triose phosphate isomerase'.
	r addReactant: dhap stoichiometry: 1.
	r addProduct: g3p stoichiometry: 1.
	r reversible: true.
	pathway addReaction: r.
	r := BioReaction id: 'R_GAPDH_PGK' name: 'GAPDH + PGK'.
	r addReactant: g3p stoichiometry: 2.
	r addReactant: nad stoichiometry: 2.
	r addReactant: adp stoichiometry: 2.
	r addProduct: bpg stoichiometry: 2.
	r addProduct: nadh stoichiometry: 2.
	r addProduct: atp stoichiometry: 2.
	pathway addReaction: r.
	r := BioReaction id: 'R_PYK' name: 'Pyruvate kinase'.
	r addReactant: pep stoichiometry: 1.
	r addReactant: adp stoichiometry: 1.
	r addProduct: pyruvate stoichiometry: 1.
	r addProduct: atp stoichiometry: 1.
	pathway addReaction: r.
	pathway description: 'The classic ten-step pathway converting glucose to pyruvate'.
	pathway crossRefAt: 'KEGG' put: 'hsa00010'.
	pathway crossRefAt: 'MetaCyc' put: 'GLYCOLYSIS'.
	^ pathway
]

{ #category : 'examples' }
BioPathway class >> example02 [
	"BioPathway example02 inspect"

	| cycle r acetylCoA oxaloacetate citrate isocitrate akG succinylCoA succinate fumarate malate coA_SH nad nadh |
	acetylCoA := BioPathwaySpecies metabolite: 'acetyl-CoA'.
	oxaloacetate := BioPathwaySpecies metabolite: 'oxaloacetate'.
	citrate := BioPathwaySpecies metabolite: 'citrate'.
	isocitrate := BioPathwaySpecies metabolite: 'isocitrate'.
	akG := BioPathwaySpecies metabolite: 'alpha-ketoglutarate'.
	succinylCoA := BioPathwaySpecies metabolite: 'succinyl-CoA'.
	succinate := BioPathwaySpecies metabolite: 'succinate'.
	fumarate := BioPathwaySpecies metabolite: 'fumarate'.
	malate := BioPathwaySpecies metabolite: 'malate'.
	coA_SH := BioPathwaySpecies metabolite: 'CoA-SH'.
	nad := BioPathwaySpecies metabolite: 'NAD+'.
	nadh := BioPathwaySpecies metabolite: 'NADH'.
	cycle := BioPathway
		         id: 'hsa00020'
		         name: 'TCA Cycle'
		         organism: 'Homo sapiens'.
	cycle addCompartment:
		(BioCompartment id: 'mito' name: 'mitochondrial matrix').
	r := BioReaction id: 'R_CS' name: 'Citrate synthase'.
	r addReactant: oxaloacetate stoichiometry: 1.
	r addReactant: acetylCoA stoichiometry: 1.
	r addProduct: citrate stoichiometry: 1.
	r addProduct: coA_SH stoichiometry: 1.
	cycle addReaction: r.
	r := BioReaction id: 'R_ACO' name: 'Aconitase'.
	r addReactant: citrate stoichiometry: 1.
	r addProduct: isocitrate stoichiometry: 1.
	r reversible: true.
	cycle addReaction: r.
	r := BioReaction id: 'R_IDH3' name: 'Isocitrate dehydrogenase'.
	r addReactant: isocitrate stoichiometry: 1.
	r addReactant: nad stoichiometry: 1.
	r addProduct: akG stoichiometry: 1.
	r addProduct: nadh stoichiometry: 1.
	cycle addReaction: r.
	r := BioReaction id: 'R_OGDH' name: 'alpha-KGDH'.
	r addReactant: akG stoichiometry: 1.
	r addReactant: nad stoichiometry: 1.
	r addProduct: succinylCoA stoichiometry: 1.
	r addProduct: nadh stoichiometry: 1.
	r addProduct: coA_SH stoichiometry: 1.
	cycle addReaction: r.
	r := BioReaction id: 'R_SCS' name: 'Succinyl-CoA synthetase'.
	r addReactant: succinylCoA stoichiometry: 1.
	r addProduct: succinate stoichiometry: 1.
	cycle addReaction: r.
	r := BioReaction id: 'R_SDH' name: 'Succinate dehydrogenase'.
	r addReactant: succinate stoichiometry: 1.
	r addProduct: fumarate stoichiometry: 1.
	cycle addReaction: r.
	r := BioReaction id: 'R_FH' name: 'Fumarase'.
	r addReactant: fumarate stoichiometry: 1.
	r addProduct: malate stoichiometry: 1.
	cycle addReaction: r.
	r := BioReaction id: 'R_MDH' name: 'Malate dehydrogenase'.
	r addReactant: malate stoichiometry: 1.
	r addReactant: nad stoichiometry: 1.
	r addProduct: oxaloacetate stoichiometry: 1.
	r addProduct: nadh stoichiometry: 1.
	cycle addReaction: r.
	^ cycle
]

{ #category : 'examples' }
BioPathway class >> example03 [
	"BioPathway example03 inspect"

	| pathway net r lacI lacZ lacY crp |
	lacI := BioPathwaySpecies gene: 'lacI'.
	lacZ := BioPathwaySpecies gene: 'lacZ'.
	lacY := BioPathwaySpecies gene: 'lacY'.
	crp := BioPathwaySpecies protein: 'CRP'.
	lacI addOntologyTerm: (BioOntologyTerm go: 'GO:0003700').
	crp addOntologyTerm: (BioOntologyTerm go: 'GO:0003700').
	pathway := BioPathway
		           id: 'reg-lac'
		           name: 'Lac Operon Regulation'
		           organism: 'E. coli'.
	r := BioReaction id: 'R_repress' name: 'lacI repression'.
	r addReactant: lacI stoichiometry: 1.
	r addProduct: (BioPathwaySpecies gene: 'lacO') stoichiometry: 1.
	pathway addReaction: r.
	r := BioReaction id: 'R_activate' name: 'CRP activation'.
	r addReactant: crp stoichiometry: 1.
	r addProduct: lacZ stoichiometry: 1.
	pathway addReaction: r.
	net := BioNetwork new.
	net addEdge: (BioInteraction source: lacI target: lacZ type: #inhibition).
	net addEdge: (BioInteraction source: lacI target: lacY type: #inhibition).
	net addEdge: (BioInteraction source: crp target: lacZ type: #activation).
	net addEdge: (BioInteraction source: crp target: lacY type: #activation).
	pathway network: net.
	^ pathway
]

{ #category : 'examples' }
BioPathway class >> example04 [
	"BioPathway example04 inspect"
	| metabolism energy glycolysis tca cytosol mitochondria r |
	cytosol := BioCompartment id: 'c' name: 'cytosol'.
	mitochondria := BioCompartment id: 'm' name: 'mitochondrial matrix'.
	glycolysis := BioPathway id: 'hsa00010' name: 'Glycolysis' organism: 'Homo sapiens'.
	glycolysis addCompartment: cytosol.
	r := BioReaction id: 'R_HEX' name: 'Hexokinase'.
	r addReactant: (BioPathwaySpecies metabolite: 'glucose') stoichiometry: 1.
	r addProduct: (BioPathwaySpecies metabolite: 'G6P') stoichiometry: 1.
	glycolysis addReaction: r.
	r := BioReaction id: 'R_PK' name: 'Pyruvate kinase'.
	r addReactant: (BioPathwaySpecies metabolite: 'PEP') stoichiometry: 1.
	r addProduct: (BioPathwaySpecies metabolite: 'pyruvate') stoichiometry: 1.
	glycolysis addReaction: r.
	tca := BioPathway id: 'hsa00020' name: 'TCA Cycle' organism: 'Homo sapiens'.
	tca addCompartment: mitochondria.
	r := BioReaction id: 'R_CS' name: 'Citrate synthase'.
	r addReactant: (BioPathwaySpecies metabolite: 'acetyl-CoA') stoichiometry: 1.
	r addReactant: (BioPathwaySpecies metabolite: 'oxaloacetate') stoichiometry: 1.
	r addProduct: (BioPathwaySpecies metabolite: 'citrate') stoichiometry: 1.
	tca addReaction: r.
	energy := BioPathway id: 'hsa00190' name: 'Energy Metabolism' organism: 'Homo sapiens'.
	energy addSubPathway: glycolysis.
	energy addSubPathway: tca.
	metabolism := BioPathway id: 'hsa01100' name: 'Carbohydrate Metabolism' organism: 'Homo sapiens'.
	metabolism addSubPathway: energy.
	metabolism annotateWithOntology: (BioOntologyTerm go: 'GO:0005975').
	^ metabolism
]

{ #category : 'examples' }
BioPathway class >> example05 [
	"BioPathway example05 inspect"
	| pathway a b c data result r |
	a := BioPathwaySpecies metabolite: 'A'.
	b := BioPathwaySpecies metabolite: 'B'.
	c := BioPathwaySpecies metabolite: 'C'.
	pathway := BioPathway id: 'demo-omics' name: 'Demo Pathway' organism: 'Test'.
	r := BioReaction id: 'R1' name: 'A-to-B'.
	r addReactant: a stoichiometry: 1.
	r addProduct: b stoichiometry: 1.
	pathway addReaction: r.
	r := BioReaction id: 'R2' name: 'B-to-C'.
	r addReactant: b stoichiometry: 1.
	r addProduct: c stoichiometry: 1.
	pathway addReaction: r.
	data := Dictionary new.
	data at: 'A' put: 2.5.
	data at: 'B' put: 0.3.
	data at: 'C' put: 1.8.
	data at: 'X' put: 99.0.
	result := pathway mapOmicsData: data.
	^ { pathway . result }
]

{ #category : 'examples' }
BioPathway class >> example06 [
	"BioPathway example06 inspect"
	| pathway glc g6p f6p f16bp g3p pyr atp adp r |
	glc := BioPathwaySpecies metabolite: 'glucose'.
	g6p := BioPathwaySpecies metabolite: 'G6P'.
	f6p := BioPathwaySpecies metabolite: 'F6P'.
	f16bp := BioPathwaySpecies metabolite: 'F1,6BP'.
	g3p := BioPathwaySpecies metabolite: 'G3P'.
	pyr := BioPathwaySpecies metabolite: 'pyruvate'.
	atp := BioPathwaySpecies metabolite: 'ATP'.
	adp := BioPathwaySpecies metabolite: 'ADP'.
	pathway := BioPathway id: 'mini-glycolysis' name: 'Mini Glycolysis' organism: 'Homo sapiens'.
	r := BioReaction id: 'HEX' name: 'Hexokinase'.
	r addReactant: glc stoichiometry: 1.
	r addReactant: atp stoichiometry: 1.
	r addProduct: g6p stoichiometry: 1.
	r addProduct: adp stoichiometry: 1.
	pathway addReaction: r.
	r := BioReaction id: 'PGI' name: 'Phosphoglucose isomerase'.
	r addReactant: g6p stoichiometry: 1.
	r addProduct: f6p stoichiometry: 1.
	pathway addReaction: r.
	r := BioReaction id: 'PFK' name: 'PFK-1'.
	r addReactant: f6p stoichiometry: 1.
	r addReactant: atp stoichiometry: 1.
	r addProduct: f16bp stoichiometry: 1.
	r addProduct: adp stoichiometry: 1.
	pathway addReaction: r.
	r := BioReaction id: 'ALDO' name: 'Aldolase'.
	r addReactant: f16bp stoichiometry: 1.
	r addProduct: g3p stoichiometry: 2.
	pathway addReaction: r.
	r := BioReaction id: 'PK' name: 'Pyruvate kinase'.
	r addReactant: g3p stoichiometry: 1.
	r addReactant: atp stoichiometry: 1.
	r addProduct: pyr stoichiometry: 1.
	r addProduct: adp stoichiometry: 1.
	pathway addReaction: r.
	^ { 
		'stoichiometryMatrix' -> pathway stoichiometryMatrix.
		'chokePoints' -> pathway chokePoints.
		'deadEnds' -> pathway deadEndMetabolites.
		'connectedComponents' -> pathway connectedComponents.
		'species' -> pathway species.
		'validate' -> pathway validate
	}
]

{ #category : 'examples' }
BioPathway class >> example07 [
	"BioPathway example07 inspect"
	| pathway r1 r2 enzyme |
	pathway := BioPathway id: 'fba-glycolysis' name: 'FBA Glycolysis' organism: 'Homo sapiens'.
	r1 := BioReaction id: 'R_HEX1' name: 'Hexokinase'.
	r1 addReactant: (BioPathwaySpecies metabolite: 'glucose') stoichiometry: 1.
	r1 addReactant: (BioPathwaySpecies metabolite: 'ATP') stoichiometry: 1.
	r1 addProduct: (BioPathwaySpecies metabolite: 'G6P') stoichiometry: 1.
	r1 addProduct: (BioPathwaySpecies metabolite: 'ADP') stoichiometry: 1.
	r1 kineticLaw: 'Vmax * S / (Km + S)'.
	r1 parameterAt: 'Vmax' put: 100.0.
	r1 parameterAt: 'Km' put: 0.1.
	r1 geneAssociation: '(HK1 and HK2) or HK3'.
	r1 lowerBound: 0.0.
	r1 upperBound: 1000.0.
	enzyme := BioPathwaySpecies protein: 'hexokinase'.
	r1 addCatalyst: enzyme.
	r1 reversible: false.
	pathway addReaction: r1.
	r2 := BioReaction id: 'R_PFK1' name: 'PFK-1'.
	r2 addReactant: (BioPathwaySpecies metabolite: 'F6P') stoichiometry: 1.
	r2 addReactant: (BioPathwaySpecies metabolite: 'ATP') stoichiometry: 1.
	r2 addProduct: (BioPathwaySpecies metabolite: 'F1,6BP') stoichiometry: 1.
	r2 addProduct: (BioPathwaySpecies metabolite: 'ADP') stoichiometry: 1.
	r2 kineticLaw: 'Vmax * S / (Km + S)'.
	r2 parameterAt: 'Vmax' put: 50.0.
	r2 parameterAt: 'Km' put: 0.05.
	r2 geneAssociation: 'PFKM or PFKP'.
	r2 lowerBound: 0.0.
	r2 upperBound: 500.0.
	r2 reversible: false.
	pathway addReaction: r2.
	^ pathway
]

{ #category : 'instance creation' }
BioPathway class >> id: anId name: aName [
	^ self new id: anId; name: aName; yourself
]

{ #category : 'instance creation' }
BioPathway class >> id: anId name: aName organism: anOrganism [
	^ self new id: anId; name: aName; organism: anOrganism; yourself
]

{ #category : 'comparing' }
BioPathway >> = other [
	^ self class = other class and: [ id = other id ]
]

{ #category : 'adding' }
BioPathway >> addCompartment: aCompartment [
	self compartments add: aCompartment
]

{ #category : 'adding' }
BioPathway >> addCrossReference: anAssociation [
	self crossReferences add: anAssociation
]

{ #category : 'adding' }
BioPathway >> addOntologyTerm: aTerm [
	self ontologyTerms add: aTerm
]

{ #category : 'adding' }
BioPathway >> addReaction: aReaction [
	self reactions add: aReaction
]

{ #category : 'adding' }
BioPathway >> addSubPathway: aPathway [
	self subPathways add: aPathway.
	aPathway superPathway: self
]

{ #category : 'accessing' }
BioPathway >> annotateWithOntology: aTerm [
	self addOntologyTerm: aTerm
]

{ #category : 'converting' }
BioPathway >> asBioPAX [ ^ '<?xml version="1.0"?>' , String cr , '<rdf:RDF>' , String cr , '<!-- BioPAX export not yet implemented -->' , String cr , '</rdf:RDF>'
]

{ #category : 'converting' }
BioPathway >> asGraph [
	| net |
	net := BioNetwork new.
	self reactions do: [ :r |
		r reactants do: [ :assoc | net addNode: assoc key ].
		r products do: [ :assoc | net addNode: assoc key ].
		r catalysts do: [ :cat | net addNode: cat ].
		r reactants do: [ :rin |
			r products do: [ :pout |
				| edge |
				edge := BioInteraction source: rin key target: pout key type: #reaction.
				edge linkedReaction: r.
				net addEdge: edge ] ] ].
	^ net
]

{ #category : 'converting' }
BioPathway >> asKGML [ ^ '<?xml version="1.0"?>' , String cr , '<pathway>' , String cr , '<!-- KGML export not yet implemented -->' , String cr , '</pathway>'
]

{ #category : 'converting' }
BioPathway >> asSBML [ ^ '<?xml version="1.0"?>' , String cr , '<sbml>' , String cr , '<!-- SBML export not yet implemented -->' , String cr , '</sbml>'
]

{ #category : 'accessing' }
BioPathway >> chokePoints [
	"Species consumed by only one reaction (production choke points) or produced by only one reaction (consumption choke points)."
	| producers consumers |
	producers := Dictionary new.
	consumers := Dictionary new.
	self species do: [ :s | producers at: s put: 0. consumers at: s put: 0 ].
	self reactions do: [ :r |
		r products do: [ :assoc | producers at: assoc key put: (producers at: assoc key) + 1 ].
		r reactants do: [ :assoc | consumers at: assoc key put: (consumers at: assoc key) + 1 ] ].
	^ self species select: [ :s | (producers at: s) = 1 or: [ (consumers at: s) = 1 ] ]
]

{ #category : 'accessing' }
BioPathway >> compartments [
	^ compartments ifNil: [ compartments := OrderedCollection new ]
]

{ #category : 'accessing' }
BioPathway >> connectedComponents [
	| visited components |
	visited := Set new.
	components := OrderedCollection new.
	self network nodes do: [ :node |
		(visited includes: node) ifFalse: [
			| component queue |
			component := OrderedCollection new.
			queue := OrderedCollection with: node.
			[ queue isNotEmpty ] whileTrue: [
				| current |
				current := queue removeFirst.
				(visited includes: current) ifFalse: [
					visited add: current.
					component add: current.
					queue addAll: (self network neighborsOf: current) ] ].
			components add: component ] ].
	^ components
]

{ #category : 'accessing' }
BioPathway >> crossRefAt: aKey [
	^ self crossReferences at: aKey ifAbsent: [ nil ]
]

{ #category : 'accessing' }
BioPathway >> crossRefAt: aKey put: aValue [
	^ self crossReferences at: aKey put: aValue
]

{ #category : 'accessing' }
BioPathway >> crossReferences [
	^ crossReferences ifNil: [ crossReferences := Dictionary new ]
]

{ #category : 'accessing' }
BioPathway >> deadEndMetabolites [
	"Species that are only produced or only consumed, never both."

	| produced consumed |
	produced := Set new.
	consumed := Set new.
	self reactions do: [ :r |
			r products do: [ :assoc | produced add: assoc key ].
			r reactants do: [ :assoc | consumed add: assoc key ] ].
	^ (produced \ consumed) asOrderedCollection
	  , (consumed \ produced) asOrderedCollection
]

{ #category : 'accessing' }
BioPathway >> description [
	^ self metadataAt: #description
]

{ #category : 'accessing' }
BioPathway >> description: aString [
	self metadataAt: #description put: aString
]

{ #category : 'accessing' }
BioPathway >> downstreamSpecies: aSpecies [
	^ self network neighborsOf: aSpecies
]

{ #category : 'accessing' }
BioPathway >> findPathsFrom: aSource to: aTarget [

	| queue visited paths current |
	queue := OrderedCollection with: (OrderedCollection with: aSource).
	visited := Set with: aSource.
	paths := OrderedCollection new.
	[ queue isNotEmpty ] whileTrue: [
			current := queue removeFirst.
			current last = aTarget ifTrue: [ paths add: current copy ].
			(self network neighborsOf: current last) do: [ :neighbor |
					(visited includes: neighbor) ifFalse: [
							visited add: neighbor.
							queue add: (current copy
									 add: neighbor;
									 yourself) ] ] ].
	^ paths
]

{ #category : 'instance creation' }
BioPathway >> fromBioPAX: aString [
	"Stub: parse BioPAX string. Extension point."
	self notify: 'BioPAX parsing not yet implemented'
]

{ #category : 'instance creation' }
BioPathway >> fromKGML: aString [
	"Stub: parse KGML string. Extension point."
	self notify: 'KGML parsing not yet implemented'
]

{ #category : 'instance creation' }
BioPathway >> fromSBML: aString [
	"Stub: parse SBML string. Extension point."
	self notify: 'SBML parsing not yet implemented'
]

{ #category : 'comparing' }
BioPathway >> hash [
	^ id ifNil: [ super hash ]
]

{ #category : 'accessing' }
BioPathway >> id [
	^ id
]

{ #category : 'accessing' }
BioPathway >> id: anObject [
	id := anObject
]

{ #category : 'accessing' }
BioPathway >> mapOmicsData: aDictionary [
	"Map expression/metabolomics data onto species. aDictionary maps species id -> numeric value.
	Returns a dictionary of species -> mapped value."
	| result |
	result := Dictionary new.
	aDictionary keysAndValuesDo: [ :speciesId :value |
		| sp |
		sp := self speciesById: speciesId.
		sp ifNotNil: [ result at: sp put: value ] ].
	^ result
]

{ #category : 'accessing' }
BioPathway >> metadata [
	^ metadata ifNil: [ metadata := Dictionary new ]
]

{ #category : 'accessing' }
BioPathway >> metadataAt: aKey [
	^ self metadata at: aKey ifAbsent: [ nil ]
]

{ #category : 'accessing' }
BioPathway >> metadataAt: aKey put: aValue [
	^ self metadata at: aKey put: aValue
]

{ #category : 'accessing' }
BioPathway >> name [
	^ name
]

{ #category : 'accessing' }
BioPathway >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
BioPathway >> network [
	^ network ifNil: [ network := self asGraph ]
]

{ #category : 'accessing' }
BioPathway >> network: aNetwork [

	^ network := aNetwork
]

{ #category : 'accessing' }
BioPathway >> ontologyTerms [
	^ ontologyTerms ifNil: [ ontologyTerms := OrderedCollection new ]
]

{ #category : 'accessing' }
BioPathway >> organism [
	^ organism
]

{ #category : 'accessing' }
BioPathway >> organism: anObject [
	organism := anObject
]

{ #category : 'printing' }
BioPathway >> printOn: aStream [ super printOn: aStream. aStream nextPutAll: ' ('. name ifNotNil: [ aStream nextPutAll: name ]. aStream nextPutAll: ')'
]

{ #category : 'accessing' }
BioPathway >> reactionById: anId [
	^ self reactions detect: [ :r | r id = anId ] ifNone: [ nil ]
]

{ #category : 'accessing' }
BioPathway >> reactions [
	^ reactions ifNil: [ reactions := OrderedCollection new ]
]

{ #category : 'accessing' }
BioPathway >> reactions: aCollection [
	reactions := aCollection
]

{ #category : 'removing' }
BioPathway >> removeReaction: aReaction [ self reactions remove: aReaction ifAbsent: []
]

{ #category : 'private' }
BioPathway >> species [
	| all |
	all := Set new.
	self reactions do: [ :r |
		r reactants do: [ :assoc | all add: assoc key ].
		r products do: [ :assoc | all add: assoc key ] ].
	^ all asOrderedCollection
]

{ #category : 'accessing' }
BioPathway >> speciesById: anId [

	^ self species detect: [ :s | s id = anId ] ifNone: [ nil ]
]

{ #category : 'accessing' }
BioPathway >> stoichiometryMatrix [
	"Return a matrix as an array of rows. Each row = one reaction, each column = one species."
	| speciesList mat i |
	speciesList := self species asArray.
	mat := Array new: self reactions size.
	1 to: mat size do: [ :j | mat at: j put: (Array new: speciesList size withAll: 0) ].
	i := 0.
	self reactions do: [ :r |
		i := i + 1.
		r reactants do: [ :assoc |
			| idx |
			idx := speciesList indexOf: assoc key ifAbsent: [ 0 ].
			idx > 0 ifTrue: [ (mat at: i) at: idx put: (assoc value * -1) ] ].
		r products do: [ :assoc |
			| idx |
			idx := speciesList indexOf: assoc key ifAbsent: [ 0 ].
			idx > 0 ifTrue: [ (mat at: i) at: idx put: assoc value ] ] ].
	^ mat
]

{ #category : 'accessing' }
BioPathway >> subPathways [
	^ subPathways ifNil: [ subPathways := OrderedCollection new ]
]

{ #category : 'accessing' }
BioPathway >> superPathway [
	^ superPathway
]

{ #category : 'accessing' }
BioPathway >> superPathway: aPathway [
	superPathway := aPathway
]

{ #category : 'accessing' }
BioPathway >> upstreamSpecies: aSpecies [
	^ self network predecessorsOf: aSpecies
]

{ #category : 'accessing' }
BioPathway >> validate [
	"Run consistency checks. Returns a collection of warning strings."
	| warnings |
	warnings := OrderedCollection new.
	self reactions do: [ :r |
		r reactants ifEmpty: [ warnings add: 'Reaction'  , r id asString , ' has no reactants' ].
		r products ifEmpty: [ warnings add: 'Reaction'  , r id asString , ' has no products' ] ].
	^ warnings
]

{ #category : 'versions' }
BioPathway >> version [
	^ self metadataAt: #version
]

{ #category : 'versions' }
BioPathway >> version: aString [
	self metadataAt: #version put: aString
]
