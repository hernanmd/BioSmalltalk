exporting
exportFromAlignment: aBioAlignment

	aBioAlignment associationsDo: [ : assoc |
		self exportGroup: assoc. ]
