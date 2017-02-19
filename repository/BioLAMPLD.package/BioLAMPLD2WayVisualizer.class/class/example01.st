examples
example01
	" Read expanded output file and positions file "

	self new
		lineWidth: 0.75;
		posFile: 'positions_mb.pos';
		population1Name: 'Angus' color: Color red;
		population2Name: 'Brahman' color: Color blue;
		readExpanded: 'postlampld_ws-100.txt' title: 'Angus versus Brahman';
		open.