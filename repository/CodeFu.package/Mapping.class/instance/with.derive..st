converting
with: aCollection derive: aBlock 

	^self derive: [ :index | aBlock value: (aCollection at: index) ]