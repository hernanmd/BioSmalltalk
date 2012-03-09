*BioTools
with: firstCollection with: sndCollection do: threeArgBlock
	"Evaluate threeArgBlock with corresponding elements from this firstCollection and sndCollection."
	
	( ( firstCollection size = sndCollection size ) 
		and: [ firstCollection size = self size ] ) 
			ifFalse: [ self error: 'collections all must be the same size'].
	
	1 to: self size do:
		[:index |
		threeArgBlock 
			value: (self at: index)
			value: ( firstCollection at: index )
			value: ( sndCollection at: index ) ]