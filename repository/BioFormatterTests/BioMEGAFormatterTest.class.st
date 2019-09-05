Class {
	#name : #BioMEGAFormatterTest,
	#superclass : #BioFormatterTest,
	#category : 'BioFormatterTests-Formats'
}

{ #category : #accessing }
BioMEGAFormatterTest >> formatterClass [
	
	^ BioMEGAFormatter 
]

{ #category : #'tests-accessing' }
BioMEGAFormatterTest >> testCodeTable [
]

{ #category : #accessing }
BioMEGAFormatterTest >> testDataSet01 [
	" self new testDataSet01 explore "
	^ (Array new: 4)
		at: 1 put:	'Brazil' -> (PluggableDictionary new
								add:	'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGCATATCTATTATATATTCCTTGCCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA' -> (
									OrderedCollection new 	add:
											(Dictionary new
													add: 'mol_type' -> 'genomic DNA';
													add: 'GBReference_title' -> 'Direct Submission';
													add: 'GBSeq_accession-version' -> 'AY235802.1';
													add: 'organism' -> 'Bos taurus';
													add: 'db_xref' -> 'taxon:9913';
													add: 'GBAuthor' -> 'Magee,D.';
													add: 'GBSeq_aligned-sequence'  ->
																'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGCATATCTATTATATATTCCTTGCCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
													add: 'breed' -> 'Nelore';
													add: 'note' -> 'hypervariable region';
													add: 'organelle' -> 'mitochondrion';
													add: 'isolate' -> '10';
													yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AY235801.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Magee,D.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGCATATCTATTATATATTCCTTGCCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> '8';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AY235797.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Magee,D.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGCATATCTATTATATATTCCTTGCCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> '18';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTCACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Brazil';
																		add: 'GBSeq_accession-version' -> 'FJ815728.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTCACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Caracu';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CAR827';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACTTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTGGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Brazil';
																		add: 'GBSeq_accession-version' -> 'FJ815723.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACTTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTGGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Caracu';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CAR804';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AY235800.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Magee,D.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACTTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTGGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> '7';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AY235799.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Magee,D.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACTTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTGGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> '5';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AY235792.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Magee,D.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACTTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTGGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> '24';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Brazil';
																		add: 'GBSeq_accession-version' -> 'FJ815729.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Caracu';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CAR858';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Brazil';
																		add: 'GBSeq_accession-version' -> 'FJ815727.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Caracu';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CAR825';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Brazil';
																		add: 'GBSeq_accession-version' -> 'FJ815725.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Caracu';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CAR816';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Brazil';
																		add: 'GBSeq_accession-version' -> 'EF431953.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Liron,J.P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'first hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'Nel2';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AY235803.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Magee,D.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> '12';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AY235796.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Magee,D.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> '19';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AY235794.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Magee,D.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> '21';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AY235793.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Magee,D.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> '22';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AY235790.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Magee,D.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Nelore';
																		add: 'note' -> 'hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> '27';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAAGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Brazil';
																		add: 'GBSeq_accession-version' -> 'FJ815722.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAAGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Caracu';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CAR793';
																		yourself);
														yourself);
								yourself);
		at: 2
			put:
				'Uruguay'
						->
							(PluggableDictionary new
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTACAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'EF094977.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTACAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr3';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Uruguay';
																		add: 'GBSeq_accession-version' -> 'EU121520.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Garcia,P.P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region; control region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1-K';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Uruguay';
																		add: 'GBSeq_accession-version' -> 'EU121519.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region; control region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1-J';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Uruguay';
																		add: 'GBSeq_accession-version' -> 'EU121518.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region; control region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1-I';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Uruguay';
																		add: 'GBSeq_accession-version' -> 'EU121517.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region; control region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1-H';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Uruguay';
																		add: 'GBSeq_accession-version' -> 'EU121516.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region; control region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1-G';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Uruguay';
																		add: 'GBSeq_accession-version' -> 'EU121515.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region; control region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1-F';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Uruguay';
																		add: 'GBSeq_accession-version' -> 'EU121514.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region; control region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1-E';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Uruguay';
																		add: 'GBSeq_accession-version' -> 'EU121513.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region; control region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1-d';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Uruguay';
																		add: 'GBSeq_accession-version' -> 'EU121512.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region; control region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1-c';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Uruguay';
																		add: 'GBSeq_accession-version' -> 'EU121511.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region; control region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1-b';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'EF094975.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'JQ070349.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Giovambattista,G.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'Cur4a';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'JQ070348.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Giovambattista,G.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr1l';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'EF094976.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Peral-Garcia,P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Uruguayan Creole';
																		add: 'note' -> 'first hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CUr2';
																		yourself);
														yourself);
								yourself);
		at: 3
			put:
				'Paraguay'
						->
							(PluggableDictionary new
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATATCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Paraguay';
																		add: 'GBSeq_accession-version' -> 'FJ815829.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATATCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Pampa Chaqueno';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CCQ42';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTGGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Paraguay';
																		add: 'GBSeq_accession-version' -> 'FJ815818.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTGGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Pampa Chaqueno';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CCQ06';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Paraguay';
																		add: 'GBSeq_accession-version' -> 'FJ815823.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Pampa Chaqueno';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CCQ25';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Paraguay';
																		add: 'GBSeq_accession-version' -> 'FJ815820.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Pampa Chaqueno';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CCQ12';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Paraguay';
																		add: 'GBSeq_accession-version' -> 'FJ815822.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Pampa Chaqueno';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CCQ22';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTATCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Paraguay';
																		add: 'GBSeq_accession-version' -> 'FJ815827.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTATCA';
																		add: 'breed' -> 'Criollo Pampa Chaqueno';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CCQ37';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Paraguay';
																		add: 'GBSeq_accession-version' -> 'FJ815819.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTATCA';
																		add: 'breed' -> 'Criollo Pampa Chaqueno';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CCQ08';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Paraguay';
																		add: 'GBSeq_accession-version' -> 'FJ815816.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTATCA';
																		add: 'breed' -> 'Criollo Pampa Chaqueno';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CCQ01';
																		yourself);
														yourself);
								yourself);
		at: 4
			put:
				'Argentina'
						->
							(PluggableDictionary new
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTACAACAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815715.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTACAACAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG69';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815709.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG56';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAAGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815713.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAAGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG64';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCCATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815712.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCCATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG62';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'EU352335.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCCATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Patagonico';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CArPa1-e';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'EU352334.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCCATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Patagonico';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CArPa1-d';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'EU352333.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCCATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Patagonico';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CArPa1-c';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'EU352332.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCCATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Patagonico';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CArPa1-b';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'EF160130.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCCATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Patagonico';
																		add: 'note' -> 'control region; first hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CArPa1';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATATCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815719.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATATCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG76';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815718.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATATCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG74';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815711.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATATCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG60';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'EF160128.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATATCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'note' -> 'control region; first hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'Car2';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAATACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAGTGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AF531384.1';
																		add: 'GBXref_id' -> '10.1038/sj.hdy.6800312';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Liron,J.P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAATACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAGTGAATTTTACCA';
																		add: 'breed' -> 'Argentinean Creole';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CC2';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815717.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG72';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815716.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG70';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815714.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG67';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815710.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG59';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815708.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG52';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815707.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG51';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815706.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG45';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815705.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG44';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815704.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG41';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815702.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG19';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815701.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG13';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815699.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG06';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815697.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG01';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'EU352331.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CAr1-b';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'EF160127.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'note' -> 'control region; first hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'Car1';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'EF173656.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Patagonico';
																		add: 'note' -> 'first hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CArPa3';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AF531402.1';
																		add: 'GBXref_id' -> '10.1038/sj.hdy.6800312';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Liron,J.P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Argentinean Creole';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CC16';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AF531394.1';
																		add: 'GBXref_id' -> '10.1038/sj.hdy.6800312';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Liron,J.P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Argentinean Creole';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CC9';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AF531392.1';
																		add: 'GBXref_id' -> '10.1038/sj.hdy.6800312';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Liron,J.P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Argentinean Creole';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CC8';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'AF531381.1';
																		add: 'GBXref_id' -> '10.1038/sj.hdy.6800312';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Liron,J.P.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Argentinean Creole';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CC1';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACTTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAAGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'EU352336.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACTTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAAGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Criollo Patagonico';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CArPa2-b';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'EF173655.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACTTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATCCTTGATAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAAGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Criollo Patagonico';
																		add: 'note' -> 'first hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'CArPa2';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'GBSeq_accession-version' -> 'EF160129.1';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Posik,D.M.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGATAGTATATCTATTATATATTTCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTAGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAACTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'note' -> 'control region; first hypervariable region';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'Car3';
																		yourself);
														yourself);
								add:
										'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTGGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA'
												->
													(OrderedCollection new
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815700.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTGGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG09';
																		yourself);
														add:
																(Dictionary new
																		add: 'mol_type' -> 'genomic DNA';
																		add: 'GBReference_title' -> 'Direct Submission';
																		add: 'country' -> 'Argentina';
																		add: 'GBSeq_accession-version' -> 'FJ815698.1';
																		add: 'GBXref_id' -> '10.1111/j.1365-2052.2009.01976.x';
																		add: 'organism' -> 'Bos taurus';
																		add: 'db_xref' -> 'taxon:9913';
																		add: 'GBAuthor' -> 'Penedo,M.C.T.';
																		add:
																				'GBSeq_aligned-sequence'
																						->
																							'CCCCATGCATATAAGCAAGTACATGACCTCTATAGCAGTACATAATACATATAATTATTGACTGTACATAGTACATTATGTCAAATTCATTCTTGACAGTATATCTATTATATATTCCTTACCATTAGATCACGAGCTTAATTACCATGCCGCGTGAAACCAGCAACCCGCTGGGCAGGGATCCCTCTTCTCGCTCCGGGCCCATAAACCGTGGGGGTCGCTATCCAATGAATTTTACCA';
																		add: 'breed' -> 'Criollo Argentino';
																		add: 'organelle' -> 'mitochondrion';
																		add: 'isolate' -> 'ARG03';
																		yourself);
														yourself);
								yourself);
		yourself
]

