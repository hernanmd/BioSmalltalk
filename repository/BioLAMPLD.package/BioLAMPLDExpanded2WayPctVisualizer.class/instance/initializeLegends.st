initialization
initializeLegends

	| lb |
	
	lb := RTLegendBuilder new.
	lb view: self grapher view.
	lb addColor: self population1Color text: self population1Name.
	lb addColor: self population2Color text: self population2Name.
	"lb addColor: Color black text: 'Admixed population'."
	lb build.
