accessing
markersCount
    " Answer how many markers contains the receiver's samples (assuming all containing the same count of markers ) "
   
    | rep |
    rep := self samples anyOne.
    ^ rep markers size