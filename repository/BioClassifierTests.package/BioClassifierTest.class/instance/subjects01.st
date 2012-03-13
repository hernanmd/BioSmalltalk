accessing
subjects01
	" Answer a Collection of BioAccession objects "

	^ self featureVectors01 lines collect: [: accString | BioParser tokenizeFastaDescription: accString ]