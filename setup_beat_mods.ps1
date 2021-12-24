$env:BEAT_SAB_LOC="C:\Program Files (x86)\Steam\steamapps\common\Beat Saber"
echo "BEAT SABER LOCATION: $env:BEAT_SAB_LOC"
if (-not(Test-Path -Path beat_saber_mods)){
		echo "The beat_saber_mod directory does not exist. Creating it now"
		New-Item -Name "beat_saber_mods" -ItemType "directory"
	}
if (Test-Path -Path beat_saber_mods){
		cd beat_saber_mods
	} else {
		echo "Unable to find the beat_saber_mods directory!!!!"
		pause
	}

echo "Pulling Down ModAssistant.."
Invoke-WebRequest https://github.com/Assistant/ModAssistant/releases/download/v1.1.26/ModAssistant.exe -O ModAssistant.exe
if (Test-Path -Path ModAssistant.exe -PathType Leaf) {
echo "Retrieved the ModAssistant.exe!"
}
else {
	echo "Unable to Retrieve the ModAssistant. Please check to make sure the URL is exists: https://github.com/Assistant/ModAssistant/releases/download/v1.1.26/ModAssistant.exe"
}
# get the MultiplayerExtensions
echo "Pulling Down Multiplayer Extensions.."
Invoke-WebRequest https://github.com/Goobwabber/MultiplayerExtensions/releases/download/v0.6.2/MultiplayerExtensions-v0.6.2.zip -O MultiplayerExtensions.zip
if (Test-Path -Path MultiplayerExtensions.zip -PathType Leaf) {
	echo "Retrieved the Multiplayer Extensions!"
	#if the Multiplayer extensions was pull down in the past just delete it so the new version can be pulled down
	if (Test-Path -Path MultiplayerExtensions){
		echo "NEED TO REMOVE EXISTING MultiplayerExtensions Directory. Please Answer Y"
		Remove-Item MultiplayerExtensions
	}
	Expand-Archive MultiplayerExtensions.zip
	#TODO need to do something about that second directory..
	Copy-Item "MultiplayerExtensions\MultiplayerExtensions-v0.6.2\Plugins\MultiplayerExtensions.dll" -Destination "$env:BEAT_SAB_LOC\Plugins\"
}else {
		echo "Unable to Retrieve the Multiplayer Extensions. Please check to make sure the URL is exists: https://github.com/Goobwabber/MultiplayerExtensions/releases/download/v0.6.2/MultiplayerExtensions-v0.6.2.zip"
}

# get the ServerBrowser
echo "Pulling Down Server Browser.."
Invoke-WebRequest https://github.com/roydejong/BeatSaberServerBrowser/releases/download/ServerBrowser-0.7.6-bs1.18.3-0874855/ServerBrowser-0.7.6-bs1.18.3-0874855.zip -O ServerBrowser.zip
if (Test-Path -Path ServerBrowser.zip -PathType Leaf) {
	echo "Retrieved the Server Browser!"
	if (Test-Path -Path ServerBrowser){
		echo "NEED TO REMOVE EXISTING ServerBrowser Directory. Please Answer Y"
		Remove-Item ServerBrowser
	}
	Expand-Archive ServerBrowser.zip
	Copy-Item "ServerBrowser\Plugins\ServerBrowser.dll" -Destination "$env:BEAT_SAB_LOC\Plugins\"
}else {
	echo "Unable to Retrieve the Server Browser. Please check to make sure the URL is exists: https://github.com/roydejong/BeatSaberServerBrowser/releases/download/ServerBrowser-0.7.6-bs1.18.3-0874855/ServerBrowser-0.7.6-bs1.18.3-0874855.zip"
}

# get the BeatTogether
echo "Pulling Down BeatTogether.."
Invoke-WebRequest https://github.com/pythonology/BeatTogether/releases/download/v1.2.0/BeatTogether-1.2.0-bs1.17.1-835c4c3.zip -O BeatTogether.zip
if (Test-Path -Path BeatTogether.zip -PathType Leaf) {
	echo "Retrieved the BeatTogether!"
	if (Test-Path -Path BeatTogether){
		echo "NEED TO REMOVE EXISTING BeatTogether Directory. Please Answer Y"
		Remove-Item BeatTogether
	}
	Expand-Archive BeatTogether.zip
	Copy-Item "BeatTogether\Plugins\BeatTogether.dll" -Destination "$env:BEAT_SAB_LOC\Plugins\"
}else {
	echo "Unable to Retrieve the BeatTogether. Please check to make sure the URL is exists: https://github.com/pythonology/BeatTogether/releases/download/v1.2.0/BeatTogether-1.2.0-bs1.17.1-835c4c3.zip"
}
echo "Successfully downloaded and installed all plugins/mods for Beat Saber. Open the ModAssistant.exe to install the rest."
cd ..
pause