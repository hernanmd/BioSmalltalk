accessing
dnaMwSingleLinear
	| mw_direct_strand |

	(mw_direct_strand := self molecularWeight) size = 1
		ifTrue: [ 
			| mw |
			mw := mw_direct_strand at: 1.
"			mw = mw.toFixed(2)."
			^ mw , ' Da' ]
		ifFalse: [ 
			mw_direct_strand size = 2
				ifTrue: [ 
					| mw_lower mw_upper |
					mw_lower := mw_direct_strand at: 1.
					mw_upper := mw_direct_strand at: 2.
"					mw_lower = mw_lower.toFixed(2).
					mw_upper = mw_upper.toFixed(2).
"					^ mw_lower , ' to ' , mw_upper , ' Da' ] ]		
