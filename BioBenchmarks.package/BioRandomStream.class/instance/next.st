accessing
next

	| r |

	r := random next.
	repeatPtr := repeatPtr + 1.
	1 to: percentages size do: [ : i |
		(r < (percentages at: i)) ifTrue: [ ^ collection at: i ] ]