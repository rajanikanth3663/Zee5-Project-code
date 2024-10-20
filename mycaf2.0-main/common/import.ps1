$resourceIds = @(    
    'terraform import module.stream-analytics-cluster[\`"strmacls-xx77-${local.common.dep_env}-ci1-csvc-0001\`"].azurerm_stream_analytics_managed_private_endpoint.this[\`"streamanalytics-eventhubpbtept2\`"] /subscriptions/subs-******-******/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.StreamAnalytics/clusters/stmacls-xx77-${local.common.dep_env}-ci1-csvc-0001/privateEndpoints/streamanalytics-eventhubpbtept2',
'terraform import module.stream-analytics-cluster[\`"strmacls-xx77-${local.common.dep_env}-ci1-csvc-0001\`"].azurerm_stream_analytics_managed_private_endpoint.this[\`"Blob1\`"] /subscriptions/subs-******-******/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.StreamAnalytics/clusters/stmacls-xx77-${local.common.dep_env}-ci1-csvc-0001/privateEndpoints/Blob1',
'terraform import module.stream-analytics-cluster[\`"strmacls-xx77-${local.common.dep_env}-ci1-csvc-0001\`"].azurerm_stream_analytics_managed_private_endpoint.this[\`"SQL\`"] /subscriptions/subs-******-******/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.StreamAnalytics/clusters/stmacls-xx77-${local.common.dep_env}-ci1-csvc-0001/privateEndpoints/SQL',
'terraform import module.stream-analytics-cluster[\`"strmacls-xx77-${local.common.dep_env}-ci1-csvc-0001\`"].azurerm_stream_analytics_managed_private_endpoint.this[\`"cosmos001\`"] /subscriptions/subs-******-******/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.StreamAnalytics/clusters/stmacls-xx77-${local.common.dep_env}-ci1-csvc-0001/privateEndpoints/cosmos001',
'terraform import module.stream-analytics-cluster[\`"strmacls-xx77-${local.common.dep_env}-ci1-csvc-0001\`"].azurerm_stream_analytics_managed_private_endpoint.this[\`"streamanalytics-eventhubpbtept\`"] /subscriptions/subs-******-******/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.StreamAnalytics/clusters/stmacls-xx77-${local.common.dep_env}-ci1-csvc-0001/privateEndpoints/streamanalytics-eventhubpbtept',
'terraform import module.stream-analytics-cluster[\`"strmacls-xx77-${local.common.dep_env}-ci1-csvc-0001\`"].azurerm_stream_analytics_managed_private_endpoint.this[\`"functionapp\`"] /subscriptions/subs-******-******/resourceGroups/${local.common.resource_group_name_csvc}/providers/Microsoft.StreamAnalytics/clusters/stmacls-xx77-${local.common.dep_env}-ci1-csvc-0001/privateEndpoints/functionapp'


)
 
# Iterate through the list and import each resource
foreach ($resourceId in $resourceIds) {
    # Execute terraform import command
    $terraformImportCmd = "$resourceId"
    Write-Host "Executing command: $terraformImportCmd"
    Invoke-Expression $terraformImportCmd
}
