#####################################################################################################
# Get_PowerBIDataSetByID.ps1
#
# PURPOSE: 
#    The purpose of this script is to get the Name of a Power BI DataSet when all we have is the DataSet ID.
#
# RESOURCES:
#   Get-PowerBIDataSetID: https://docs.microsoft.com/en-us/powershell/module/microsoftpowerbimgmt.data/get-powerbidataset?view=powerbi-ps
#   Connect-PowerBIServiceAccount: https://docs.microsoft.com/en-us/powershell/module/microsoftpowerbimgmt.profile/connect-powerbiserviceaccount?view=powerbi-ps
#   You will need the PowerBIMgmt Module to make this work.  If you do not have it setup, you can install them with the following: Install-Module -Name MicrosoftPowerBIMgmt
# CREATION DATE: June 21, 2019 - Tim Macaulay (timmac@microsoft.com)
#####################################################################################################


$PBIDataSetID = '<Data Set ID>'
Connect-PowerBiServiceAccount
$GetPBIDataSet = Get-PowerBIDataset -Id $PBIDataSetID -Scope Organization
$GetPBIDataSetName = $GetPBIDataSet.Name
$GetPBIDataSetName 
