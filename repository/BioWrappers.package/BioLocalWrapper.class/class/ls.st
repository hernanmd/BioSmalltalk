instance creation
ls
	" List contents of current image directory "
	
	^ self new
		programName: 'dir';
		execute
		