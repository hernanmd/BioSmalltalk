Extension { #name : #SequenceableCollection }

{ #category : #'*BioTools' }
SequenceableCollection >> asFastaRecord [
	" Answer a <BioFastaRecord> "
	
	^ (BioFastaRecord 
			named: self first last 
			sequence: self second)
				addIdentifiers: self first;
				yourself
	
]

{ #category : #'*BioTools' }
SequenceableCollection >> asFileDirectoryCollection [

	^ BioFileCollection withAll: self
]

{ #category : #'*BioTools' }
SequenceableCollection >> rejectFromBioAlignment: aBioAlignment [
	" Receiver represents a <Collection> of taxa (<String>) used to filter aBioAlignment "

	^ self flatCollect: [ : taxa | taxa rejectFromBioAlignment: aBioAlignment ]
]

{ #category : #'*BioTools' }
SequenceableCollection >> setMicrosatelliteGenotypeFor: aBioMicrosatellite [
	" Set the receiver's first two elements as the allele size range of aBioMicrosatellite "

	aBioMicrosatellite
		start: self first;
		end: self second.
]
