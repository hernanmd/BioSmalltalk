convenience
expected: m probabilitySeqOfSize: n patternLength: k alphabetSize: a occurrences: t
	" Answer a <Float> representing the expected k-mer occurrences in m (random) strings of length n formed from an alphabet of a letters.
	n = Length of each String.
	k = Length of pattern sequence (k-mer).
	a = Alphabet size (Number of letters in alphabet).
	t = Number of times where pattern appears.
	"
	
	^ ((n - (t * (k - 1)) choose:  t) / (a raisedTo: (t * k))) asFloat * m