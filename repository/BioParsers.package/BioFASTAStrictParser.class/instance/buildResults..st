accessing private
buildResults: aCollection
	" Answer an identified object for the receiver's parsing output "

	results := BioFastaMultiRecord from: ( aCollection collect: #first )