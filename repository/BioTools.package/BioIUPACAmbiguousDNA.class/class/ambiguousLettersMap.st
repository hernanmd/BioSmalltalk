accessing
ambiguousLettersMap
	" Answer a <Dictionary> with mappings between ambiguity codes. Note ambiguity codes could appear as:	
	[AT]
	[A/T]
	W
	"

	^ Dictionary new
		add: 'AT' -> 'W';
		add: 'TA' -> 'W';
		add: 'CG' -> 'S';
		add: 'GC' -> 'S';
		add: 'AC' -> 'M';
		add: 'CA' -> 'M';
		add: 'GT' -> 'K';
		add: 'TG' -> 'K';		
		add: 'AG' -> 'R';
		add: 'GA' -> 'R';		
		add: 'CT' -> 'Y';
		add: 'TC' -> 'Y';
		
		add: 'CGT' -> 'B';
		add: 'CTG' -> 'B';
		add: 'GCT' -> 'B';
		add: 'GTC' -> 'B';
		add: 'TGC' -> 'B';
		add: 'TCG' -> 'B';
		
		add: 'AGT' -> 'D';
		add: 'ATG' -> 'D';
		add: 'GAT' -> 'D';
		add: 'GTA' -> 'D';
		add: 'TGA' -> 'D';
		add: 'TCA' -> 'D';
		
		add: 'CAT' -> 'H';
		add: 'CTA' -> 'H';
		add: 'ACT' -> 'H';
		add: 'ATC' -> 'H';
		add: 'TAC' -> 'H';
		add: 'TCA' -> 'H';
		
		add: 'CGA' -> 'V';
		add: 'CAG' -> 'V';
		add: 'GCA' -> 'V';
		add: 'GAC' -> 'V';
		add: 'AGC' -> 'V';
		add: 'ACG' -> 'V';
		
		yourself.
