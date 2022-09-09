# Lookup EmployeeID property in AD
# 09/06/2022   	V1.00   	Initial Release               	GH
# 09/09/2022   	V1.01   	Fixed syntax to work on PS v5  	GH
# 09/09/2022   	V1.02   	Added No ID Found error msg 	GH

Add-Type -assembly System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Lookup Employee ID'
$main_form.Width = 600
$main_form.Height = 150
$main_form.AutoSize = $true

$Label = New-Object System.Windows.Forms.Label
$Label.Text = "ADuser: "
$Label.Location  = New-Object System.Drawing.Point(40,10)
$Label.AutoSize = $true
$main_form.Controls.Add($Label)

$textLabel1 = New-Object System.Windows.Forms.Label
$textLabel1.Left = 40
$textLabel1.Top = 50
$textLabel1.Text = "EmployeeID: "
$main_form.Controls.Add($textLabel1)
  
$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Left = 150
$textBox1.Top = 10
$textBox1.width = 200
$main_form.Controls.Add($textBox1)

$Label3 = New-Object System.Windows.Forms.Label
$Label3.Text = ""
$Label3.Location  = New-Object System.Drawing.Point(150,50)
$Label3.AutoSize = $true
$main_form.Controls.Add($Label3)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(400,10)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Check"
$main_form.Controls.Add($Button)

$Button.Add_Click(
	{
		$UserID=Get-ADUser -identity $textBox1.Text -Property EmployeeID
		$Label3.Text =   $UserID.EmployeeID
		if ($UserID.EmployeeID -eq $null){
			$Label3.Text = "No ID Found"
		} 
	}
)

$main_form.ShowDialog()

