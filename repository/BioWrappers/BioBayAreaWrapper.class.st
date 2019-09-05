"
BayArea infers the biogeographic histories of taxa sharing a phylogeny, using Markov chain Monte Carlo (MCMC) to approximate the joint posterior of biogeographic histories and range evolution parameters given presence-absence (binary) data and a time-calibrated phylogeny. BioBayArea is a wrapper for the open-source software program written in C++.


"
Class {
	#name : #BioBayAreaWrapper,
	#superclass : #BioWrapperObject,
	#category : 'BioWrappers-Programs'
}

{ #category : #programs }
BioBayAreaWrapper class >> bayArea [
	" Answer a <String> with the command line name "

	^ 'bayarea'
]

{ #category : #defaults }
BioBayAreaWrapper class >> defaultProgramName [
	" Answer a <String> "

	^ self bayArea
]

{ #category : #testing }
BioBayAreaWrapper class >> testFilesFullDirectoryName [
	" See superimplementor's comment "

	^ super testFilesFullDirectoryName / 'bayarea'
]

{ #category : #'properties - input/output' }
BioBayAreaWrapper >> areaFileName: fileName [  
	" Set the data le containing presence-absence data for all taxa "

	self propertyAt: 'areaFileName' ifAbsentPut: [ fileName ]
]

{ #category : #'properties - analysis settings' }
BioBayAreaWrapper >> areaProposalTuner: aFloat [  
	" Set the the number of areas sampled for a history update is Poisson-distributed with rate equal to this value multiplied by the number of areas in the analysis.
The value must be between 0 and 1. Adjust this value if you find your MCMC mixes slowly. "

	self propertyAt: 'areaProposalTuner' ifAbsentPut: [ aFloat ]
]

{ #category : #programs }
BioBayAreaWrapper >> bayArea [
	" Answer a <String> with the command line name "

	^ self class bayarea
]

{ #category : #'properties - analysis settings' }
BioBayAreaWrapper >> chainBurnIn: aNumber [  
	" Set the first MCMC cycle sampling point for .parameters.txt and .area states.txt "

	self propertyAt: 'chainBurnIn' ifAbsentPut: [ aNumber ]
]

{ #category : #'properties - analysis settings' }
BioBayAreaWrapper >> chainLength: aNumber [  
	" Set the number of MCMC cycles "

	self propertyAt: 'chainLength' ifAbsentPut: [ aNumber ]
]

{ #category : #programs }
BioBayAreaWrapper >> defaultProgramName [ 
	" Private - See superimplementor's comment "

	^ self programNamed: self bayArea
]

{ #category : #'properties - analysis settings' }
BioBayAreaWrapper >> distancePowerPrior: aFloat [  
	" Set the scale parameter for Cauchy with location 0 "

	self propertyAt: 'distancePowerPrior' ifAbsentPut: [ aFloat ]
]

{ #category : #'properties - analysis settings' }
BioBayAreaWrapper >> gainPrior: aFloat [  
	" Set the scale parameter for half-Cauchy with location 0 "

	self propertyAt: 'gainPrior' ifAbsentPut: [ aFloat ]
]

{ #category : #'options - analysis settings' }
BioBayAreaWrapper >> geoDistancePowerPositiveSet [
	" Do not constrains the distance power parameter to be positive when True. This may lead to more sensible parameter inferences when range data are sparse and global. "

	self propertyAt: 'geoDistancePowerPositive' ifAbsentPut: [ 'T' ]

]

{ #category : #'options - analysis settings' }
BioBayAreaWrapper >> geoDistancePowerPositiveUnset [
	" Constrains the distance power parameter to be positive when True. This may lead to more sensible parameter inferences when range data are sparse and global. "

	self propertyAt: 'geoDistancePowerPositive' ifAbsentPut: [ 'F' ]

]

{ #category : #'properties - input/output' }
BioBayAreaWrapper >> geoFileName: fileName [  
	" Set the geography le containing latitudes and longitudes "

	self propertyAt: 'geoFileName' ifAbsentPut: [ fileName ]
]

{ #category : #'options - analysis settings' }
BioBayAreaWrapper >> guessInitialRatesSet [
	" Use heuristic to initialize MCMC area loss/gain rates "

	self propertyAt: 'guessInitialRates' ifAbsentPut: [ 'T' ]

]

{ #category : #'options - analysis settings' }
BioBayAreaWrapper >> guessInitialRatesUnset [
	" Do not use heuristic to initialize MCMC area loss/gain rates "

	self propertyAt: 'guessInitialRates' ifAbsentPut: [ 'F' ]

]

{ #category : #'properties - input/output' }
BioBayAreaWrapper >> historySampleFrequency: aNumber [  
	" Set the MCMC sample frequency to populate the .area states.txt, .area probs.txt, and .nhxfiles "

	self propertyAt: 'historySampleFrequency' ifAbsentPut: [ aNumber ]
]

{ #category : #'properties - input/output' }
BioBayAreaWrapper >> inputFilePath: directoryName [  
	" Set the directory name <String> for input files "

	self propertyAt: 'inputFilePath' ifAbsentPut: [ directoryName ]
]

{ #category : #'properties - analysis settings' }
BioBayAreaWrapper >> lossPrior: aFloat [  
	" Set the scale parameter for half-Cauchy with location 0 "

	self propertyAt: 'lossPrior' ifAbsentPut: [ aFloat ]
]

{ #category : #'properties - input/output' }
BioBayAreaWrapper >> outputFilePath: directoryName [  
	" Set the directory name <String> for output files "

	self propertyAt: 'outputFilePath' ifAbsentPut: [ directoryName ]
]

{ #category : #'properties - input/output' }
BioBayAreaWrapper >> outputPrefix: prefixName [  
	" Set the analysis prefix name <String> for all output files "

	self propertyAt: 'outputPrefix' ifAbsentPut: [ prefixName ]

]

{ #category : #'options - input/output' }
BioBayAreaWrapper >> outputTimestampSet [
	" Append timestamp string to output prefix "

	self propertyAt: 'outputTimestamp' ifAbsentPut: [ 'T' ]

]

{ #category : #'options - input/output' }
BioBayAreaWrapper >> outputTimestampUnset [
	" Append timestamp string to output prefix "

	self propertyAt: 'outputTimestamp' ifAbsentPut: [ 'F' ]

]

{ #category : #'properties - input/output' }
BioBayAreaWrapper >> parameterSampleFrequency: aNumber [  
	" Set the MCMC sample frequency to populate the .parameters.txt file "

	self propertyAt: 'parameterSampleFrequency' ifAbsentPut: [ aNumber ]
]

{ #category : #'properties - input/output' }
BioBayAreaWrapper >> printFrequency: aNumber [  
	" Set the print frequency to the screen "

	self propertyAt: 'printFrequency' ifAbsentPut: [ aNumber ]
]

{ #category : #'properties - analysis settings' }
BioBayAreaWrapper >> probBurnIn: aNumber [  
	" Set the First MCMC cycle sampling point for .area probs.txt and .nhx (Note: For these files to be reflective of the posterior, the chain mustfirst burn-in { i.e. a small probBurnIn will give inaccurate results.) "

	self propertyAt: 'probBurnIn' ifAbsentPut: [ aNumber ]
]

{ #category : #'properties - analysis settings' }
BioBayAreaWrapper >> seed: aNumber [  
	" Set the random number generator seed "

	self propertyAt: 'seed' ifAbsentPut: [ aNumber ]
]

{ #category : #'options - analysis settings' }
BioBayAreaWrapper >> setModelTypeDistanceNorm [
	" Set DISTANCE_NORM as the likelihood model to use. "

	self propertyAt: 'modelType' ifAbsentPut: [ '3' ]

]

{ #category : #'options - analysis settings' }
BioBayAreaWrapper >> setModelTypeIndependence [
	" Set Independence as the likelihood model to use. "

	self propertyAt: 'modelType' ifAbsentPut: [ '1' ]

]

{ #category : #'properties - input/output' }
BioBayAreaWrapper >> treeFileName: fileName [  
	" Set the tree file containing the Newick string "

	self propertyAt: 'treeFileName' ifAbsentPut: [ fileName ]
]
