"
A null-object implementation of BioConsensusStrategy. Used as a placeholder when no consensus calculation strategy is needed, returning default or empty values.
"
Class {
	#name : 'BioDummyConsensusStrategy',
	#superclass : 'BioConsensusStrategy',
	#category : 'BioTools-Helpers',
	#package : 'BioTools',
	#tag : 'Helpers'
}

{ #category : 'accessing' }
BioDummyConsensusStrategy >> consensusAt: aString [

	^ 'ACGTUN-' detectMax: [ : letter | aString instancesOf: letter ]
]
