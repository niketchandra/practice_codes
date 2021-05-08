$costTotal=0
$RGName ="clientvm" 
$StartDay= $args[0]
$EndDay= $args[1]
$VMName="mastervm"
$Consumption = Get-AzConsumptionUsageDetail -ResourceGroup $RGName -StartDate $StartDay -EndDate $EndDay #-InstanceName $VMName 
    
$Costs = $Consumption.PretaxCost
   
foreach ($Cost in $Costs) { $CostTotal += $Cost}
    
$CostTotal
