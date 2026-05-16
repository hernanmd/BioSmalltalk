"
Wrapper for Genepop, a population genetics software package.

Genepop computes exact tests for Hardy-Weinberg equilibrium, population differentiation, and genotypic disequilibrium. It estimates F-statistics, null allele frequencies, and performs isolation-by-distance analyses.

```
""Simple one-liner""
wrapper := BioGenePopWrapper new.
wrapper inputFile: 'sample.txt'; hardyWeinbergDeficiency; modeBatch; execute.

 ""Full FST analysis with MCMC parameters""
wrapper := BioGenePopWrapper new.
wrapper inputFile: 'pops.txt'.
wrapper fStatisticsAll; modeBatch.
wrapper dememorisation: 10000; batchNumber: 100; batchLength: 5000.
wrapper execute.

""Isolation by distance with all options""
wrapper := BioGenePopWrapper new.
wrapper inputFile: 'ibd_data.txt'; isolationByDistanceIndividuals.
wrapper isolationStatisticA; geographicScaleLog.
wrapper minimalDistance: 0.001; ciCoverage: 0.95.
wrapper modeBatch; execute.

""Using settings file for complex analysis""
wrapper := BioGenePopWrapper new.
wrapper settingsFile: 'genepop.settings'; execute.
```

- Non-interactive mode is enabled by default (Mode=Batch). Use settings file for complex analyses: `wrapper settingsFile: 'genepop.settings'.`
- Key settings: InputFile, MenuOptions, Mode, Dememorisation, BatchLength, BatchNumber.
- Menu options: 1.1-1.5 (HW tests), 2.1-2.2 (linkage disequilibrium), 3.1-3.4 (differentiation), 4 (private alleles), 5.1-5.3 (basic info/FIS), 6.1-6.6 (F-statistics/IBD), 7 (file conversion), 8.1-8.6 (null alleles/utilities).

## Reference

Rousset (2008) Genepop'007: a complete re-implementation of the Genepop software for Windows and Linux. Molecular Ecology Resources 8:103-106.
"
Class {
	#name : 'BioGenePopWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Popgen',
	#package : 'BioWrappers',
	#tag : 'Popgen'
}

