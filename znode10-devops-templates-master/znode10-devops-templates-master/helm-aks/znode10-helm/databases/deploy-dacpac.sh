#!/bin/bash

SQLPACKAGE="/usr/local/bin/sqlpackage"
DACPAC_PATH=$1
DB_NAME=$2
LOCAL_DB_USERNAME=$3
LOCAL_DB_PASSWORD=$4
LOCAL_DB_SERVER="172.16.100.194"  # Or make this $5 if you want to pass it too

if [ -z "$DACPAC_PATH" ] || [ -z "$DB_NAME" ] || [ -z "$LOCAL_DB_USERNAME" ] || [ -z "$LOCAL_DB_PASSWORD" ]; then
  echo "❌ Usage: $0 <dacpac-path> <database-name> <db-user> <db-password>"
  exit 1
fi

"$SQLPACKAGE" /Action:Publish \
  /SourceFile:"$DACPAC_PATH" \
  /TargetServerName:"$LOCAL_DB_SERVER" \
  /TargetDatabaseName:"$DB_NAME" \
  /TargetUser:"$LOCAL_DB_USERNAME" \
  /TargetPassword:"$LOCAL_DB_PASSWORD" \
  /TargetTrustServerCertificate:True \
  /p:BlockOnPossibleDataLoss=False \
  /p:DropObjectsNotInSource=False

# #!/bin/bash

# SQLPACKAGE="/home/amla/.dotnet/tools/sqlpackage"
# BACPAC_PATH=$1
# DB_NAME=$2

# $SQLPACKAGE /Action:Import \
#   /SourceFile:$BACPAC_PATH \
#   /TargetServerName:172.16.100.194 \
#   /TargetDatabaseName:$DB_NAME \
#   /TargetUser:sa \
#   /TargetPassword=Amla#987 \
#   /TargetTrustServerCertificate:True
