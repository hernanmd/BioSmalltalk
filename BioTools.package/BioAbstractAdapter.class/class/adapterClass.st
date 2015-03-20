accessing-adapters
adapterClass
	" Answer the preferred subclass for providing the receiver's services "
	
	^ self validAdapters 
			detect: [ : cls | cls isPreferredAdapter ]
			ifNone: [ self validAdapters first ]