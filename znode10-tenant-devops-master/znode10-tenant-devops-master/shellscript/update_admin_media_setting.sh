#!/bin/bash

# API endpoint from environment variable
API_URL="${API_URL}/MediaConfiguration/Update"

# Headers
ACCEPT_HEADER="accept: application/json"
CONTENT_TYPE_HEADER="Content-Type: application/json"

# Debugging: Print the API URL
echo "API URL: $API_URL"

# JSON data using the environment variables
JSON_PAYLOAD=$(cat <<EOF
{
  "MediaConfigurationId": 3,
  "MediaServerMasterId": 2,
  "Server": "Azure",   
  "URL": null,
  "NetworkUrl": null,
  "SecretKey": "${SECRET_KEY}",
  "AccessKey": "${ACCESS_KEY}",
  "BucketName": "${BUCKET_NAME}",
  "IsActive": true,
  "CDNUrl": "${CDN_URL}",
  "ThumbnailFolderName": null,
  "MediaServer": null,
  "GlobalMediaDisplaySetting": {
    "GlobalMediaDisplaySettingsId": 1,
    "MediaId": 1597,
    "MaxDisplayItems": 0,
    "MaxSmallThumbnailWidth": 38,
    "MaxSmallWidth": 250,
    "MaxMediumWidth": 400,
    "MaxThumbnailWidth": 150,
    "MaxLargeWidth": 800,
    "MaxCrossSellWidth": 150,
    "MediaPath": "",
    "DefaultImageName": null,
    "CreatedBy": 0,
    "CreatedDate": "0001-01-01T00:00:00",
    "ModifiedBy": 0,
    "ModifiedDate": "0001-01-01T00:00:00",
    "ActionMode": null,
    "Custom1": null,
    "Custom2": null,
    "Custom3": null,
    "Custom4": null,
    "Custom5": null
  },
  "CreatedBy": 0,
  "CreatedDate": "0001-01-01T00:00:00",
  "ModifiedBy": 0,
  "ModifiedDate": "0001-01-01T00:00:00",
  "ActionMode": null,
  "Custom1": null,
  "Custom2": null,
  "Custom3": null,
  "Custom4": null,
  "Custom5": null
}
EOF
)

# Debugging: Print the JSON payload
echo "JSON Payload:"
echo "$JSON_PAYLOAD"

# Execute the PUT request
response=$(curl -X PUT "$API_URL" \
  -H "$ACCEPT_HEADER" \
  -H "$CONTENT_TYPE_HEADER" \
  -d "$JSON_PAYLOAD")

# Output the response
echo "Response from API:"
echo "$response"
