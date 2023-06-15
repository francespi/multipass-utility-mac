--  Copyright (C) 2023 Francesco Pizzo
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 3 of the License, or
--  (at your option) any later version.

--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.

set appPath to path to me as text
set appName to (do shell script "basename " & quoted form of POSIX path of appPath & " | sed 's/\\.app$//'")
set instance to appName

set AlertNoteIconPath to "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:AlertNoteIcon.icns"
set AlertStopIconPath to "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:AlertStopIcon.icns"

try
	
	set test to do shell script "/usr/local/bin/multipass info " & quoted form of instance
	
	if test contains "Running" then
		
		display dialog "Instance " & quoted form of instance & " is running. Stop it?" buttons {"Yes", "No"} default button "No" with icon alias AlertStopIconPath with title "Multipass Utility"
		
		if button returned of result = "Yes" then
			
			do shell script "/usr/local/bin/multipass stop " & quoted form of instance
			
			display dialog "Instance " & quoted form of instance & " stopped!" buttons {"Close"} default button "Close" with icon alias AlertNoteIconPath with title "Multipass Utility"
			
		end if
		
	else if test contains "Stopped" then
		
		display dialog "Instance " & quoted form of instance & " is not running. Start it?" buttons {"Yes", "No"} default button "Yes" with icon alias AlertStopIconPath with title "Multipass Utility"
		
		if button returned of result = "Yes" then
			
			do shell script "/usr/local/bin/multipass start " & quoted form of instance
			
			display dialog "Instance " & quoted form of instance & " started!" buttons {"Close"} default button "Close" with icon alias AlertNoteIconPath with title "Multipass Utility"
			
		end if
		
	end if
	
on error errMsg
	
	display dialog "Instance " & quoted form of instance & " does not exist!" buttons {"Close"} default button "Close" with icon alias AlertStopIconPath with title "Multipass Utility"
	
end try
