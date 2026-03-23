Class {
	#name : 'BioPolymerTest',
	#superclass : 'TestCase',
	#category : 'BioPhysics-Tests',
	#package : 'BioPhysics-Tests'
}

{ #category : 'instance creation' }
BioPolymerTest >> newDNA: aString [
	^ BioPolymer newDNA: aString
]

{ #category : 'instance creation' }
BioPolymerTest >> newPolymerWithCoordinates: points sequence: seq [
	^ BioPolymer new
		sequence: seq;
		coordinates: points;
		yourself
]

{ #category : 'instance creation' }
BioPolymerTest >> newProtein: aString [
	^ BioPolymer newProtein: aString
]

{ #category : 'tests' }
BioPolymerTest >> testAliphaticIndexDeterministic [
	| p a b |
	p := self newProtein: 'AVILAVIL'.
	a := p aliphaticIndex.
	b := p aliphaticIndex.
	self assert: a equals: b
]

{ #category : 'tests' }
BioPolymerTest >> testAliphaticIndexHighForAVLIRich [
	| p ai |
	p := self newProtein: 'AAAAVVVVLLLLIIII'.
	ai := p aliphaticIndex.
	self assert: ai > 100.0
]

{ #category : 'tests' }
BioPolymerTest >> testAliphaticIndexLowerWithoutAliphaticResidues [
	| p ai |
	p := self newProtein: 'DEKRSTNQ'.
	ai := p aliphaticIndex.
	self assert: ai equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testAliphaticIndexReasonableBound [
	| p ai |
	p := self newProtein: 'AVIL'.
	ai := p aliphaticIndex.
	self assert: ai > 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testAliphaticIndexZeroOnEmpty [
	| p |
	p := self newProtein: ''.
	self assert: p aliphaticIndex equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testBranchingFactorDeterministic [
	| p a b |
	p := self newProtein: 'AAAA'.
	a := p branchingFactor.
	b := p branchingFactor.
	self assert: a equals: b
]

{ #category : 'tests' }
BioPolymerTest >> testBranchingFactorNoDataZero [
	| p |
	p := self newProtein: 'AAAA'.
	self assert: p branchingFactor equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testBranchingFactorNonNegativeByDefault [
	| p |
	p := self newProtein: 'AAAA'.
	self assert: p branchingFactor >= 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testBranchingFactorNumeric [
	| p |
	p := self newProtein: 'AAAA'.
	self assert: p branchingFactor isNumber
]

{ #category : 'tests' }
BioPolymerTest >> testBranchingFactorZeroWhenEmptySequence [
	| p |
	p := self newProtein: ''.
	self assert: p branchingFactor equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testChargeAtPhAcidicProteinNegativeAtNeutral [
	| p |
	p := self newProtein: 'DDDEEE'.
	self assert: (p chargeAtPh: 7.0) < 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testChargeAtPhBasicProteinPositiveAtNeutral [
	| p |
	p := self newProtein: 'KKKRRH'.
	self assert: (p chargeAtPh: 7.0) > 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testChargeAtPhMonotonicDecreaseWithPh [
	| p low high |
	p := self newProtein: 'ACDEHKR'.
	low := p chargeAtPh: 3.0.
	high := p chargeAtPh: 11.0.
	self assert: low > high
]

{ #category : 'tests' }
BioPolymerTest >> testChargeAtPhNonProteinZero [
	| p |
	p := self newDNA: 'ATGC'.
	self assert: (p chargeAtPh: 7.0) closeTo: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testChargeAtPhUsesTerminalPka [
	| p charge |
	p := self newProtein: 'A'.
	charge := p chargeAtPh: 7.0.
	self assert: charge isNumber
]

{ #category : 'tests' }
BioPolymerTest >> testClassDefaultPkaValuesContainsExpectedEntries [
	| t |
	t := BioPolymer defaultPkaValues.
	#($D $E $C $Y $H $K $R #nTerm #cTerm) do: [ :k | self assert: (t includesKey: k) ]
]

{ #category : 'tests' }
BioPolymerTest >> testClassKyteDoolittleScaleContains20AminoAcids [
	| t |
	t := BioPolymer kyteDoolittleScale.
	self assert: t size >= 20
]

{ #category : 'tests' }
BioPolymerTest >> testClassNearestNeighborInitiationForReturnsPair [
	| pair |
	pair := BioPolymer nearestNeighborInitiationFor: 'ATGC'.
	self assert: pair size equals: 2.
	self assert: pair first isNumber.
	self assert: pair second isNumber
]

{ #category : 'tests' }
BioPolymerTest >> testClassNearestNeighborThermoTableHasCorePairs [
	| t |
	t := BioPolymer nearestNeighborThermoTable.
	#('AA' 'AT' 'TA' 'CG' 'GC' 'GG') do: [ :k | self assert: (t includesKey: k) ]
]

{ #category : 'tests' }
BioPolymerTest >> testClassNucleotideExtinctionCoefficientsContainsCanonical [
	| t |
	t := BioPolymer nucleotideExtinctionCoefficients.
	#($A $C $G $T $U) do: [ :k | self assert: (t includesKey: k) ]
]

{ #category : 'tests' }
BioPolymerTest >> testContactMapCutoffEffect [
	| p near far |
	p := self newPolymerWithCoordinates: { 0@0@0. 5@0@0. 20@0@0 } sequence: 'AAA'.
	near := p contactMapWithin: 8.0.
	far := p contactMapWithin: 4.0.
	self assert: ((near at: 1) at: 2) > ((far at: 1) at: 2)
]

{ #category : 'tests' }
BioPolymerTest >> testContactMapDiagonalTrue [
	| p map |
	p := self newPolymerWithCoordinates: { 0@0@0. 1@0@0 } sequence: 'AA'.
	map := p contactMap.
	self assert: ((map at: 1) at: 1) equals: 1.
	self assert: ((map at: 2) at: 2) equals: 1
]

{ #category : 'tests' }
BioPolymerTest >> testContactMapEmptyWithoutCoordinates [
	| p |
	p := self newProtein: 'AAA'.
	self assert: p contactMap isEmpty
]

{ #category : 'tests' }
BioPolymerTest >> testContactMapSquareDimensions [
	| p map |
	p := self newPolymerWithCoordinates: { 0@0@0. 1@0@0. 2@0@0 } sequence: 'AAA'.
	map := p contactMap.
	self assert: map size equals: 3.
	self assert: (map first size) equals: 3
]

{ #category : 'tests' }
BioPolymerTest >> testContactMapSymmetric [
	| p map |
	p := self newPolymerWithCoordinates: { 0@0@0. 7@0@0. 20@0@0 } sequence: 'AAA'.
	map := p contactMap.
	self assert: ((map at: 1) at: 2) equals: ((map at: 2) at: 1)
]

{ #category : 'tests' }
BioPolymerTest >> testExtinctionCoefficientDNAUsesNucleotideSum [
	| p epsilon |
	p := self newDNA: 'ACGT'.
	epsilon := p extinctionCoefficient.
	self assert: epsilon equals: (15400 + 7400 + 11500 + 8700)
]

{ #category : 'tests' }
BioPolymerTest >> testExtinctionCoefficientDeterministic [
	| p a b |
	p := self newDNA: 'ACGTACGT'.
	a := p extinctionCoefficient.
	b := p extinctionCoefficient.
	self assert: a equals: b
]

{ #category : 'tests' }
BioPolymerTest >> testExtinctionCoefficientProteinDominatesProteinLike [
	| p |
	p := self newProtein: 'W'.
	self assert: p extinctionCoefficient equals: 5500
]

{ #category : 'tests' }
BioPolymerTest >> testExtinctionCoefficientProteinUsesWYCCystineRule [
	| p epsilon |
	p := self newProtein: 'WWYYCC'.
	epsilon := p extinctionCoefficient.
	self assert: epsilon equals: ((2 * 5500) + (2 * 1490) + (1 * 125))
]

{ #category : 'tests' }
BioPolymerTest >> testExtinctionCoefficientUnknownPolymerZero [
	| p |
	p := BioPolymer new sequence: 'XYZ'; yourself.
	self assert: p extinctionCoefficient equals: 0
]

{ #category : 'tests' }
BioPolymerTest >> testGravyHydrophilicNegative [
	| p |
	p := self newProtein: 'DEKRDEKR'.
	self assert: p gravy < 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testGravyHydrophobicPositive [
	| p |
	p := self newProtein: 'IVLIVL'.
	self assert: p gravy > 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testGravyIgnoresUnknownResiduesViaFilter [
	| p g |
	p := BioPolymer new sequence: 'ACDXZ'; yourself.
	g := p gravy.
	self assert: g isNumber
]

{ #category : 'tests' }
BioPolymerTest >> testGravyMixedNearReasonableRange [
	| p g |
	p := self newProtein: 'ACDEFGHIKLMNPQRSTVWY'.
	g := p gravy.
	self assert: (g between: -5.0 and: 5.0)
]

{ #category : 'tests' }
BioPolymerTest >> testGravyNonProteinZero [
	| p |
	p := self newDNA: 'ATGC'.
	self assert: p gravy closeTo: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testInstabilityIndexDeterministic [
	| p a b |
	p := self newProtein: 'MKWVTFISLLFLFSSAYS'.
	a := p instabilityIndex.
	b := p instabilityIndex.
	self assert: a equals: b
]

{ #category : 'tests' }
BioPolymerTest >> testInstabilityIndexLongerSequenceNotNaN [
	| p val |
	p := self newProtein: 'ACDEFGHIKLMNPQRSTVWYACDEFGHIK'.
	val := p instabilityIndex.
	self assert: val isNumber
]

{ #category : 'tests' }
BioPolymerTest >> testInstabilityIndexNonProteinZero [
	| p |
	p := self newDNA: 'ATGC'.
	self assert: p instabilityIndex equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testInstabilityIndexShortProteinZero [
	| p |
	p := self newProtein: 'A'.
	self assert: p instabilityIndex equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testInstabilityIndexUsesDipeptideWeights [
	| p val |
	p := self newProtein: 'AAVV'.
	val := p instabilityIndex.
	self assert: val isNumber
]

{ #category : 'tests' }
BioPolymerTest >> testIsoelectricPointBasicProteinHigherThanAcidic [
	| basic acidic |
	basic := self newProtein: 'KKKKRRRRHH'.
	acidic := self newProtein: 'DDDDEEEE'.
	self assert: basic isoelectricPoint > acidic isoelectricPoint
]

{ #category : 'tests' }
BioPolymerTest >> testIsoelectricPointConvergenceStable [
	| p a b |
	p := self newProtein: 'MTEITAAMVKELRESTGAGM'.
	a := p isoelectricPoint.
	b := p isoelectricPoint.
	self assert: (a - b) abs < 1e-4
]

{ #category : 'tests' }
BioPolymerTest >> testIsoelectricPointInRange [
	| p pi |
	p := self newProtein: 'ACDEFGHIKLMNPQRSTVWY'.
	pi := p isoelectricPoint.
	self assert: (pi between: 0.0 and: 14.0)
]

{ #category : 'tests' }
BioPolymerTest >> testIsoelectricPointNonProteinNeutralFallback [
	| p |
	p := self newDNA: 'ATGCATGC'.
	self assert: p isoelectricPoint equals: 7.0
]

{ #category : 'tests' }
BioPolymerTest >> testIsoelectricPointProteinLikeDefault [
	| p |
	p := self newProtein: 'MKWVTFISLL'.
	self assert: p isoelectricPoint isNumber
]

{ #category : 'tests' }
BioPolymerTest >> testMeltingTempEmpty [
	| p |
	p := self newDNA: ''.
	self assert: p meltingTemp equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testMeltingTempLongSequencePositive [
	| p tm |
	p := self newDNA: 'ATGCGCGATATCGCGC'.
	tm := p meltingTemp.
	self assert: tm isNumber.
	self assert: tm > 20.0
]

{ #category : 'tests' }
BioPolymerTest >> testMeltingTempRejectsProtein [
	| p |
	p := self newProtein: 'MKWVTFISLL'.
	self assert: p meltingTemp equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testMeltingTempShortWallaceCase1 [
	| p |
	p := self newDNA: 'ATGC'.
	self assert: p meltingTemp equals: 12.0
]

{ #category : 'tests' }
BioPolymerTest >> testMeltingTempShortWallaceCase2 [
	| p |
	p := self newDNA: 'AAAA'.
	self assert: p meltingTemp equals: 8.0
]

{ #category : 'tests' }
BioPolymerTest >> testMolarAbsorptionDeterministic [
	| p a b |
	p := self newDNA: 'ATGCGC'.
	a := p molarAbsorption.
	b := p molarAbsorption.
	self assert: a equals: b
]

{ #category : 'tests' }
BioPolymerTest >> testMolarAbsorptionEmptyZero [
	| p |
	p := self newDNA: ''.
	self assert: p molarAbsorption equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testMolarAbsorptionEqualsExtinctionForDefaultPathAndConc [
	| p |
	p := self newDNA: 'ACGT'.
	self assert: p molarAbsorption equals: p extinctionCoefficient asFloat
]

{ #category : 'tests' }
BioPolymerTest >> testMolarAbsorptionNonNucleicZero [
	| p |
	p := self newProtein: 'MKWVTF'.
	self assert: p molarAbsorption equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testMolarAbsorptionScalesWithLength [
	| short long |
	short := self newDNA: 'AC'.
	long := self newDNA: 'ACAC'.
	self assert: long molarAbsorption > short molarAbsorption
]

{ #category : 'tests' }
BioPolymerTest >> testMonomerFrequenciesCaseInsensitive [
	| p freq |
	p := BioPolymer new sequence: 'AaAa'; yourself.
	freq := p monomerFrequencies.
	self assert: (freq at: $A) equals: 1.0
]

{ #category : 'tests' }
BioPolymerTest >> testMonomerFrequenciesDistribution [
	| p freq |
	p := self newDNA: 'AAGT'.
	freq := p monomerFrequencies.
	self assert: (freq at: $A) equals: 0.5.
	self assert: (freq at: $G) equals: 0.25.
	self assert: (freq at: $T) equals: 0.25
]

{ #category : 'tests' }
BioPolymerTest >> testMonomerFrequenciesEmpty [
	| p |
	p := self newProtein: ''.
	self assert: p monomerFrequencies isEmpty
]

{ #category : 'tests' }
BioPolymerTest >> testMonomerFrequenciesSingleMonomer [
	| p freq |
	p := self newDNA: 'AAAA'.
	freq := p monomerFrequencies.
	self assert: freq size equals: 1.
	self assert: (freq at: $A) equals: 1.0
]

{ #category : 'tests' }
BioPolymerTest >> testMonomerFrequenciesSumToOne [
	| p freq sum |
	p := self newProtein: 'AABB'.
	freq := p monomerFrequencies.
	sum := (freq values inject: 0.0 into: [ :acc :v | acc + v ]).
	self assert: (sum - 1.0) abs < 1e-9
]

{ #category : 'tests' }
BioPolymerTest >> testPkaValuesDeterministic [
	| p a b |
	p := self newProtein: 'ACD'.
	a := p pkaValues.
	b := p pkaValues.
	self assert: a equals: b
]

{ #category : 'tests' }
BioPolymerTest >> testPkaValuesIncludesSideChains [
	| p table |
	p := self newProtein: 'ACDEHKRY'.
	table := p pkaValues.
	#($D $E $C $Y $H $K $R) do: [ :aa | self assert: (table includesKey: aa) ]
]

{ #category : 'tests' }
BioPolymerTest >> testPkaValuesIncludesTermini [
	| p table |
	p := self newProtein: 'A'.
	table := p pkaValues.
	self assert: (table includesKey: #nTerm).
	self assert: (table includesKey: #cTerm)
]

{ #category : 'tests' }
BioPolymerTest >> testPkaValuesNumeric [
	| p table |
	p := self newProtein: 'ACD'.
	table := p pkaValues.
	self assert: (table at: $D) isNumber
]

{ #category : 'tests' }
BioPolymerTest >> testPkaValuesReturnsCopy [
	| p a b |
	p := self newProtein: 'A'.
	a := p pkaValues.
	b := p pkaValues.
	a at: $D put: 99.
	self deny: (b at: $D) equals: 99
]

{ #category : 'tests' }
BioPolymerTest >> testPostTranslationalModificationsCollectionType [
	| p |
	p := self newProtein: 'AAAA'.
	self assert: p postTranslationalModifications isCollection
]

{ #category : 'tests' }
BioPolymerTest >> testPostTranslationalModificationsDefaultsEmpty [
	| p |
	p := self newProtein: 'AAAA'.
	self assertEmpty: p postTranslationalModifications
]

{ #category : 'tests' }
BioPolymerTest >> testPostTranslationalModificationsDeterministic [
	| p a b |
	p := self newProtein: 'AAAA'.
	a := p postTranslationalModifications.
	b := p postTranslationalModifications.
	self assert: a equals: b
]

{ #category : 'tests' }
BioPolymerTest >> testPostTranslationalModificationsIndependentFromSequenceType [
	| p |
	p := self newDNA: 'ATGC'.
	self assert: p postTranslationalModifications isCollection
]

{ #category : 'tests' }
BioPolymerTest >> testPostTranslationalModificationsReturnsCopy [
	| p a b |
	p := self newProtein: 'AAAA'.
	a := p postTranslationalModifications.
	b := p postTranslationalModifications.
	a add: #phospho.
	self deny: (b includes: #phospho)
]

{ #category : 'tests' }
BioPolymerTest >> testProteolysisSitesNonProteinEmpty [
	| p |
	p := self newDNA: 'ATGC'.
	self assertEmpty: (p proteolysisSites: 'trypsin')
]

{ #category : 'tests' }
BioPolymerTest >> testProteolysisSitesPepsinAromatics [
	| p sites |
	p := self newProtein: 'AFLWY'.
	sites := p proteolysisSites: 'pepsin'.
	self assert: sites notEmpty
]

{ #category : 'tests' }
BioPolymerTest >> testProteolysisSitesTrypsinBlockedByProline [
	| p sites |
	p := self newProtein: 'AKP'.
	sites := p proteolysisSites: 'trypsin'.
	self deny: (sites includes: 2)
]

{ #category : 'tests' }
BioPolymerTest >> testProteolysisSitesTrypsinCutsAfterKROnly [
	| p sites |
	p := self newProtein: 'AKRPQK'.
	sites := p proteolysisSites: 'trypsin'.
	self assert: (sites includes: 2).
	self deny: (sites includes: 3)
]

{ #category : 'tests' }
BioPolymerTest >> testProteolysisSitesUnknownEnzymeEmpty [
	| p |
	p := self newProtein: 'AKRFLWY'.
	self assert: (p proteolysisSites: 'unknown') isEmpty
]

{ #category : 'tests' }
BioPolymerTest >> testRadiusOfGyrationDeterministic [
	| p a b |
	p := self newPolymerWithCoordinates: { 0@0@0. 1@1@1. 2@2@2 } sequence: 'AAA'.
	a := p radiusOfGyration.
	b := p radiusOfGyration.
	self assert: a equals: b
]

{ #category : 'tests' }
BioPolymerTest >> testRadiusOfGyrationSinglePointZero [
	| p |
	p := self newPolymerWithCoordinates: { 0@0@0 } sequence: 'A'.
	self assert: p radiusOfGyration equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testRadiusOfGyrationTranslationInvariant [
	| p1 p2 |
	p1 := self newPolymerWithCoordinates: { 0@0@0. 1@0@0. 0@1@0 } sequence: 'AAA'.
	p2 := self newPolymerWithCoordinates: { 10@10@10. 11@10@10. 10@11@10 } sequence: 'AAA'.
	self assert: (p1 radiusOfGyration - p2 radiusOfGyration) abs < 1e-9
]

{ #category : 'tests' }
BioPolymerTest >> testRadiusOfGyrationTwoPointsPositive [
	| p rg |
	p := self newPolymerWithCoordinates: { 0@0@0. 2@0@0 } sequence: 'AA'.
	rg := p radiusOfGyration.
	self assert: rg > 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testRadiusOfGyrationZeroWithoutCoordinates [
	| p |
	p := self newProtein: 'AAAA'.
	self assert: p radiusOfGyration equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testSecondaryStructureFractionDeterministic [
	| p a b |
	p := self newProtein: 'AAAA'.
	a := p secondaryStructureFraction.
	b := p secondaryStructureFraction.
	self assert: a equals: b
]

{ #category : 'tests' }
BioPolymerTest >> testSecondaryStructureFractionFallbackHasAllKeys [
	| p frac |
	p := self newProtein: 'AAAA'.
	frac := p secondaryStructureFraction.
	self assert: (frac includesKey: #helix).
	self assert: (frac includesKey: #sheet).
	self assert: (frac includesKey: #turn)
]

{ #category : 'tests' }
BioPolymerTest >> testSecondaryStructureFractionFallbackZeros [
	| p frac |
	p := self newProtein: 'AAAA'.
	frac := p secondaryStructureFraction.
	self assert: (frac at: #helix) closeTo: 1.0.
	self assert: (frac at: #sheet) closeTo: 0.0.
	self assert: (frac at: #turn) closeTo: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testSecondaryStructureFractionHandlesEmpty [
	| p frac |
	p := self newProtein: ''.
	frac := p secondaryStructureFraction.
	self assert: (frac at: #helix) equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testSecondaryStructureFractionSumsAtMostOne [
	| p frac sum |
	p := self newProtein: 'AAAA'.
	frac := p secondaryStructureFraction.
	sum := (frac at: #helix) + (frac at: #sheet) + (frac at: #turn).
	self assert: sum <= 1.0
]

{ #category : 'tests' }
BioPolymerTest >> testSolventAccessibleSurfaceAreaDeterministic [
	| p a b |
	p := self newProtein: 'MKWVTF'.
	a := p solventAccessibleSurfaceArea.
	b := p solventAccessibleSurfaceArea.
	self assert: a equals: b
]

{ #category : 'tests' }
BioPolymerTest >> testSolventAccessibleSurfaceAreaEmptyProteinZero [
	| p |
	p := self newProtein: ''.
	self assert: p solventAccessibleSurfaceArea equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testSolventAccessibleSurfaceAreaNonProteinZero [
	| p |
	p := self newDNA: 'ATGC'.
	self assert: p solventAccessibleSurfaceArea equals: 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testSolventAccessibleSurfaceAreaProteinPositive [
	| p sasa |
	p := self newProtein: 'ACDE'.
	sasa := p solventAccessibleSurfaceArea.
	self assert: sasa > 0.0
]

{ #category : 'tests' }
BioPolymerTest >> testSolventAccessibleSurfaceAreaScalesWithLength [
	| a b |
	a := self newProtein: 'AAAA'.
	b := self newProtein: 'AAAAAAAA'.
	self assert: b solventAccessibleSurfaceArea > a solventAccessibleSurfaceArea
]
