instance creation
rows: m columns: n
	"Create a new matrix with m rows and n columns."

	^(self basicNew) 
		initializeRows: m columns: n;
		yourself