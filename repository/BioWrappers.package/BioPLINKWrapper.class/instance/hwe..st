properties - filtering
hwe: pValue
	" Removes variants with Hardy-Weinberg equilibrium exact test p-value below the provided threshold.

	Only founders are considered by this test; use --nonfounders to change this.
	Also, with case/control data, cases and missing phenotypes are normally ignored; override this with 'include-nonctrl'. "

	self propertyAt: 'hwe' ifAbsentPut: [ pValue ]