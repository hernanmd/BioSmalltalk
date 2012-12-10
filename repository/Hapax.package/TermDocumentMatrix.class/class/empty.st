instance creation
empty

	| tdm |
	tdm := super on: SparseRowMatrix new.
	tdm initialize.
	^tdm