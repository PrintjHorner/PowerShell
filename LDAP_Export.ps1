# Retrives multiple groups and exports selected data of the members to csv in a custom format
$Groups = (Get-ADGroup -Filter * SearchBase "OU=Accounting,DC=Vsphere,DC=LOCAL")


$Table = @()

# Data Headers
$Records = [ordered]@{
"IMPORT_ID" = ""
"USERNAME" = ""
"FIRST_NAME" = ""
"LAST_NAME" = ""
"EMAIL" = ""
}

Foreach ($Group in $Groups)
{

$Array = Get-AdGroupMember -identify  $Group | Get-ADUser -Properties samAccountName,givenName,sn,mail,enabled | Where-Object {$_.Enabled -eq $true}

    foreach ($Member in $Array)
    {
        $Record."IMPORT_ID" = $Member.samAccountName.ToUpper()
        $Record."USERNAME" = $Member.sanAccountName.ToUpper()
        $Record."FIRST_NAME" = $Member.givenName.ToUpper()
        $Record."LASt_NAME" = $Member.sn.ToUpper()
        $Record."EMAIL" = $Member.mail.ToUpper()
        $objRecord = New-Object PSObject -property $Record
        $Table += $objRecord
        
    }

}


$Table | Export-csv -path C:\Output\MemeberOutput.csv -NoTypeInformation