sorting
at: anIndex put: singularTriplet
	"comment stating purpose of message"

	U columnAt: anIndex put: (singularTriplet at: 1).
	S at: anIndex put: (singularTriplet at: 2).
	V columnAt: anIndex put: (singularTriplet at: 3).