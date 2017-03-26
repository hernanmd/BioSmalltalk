private
findMaxChrNum
	" Answer <Number> representing the maximum chromosome number for the receiver's configured organism. If none found, then answer Human default "
	
	^ self options 
		detect: [ : opt | self validOrganisms includes: opt ]
		ifFound: [ : o | o maxChrNum ]
		ifNone: [ 23 ]