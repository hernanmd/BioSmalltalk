"
Wrapper for the GBK2FAS conversion tool. Converts GenBank format files to FASTA format.
"
Class {
	#name : 'BioGbk2FasWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Programs',
	#package : 'BioWrappers',
	#tag : 'Programs'
}

{ #category : 'accessing' }
BioGbk2FasWrapper >> defaultProgramName [

	^ (self scriptsFullDirectoryName / 'gbk2fas.sed') fullName
]
