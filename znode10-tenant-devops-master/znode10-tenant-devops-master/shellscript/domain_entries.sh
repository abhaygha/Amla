#!/bin/bash

# Azure SQL Database connection details (use environment variables)
AZURE_SQL_SERVER="$AZURE_SQL_SERVER"
AZURE_SQL_DB="$AZURE_SQL_DB"
AZURE_SQL_USER="$AZURE_SQL_USER"
AZURE_SQL_PASSWORD="$AZURE_SQL_PASSWORD"

# Array of domain entries with their parameters (DomainName, ApiKey, ApplicationType)
entries=(
  "api-cp-etna-qa.amla.io|a2c32d26-fb56-4e2d-aa44-10ae401a0970|API" #15915F1-7E6B-4386-A623-9779F27D9A5E
  "apigateways-cp-etna-qa.amla.io|a2c32d26-fb56-4e2d-aa44-10ae401a0970|API"
  "commerceportal-etna-qa.amla.io|a2c32d26-fb56-4e2d-aa44-10ae401a0970|Commerce Portal"

)


# SQL common variables
PortalId=7
IsActive=1
CreatedBy=2
ModifiedBy=2
IsDefault=1

# SQL Command initialization
SQL_COMMAND=""

# Loop through each entry and create SQL command
for entry in "${entries[@]}"; do
  IFS="|" read -r DomainName ApiKey ApplicationType <<< "$entry"

  SQL_COMMAND+="
  IF NOT EXISTS (
    SELECT 1 
    FROM dbo.ZnodeDomain 
    WHERE DomainName = '$DomainName' 
      AND ApiKey = '$ApiKey' 
      AND ApplicationType = '$ApplicationType'
  )
  BEGIN
    INSERT INTO dbo.ZnodeDomain (
      PortalId, DomainName, IsActive, ApiKey, ApplicationType, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate, IsDefault
    )
    VALUES (
      $PortalId, '$DomainName', $IsActive, '$ApiKey', '$ApplicationType', $CreatedBy, GETDATE(), $ModifiedBy, GETDATE(), $IsDefault
    );
  END;
  "
done

# Execute the SQL command
echo "$SQL_COMMAND" | sqlcmd -S $AZURE_SQL_SERVER -d $AZURE_SQL_DB -U $AZURE_SQL_USER -P $AZURE_SQL_PASSWORD