initialize-release
initializeThreeLetterNucleotideNames

	^ Dictionary new 
		add: 'Ade' -> 'Adenine';
		add: 'Thy' -> 'Thymine';
		add: 'Gua' -> 'Guanine';
		add: 'Cyt' -> 'Cytosine';
		yourself