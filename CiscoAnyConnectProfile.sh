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
/bin/echo '<?xml version="1.0" encoding="UTF-8"?>' > "$ConfigFileName"
/bin/echo '<AnyConnectProfile xmlns="http://schemas.xmlsoap.org/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://schemas.xmlsoap.org/encoding/ AnyConnectProfile.xsd">' >> "$ConfigFileName"
/bin/echo '	<ClientInitialization>' >> "$ConfigFileName"
/bin/echo '		<UseStartBeforeLogon UserControllable="true">true</UseStartBeforeLogon>' >> "$ConfigFileName"
/bin/echo '		<AutomaticCertSelection UserControllable="false">true</AutomaticCertSelection>' >> "$ConfigFileName"
/bin/echo '		<ShowPreConnectMessage>false</ShowPreConnectMessage>' >> "$ConfigFileName"
/bin/echo '		<CertificateStore>All</CertificateStore>' >> "$ConfigFileName"
/bin/echo '		<CertificateStoreMac>All</CertificateStoreMac>' >> "$ConfigFileName"
/bin/echo '		<CertificateStoreOverride>false</CertificateStoreOverride>' >> "$ConfigFileName"
/bin/echo '		<ProxySettings>Native</ProxySettings>' >> "$ConfigFileName"
/bin/echo '		<AllowLocalProxyConnections>true</AllowLocalProxyConnections>' >> "$ConfigFileName"
/bin/echo '		<AuthenticationTimeout>12</AuthenticationTimeout>' >> "$ConfigFileName"
/bin/echo '		<AutoConnectOnStart UserControllable="true">false</AutoConnectOnStart>' >> "$ConfigFileName"
/bin/echo '		<MinimizeOnConnect UserControllable="true">true</MinimizeOnConnect>' >> "$ConfigFileName"
/bin/echo '		<LocalLanAccess UserControllable="false">true</LocalLanAccess>' >> "$ConfigFileName"
/bin/echo '		<DisableCaptivePortalDetection UserControllable="false">false</DisableCaptivePortalDetection>' >> "$ConfigFileName"
/bin/echo '		<ClearSmartcardPin UserControllable="true">true</ClearSmartcardPin>' >> "$ConfigFileName"
/bin/echo '		<IPProtocolSupport>IPv4</IPProtocolSupport>' >> "$ConfigFileName"
/bin/echo '		<AutoReconnect UserControllable="false">true' >> "$ConfigFileName"
/bin/echo '			<AutoReconnectBehavior UserControllable="false">ReconnectAfterResume</AutoReconnectBehavior>' >> "$ConfigFileName"
/bin/echo '		</AutoReconnect>' >> "$ConfigFileName"
/bin/echo '		<SuspendOnConnectedStandby>false</SuspendOnConnectedStandby>' >> "$ConfigFileName"
/bin/echo '		<AutoUpdate UserControllable="true">false</AutoUpdate>' >> "$ConfigFileName"
/bin/echo '		<RSASecurIDIntegration UserControllable="false">Automatic</RSASecurIDIntegration>' >> "$ConfigFileName"
/bin/echo '		<WindowsLogonEnforcement>SingleLocalLogon</WindowsLogonEnforcement>' >> "$ConfigFileName"
/bin/echo '		<LinuxLogonEnforcement>SingleLocalLogon</LinuxLogonEnforcement>' >> "$ConfigFileName"
/bin/echo '		<WindowsVPNEstablishment>LocalUsersOnly</WindowsVPNEstablishment>' >> "$ConfigFileName"
/bin/echo '		<LinuxVPNEstablishment>LocalUsersOnly</LinuxVPNEstablishment>' >> "$ConfigFileName"
/bin/echo '		<AutomaticVPNPolicy>false</AutomaticVPNPolicy>' >> "$ConfigFileName"
/bin/echo '		<PPPExclusion UserControllable="false">Disable' >> "$ConfigFileName"
/bin/echo '			<PPPExclusionServerIP UserControllable="false"></PPPExclusionServerIP>' >> "$ConfigFileName"
/bin/echo '		</PPPExclusion>' >> "$ConfigFileName"
/bin/echo '		<EnableScripting UserControllable="false">false</EnableScripting>' >> "$ConfigFileName"
/bin/echo '		<BackupServerList>' >> "$ConfigFileName"
/bin/echo '			<HostAddress>'$BackupServerAddress'</HostAddress>' >> "$ConfigFileName"
/bin/echo '		</BackupServerList>' >> "$ConfigFileName"
/bin/echo '		<EnableAutomaticServerSelection UserControllable="false">false' >> "$ConfigFileName"
/bin/echo '			<AutoServerSelectionImprovement>20</AutoServerSelectionImprovement>' >> "$ConfigFileName"
/bin/echo '			<AutoServerSelectionSuspendTime>4</AutoServerSelectionSuspendTime>' >> "$ConfigFileName"
/bin/echo '		</EnableAutomaticServerSelection>' >> "$ConfigFileName"
/bin/echo '		<RetainVpnOnLogoff>false' >> "$ConfigFileName"
/bin/echo '		</RetainVpnOnLogoff>' >> "$ConfigFileName"
/bin/echo '		<CaptivePortalRemediationBrowserFailover>false</CaptivePortalRemediationBrowserFailover>' >> "$ConfigFileName"
/bin/echo '		<AllowManualHostInput>true</AllowManualHostInput>' >> "$ConfigFileName"
/bin/echo '	</ClientInitialization>' >> "$ConfigFileName"
/bin/echo '	<ServerList>' >> "$ConfigFileName"
/bin/echo '		<HostEntry>' >> "$ConfigFileName"
/bin/echo '			<HostName>'$ConnectionName'</HostName>' >> "$ConfigFileName"
/bin/echo '			<HostAddress>'$ServerAddress'</HostAddress>' >> "$ConfigFileName"
/bin/echo '		</HostEntry>' >> "$ConfigFileName"
/bin/echo '	</ServerList>' >> "$ConfigFileName"
/bin/echo '</AnyConnectProfile>' >> "$ConfigFileName"
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
