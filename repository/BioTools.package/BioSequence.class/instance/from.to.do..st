accessing
from: start to: stop do: aClosure
	" Evaluate aBlock for all elements between start and stop (inclusive). "
	
	^ self sequence from: start to: stop do: aClosure	
