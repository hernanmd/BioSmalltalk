constants
defaultColors

	^#(
			red
			blue
			cyan
			green
			orange

			darkMagenta
			magenta
			yellow
			purple

			darkGreen
			orange
			pink
			olive
			gray

	) collect: [ :each | ColorValue perform: each ].