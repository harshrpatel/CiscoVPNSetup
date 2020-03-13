# CiscoVPNSetup

CiscoVPNSetup is the best automated way to connect to any VPN using Cisco VPN Anyconnect using Softoken generated PIN.

## Getting Started

1) Substitute "server.example.com" and "YOURPIN" with your VPN server and Softoken PIN.

2) Save the modified code as "<any_name>.applescript" and store it anywhere and double click on it to launch Script Editor.

3) Click the "compile" icon 🔨 and from the File menu, click Save and choose "Application" as the "File format". Make sure Save as at the top is "any_name.app" without the quotes and save it in /Applications.

4) Open Security & Privacy in System Preferences, go to Privacy, Accessibility and Unlock the window.
Click on + and add "Script Editor" & "any_name.app" (Or Just drag and drop your application to the window).

5) Launch the application from the /Applications and Run it again to Disconnect.


## To use Anyconnect VPN with DUO

1. Create a new generic password entry in Keychain Access called "cisco_vpn" (the name in Keychain access must match that in line 39 below) with your password for the Cisco AnyConnect VPN server. 
So this entry should have Name: cisco_vpn, and Account: cisco_vpn
2. Change the username in line no #38 from "hapatel2" to <YOUR CEC ID>
3. Save the script as an Application if you want to use it permanently with some name and set it up on Dock to keep it handy.
4. Open Security & Privacy System Preferences, go to Privacy, Accessibility and enable the above .app so it can access Accessibility
5. Run the script to connect VPN automatically without clicking/typing anything.
6. Run script again to close connection
