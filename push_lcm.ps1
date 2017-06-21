#push lcm config file
# usage
# set-dsclocalconfigurationamanger "dirname" after this config has been run
Configuration SetupLCM
{
#param ([string]$machinename)
Node $AllNodes.Where{$_.Role -contains "WebServer"}.Nodename
#param
#(
# [string[]]$NodeName "END-SSWS0039" # $env:computername
#)
{
LocalConfigurationManager
{
ConfigurationModeFrequencyMins = 30
ConfigurationMode = 'ApplyAndAutoCorrect'
RebootNodeIfNeeded = $True
RefreshMode = 'PUSH'

}
}
}
SetupLCM -configurationdata "d:\dsc\b2b-steps.psd1"
