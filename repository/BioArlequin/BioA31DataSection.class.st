Class {
	#name : #BioA31DataSection,
	#superclass : #BioA31INISection,
	#category : 'BioArlequin-Sections'
}

{ #category : #accessing }
BioA31DataSection class >> notation [
	" Answer a String describing the receiver's section identifier "
	
	^ 'Data'
]

{ #category : #subsections }
BioA31DataSection >> sampleSubsection [
	" Answer a samples subsection object for adding and removing samples "

	^ self 
		at: self class notation
		ifAbsentPut: [ 
			BioA31SamplesSection 
				named: BioA31SamplesSection notation
				on: self iniFile ].
	

]

{ #category : #subsections }
BioA31DataSection >> structureSubsection [
	" Answer a samples subsection object for adding and removing samples "

	^ self 
		at: self class notation
		ifAbsentPut: [ 
			BioA31StructureSection 
				named: BioA31StructureSection notation
				on: self iniFile ].
	

]
