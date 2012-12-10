accumulate
from: start to: end do: aBlock

	start to: end do: [ :each |
		self accumulate: (aBlock value: each)
	].
	^value