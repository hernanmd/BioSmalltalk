accessing
mostFrequentKmerRevComp: k mismatches: d
	" Answer a <Collection> of receiver with the most frequent k-mers of size k allowing mismatches of size d "
	" Frequent Words with Mismatches Problem
		Input : A string  Text  as well as integers  k  and  d . (You may assume  k  ≤ 12 and  d  ≤ 3.)
		Output : All most frequent  k -mers with up to  d  mismatches in  Text . "

	| counter |
	
	counter := Bag new: (4 ** k). 
	('ACGT' enumerationsOfSize: k) 
			do: [ : kmer | 
				counter 
					add: kmer 
					withOccurrences: (self sequence indicesOfSubstring: kmer mismatches: d) size + (self reverseComplement sequence indicesOfSubstring: kmer mismatches: d) size ].
	^ counter maxElements
