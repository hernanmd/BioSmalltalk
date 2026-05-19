Class {
	#name : 'BioOntologyTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioOntology-Tests',
	#package : 'BioOntology-Tests'
}

{ #category : 'as yet unclassified' }
BioOntologyTest class >> testFoo [ self assert: true
]

{ #category : 'as yet unclassified' }
BioOntologyTest class >> testWith: anArg [ self assert: anArg
]

{ #category : 'tests' }
BioOntologyTest >> testAddAndLookupTerm [
	| onto term |
	onto := BioOntology id: 'GO' name: 'Gene Ontology'.
	term := BioOntologyTerm id: 'GO:0008150' name: 'biological_process' ontology: 'GO'.
	onto addTerm: term.
	self assert: onto termCount equals: 1.
	self assert: (onto termById: 'GO:0008150') equals: term.
	self assert: (onto termById: 'GO:9999999') isNil


]

{ #category : 'tests' }
BioOntologyTest >> testAncestorsAndDescendants [
	| root mid leaf |
	root := BioOntologyTerm id: 'GO:0008150' name: 'biological_process' ontology: 'GO'.
	mid := BioOntologyTerm id: 'GO:0009987' name: 'cellular process' ontology: 'GO'.
	leaf := BioOntologyTerm id: 'GO:0006810' name: 'transport' ontology: 'GO'.
	mid isA: root.
	leaf isA: mid.
	self assert: (leaf allParents includes: root).
	self assert: (leaf allParents includes: mid).
	self assert: (root allChildren includes: leaf).
	self assert: (root allChildren includes: mid)


]

{ #category : 'tests' }
BioOntologyTest >> testAnnotation [
	| term species annotation |
	term := BioOntologyTerm id: 'GO:0008150' name: 'biological_process' ontology: 'GO'.
	species := BioSpecies metabolite: 'glucose'.
	annotation := BioAnnotation entity: species term: term qualifier: #enables.
	self assert: annotation entity equals: species.
	self assert: annotation term equals: term.
	self assert: annotation qualifier equals: #enables


]

{ #category : 'tests' }
BioOntologyTest >> testAnnotationViaOntology [
	| onto term species |
	onto := BioOntology id: 'GO' name: 'Gene Ontology'.
	term := BioOntologyTerm id: 'GO:0008150' name: 'biological_process' ontology: 'GO'.
	onto addTerm: term.
	species := BioSpecies metabolite: 'glucose'.
	onto annotate: species withTerm: term qualifier: #enables.
	self assert: species ontologyTerms size equals: 1


]

{ #category : 'tests' }
BioOntologyTest >> testAsGraph [
	| onto root child net |
	root := BioOntologyTerm id: 'GO:1' name: 'root' ontology: 'GO'.
	child := BioOntologyTerm id: 'GO:2' name: 'child' ontology: 'GO'.
	child isA: root.
	onto := BioOntology id: 'GO' name: 'GO'.
	onto addTerm: root. onto addTerm: child.
	net := onto asGraph.
	self assert: net size equals: 2.
	self assert: net edgeCount equals: 1


]

{ #category : 'tests' }
BioOntologyTest >> testCommonAncestors [
	| root cat1 cat2 onto |
	root := BioOntologyTerm id: 'GO:0008150' name: 'biological_process' ontology: 'GO'.
	cat1 := BioOntologyTerm id: 'GO:0009987' name: 'cellular process' ontology: 'GO'.
	cat2 := BioOntologyTerm id: 'GO:0006950' name: 'response to stress' ontology: 'GO'.
	cat1 isA: root.
	cat2 isA: root.
	onto := BioOntology id: 'GO' name: 'Gene Ontology'.
	onto addTerm: root. onto addTerm: cat1. onto addTerm: cat2.
	self assert: (onto commonAncestorsOf: cat1 and: cat2) notEmpty.
	self assert: ((onto commonAncestorsOf: cat1 and: cat2) includes: root)


]

{ #category : 'tests' }
BioOntologyTest >> testConvenienceFactories [
	| go chebi sbo |
	go := BioOntology fromGO.
	self assert: go id equals: 'GO'.
	chebi := BioOntology fromChEBI.
	self assert: chebi id equals: 'ChEBI'.
	sbo := BioOntology fromSBO.
	self assert: sbo id equals: 'SBO'

]

{ #category : 'tests' }
BioOntologyTest >> testCrossReferences [
	| term |
	term := BioOntologyTerm id: 'GO:0008150' name: 'biological_process' ontology: 'GO'.
	term addCrossReference: 'Wikipedia:Biological_process'.
	term addCrossReference: 'MetaCyc:BIOL-PROCESS'.
	self assert: term crossReferences size equals: 2


]

{ #category : 'tests' }
BioOntologyTest >> testExportToOBO [
	| onto term obo |
	onto := BioOntology id: 'GO' name: 'GO'.
	term := BioOntologyTerm id: 'GO:0008150' name: 'biological_process' ontology: 'GO'.
	term namespace: 'biological_process'.
	onto addTerm: term.
	obo := onto exportToOBO.
	self assert: (obo includesSubstring: '[Term]').
	self assert: (obo includesSubstring: 'id: GO:0008150').
	self assert: (obo includesSubstring: 'name: biological_process')


]

{ #category : 'tests' }
BioOntologyTest >> testNamespace [

	| onto bp mf cc |
	onto := BioOntology id: 'GO' name: 'Gene Ontology'.
	bp := BioOntologyTerm
		      id: 'GO:0008150'
		      name: 'biological_process'
		      ontology: 'GO'
		      namespace: 'biological_process'.
	mf := BioOntologyTerm
		      id: 'GO:0003674'
		      name: 'molecular_function'
		      ontology: 'GO'
		      namespace: 'molecular_function'.
	cc := BioOntologyTerm
		      id: 'GO:0005575'
		      name: 'cellular_component'
		      ontology: 'GO'
		      namespace: 'cellular_component'.
	onto addTerm: bp.
	onto addTerm: mf.
	onto addTerm: cc.
	self
		assert: (onto termsInNamespace: 'biological_process') size
		equals: 1.
	self
		assert: (onto termsInNamespace: 'molecular_function') size
		equals: 1
]

{ #category : 'tests' }
BioOntologyTest >> testOBOIsAParsing [
	| onto bp cell transport oboText |
	oboText := 'format-version: 1.2
ontology: go

[Term]
id: GO:0008150
name: biological_process
namespace: biological_process

[Term]
id: GO:0009987
name: cellular process
namespace: biological_process
is_a: GO:0008150 ! biological_process

[Term]
id: GO:0006810
name: transport
namespace: biological_process
is_a: GO:0009987 ! cellular process
'.
	onto := BioOntology loadFromOBO: oboText.
	self assert: onto termCount equals: 3.
	bp := onto termById: 'GO:0008150'.
	cell := onto termById: 'GO:0009987'.
	transport := onto termById: 'GO:0006810'.
	self assert: cell parents size equals: 1.
	self assert: cell parents first object equals: bp.
	self assert: bp children notEmpty.
	self assert: (transport allParents includes: bp)


]

{ #category : 'tests' }
BioOntologyTest >> testOBOKeywordRelationship [
	| onto term oboText |
	oboText := 'format-version: 1.2
ontology: go

[Term]
id: GO:0008150
name: biological_process
namespace: biological_process

[Term]
id: GO:0050789
name: regulation of biological process
namespace: biological_process
relationship: regulates GO:0008150
'.
	onto := BioOntology loadFromOBO: oboText.
	self assert: onto termCount equals: 2.
	term := onto termById: 'GO:0050789'.
	self assert: term parents size equals: 1.
	self assert: term parents first predicate equals: #regulates


]

{ #category : 'tests' }
BioOntologyTest >> testOBOObsoleteParsing [
	| onto term oboText |
	oboText := 'format-version: 1.2
ontology: go

[Term]
id: GO:9999999
name: obsolete term
is_obsolete: true
'.
	onto := BioOntology loadFromOBO: oboText.
	self assert: onto termCount equals: 1.
	term := onto termById: 'GO:9999999'.
	self assert: term isObsolete


]

{ #category : 'tests' }
BioOntologyTest >> testOBOParsing [
	| onto oboText |
	oboText := 'format-version: 1.2
ontology: go

[Term]
id: GO:0008150
name: biological_process
namespace: biological_process

[Term]
id: GO:0003674
name: molecular_function
namespace: molecular_function

[Term]
id: GO:0005575
name: cellular_component
namespace: cellular_component
'.
	onto := BioOntology loadFromOBO: oboText.
	self assert: onto termCount equals: 3.
	self assert: (onto termById: 'GO:0008150') name equals: 'biological_process'.
	self assert: (onto termById: 'GO:0003674') namespace equals: 'molecular_function'


]

{ #category : 'tests' }
BioOntologyTest >> testOBOSynonymParsing [
	| onto term oboText |
	oboText := 'format-version: 1.2
ontology: go

[Term]
id: GO:0008150
name: biological_process
namespace: biological_process
synonym: "biological process" EXACT []
synonym: "physiological process" RELATED []
'.
	onto := BioOntology loadFromOBO: oboText.
	term := onto termById: 'GO:0008150'.
	self assert: term exactSynonyms size equals: 1.
	self assert: term relatedSynonyms size equals: 1


]

{ #category : 'tests' }
BioOntologyTest >> testObsoleteTerms [
	| onto t1 t2 |
	onto := BioOntology id: 'GO' name: 'Gene Ontology'.
	t1 := BioOntologyTerm id: 'GO:1' name: 'active' ontology: 'GO'.
	t2 := BioOntologyTerm id: 'GO:2' name: 'obsolete' ontology: 'GO'.
	t2 isObsolete: true.
	onto addTerm: t1. onto addTerm: t2.
	self assert: onto activeTerms size equals: 1.
	self assert: onto obsoleteTerms size equals: 1


]

{ #category : 'tests' }
BioOntologyTest >> testOntologyCreation [
	| onto |
	onto := BioOntology id: 'GO' name: 'Gene Ontology'.
	self assert: onto id equals: 'GO'.
	self assert: onto name equals: 'Gene Ontology'.
	self assert: onto termCount equals: 0


]

{ #category : 'tests' }
BioOntologyTest >> testPathsToRoot [
	| root mid leaf |
	root := BioOntologyTerm id: 'GO:0008150' name: 'bp' ontology: 'GO'.
	mid := BioOntologyTerm id: 'GO:0009987' name: 'cell process' ontology: 'GO'.
	leaf := BioOntologyTerm id: 'GO:0006810' name: 'transport' ontology: 'GO'.
	mid isA: root.
	leaf isA: mid.
	self assert: leaf depthToRoot equals: 2.
	self assert: mid depthToRoot equals: 1.
	self assert: root depthToRoot equals: 0


]

{ #category : 'tests' }
BioOntologyTest >> testPathwayIntegration [
	| onto term pathway |
	onto := BioOntology id: 'GO' name: 'Gene Ontology'.
	term := BioOntologyTerm id: 'GO:0008150' name: 'biological_process' ontology: 'GO'.
	onto addTerm: term.
	pathway := BioPathway id: 'hsa00010' name: 'Glycolysis' organism: 'Homo sapiens'.
	onto annotate: pathway withTerm: term qualifier: #enables.
	self assert: pathway ontologyTerms size equals: 1


]

{ #category : 'tests' }
BioOntologyTest >> testRelationshipTypes [
	| rel |
	rel := BioOntologyRelationship subject: nil predicate: #is_a object: nil.
	self assert: rel isA.
	self deny: rel isPartOf.
	rel := BioOntologyRelationship subject: nil predicate: #part_of object: nil.
	self assert: rel isPartOf.
	rel := BioOntologyRelationship subject: nil predicate: #regulates object: nil.
	self assert: rel isRegulates


]

{ #category : 'tests' }
BioOntologyTest >> testSynonyms [
	| term |
	term := BioOntologyTerm id: 'GO:0008150' name: 'biological_process' ontology: 'GO'.
	term addSynonym: 'biological process' type: 'exact'.
	term addSynonym: 'physiological process' type: 'related'.
	self assert: term exactSynonyms size equals: 1.
	self assert: term relatedSynonyms size equals: 1


]

{ #category : 'tests' }
BioOntologyTest >> testTermRelationships [
	| parent child |
	parent := BioOntologyTerm id: 'GO:0008150' name: 'biological_process' ontology: 'GO'.
	child := BioOntologyTerm id: 'GO:0009987' name: 'cellular process' ontology: 'GO'.
	child isA: parent.
	self assert: child parents size equals: 1.
	self assert: parent children size equals: 1.
	self assert: child parents first predicate equals: #is_a.
	self assert: child parents first object equals: parent


]

{ #category : 'tests' }
BioOntologyTest >> testTermsMatching [
	| onto t1 t2 t3 |
	onto := BioOntology id: 'GO' name: 'Gene Ontology'.
	t1 := BioOntologyTerm id: 'GO:1' name: 'protein folding' ontology: 'GO'.
	t2 := BioOntologyTerm id: 'GO:2' name: 'protein transport' ontology: 'GO'.
	t3 := BioOntologyTerm id: 'GO:3' name: 'DNA binding' ontology: 'GO'.
	onto addTerm: t1. onto addTerm: t2. onto addTerm: t3.
	self assert: (onto termsMatching: 'protein') size equals: 2.
	self assert: (onto termsMatching: 'DNA') size equals: 1


]

{ #category : 'tests' }
BioOntologyTest >> testValidationConsistency [
	| onto |
	onto := BioOntology id: 'GO' name: 'GO'.
	self assert: onto validateConsistency isEmpty


]
