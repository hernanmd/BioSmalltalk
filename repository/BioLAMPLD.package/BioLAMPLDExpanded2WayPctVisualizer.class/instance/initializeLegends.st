initialization
initializeLegends

	| lb |
	
	lb := RTLegendBuilder new.
	lb view: self grapher view.
	lb addColor: Color blue text: 'Angus'.
	lb addColor: Color red text: 'Brahman'.
	"lb addColor: Color black text: 'Admixed population'."
	lb build.

	self grapher axisX title: self axisXTitle.
	self grapher axisY title: self axisYTitle.