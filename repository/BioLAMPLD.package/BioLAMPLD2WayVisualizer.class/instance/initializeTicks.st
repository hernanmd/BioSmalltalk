initialization
initializeTicks

	self grapher axisX 
		title: self axisXTitle;
		numberOfTicks: self numberOfXTicks;
		numberOfLabels: self numberOfXLabels.
	self grapher axisY 
		title: self axisYTitle;
		numberOfTicks: self numberOfYTicks
