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
