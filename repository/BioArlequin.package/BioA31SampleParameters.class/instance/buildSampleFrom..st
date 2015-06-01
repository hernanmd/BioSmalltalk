private
buildSampleFrom: assoc

	identifiers add: (self newIdFor: assoc value).
	frequencies add: (self frequenciesFor: assoc value).
"	sequences add: assoc key"