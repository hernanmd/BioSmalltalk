*dhbExtensions
atColumn: columnIndex put: aValue repeat: repNumber
	"	Example: self atColumn: 1 fillWith: 'BM1818' repeat: 3
	produces
	[ 'BM1818' nil nil nil 
	'BM1818' nil nil nil 	
	'BM1818' nil nil nil 	
	nil nil nil nil 			
	nil nil nil nil ]
"
	1 to: repNumber do: [ : index | 
		self rowAt: index columnAt: columnIndex put: aValue ].

	
