example
deer90
	"(((	self deer90	)))"

	| data corpus |
	data := #(	( c1 'Human machine interface for Lab ABC computer applications' )
		( c2 'A survey of user opinion of computer system response time' )
		( c3 'The EPS user interface management system' )
		( c4 'System and human system engineering testing of EPS' )
		( c5 'Relation of user-perceived response time to error measurement' )
		( m1 'The generation of random, binary, unordered trees' )
		( m2 'The intersection graph of paths in trees' )
		( m3 'Graph minors IV: Widths of trees and well-quasi-ordering' )
		( m4 'Graph minors: A survey' ) ).
	corpus := Corpus new.
	data do: [ :each |
		corpus addDocument: each first with: (Terms fromString: each last) ].
	^corpus