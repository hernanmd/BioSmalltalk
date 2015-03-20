A Matrix formatter is a generic writer for matrix objects. For example to export a matrix where each row is delimited by spaces evaluate:

| myMatrixWriter |

myMatrixWriter := (BioMatrixFormatter new initMatrixRows: 10 columns: 2)
	atColumn: 1 fillWith: (BioObject generate: 1 repeat: 10);
	atColumn: 2 fillWith: ((1 to: 10) collect: #asNumber);
	yourself.
myMatrixWriter exportMatrix.

Subclasses should override the 'exporting' protocol accordingly to their specific matrix formatting.

Instance Variables:
	matrix	<DhbMatrix>
	