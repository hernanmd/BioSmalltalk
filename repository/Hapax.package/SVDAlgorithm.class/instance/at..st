sorting
at: anIndex
	"comment stating purpose of message"

	^Array with: (U columnAt: anIndex) asArray with: (S at: anIndex) with: (V columnAt: anIndex) asArray.