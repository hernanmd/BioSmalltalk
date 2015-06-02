private
buildSampleFrom: assoc
	" Building samples uses currently the HaplotypeDefinition format "

	identifiers add: (self groupBuilder atSequence: assoc key).
	frequencies add: assoc value size.
"	sequences add: assoc key"