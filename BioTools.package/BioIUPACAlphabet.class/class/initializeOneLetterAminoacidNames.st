initialize-release
initializeOneLetterAminoacidNames
	" Private - Answer the one letter mapping from Characters to aminoacid names. "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ Dictionary new 
		at: $A put: 'Alanine';
		at: $R put: 'Arginine';
		at: $N put: 'Asparagine';
		at: $D put: 'Aspartic Acid';
		at: $C put: 'Cysteine';
		at: $E put: 'Glutamic Acid';
		at: $Q put: 'Glutamine';
		at: $G put: 'Glycine';
		at: $H put: 'Histidine';
		at: $I put: 'Isoleucine';
		at: $L put: 'Leucine';
		at: $K put: 'Lysine';
		at: $M put: 'Methionine';
		at: $F put: 'Phenylalanine';
		at: $P put: 'Proline';
		at: $S put: 'Serine';
		at: $T put: 'Threonine';
		at: $W put: 'Tryptophan';
		at: $Y put: 'Tyrosine';
		at: $V put: 'Valine';
		yourself