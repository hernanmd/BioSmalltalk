Class {
	#name : #BioGbk2FasWrapper,
	#superclass : #BioWrapperObject,
	#category : 'BioWrappers-Programs'
}

{ #category : #accessing }
BioGbk2FasWrapper >> defaultProgramName [

	^ (self scriptsFullDirectoryName / 'gbk2fas.sed') fullName
]
