#GUI for adding AD Users

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing



#region Form
$form = New-Object System.Windows.Forms.Form
$form.Size = '330,330'
$form.Text = "Create a New Account"
$form.StartPosition = 'CenterScreen'
#endregion Form



$TextBox_FName = New-Object System.Windows.Forms.TextBox
$TextBox_FName.Location = New-Object System.Drawing.Size(25,50)
$TextBox_FName.Size = New-Object System.Drawing.Size(250,50)
$TextBox_FName.Text = "First Name"
$TextBox_FName.Add_Click{ $TextBox_FName.Text = ""}
$form.Controls.Add($TextBox_FName)


$TextBox_LName = New-Object System.Windows.Forms.TextBox
$TextBox_LName.Location = New-Object System.Drawing.Size(25,70)
$TextBox_LName.Size = New-Object System.Drawing.Size(250,50)
$TextBox_LName.Text = "Last Name"
$TextBox_LName.Add_Click{ $TextBox_LName.Text = ""}
$form.Controls.Add($TextBox_LName)

$TextBox_UName = New-Object System.Windows.Forms.TextBox
$TextBox_UName.Location = New-Object System.Drawing.Size(25,100)
$TextBox_UName.Size = New-Object System.Drawing.Size(250,50)
$TextBox_UName.Text = "User Name"
$TextBox_UName.Add_Click{ $TextBox_UName.Text = ""}
$form.Controls.Add($TextBox_UName)

$TextBox_Job = New-Object System.Windows.Forms.TextBox
$TextBox_Job.Location = New-Object System.Drawing.Size(25,130)
$TextBox_Job.Size = New-Object System.Drawing.Size(250,50)
$TextBox_Job.Text = "Job Title"
$TextBox_Job.Add_Click{ $TextBox_Job.Text = ""}
$form.Controls.Add($TextBox_Job)

$TextBox_EmID = New-Object System.Windows.Forms.TextBox
$TextBox_EmID.Location = New-Object System.Drawing.Size(25,160)
$TextBox_EmID.Size = New-Object System.Drawing.Size(250,50)
$TextBox_EmID.Text = "Employee ID"
$TextBox_EmID.Add_Click{ $TextBox_EmID.Text = ""}
$form.Controls.Add($TextBox_EmID)


$Button_Close = New-Object System.Windows.Forms.Button
$Button_Close.Location = New-Object System.Drawing.Size(25,200)
$Button_Close.Size = New-Object System.Drawing.Size(120,25)
$Button_Close.Text = "Create User Account"
$Button_Close.Add_Click{ $form.Close()}
$form.Controls.Add($Button_Close)

$form.Add_shown({$form.Activate()})
$form.ShowDialog()

$NewUser = [ordered]@{FirstName=($TextBox_FName).Text; LastName=($TextBox_LName).Text; Username=($TextBox_UName).Text;  Title=($TextBox_Job).Text; Employee=($TextBox_EmID).Text}

Return $NewUser
