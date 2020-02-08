"
List available wrapper classes:

BioShapeIt2Wrapper releases. 

Examples:

See class side method.

Usage:

- The program binary must be in the PATH
- All input files, being binarized PLINK (bed, bim, fam) or textual PLINK (ped, map) must share the same name.

See examples in class side methods. 
"
Class {
	#name : #BioShapeIt2Wrapper,
	#superclass : #BioWrapperObject,
	#category : #'BioWrappers-Popgen'
}

{ #category : #accessing }
BioShapeIt2Wrapper class >> availablePlatforms [
	" Private - See superimplementor's comment "
	
	^ #('Unix')
]

{ #category : #defaults }
BioShapeIt2Wrapper class >> defaultProgramName [
	" Answer a <String> "

	^ self shapeIt 
]

{ #category : #accessing }
BioShapeIt2Wrapper class >> description [

	^ 'SHAPEIT is a fast and accurate method for estimation of haplotypes (aka phasing) from genotype or sequencing data.

SHAPEIT is primarily a tool for inferring haplotypes from SNP genotypes. It takes as input a set of genotypes and a genetic map, and produces as output, either a single set of estimated haplotypes, or a haplotype graph that encapsulates the uncertainty about the underlying haplotypes.'
]

{ #category : #examples }
BioShapeIt2Wrapper class >> example1 [
	" Check with binarized PLINK input files "

	BioShapeIt2Wrapper new
		inputBinarized: 'filter_Brangus';
		outputMax: 'brangus';
		thread: 8;
		execute
]

{ #category : #examples }
BioShapeIt2Wrapper class >> example2 [
	" Check with binarized PLINK input files "

	BioShapeIt2Wrapper new
		inputBinarized: 'filter_Brangus';
		outputMax: 'brangus';
		thread: 8;
		execute
]

{ #category : #accessing }
BioShapeIt2Wrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'SHAPEIT2'
]

{ #category : #accessing }
BioShapeIt2Wrapper class >> url [

	^ 'http://www.shapeit.fr/'
]

{ #category : #'properties - mcmc' }
BioShapeIt2Wrapper >> burn: aNumber [
	" Default (=7). Number of burn-in MCMC iterations."
	
	self propertyAt: 'burn' put: aNumber.

]

{ #category : #'properties - model' }
BioShapeIt2Wrapper >> effectiveSize: anInteger [
	" Private - Set the effective size of the population "

	self propertyAt: 'effective-size' put: anInteger
]

{ #category : #private }
BioShapeIt2Wrapper >> execSelectorForUnix [
	" Private - Answer a <Symbol> representing a selector for performing a message in a Unix-box "
	
	^ #executeMonitoring:


]

{ #category : #'properties - model' }
BioShapeIt2Wrapper >> hiddenStatesNrHamming: anInteger [
	" Private - Set the number of hidden states used for phasing (selected using Hamming distance) "

	self propertyAt: 'S' put: anInteger
]

{ #category : #'properties - model' }
BioShapeIt2Wrapper >> hiddenStatesNrPerfectMatch: anInteger [
	" Private - Set the number of hidden states used for phasing (selected using perfect match maximisation ) "

	self propertyAt: 'states-pmatch' put: anInteger
]

{ #category : #'properties - model' }
BioShapeIt2Wrapper >> hiddenStatesNrRandom: anInteger [
	" Private - Set the number of hidden states used for phasing (selected at random) "

	self propertyAt: 'states-random' put: anInteger
]

{ #category : #'properties - input' }
BioShapeIt2Wrapper >> inputBinarized: inputFilename [  
	" Set bed, bim, fam input all at once to be fileName "

	self propertyAt: 'B' put: inputFilename
]

{ #category : #'properties - input' }
BioShapeIt2Wrapper >> inputMap: inputMapFilename [ 
	" Set input MAP file to be inputMapFilename "

	self propertyAt: 'M' put: inputMapFilename
]

{ #category : #'properties - input' }
BioShapeIt2Wrapper >> inputTextual: inputFilename [ 
	" Set ped, map input all at once to be fileName "

	self propertyAt: 'P' put: inputFilename
]

{ #category : #'properties - mcmc' }
BioShapeIt2Wrapper >> main: aNumber [
	" Default (=20). Number of main MCMC iterations."
	
	self propertyAt: 'main' put: aNumber.

]

{ #category : #'properties - mcmc' }
BioShapeIt2Wrapper >> noMcmc: aNumber [
	" No MCMC iterations."
	
	self propertyAt: 'no-mcmc' put: aNumber.

]

{ #category : #'properties - output' }
BioShapeIt2Wrapper >> outputGraph: outputGraphFilename [ 
	" Set Phased haplotypes graphs in SHAPEIT binary format "

	self propertyAt: 'output-graph' put: outputGraphFilename
]

{ #category : #'properties - output' }
BioShapeIt2Wrapper >> outputMax: outputMaxFilename [ 
	" Set output best haplotypes in HAPS/SAMPLE to be outputMaxFilename "

	self propertyAt: 'O' put: outputMaxFilename
]

{ #category : #'accessing - private' }
BioShapeIt2Wrapper >> propertySeparator [
	" Answer a <Character> with receiver's options separator "

	^ Character space
]

{ #category : #'properties - mcmc' }
BioShapeIt2Wrapper >> prune: aNumber [
	" Default (=8). Number of pruning MCMC iterations."
	
	self propertyAt: 'prune' put: aNumber.

]

{ #category : #'properties - model' }
BioShapeIt2Wrapper >> rho: aFloat [
	" Private - Set the constant recombination rate "

	self propertyAt: 'rho' put: aFloat
]

{ #category : #'properties - model' }
BioShapeIt2Wrapper >> thread: aNumber [ 
	" Set thread to be aNumber. It is strongly adviced to use the multi-threading capabilities of SHAPEIT. "

	self propertyAt: 'T' put: aNumber
]

{ #category : #'properties - model' }
BioShapeIt2Wrapper >> windowSize: anInteger [
	" Set the mean size of the windows in which conditioning haplotypes are defined. "

	self propertyAt: 'W' put:  anInteger
]
