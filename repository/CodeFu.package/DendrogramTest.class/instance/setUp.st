fixture
setUp

	| ab cd ef abcd efg |
	ab := (	Dendrogram with: #a) merge: (Dendrogram with: #b) at: 1.
	cd := (Dendrogram with: #c) merge: (Dendrogram with: #d) at: 2.
	ef := (Dendrogram with: #e) merge: (Dendrogram with: #f) at: 3.
	abcd := ab merge: cd at: 4.
	efg := ef merge: (Dendrogram with: #g) at: 5.
	dendrogram := abcd merge: efg at: 7.

	"#(((a 1 b) 4 (c 2 d)) 7 ((e 3 f) 5 g))"