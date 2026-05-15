"
Represents the ALU repeats database in the NCBI system. Provides access to ALU repeat annotation records.
"
Class {
	#name : 'BioNCBIALURepeats',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIALURepeats class >> dbName [

	^ 'alu_repeats'
]

{ #category : 'accessing' }
BioNCBIALURepeats class >> description [

	^ 'Human ALU repeat elements: ' , self dbName
]
