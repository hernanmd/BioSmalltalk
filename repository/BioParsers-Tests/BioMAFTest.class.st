Class {
	#name : 'BioMAFTest',
	#superclass : 'BioAbstractParserTest',
	#category : 'BioParsers-Tests',
	#package : 'BioParsers-Tests'
}

{ #category : 'tests' }
BioMAFTest >> testCustomFields [

	| mut |
	mut := BioMutation new.
	mut customFieldAt: 'TMB_Score' put: '15.3'.
	self assert: (mut customFieldAt: 'TMB_Score') equals: '15.3'.
	self assert: (mut customFieldAt: 'nonexistent') isNil
]

{ #category : 'tests' }
BioMAFTest >> testFileIntegration [

	| mset tp53Muts |
	mset := BioMAFParser parseFile: '/tmp/maf_test/test.maf'.
	self assert: mset size equals: 8.
	tp53Muts := mset mutationsForGene: 'TP53'.
	self assert: tp53Muts size equals: 2
]

{ #category : 'tests' }
BioMAFTest >> testFileParsing [

	| mset |
	mset := BioMAFParser parseFile: '/tmp/maf_test/test.maf'.
	self assert: mset size equals: 8
]

{ #category : 'tests' }
BioMAFTest >> testIndexes [
	| maf mset |
	maf := 'Hugo_Symbol	Entrez_Gene_Id	Chromosome	Start_Position	Variant_Classification	Variant_Type	Reference_Allele	Tumor_Seq_Allele1	Tumor_Seq_Allele2	Tumor_Sample_Barcode
TP53	7157	17	1	Missense_Mutation	SNP	G	A	A	TCGA-AB-1
KRAS	3845	12	1	Missense_Mutation	SNP	C	A	A	TCGA-AB-2
TP53	7157	17	2	Nonsense_Mutation	SNP	C	T	T	TCGA-AB-1'.
	mset := BioMAFParser parseString: maf.
	self assert: (mset mutationsForGene: 'TP53') size equals: 2.
	self assert: (mset mutationsForSample: 'TCGA-AB-1') size equals: 2.
	self assert: (mset mutationsForChromosome: '17') size equals: 2


]

{ #category : 'tests' }
BioMAFTest >> testMAFMutationAccessors [
	| maf mset mut |
	maf := 'Hugo_Symbol	Entrez_Gene_Id	Chromosome	Start_Position	End_Position	Strand	Variant_Classification	Variant_Type	Reference_Allele	Tumor_Seq_Allele1	Tumor_Seq_Allele2	Tumor_Sample_Barcode
TP53	7157	17	7579472	7579472	+	Missense_Mutation	SNP	G	A	A	TCGA-AB-1234'.
	mset := BioMAFParser parseString: maf.
	mut := mset mutations first.
	self assert: mut hugoSymbol equals: 'TP53'.
	self assert: mut entrezGeneId equals: 7157.
	self assert: mut chromosome equals: '17'.
	self assert: mut startPosition equals: 7579472.
	self assert: mut variantClassification equals: 'Missense_Mutation'.
	self assert: mut variantType equals: 'SNP'.
	self assert: mut referenceAllele equals: 'G'.
	self assert: mut tumorSeqAllele2 equals: 'A'.
	self assert: mut tumorSampleBarcode equals: 'TCGA-AB-1234'


]

{ #category : 'tests' }
BioMAFTest >> testMAFParsing [
	| maf mset |
	maf := 'Hugo_Symbol	Entrez_Gene_Id	Chromosome	Start_Position	End_Position	Strand	Variant_Classification	Variant_Type	Reference_Allele	Tumor_Seq_Allele1	Tumor_Seq_Allele2	Tumor_Sample_Barcode	Matched_Norm_Sample_Barcode
TP53	7157	17	7579472	7579472	+	Missense_Mutation	SNP	G	A	A	TCGA-AB-1234	TCGA-AB-1234-10
KRAS	3845	12	25398284	25398284	+	Missense_Mutation	SNP	C	A	A	TCGA-AB-5678	TCGA-AB-5678-10'.
	mset := BioMAFParser parseString: maf.
	self assert: mset size equals: 2


]

{ #category : 'tests' }
BioMAFTest >> testMutationBurdenPerMB [
	| maf mset |
	maf := 'Hugo_Symbol	Variant_Classification	Variant_Type	Reference_Allele	Tumor_Seq_Allele1	Tumor_Seq_Allele2	Tumor_Sample_Barcode
TP53	Missense_Mutation	SNP	G	A	A	TCGA-AB-1
KRAS	Missense_Mutation	SNP	C	A	A	TCGA-AB-1
BRAF	Nonsense_Mutation	SNP	A	T	T	TCGA-AB-1'.
	mset := BioMAFParser parseString: maf.
	self assert: (mset mutationBurdenPerMB: 3000) closeTo: 0.001


]

{ #category : 'tests' }
BioMAFTest >> testMutationSpectrum [
	| maf mset spectrum |
	maf := 'Hugo_Symbol	Entrez_Gene_Id	Chromosome	Start_Position	End_Position	Strand	Variant_Classification	Variant_Type	Reference_Allele	Tumor_Seq_Allele1	Tumor_Seq_Allele2	Tumor_Sample_Barcode
TP53	7157	17	7579472	7579472	+	Missense_Mutation	SNP	G	A	A	TCGA-AB-1234
KRAS	3845	12	25398284	25398284	+	Missense_Mutation	SNP	C	A	A	TCGA-AB-5678'.
	mset := BioMAFParser parseString: maf.
	spectrum := mset mutationSpectrum.
	self assert: (spectrum at: 'C>A' ifAbsent: [0]) >= 1


]

{ #category : 'tests' }
BioMAFTest >> testMutationTypePredicates [

	| mut |
	mut := BioMutation new.
	mut variantType: 'SNP'.
	self assert: mut isSNP.
	self deny: mut isInsertion.
	self deny: mut isDeletion.
	mut variantType: 'INS'.
	self assert: mut isInsertion.
	self assert: mut isIndel.
	mut variantType: 'DEL'.
	self assert: mut isDeletion.
	self assert: mut isIndel
]

{ #category : 'tests' }
BioMAFTest >> testSelectReject [
	| maf mset snvs |
	maf := 'Hugo_Symbol	Entrez_Gene_Id	Chromosome	Start_Position	Variant_Classification	Variant_Type	Reference_Allele	Tumor_Seq_Allele1	Tumor_Seq_Allele2	Tumor_Sample_Barcode
TP53	7157	17	1	Missense_Mutation	SNP	G	A	A	TCGA-AB-1
EGFR	1956	7	1	Frame_Shift_Del	DEL	TCTAACT		TCTAACT		TCGA-AB-2'.
	mset := BioMAFParser parseString: maf.
	snvs := mset select: [ :m | m isSNP ].
	self assert: snvs size equals: 1.
	self assert: snvs mutations first hugoSymbol equals: 'TP53'


]

{ #category : 'tests' }
BioMAFTest >> testSmaCCFileParsing [
	| mset |
	mset := BioMAFSmaCCParser parseFile: '/tmp/maf_test/test.maf'.
	self assert: mset size equals: 8


]

{ #category : 'tests' }
BioMAFTest >> testSmaCCMutationAccessors [

	| maf mset mut |
	maf := String cr join:
		       { 'Hugo_Symbol	Entrez_Gene_Id	Chromosome	Start_Position	End_Position	Strand	Variant_Classification	Variant_Type	Reference_Allele	Tumor_Seq_Allele1	Tumor_Seq_Allele2	Tumor_Sample_Barcode'.
		       'TP53	7157	17	7579472	7579472	+	Missense_Mutation	SNP	G	A	A	TCGA-AB-1234' }.
	mset := BioMAFSmaCCParser parseString: maf.
	mut := mset mutations first.
	self assert: mut hugoSymbol equals: 'TP53'.
	self assert: mut chromosome equals: '17'.
	self assert: mut variantClassification equals: 'Missense_Mutation'.
	self assert: mut variantType equals: 'SNP'
]

{ #category : 'tests' }
BioMAFTest >> testSmaCCParsing [
	| mset maf |
	maf := String cr join: {
		'Hugo_Symbol	Entrez_Gene_Id	Chromosome	Start_Position	End_Position	Strand	Variant_Classification	Variant_Type	Reference_Allele	Tumor_Seq_Allele1	Tumor_Seq_Allele2	Tumor_Sample_Barcode'.
		'TP53	7157	17	7579472	7579472	+	Missense_Mutation	SNP	G	A	A	TCGA-AB-1234'.
		'KRAS	3845	12	25398284	25398284	+	Missense_Mutation	SNP	C	A	A	TCGA-AB-5678' }.
	mset := BioMAFSmaCCParser parseString: maf.
	self assert: mset size equals: 2


]

{ #category : 'tests' }
BioMAFTest >> testSmaCCVsLineByLine [
	"Both parsers should produce identical results"
	| lineByMset smaccMset |
	lineByMset := BioMAFParser parseFile: '/tmp/maf_test/test.maf'.
	smaccMset := BioMAFSmaCCParser parseFile: '/tmp/maf_test/test.maf'.
	self assert: lineByMset size equals: smaccMset size

]

{ #category : 'tests' }
BioMAFTest >> testTopMutatedGenes [
	| maf mset top |
	maf := 'Hugo_Symbol	Entrez_Gene_Id	Chromosome	Start_Position	Variant_Classification	Variant_Type	Reference_Allele	Tumor_Seq_Allele1	Tumor_Seq_Allele2	Tumor_Sample_Barcode
TP53	7157	17	1	Missense_Mutation	SNP	G	A	A	TCGA-AB-1
TP53	7157	17	2	Nonsense_Mutation	SNP	C	T	T	TCGA-AB-2
KRAS	3845	12	1	Missense_Mutation	SNP	C	A	A	TCGA-AB-1'.
	mset := BioMAFParser parseString: maf.
	top := mset topMutatedGenes: 5.
	self assert: top first key equals: 'TP53'.
	self assert: top first value equals: 2


]

{ #category : 'tests' }
BioMAFTest >> testVariantClassificationPredicates [
	| mut |
	mut := BioMutation new.
	mut variantClassification: 'Missense_Mutation'.
	self assert: mut isMissense.
	self deny: mut isNonsense.
	mut variantClassification: 'Nonsense_Mutation'.
	self assert: mut isNonsense.
	mut variantClassification: 'Frame_Shift_Del'.
	self assert: mut isFrameshift.
	mut variantClassification: 'Splice_Site'.
	self assert: mut isSpliceSite.
	mut variantClassification: 'Silent'.
	self assert: mut isSynonymous


]
