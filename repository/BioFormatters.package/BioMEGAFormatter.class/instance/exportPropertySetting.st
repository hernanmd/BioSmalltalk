exporting
exportPropertySetting
	" Write the receiver's property setting "
	
	self stream
		nextPutAll: 'Property=';
		nextPutAll: self propertySetting