{ #category : #'tests-exporting' }
BioMEGAFormatterTest >> testExport [

	| results |
	self formatter: self formatterClass forDataTypeDNA.
	self formatter alignments: self testDataSet01.
	results := self formatter export.
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter outputFilename notNil.
	self assert: (BioObject fileExists: self formatter outputFilename).
	BioObject removeFileNamed: self formatter outputFilename.


]

{ #category : #'tests-exporting' }
BioMEGAFormatterTest >> testExportHeader [
]

{ #category : #testing }
BioMEGAFormatterTest >> testForDataTypeDNA [
	self formatter: self formatterClass forDataTypeDNA.
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter formatType equals: 'DNA'
]

{ #category : #testing }
BioMEGAFormatterTest >> testForDataTypeDistance [
	self formatter: self formatterClass forDataTypeDistance.
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter formatType equals: 'Distance'
]

{ #category : #testing }
BioMEGAFormatterTest >> testForDataTypeNucleotide [
	self formatter: self formatterClass forDataTypeNucleotide.
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter formatType equals: 'Nucleotide'
]

{ #category : #testing }
BioMEGAFormatterTest >> testForDataTypeProtein [
	self formatter: self formatterClass forDataTypeProtein.
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter formatType equals: 'Protein'
]

{ #category : #testing }
BioMEGAFormatterTest >> testForDataTypeRNA [
	self formatter: self formatterClass forDataTypeRNA.
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter formatType equals: 'RNA'
]

{ #category : #testing }
BioMEGAFormatterTest >> testFormatExtension [

	self assert: (self formatterClass formatExtension isKindOf: String).

]
