creation
openInBrowser

	| file |
	file := self  make: #svg.
	file := self writeHtmlSvgFor: file.

	Win32Shell new shellOpen: file