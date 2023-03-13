#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	CiscoAnyConnectProfile.sh
#	https://github.com/Headbolt/CiscoAnyConnectProfile
#
#   This Script is designed for use in JAMF and was designed to create a config Profile fo Cisco AnyConnect
#	AFTER the install is completed.
#
#	The Following Variables should be defined
#	Variable 4 - Named "Config File Path - eg. /opt/cisco/anyconnect/profile/profilename.xml"
#	Variable 5 - Named "Connection Name - eg. CompanyName-SSL"
#	Variable 6 - Named "Server Address - eg. vpn.company.com"
#	Variable 7 - Named "Backup Server Address - eg. vpn.company.com"
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 13/03/2023
#
#	13/03/2023 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
#   DEFINE VARIABLES & READ IN PARAMETERS
#
###############################################################################################################################################
#
ConfigFileName=$4
ConnectionName=$5
ServerAddress=$6
BackupServerAddress=$7
#
ConfigureFolder="/opt/cisco/anyconnect/profile"
ScriptName="Application | Cisco AnyConnect | Local VPN Profile"
ExitCode=0
#
###############################################################################################################################################
#
#   Checking and Setting Variables Complete
#
###############################################################################################################################################
# 
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
# Defining Functions
#
###############################################################################################################################################
#
# ConfigFile Function
#
ReWriteConfigFile(){
#
/bin/echo 'Rewriting Config File "'"$ConfigureFolder"/"$ConfigFileName"'"'
#
/bin/echo '<?xml version="1.0" encoding="UTF-8"?>' > "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '<AnyConnectProfile xmlns="http://schemas.xmlsoap.org/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://schemas.xmlsoap.org/encoding/ AnyConnectProfile.xsd">' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '	<ClientInitialization>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<UseStartBeforeLogon UserControllable="true">true</UseStartBeforeLogon>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<AutomaticCertSelection UserControllable="false">true</AutomaticCertSelection>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<ShowPreConnectMessage>false</ShowPreConnectMessage>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<CertificateStore>All</CertificateStore>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<CertificateStoreMac>All</CertificateStoreMac>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<CertificateStoreOverride>false</CertificateStoreOverride>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<ProxySettings>Native</ProxySettings>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<AllowLocalProxyConnections>true</AllowLocalProxyConnections>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<AuthenticationTimeout>12</AuthenticationTimeout>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<AutoConnectOnStart UserControllable="true">false</AutoConnectOnStart>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<MinimizeOnConnect UserControllable="true">true</MinimizeOnConnect>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<LocalLanAccess UserControllable="false">true</LocalLanAccess>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<DisableCaptivePortalDetection UserControllable="false">false</DisableCaptivePortalDetection>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<ClearSmartcardPin UserControllable="true">true</ClearSmartcardPin>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<IPProtocolSupport>IPv4</IPProtocolSupport>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<AutoReconnect UserControllable="false">true' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '			<AutoReconnectBehavior UserControllable="false">ReconnectAfterResume</AutoReconnectBehavior>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		</AutoReconnect>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<SuspendOnConnectedStandby>false</SuspendOnConnectedStandby>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<AutoUpdate UserControllable="true">false</AutoUpdate>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<RSASecurIDIntegration UserControllable="false">Automatic</RSASecurIDIntegration>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<WindowsLogonEnforcement>SingleLocalLogon</WindowsLogonEnforcement>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<LinuxLogonEnforcement>SingleLocalLogon</LinuxLogonEnforcement>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<WindowsVPNEstablishment>LocalUsersOnly</WindowsVPNEstablishment>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<LinuxVPNEstablishment>LocalUsersOnly</LinuxVPNEstablishment>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<AutomaticVPNPolicy>false</AutomaticVPNPolicy>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<PPPExclusion UserControllable="false">Disable' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '			<PPPExclusionServerIP UserControllable="false"></PPPExclusionServerIP>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		</PPPExclusion>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<EnableScripting UserControllable="false">false</EnableScripting>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<BackupServerList>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '			<HostAddress>'$BackupServerAddress'</HostAddress>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		</BackupServerList>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<EnableAutomaticServerSelection UserControllable="false">false' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '			<AutoServerSelectionImprovement>20</AutoServerSelectionImprovement>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '			<AutoServerSelectionSuspendTime>4</AutoServerSelectionSuspendTime>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		</EnableAutomaticServerSelection>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<RetainVpnOnLogoff>false' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		</RetainVpnOnLogoff>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<CaptivePortalRemediationBrowserFailover>false</CaptivePortalRemediationBrowserFailover>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<AllowManualHostInput>true</AllowManualHostInput>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '	</ClientInitialization>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '	<ServerList>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		<HostEntry>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '			<HostName>'$ConnectionName'</HostName>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '			<HostAddress>'$ServerAddress'</HostAddress>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '		</HostEntry>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '	</ServerList>' >> "$ConfigureFolder"/"$ConfigFileName"
/bin/echo '</AnyConnectProfile>' >> "$ConfigureFolder"/"$ConfigFileName"
#
}
#
###############################################################################################################################################
#
# Section End Function
#
SectionEnd(){
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
}
#
###############################################################################################################################################
#
# Script End Function
#
ScriptEnd(){
#
/bin/echo Ending Script '"'$ScriptName'"'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
exit $ExitCode
#
}
#
###############################################################################################################################################
#
# End Of Function Definition
#
###############################################################################################################################################
# 
# Begin Processing
#
###############################################################################################################################################
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
SectionEnd
#
ReWriteConfigFile
SectionEnd
ScriptEnd
