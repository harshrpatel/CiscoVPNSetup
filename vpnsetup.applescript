-- Assumes that SofToken II is in /Applications
on get_token(userPin)
	set token to do shell script "bash -c 'echo " & userPin & "|/Applications/SofToken\\ II.app/Contents/Resources/st-wrap.sh -s -p'"
	return token
end get_token

-- Substitute YOURPIN with actual SofToken PIN
set thePin to "YOURPIN"

-- Verify generated PIN from SofToken
set theToken to get_token(thePin)
log "gettoken returned: " & theToken
if the length of theToken is not 8 then
	log "wrong pin?"
	return
end if

tell application "System Events"
	set processExists to exists process "Cisco AnyConnect Secure Mobility Client"
end tell

-- Exits VPN Client if already Open
if processExists is true then
	tell application "Cisco AnyConnect Secure Mobility Client"
		quit
	end tell

else
  -- Connects VPN Client
	tell application "Cisco AnyConnect Secure Mobility Client"
		activate
	end tell
	repeat until application "Cisco AnyConnect Secure Mobility Client" is running
		delay 1
	end repeat
	tell application "System Events"
		repeat until (window 1 of process "Cisco AnyConnect Secure Mobility Client" exists)
			delay 1
		end repeat
    -- Add VPN server info to connect
		tell process "Cisco AnyConnect Secure Mobility Client"
			keystroke ("server.example.com" as string)
			keystroke return
		end tell
		repeat until (window 2 of process "Cisco AnyConnect Secure Mobility Client" exists)
			delay 1
		end repeat
		repeat until (window 3 of process "Cisco AnyConnect Secure Mobility Client" exists)
			delay 1
		end repeat
    -- Add generated PIN to VPN Client
		tell process "Cisco AnyConnect Secure Mobility Client"
			keystroke (theToken as string)
			keystroke return
		end tell
    -- Accept the agreement
		repeat until (window "Cisco AnyConnect - Banner" of process "Cisco AnyConnect Secure Mobility Client" exists)
			delay 1
		end repeat
		click button "Accept" of window "Cisco AnyConnect - Banner" of application process "Cisco AnyConnect Secure Mobility Client"
	end tell

end if
