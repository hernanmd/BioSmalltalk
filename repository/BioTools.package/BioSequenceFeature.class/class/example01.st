examples
example01
	" Based in BioPerl example : http://lab.stajich.org/presentations/stajich_2006_Bioperl_I.pdf "

	^ self new
		start: 10;
		end: 20;
		strand: 1;
		name: 'hs.1';
		primaryTag: 'CDS';
		sourceTag: 'genscan';
		score: 30;
		tag: ('Parent' -> 'Gene1');
		yourself