accessing-private
speciesFobiddenNames
	" Private - Answer a <Collection> with receiver's not allowed Characters in a species name "
	
	^ OrderedCollection new
		add: Character cr;
		add: Character lf;
		add: $[;
		add: $];
		add: $(;
		add: $);
		add: $:;
		add: $;;
		add: $,;
		yourself