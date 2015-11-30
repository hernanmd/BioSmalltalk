private
configureGrapher
	" Answer a new grapher for the receiver's data values "

	grapher := RTGrapher new.
	grapher extent: self extent. 
	grapher add: self configureDataSet.
	grapher axisX title: self axisXTitle. 
	grapher axisY title: self axisYTitle.
	^ grapher
