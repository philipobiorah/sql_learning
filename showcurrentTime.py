import time

currentTime = time.time() #Get current time

#Obtain the total seconds since midnight Jan 1, 1970

totalSeconds = int(currentTime)


#Get the current second
currentSecond = totalSeconds % 60

