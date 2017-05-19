accessing - sequence features
sequenceFeaturesClass
	" Private - Answer the <Class> used to store sequence features "
	
	^ sequenceFeaturesClass
		ifNil: [ sequenceFeaturesClass := self defaultSequenceFeaturesClass ] 