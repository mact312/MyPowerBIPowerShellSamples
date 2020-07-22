# MyPowerBIPowerShellSamples
Using the Get-PowerBIWorkspace PowerShell cmdlet to aquire information from workspaces.

**Disclaimer Note**
All scripts found here are illustrations and have been based on my labs.  The overall concept of the script should work for you; however, you will most likely have to make small changes to adhere to the business rules for your specific business need.
**Disclaimer Note**

# Information on the different environments
Working within the different environments, there are some small items that we need to be aware of here.  I am trying to list them out as I become aware of them.

## Login-PowerBIServiceAccount
| Environment | Command |
| --- | --- |
| GCC | Login-PowerBIServiceAccount -Environment USGOV |
| GCC HIGH | Login-PowerBIServiceAccount -Environment USGOVHIGH |
| GCC MIL | Login-PowerBIServiceAccount -Environment USGOVMIL |
| Commercial | Login-PowerBIServiceAccount |
| Using the Credential Parameter | Login-PowerBIServiceAccount -Credential $CredParam |

## API
| Environment | Command |
| --- | --- |
| GCC | https://api.powerbigov.us |
| GCC HIGH | https://api.high.powerbigov.us |
| Commercial | https://api.powerbi.com |



## Datasets_GetDataset_DataSource_GWInfo
**Script**: https://github.com/msfttimmac/MyPowerBIPowerShellSamples/blob/master/Datasets_GetDataset_DataSource_GWInfo
<br>
**Required**: Power BI Admin Role and possibly Global Admin<br>
**Purpose**:
This has been designed with the intention to loop through all of the Power BI Workspaces and grab all of the dataset related information.  Additionally, it will take the Dataset ID to get the DataSoruce Information.  Inside of the DataSource Information is the Gateway ID.  I utilize the Gateway ID and the Gateway PowerShell cmdlets to get the Name of the Gateway Cluster.

**NOTE**: This has been coded based on a single datasource to a single dataset.  If you have a scenario where there are multiple datasources to a single dataset, you will need to update/modify the code.

**Rest API and PowerShell cmdlets involved here**
* Admin - Datasets GetDatasourcesAsAdmin: https://docs.microsoft.com/en-us/rest/api/power-bi/admin/datasets_getdatasourcesasadmin
* Admin - Datasets GetDatasetsInGroupAsAdmin: https://docs.microsoft.com/en-us/rest/api/power-bi/admin/datasets_getdatasetsingroupasadmin
* Get-DataGatewayCluster: https://docs.microsoft.com/en-us/powershell/module/datagateway/get-datagatewaycluster?view=datagateway-ps
* Get-PowerBIWorkspace: https://docs.microsoft.com/en-us/powershell/module/microsoftpowerbimgmt.workspaces/get-powerbiworkspace?view=powerbi-ps

<br><br><br><br>


## Reports_Get_ReportsPerWorkspaceWithCreatedAndModified
**Script**: https://github.com/msfttimmac/MyPowerBIPowerShellSamples/blob/master/Reports_Get_ReportsPerWorkspaceWithCreatedAndModified <br>
**Required**: Power BI Admin Role and possibly Global Admin<br>
**Purpose**:
Loops through all workspaces and lists out all reports with 
 - the created date/time and the modified date/time
 - the user (currently only supplies the user object id - you can use the objectid and the Azure AD modules to pull the actual user info)
This does dump to a CSV file in the C:\Temp Directory, so you will need to ensure that you have the C:\Temp directory
It adds each record through the loop via Append.

I am using the following Rest APIs with this script through the Invoke-PowerBIRestMethod call.
 - **Admin - Reports GetReportsInGroupAsAdmin**: https://docs.microsoft.com/en-us/rest/api/power-bi/admin/reports_getreportsingroupasadmin
 
Now I am also using the Get-PowerBIWorkspace PowerShell cmdlet: https://docs.microsoft.com/en-us/powershell/module/microsoftpowerbimgmt.workspaces/get-powerbiworkspace?view=powerbi-ps.


## CAPACITY SCRIPTS
https://github.com/msfttimmac/MyPowerBIPowerShellSamples/blob/master/Capacity_Scripts/ListRefreshablesOnCapacity




