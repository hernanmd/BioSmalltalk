accessing - sequence features
features
	" Answer a <Collection> of receiver's <BioSeqFeature> "

	^ sequenceFeatures
		ifNil: [ sequenceFeatures := self sequenceFeaturesClass new ]