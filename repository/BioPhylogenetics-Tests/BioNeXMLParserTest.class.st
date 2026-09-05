Class {
	#name : 'BioNeXMLParserTest',
	#superclass : 'TestCase',
	#category : 'BioPhylogenetics-Tests-Tests',
	#package : 'BioPhylogenetics-Tests',
	#tag : 'Tests'
}

{ #category : 'examples' }
BioNeXMLParserTest >> sampleNeXML [
	^ '<nex:nexml xmlns:nex="http://www.nexml.org/2009" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="0.9"><otus id="otus1"><otu id="otuA" label="A"/><otu id="otuB" label="B"/><otu id="otuC" label="C"/></otus><trees id="trees1" otus="otus1"><tree id="t1" label="t1" xsi:type="nex:FloatTree"><node id="n0" root="true"/><node id="n1" otu="otuA"/><node id="n2"/><node id="n3" otu="otuB"/><node id="n4" otu="otuC"/><edge source="n0" target="n2" length="0.3"/><edge source="n0" target="n1" length="0.1"/><edge source="n2" target="n3" length="0.2"/><edge source="n2" target="n4" length="0.4"/></tree></trees></nex:nexml>'
]

{ #category : 'tests' }
BioNeXMLParserTest >> testBranchLengthsAndDistance [
	| t |
	t := (BioNeXMLParser parseString: self sampleNeXML) first.
	self assert: (t cladeNamed: 'A') branchLength equals: 0.1.
	self assert: (t distanceBetween: 'A' and: 'B') closeTo: 0.6
]

{ #category : 'tests' }
BioNeXMLParserTest >> testMultipleTrees [
	| xml trees |
	xml := '<nex:nexml xmlns:nex="http://www.nexml.org/2009" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="0.9"><otus id="o1"><otu id="a" label="A"/></otus><trees id="t1" otus="o1"><tree id="x1" xsi:type="nex:FloatTree"><node id="r" root="true"/><node id="l" otu="a"/><edge source="r" target="l" length="0.5"/></tree><tree id="x2" xsi:type="nex:FloatTree"><node id="r2" root="true"/><node id="l2" otu="a"/><edge source="r2" target="l2" length="0.9"/></tree></trees></nex:nexml>'.
	trees := BioNeXMLParser parseString: xml.
	self assert: trees size equals: 2.
	self assert: trees first countTerminals equals: 1.
	self assert: (trees second cladeNamed: 'A') branchLength equals: 0.9
]

{ #category : 'tests' }
BioNeXMLParserTest >> testNetworkUnsupportedRaises [
	| xml |
	xml := '<nex:nexml xmlns:nex="http://www.nexml.org/2009" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="0.9"><otus id="o1"><otu id="a" label="A"/></otus><trees id="t1" otus="o1"><network id="n1" xsi:type="nex:FloatNetwork"><node id="x" otu="a"/></network></trees></nex:nexml>'.
	self should: [ BioNeXMLParser parseString: xml ] raise: Error
]

{ #category : 'tests' }
BioNeXMLParserTest >> testRootByNoIncomingEdge [
	| xml t |
	xml := '<nex:nexml xmlns:nex="http://www.nexml.org/2009" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="0.9"><otus id="o1"><otu id="a" label="A"/><otu id="b" label="B"/></otus><trees id="t1" otus="o1"><tree id="x1" xsi:type="nex:FloatTree"><node id="r"/><node id="la" otu="a"/><node id="lb" otu="b"/><edge source="r" target="la" length="0.1"/><edge source="r" target="lb" length="0.2"/></tree></trees></nex:nexml>'.
	t := (BioNeXMLParser parseString: xml) first.
	self assert: t root isRoot.
	self assert: t countTerminals equals: 2
]

{ #category : 'tests' }
BioNeXMLParserTest >> testSimpleTree [
	| trees |
	trees := BioNeXMLParser parseString: self sampleNeXML.
	self assert: trees size equals: 1.
	self assert: trees first countTerminals equals: 3.
	self assert: (trees first leaves collect: #name) asSet equals: #('A' 'B' 'C') asSet
]
