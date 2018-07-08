accessing
buildFrequencies: k
	" Generates a frequency array by first initializing every element in the frequency array to zero (4k operations) and then making a single pass down receiver's sequence (approximately |sequence size| · k operations). 
	For each k-mer Pattern that we encounter, we add 1 to the value of the frequency array corresponding to Pattern "
	| freqArray j |
	
	freqArray := (Array new: self alphabet size ** k) atAllPut: 0.
	1 to: self size - k + 1 do: [ : i |
		| pattern |
		pattern := self copyFrom: i to: k + i - 1.
		j := self indexOfPattern: pattern.
		freqArray at: j put: (freqArray at: j) + 1 ].
	^ freqArray 