accessing-adapters
adapterClass
	" Answer the preferred subclass for providing the receiver's services "
	
	^ self allSubclasses 
			detect: [ : cls | cls isPreferredAdapter ]
			ifNone: [ self error: 'No preferred adapters found' translated ]