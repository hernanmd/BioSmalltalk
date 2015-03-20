accessing
results

	^ results
		ifNil: [ results := OrderedCollection new: self uids size ]