{ #category : 'accessing' }
BioGenePopWrapper class >> defaultProgramName [
	" Answer a <String> representing the Genepop executable name "
	^ 'Genepop'
]

{ #category : 'accessing' }
BioGenePopWrapper class >> url [
	" Answer a <String> representing receiver's URL "

	^ 'https://gitlab.mbb.univ-montp2.fr/francois/genepop'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> alleleFrequenciesAndFis [
	" Compute allele frequencies, FIS, and gene diversities using allele identity (Option 5.2) "

	^ self menuOptions: '5.2'
]

{ #category : 'accessing-alleles' }
BioGenePopWrapper >> alleleSizes: aString [
	" Set allele size definitions (e.g. '1:5,2:10,3:15,10:50') "

	^ self propertyAt: 'AlleleSizes' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-alleles' }
BioGenePopWrapper >> allelicDistanceSize [
	" Use allele size-based statistics "

	^ self propertyAt: 'AllelicDistance' ifAbsentPut: [ 'Size' ]
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> basicInformation [
	" Compute allele and genotype frequencies per locus and per sample (Option 5.1) "

	^ self menuOptions: '5.1'
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> basicInformation: fileName [
	" Compute allele frequencies, FIS, and gene diversities for fileName.
	Creates .INF output file. Wrapper convenience for MenuOptions=5.1 "

	^ self
		  inputFile: fileName;
		  menuOptions: '5.1';
		  modeBatch;
		  execute
]

{ #category : 'accessing-parameters' }
BioGenePopWrapper >> batchLength: anInteger [
	" Set the number of iterations per batch for Markov chain algorithms (default: 5000) "

	^ self propertyAt: 'BatchLength' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-parameters' }
BioGenePopWrapper >> batchNumber: anInteger [
	" Set the number of batches for Markov chain algorithms (default: 100) "

	^ self propertyAt: 'BatchNumber' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-parameters' }
BioGenePopWrapper >> bootstrapMethodABC [
	" Use ABC bootstrap method (default) "

	^ self propertyAt: 'BootstrapMethod' ifAbsentPut: [ 'ABC' ]
]

{ #category : 'accessing-parameters' }
BioGenePopWrapper >> bootstrapMethodBC [
	" Use BC bootstrap method "

	^ self propertyAt: 'BootstrapMethod' ifAbsentPut: [ 'BC' ]
]

{ #category : 'accessing-parameters' }
BioGenePopWrapper >> bootstrapMethodBCa [
	" Use BCa bootstrap method "

	^ self propertyAt: 'BootstrapMethod' ifAbsentPut: [ 'BCa' ]
]

{ #category : 'accessing-parameters' }
BioGenePopWrapper >> bootstrapNsim: anInteger [
	" Set number of bootstrap simulations (default: 999) "

	^ self propertyAt: 'BootstrapNsim' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing - private' }
BioGenePopWrapper >> buildOptions: stream [
	" Private - Genepop doesn't use dash-prefixed options, but some flags have no value "

	self options ifNil: [ ^ self ].
	self options do: [ :optString |
			stream space.
			stream nextPutAll: optString ]
]

{ #category : 'accessing - private' }
BioGenePopWrapper >> buildProperties: stream [
	" Private - Append receiver's properties to stream in Key=Value format (no dash prefix) "

	self properties ifNil: [ ^ self ].
	self properties associationsDo: [ :assoc |
			stream space.
			stream
				nextPutAll: assoc key asString;
				nextPut: $=;
				nextPutAll: assoc value asString ]
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> calcFstAll: fileName [
	" Calculate FST/FIS/FIT for all populations. Creates a .FST output file.
	Wrapper convenience for MenuOptions=6.1 "

	^ self
		  inputFile: fileName;
		  menuOptions: '6.1';
		  modeBatch;
		  execute
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> calcFstPairs: fileName [
	" Calculate FST/FIS/FIT for all population pairs. Creates .ST2 and .MIG output files.
	Wrapper convenience for MenuOptions=6.2 "

	^ self
		  inputFile: fileName;
		  menuOptions: '6.2';
		  modeBatch;
		  execute
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> ciCoverage: aNumber [
	" Set coverage probability for confidence intervals (default: 0.95). For 99% CI use 0.99 "

	^ self propertyAt: 'CIcoverage' ifAbsentPut: [ aNumber ]
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> convertToBiosysLetter [
	" Convert Genepop file to BIOSYS letter code format (Option 7.2) "

	^ self menuOptions: '7.2'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> convertToBiosysNumber [
	" Convert Genepop file to BIOSYS number code format (Option 7.3) "

	^ self menuOptions: '7.3'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> convertToFstat [
	" Convert Genepop file to FSTAT format (Option 7.1) "

	^ self menuOptions: '7.1'
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> convertToFstat: fileName [
	" Convert Genepop file to FSTAT format.
	Creates a .DAT output file. Wrapper convenience for MenuOptions=7.1 "

	^ self
		  inputFile: fileName;
		  menuOptions: '7.1';
		  modeBatch;
		  execute
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> convertToIndividualData [
	" Convert population data to individual data with population names (Option 8.4) "

	^ self menuOptions: '8.4'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> convertToIndividualDataNamed [
	" Convert population data to individual data with individual names (Option 8.5) "

	^ self menuOptions: '8.5'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> convertToLinkdos [
	" Convert Genepop file to Linkdos format (Option 7.4) "

	^ self menuOptions: '7.4'
]

{ #category : 'accessing-parameters' }
BioGenePopWrapper >> dememorisation: anInteger [
	" Set the dememorisation number for Markov chain algorithms (default: 10000) "

	^ self propertyAt: 'Dememorisation' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-differentiation' }
BioGenePopWrapper >> differentiationTestGeneDiv [
	" Use gene diversity as test statistic for differentiation "

	^ self propertyAt: 'DifferentiationTest' ifAbsentPut: [ 'GeneDiv' ]
]

{ #category : 'accessing-differentiation' }
BioGenePopWrapper >> differentiationTestProba [
	" Use probability test for differentiation (Fisher's exact test) "

	^ self propertyAt: 'DifferentiationTest' ifAbsentPut: [ 'Proba' ]
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> diploidizeHaploidData [
	" Diploidize haploid data (Option 8.2) "

	^ self menuOptions: '8.2'
]

{ #category : 'accessing' }
BioGenePopWrapper >> estimationPloidyDiploid [
	" Set EstimationPloidy to Diploid for multilocus estimates (default) "

	^ self propertyAt: 'EstimationPloidy' ifAbsentPut: [ 'Diploid' ]
]

{ #category : 'accessing' }
BioGenePopWrapper >> estimationPloidyHaploid [
	" Set EstimationPloidy to Haploid for multilocus estimates "

	^ self propertyAt: 'EstimationPloidy' ifAbsentPut: [ 'Haploid' ]
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> fStatisticsAll [
	" Compute FST, FIS, FIT for all populations using allele identity (Option 6.1) "

	^ self menuOptions: '6.1'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> fStatisticsPairs [
	" Compute FST, FIS, FIT for all population pairs using allele identity (Option 6.2) "

	^ self menuOptions: '6.2'
]

{ #category : 'accessing-linkage' }
BioGenePopWrapper >> gameticDiseqTestProba [
	" Use probability test for linkage disequilibrium (old Genepop behaviour) "

	^ self propertyAt: 'GameticDiseqTest' ifAbsentPut: [ 'Proba' ]
]

{ #category : 'accessing-differentiation' }
BioGenePopWrapper >> geneDivRanks: aString [
	" Set gene diversity ranks for GeneDiv differentiation test (e.g. '2,1,3,3,3') "

	^ self propertyAt: 'GeneDivRanks' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> genicDifferentiationAll [
	" Test genic differentiation for all populations (Option 3.1) "

	^ self menuOptions: '3.1'
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> genicDifferentiationAll: fileName [
	" Run genic differentiation test for all populations on fileName.
	Creates .GE and .PR output files. Wrapper convenience for MenuOptions=3.1 "

	^ self
		  inputFile: fileName;
		  menuOptions: '3.1';
		  modeBatch;
		  execute
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> genicDifferentiationPairs [
	" Test genic differentiation for all pairs of populations (Option 3.2) "

	^ self menuOptions: '3.2'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> genotypicDifferentiationAll [
	" Test genotypic differentiation for all populations (Option 3.3) "

	^ self menuOptions: '3.3'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> genotypicDifferentiationPairs [
	" Test genotypic differentiation for all pairs of populations (Option 3.4) "

	^ self menuOptions: '3.4'
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> geoDistFile: aFilename [
	" Set a user-provided geographic distance matrix file "

	^ self
		  propertyAt: 'geoDistFile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> geographicScaleLinear [
	" Use linear geographic scale (1D habitat) "

	^ self propertyAt: 'GeographicScale' ifAbsentPut: [ 'Linear' ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> geographicScaleLog [
	" Use log geographic scale (2D habitat, default in batch mode) "

	^ self propertyAt: 'GeographicScale' ifAbsentPut: [ 'Log' ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> geometry1D [
	" Set 1D habitat geometry (equivalent to Linear geographic scale) "

	^ self propertyAt: 'GeographicScale' ifAbsentPut: [ 'Linear' ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> geometry2D [
	" Set 2D habitat geometry (equivalent to Log geographic scale) "

	^ self propertyAt: 'GeographicScale' ifAbsentPut: [ 'Log' ]
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> getLociGenotypeCounts: fileName [
	" Compute allele and genotype frequencies per locus and per sample.
	Creates a .INF output file. Wrapper convenience for MenuOptions=5.1 "

	^ self
		  inputFile: fileName;
		  menuOptions: '5.1';
		  modeBatch;
		  execute
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> hardyWeinbergDeficiency [
	" Run HW test for heterozygote deficiency (Option 1.1) "

	^ self menuOptions: '1.1'
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> hardyWeinbergDeficiency: fileName [
	" Run HW test for heterozygote deficiency on fileName.
	Creates a .D output file. Wrapper convenience for MenuOptions=1.1 "

	^ self
		  inputFile: fileName;
		  menuOptions: '1.1';
		  modeBatch;
		  execute
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> hardyWeinbergExcess [
	" Run HW test for heterozygote excess (Option 1.2) "

	^ self menuOptions: '1.2'
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> hardyWeinbergExcess: fileName [
	" Run HW test for heterozygote excess on fileName.
	Creates a .E output file. Wrapper convenience for MenuOptions=1.2 "

	^ self
		  inputFile: fileName;
		  menuOptions: '1.2';
		  modeBatch;
		  execute
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> hardyWeinbergGlobalDeficiency [
	" Run global HW test for heterozygote deficiency across loci/samples (Option 1.4) "

	^ self menuOptions: '1.4'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> hardyWeinbergGlobalExcess [
	" Run global HW test for heterozygote excess across loci/samples (Option 1.5) "

	^ self menuOptions: '1.5'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> hardyWeinbergProbability [
	" Run HW probability test (Option 1.3) "

	^ self menuOptions: '1.3'
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> hardyWeinbergProbability: fileName [
	" Run HW probability test on fileName.
	Creates a .P output file. Wrapper convenience for MenuOptions=1.3 "

	^ self
		  inputFile: fileName;
		  menuOptions: '1.3';
		  modeBatch;
		  execute
]

{ #category : 'accessing-hw' }
BioGenePopWrapper >> hwFile: aFilename [
	" Set the HW ad hoc test input file "

	^ self
		  propertyAt: 'HWFile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'accessing-hw' }
BioGenePopWrapper >> hwFileOptions: aString [
	" Set HW file options (e.g. '4,3') "

	^ self propertyAt: 'HWfileOptions' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-hw' }
BioGenePopWrapper >> hwTestsEnumeration [
	" Force HW tests to use complete enumeration algorithm "

	^ self propertyAt: 'HWtests' ifAbsentPut: [ 'Enumeration' ]
]

{ #category : 'accessing-hw' }
BioGenePopWrapper >> hwTestsMCMC [
	" Force HW tests to use Markov chain algorithm "

	^ self propertyAt: 'HWtests' ifAbsentPut: [ 'MCMC' ]
]

{ #category : 'accessing' }
BioGenePopWrapper >> inputFile: aFilename [
	" Set the Genepop input file (GenepopInputFile or InputFile) "

	^ self
		  propertyAt: 'InputFile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'private' }
BioGenePopWrapper >> isDoubleDashProperties [
	" Answer <false> - Genepop uses Key=Value syntax without dash prefix "

	^ false
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> isolationByDistanceGroups [
	" Compute isolation by distance between groups (Option 6.6) "

	^ self menuOptions: '6.6'
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> isolationByDistanceGroups: fileName [
	" Run isolation by distance analysis between groups for fileName.
	Creates .ISO, .MIG, and .GRA output files. Wrapper convenience for MenuOptions=6.6 "

	^ self
		  inputFile: fileName;
		  menuOptions: '6.6';
		  modeBatch;
		  execute
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> isolationByDistanceIndividuals [
	" Compute isolation by distance between individuals (Option 6.5) "

	^ self menuOptions: '6.5'
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> isolationByDistanceIndividuals: fileName [
	" Run isolation by distance analysis between individuals for fileName.
	Creates .ISO, .MIG, and .GRA output files. Wrapper convenience for MenuOptions=6.5 "

	^ self
		  inputFile: fileName;
		  menuOptions: '6.5';
		  modeBatch;
		  execute
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> isolationFile: aFilename [
	" Set the isolation by distance input file (Genepop MIG format) "

	^ self
		  propertyAt: 'IsolationFile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> isolationStatisticA [
	" Use a-hat statistic for isolation by distance (default for diploid) "

	^ self propertyAt: 'IsolationStatistic' ifAbsentPut: [ 'a' ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> isolationStatisticE [
	" Use e-hat statistic for isolation by distance (Loiselle-like) "

	^ self propertyAt: 'IsolationStatistic' ifAbsentPut: [ 'e' ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> isolationStatisticSingleGeneDiv [
	" Use single gene diversity denominator for F/(1-F) variant "

	^ self
		  propertyAt: 'IsolationStatistic'
		  ifAbsentPut: [ 'SingleGeneDiv' ]
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> linkageDisequilibrium: fileName [
	" Run linkage disequilibrium test on fileName.
	Creates a .DIS output file. Wrapper convenience for MenuOptions=2.1 "

	^ self
		  inputFile: fileName;
		  menuOptions: '2.1';
		  modeBatch;
		  execute
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> linkageDisequilibriumTables [
	" Create genotypic contingency tables (Option 2.2) "

	^ self menuOptions: '2.2'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> linkageDisequilibriumTest [
	" Run linkage disequilibrium test for each pair of loci in each population (Option 2.1) "

	^ self menuOptions: '2.1'
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> mantelPermutations: anInteger [
	" Set number of permutations for Mantel test "

	^ self propertyAt: 'MantelPermutations' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> mantelRankTest [
	" Enable Mantel rank correlation test "

	^ self propertyAt: 'MantelRankTest' ifAbsentPut: [ '' ]
]

{ #category : 'accessing-parameters' }
BioGenePopWrapper >> mantelSeed: anInteger [
	" Set the seed for the Mantel test random number generator "

	^ self propertyAt: 'MantelSeed' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> maximalDistance: aNumber [
	" Set maximal geographic distance for isolation by distance analysis "

	^ self propertyAt: 'MaximalDistance' ifAbsentPut: [ aNumber ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> meanDifferentiationTest [
	" Enable bootstrap analysis of mean differentiation "

	^ self propertyAt: 'MeanDifferentiationTest' ifAbsentPut: [ 'TRUE' ]
]

{ #category : 'accessing' }
BioGenePopWrapper >> menuOptions: aString [
	" Set the MenuOptions for non-interactive execution.
	Examples: '1.1' for HW heterozygote deficiency, '6.1' for F-statistics, '1.1,2.2' for multiple options "

	^ self propertyAt: 'MenuOptions' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> minimalDistance: aNumber [
	" Set minimal geographic distance for isolation by distance analysis "

	^ self propertyAt: 'MinimalDistance' ifAbsentPut: [ aNumber ]
]

{ #category : 'accessing' }
BioGenePopWrapper >> modeAsk [
	" Run Genepop in ask mode (interactive prompts for unspecified settings) "

	^ self propertyAt: 'Mode' ifAbsentPut: [ 'Ask' ]
]

{ #category : 'accessing' }
BioGenePopWrapper >> modeBatch [
	" Run Genepop in batch mode (no interactive prompts) "

	^ self propertyAt: 'Mode' ifAbsentPut: [ 'Batch' ]
]

{ #category : 'accessing' }
BioGenePopWrapper >> modeDefault [
	" Run Genepop in default mode (prompts for unspecified settings but not confirmation) "

	^ self propertyAt: 'Mode' ifAbsentPut: [ 'Default' ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> multiMigFile: aFilename [
	" Set the multiple genetic distance matrices input file "

	^ self
		  propertyAt: 'MultiMigFile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> nullAlleleEstimation [
	" Estimate null allele frequencies (Option 8.1) "

	^ self menuOptions: '8.1'
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> nullAlleleEstimation: fileName [
	" Estimate null allele frequencies for fileName. 
	Creates a .NUL output file. Wrapper convenience for MenuOptions=8.1 "

	^ self
		  inputFile: fileName;
		  menuOptions: '8.1';
		  modeBatch;
		  execute
]

{ #category : 'accessing-nullalleles' }
BioGenePopWrapper >> nullAlleleMethodApparentNulls [
	" Use ApparentNulls method for null allele estimation "

	^ self
		  propertyAt: 'NullAlleleMethod'
		  ifAbsentPut: [ 'ApparentNulls' ]
]

{ #category : 'accessing-nullalleles' }
BioGenePopWrapper >> nullAlleleMethodB96 [
	" Use Brookfield (1996) estimator for null allele estimation "

	^ self propertyAt: 'NullAlleleMethod' ifAbsentPut: [ 'B96' ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> phylipMatrix [
	" Export genetic distance matrix in Phylip format "

	^ self propertyAt: 'PhylipMatrix' ifAbsentPut: [ '' ]
]

{ #category : 'accessing-populations' }
BioGenePopWrapper >> popTypeSelectionAll [
	" Use all population pairs (default) "

	^ self propertyAt: 'PopTypeSelection' ifAbsentPut: [ 'all' ]
]

{ #category : 'accessing-populations' }
BioGenePopWrapper >> popTypeSelectionInter: typeA between: typeB [
	" Select only pairs between two specified types "

	^ self
		  propertyAt: 'PopTypeSelection'
		  ifAbsentPut: [ 'inter ' , typeA asString , ' ' , typeB asString ]
]

{ #category : 'accessing-populations' }
BioGenePopWrapper >> popTypeSelectionOnly: typeIndex [
	" Select only pairs within the specified type "

	^ self
		  propertyAt: 'PopTypeSelection'
		  ifAbsentPut: [ 'only ' , typeIndex asString ]
]

{ #category : 'accessing-populations' }
BioGenePopWrapper >> popTypes: aString [
	" Set population type indices (e.g. '1 1 2 1 2 1 1 2 3 4') "

	^ self propertyAt: 'PopTypes' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> privateAlleles [
	" Estimate Nm by private allele method (Option 4) "

	^ self menuOptions: '4'
]

{ #category : 'accessing-convenience' }
BioGenePopWrapper >> privateAlleles: fileName [
	" Estimate Nm by private allele method for fileName.
	Creates a .PRI output file. Wrapper convenience for MenuOptions=4 "

	^ self
		  inputFile: fileName;
		  menuOptions: '4';
		  modeBatch;
		  execute
]

{ #category : 'accessing-parameters' }
BioGenePopWrapper >> randomSeed: anInteger [
	" Set the seed for the pseudo-random number generator "

	^ self propertyAt: 'RandomSeed' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> relabelAlleles [
	" Relabel allele names (Option 8.3) "

	^ self menuOptions: '8.3'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> rhoStatisticsAll [
	" Compute Rho-statistics for all populations using allele size (Option 6.3) "

	^ self menuOptions: '6.3'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> rhoStatisticsPairs [
	" Compute Rho-statistics for all population pairs using allele size (Option 6.4) "

	^ self menuOptions: '6.4'
]

{ #category : 'accessing-menus' }
BioGenePopWrapper >> sampleHaploidFromDiploid [
	" Randomly sample haploid genotypes from diploid loci (Option 8.6) "

	^ self menuOptions: '8.6'
]

{ #category : 'accessing' }
BioGenePopWrapper >> settingsFile: aFilename [
	" Set the Genepop settings file. This must be the first argument on the command line "

	^ self
		  propertyAt: 'settingsFile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'accessing-differentiation' }
BioGenePopWrapper >> strucFile: aFilename [
	" Set the structure test input file for single contingency table analysis "

	^ self
		  propertyAt: 'StrucFile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'accessing-ibd' }
BioGenePopWrapper >> testPoint: aNumber [
	" Test a specific value of the regression slope using bootstrap "

	^ self propertyAt: 'testPoint' ifAbsentPut: [ aNumber ]
]
