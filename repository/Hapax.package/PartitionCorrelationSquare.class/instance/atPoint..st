displaying
atPoint: here
	"Attention - this implementation of atPoint: adheres to the Shape
	protocol and NOT to the matrix protocol!"
	
	here < self dimension ifFalse: [ ^nil ].
	^Array with: (items at: here x + 1) with: (items at: here y + 1)