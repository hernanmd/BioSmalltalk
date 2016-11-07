*BioPharo4
skipHeader: n
	" Read a record n times, presumably a header, with the intention of skipping it.
	This should normally be called only at the beginning and only once.
	This sets the fieldCount (but fieldAccessors overrides fieldCount)."

	n timesRepeat: [ self readHeader ]