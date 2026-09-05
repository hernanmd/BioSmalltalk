Class {
	#name : 'BioPhyloXMLParserTest',
	#superclass : 'TestCase',
	#category : 'BioPhylogenetics-Tests-Tests',
	#package : 'BioPhylogenetics-Tests',
	#tag : 'Tests'
}

{ #category : 'examples' }
BioPhyloXMLParserTest >> samplePhyloXML [
	^ '<phyloxml xmlns="http://www.phyloxml.org"><phylogeny rooted="true"><name>t1</name><clade branch_length="0.0"><clade branch_length="0.1"><name>A</name><confidence type="bootstrap">95</confidence></clade><clade branch_length="0.2"><clade branch_length="0.3"><name>B</name></clade><clade branch_length="0.4"><name>C</name></clade></clade></clade></phylogeny></phyloxml>'
]

{ #category : 'tests' }
BioPhyloXMLParserTest >> testBranchLengthsAndConfidence [
	| t |
	t := (BioPhyloXMLParser parseString: self samplePhyloXML) first.
	self assert: (t cladeNamed: 'A') branchLength equals: 0.1.
	self assert: (t cladeNamed: 'A') confidence equals: 95.
	self assert: (t distanceBetween: 'A' and: 'B') closeTo: 0.6
]

{ #category : 'tests' }
BioPhyloXMLParserTest >> testInvalidRaises [
	self should: [ BioPhyloXMLParser parseString: '<notphyloxml/>' ] raise: Error
]

{ #category : 'tests' }
BioPhyloXMLParserTest >> testMultipleTrees [
	| xml trees |
	xml := '<phyloxml xmlns="http://www.phyloxml.org"><phylogeny><clade><name>A</name></clade></phylogeny><phylogeny><clade><name>B</name></clade></phylogeny></phyloxml>'.
	trees := BioPhyloXMLParser parseString: xml.
	self assert: trees size equals: 2.
	self assert: trees first countTerminals equals: 1.
	self assert: trees second countTerminals equals: 1
]

{ #category : 'tests' }
BioPhyloXMLParserTest >> testSimpleTree [
	| trees |
	trees := BioPhyloXMLParser parseString: self samplePhyloXML.
	self assert: trees size equals: 1.
	self assert: trees first countTerminals equals: 3.
	self assert: (trees first leaves collect: #name) asArray equals: #('A' 'B' 'C')
]

{ #category : 'tests' }
BioPhyloXMLParserTest >> testTaxonomyScientificName [
	| xml t |
	xml := '<phyloxml xmlns="http://www.phyloxml.org"><phylogeny><clade><clade><taxonomy><scientific_name>Homo sapiens</scientific_name></taxonomy></clade></clade></phylogeny></phyloxml>'.
	t := (BioPhyloXMLParser parseString: xml) first.
	self assert: (t leaves collect: #name) asArray equals: #('Homo sapiens')
]
