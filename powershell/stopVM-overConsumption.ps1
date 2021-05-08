$costTotal=0
$date1 = Get-Date -Format "yyyy-MM-dd"
$RGName ="clientvm" 
$StartDay= $date1
$EndDay= $date1
#$VMName="mastervm"
$Consumption = Get-AzConsumptionUsageDetail -ResourceGroup $RGName -StartDate $StartDay -EndDate $EndDay #-InstanceName $VMName 
    
$Costs = $Consumption.PretaxCost
   
foreach ($Cost in $Costs) { $CostTotal += $Cost}
    
$CostTotal
if ($CostTotal -gt 60){
$vm = Get-AzResource -ResourceGroupName $RGName -ResourceType Microsoft.Compute/virtualMachines
Stop-AzVM -Name $vm -ResourceGroupName $RGName
}
else
{
echo "No need to turn off"
}
