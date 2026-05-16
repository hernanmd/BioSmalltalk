Class {
	#name : 'BioHaplotypePanelTest',
	#superclass : 'TestCase',
	#category : 'BioHaplotypes-Tests-Core',
	#package : 'BioHaplotypes-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioHaplotypePanelTest >> testRegistry [

	| panel v1 |
	BioHaplotypePanel resetRegistry.
	v1 := BioVariant
		      position: 100
		      referenceAllele: 'A'
		      alternateAlleles: #( 'T' )
		      rsID: 'rs1'.
	panel := BioHaplotypePanel new
		         panelName: 'TestPanel';
		         addVariant: v1;
		         yourself.
	BioHaplotypePanel register: panel.
	self
		assert: (BioHaplotypePanel panelNamed: 'TestPanel')
		equals: panel.
	BioHaplotypePanel unregister: panel.
	self assert: (BioHaplotypePanel panelNamed: 'TestPanel') isNil
]

{ #category : 'tests' }
BioHaplotypePanelTest >> testVariantAtRsID [

	| panel v1 v2 |
	panel := BioHaplotypePanel new panelName: 'RsTest'.
	v1 := BioVariant
		      position: 100
		      referenceAllele: 'A'
		      alternateAlleles: #( 'T' )
		      rsID: 'rs1'.
	v2 := BioVariant
		      position: 200
		      referenceAllele: 'C'
		      alternateAlleles: #( 'G' )
		      rsID: 'rs2'.
	panel
		addVariant: v1;
		addVariant: v2.
	self assert: (panel variantAtRsID: 'rs1') equals: v1.
	self assert: (panel variantAtRsID: 'rs2') equals: v2.
	self assert: (panel variantAtRsID: 'rs999') isNil
]
