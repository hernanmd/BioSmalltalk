accessing
monitoringDelay
	" Answer a <Number> of seconds to wait between progress update on execution "

	^ monitoringDelay
		ifNil: [ monitoringDelay := self defaultMonitoringDelay ]