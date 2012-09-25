*BioTools
with: firstCollection with: secondCollection do: threeArgBlock
	"Evaluate threeArgBlock with corresponding elements from this firstCollection and secondCollection."
	
	( ( firstCollection size = secondCollection size ) 
		and: [ firstCollection size = self size ] ) 
			ifFalse: [ self error: 'collections all must be the same size'].
	
	1 to: self size do:
		[:index |
		threeArgBlock 
			value: (self at: index)
			value: ( firstCollection at: index )
			value: ( secondCollection at: index ) ]