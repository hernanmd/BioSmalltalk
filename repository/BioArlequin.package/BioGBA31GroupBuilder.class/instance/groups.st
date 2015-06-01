accessing
groups
	" Answer a Collection of Arlequin groups "

	self buildHaplotypes.
	self buildGroupSamples.
	^ self buildArlequinGroups.
