--  Copyright (C) 2023 Francesco Pizzo
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 3 of the License, or
--  (at your option) any later version.

--   This program is distributed in the hope that it will be useful,
--   but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.

set AlertNoteIconPath to "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:AlertNoteIcon.icns"
set AlertStopIconPath to "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:AlertStopIcon.icns"

set test to do shell script "/usr/local/bin/multipass info <YOUR_INSTANCE_NAME>"

if test contains "Running" then
	
	display dialog "<YOUR_INSTANCE_NAME> is running. Stop it?" buttons {"Yes", "No"} default button "No" with icon alias AlertStopIconPath with title "<YOUR_INSTANCE_NAME>"
	
	if button returned of result = "Yes" then
		
		do shell script "/usr/local/bin/multipass stop <YOUR_INSTANCE_NAME>"
		
		display dialog "<YOUR_INSTANCE_NAME> stopped!" buttons {"Close"} default button "Close" with icon alias AlertNoteIconPath with title "<YOUR_INSTANCE_NAME>"
		
	end if
	
else
	
	display dialog "<YOUR_INSTANCE_NAME> is not running. Start it?" buttons {"Yes", "No"} default button "Yes" with icon alias AlertStopIconPath with title "<YOUR_INSTANCE_NAME>"
	
	if button returned of result = "Yes" then
		
		do shell script "/usr/local/bin/multipass start <YOUR_INSTANCE_NAME>"
		
		display dialog "<YOUR_INSTANCE_NAME> started!" buttons {"Close"} default button "Close" with icon alias AlertNoteIconPath with title "<YOUR_INSTANCE_NAME>"
		
	end if
	
end if
