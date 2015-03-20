populating
atColumn: colNumber fillWith: aValue repeat: repNumber
	" Repeat repNumber times, aValue in column colNumber 
	Example: self atColumn: 1 fillWith: 'BM1818' repeat: 3
	produces
	[ 'BM1818' nil nil nil 
	'BM1818' nil nil nil 	
	'BM1818' nil nil nil 	
	nil nil nil nil 			
	nil nil nil nil ]
	"
	aValue 
		fillMatrix: self matrix 
		atColumn: colNumber 
		repeat: repNumber
