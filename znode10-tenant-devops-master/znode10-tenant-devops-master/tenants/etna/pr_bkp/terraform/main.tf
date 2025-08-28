provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Declare all variables used in the ConfigMaps {Admin}
variable "TZ" {}
variable "ASPNETCORE_HTTPS_PORT" {}
variable "ASPNETCORE_Kestrel__Certificates__Default__Password" {}
variable "ASPNETCORE_Kestrel__Certificates__Default__Path" {}
variable "ASPNETCORE_URLS" {}
variable "ASPNETCORE_CULTURE" {}
variable "ASPNETCORE_UI_CULTURE" {}
variable "Caching__InMemoryCacheKeys" {}
variable "appsettings__ZnodeApiRootUri" {}
variable "appsettings__ZnodeApiDomainName" {}
variable "appsettings__ZnodeApiDomainKey" {}
variable "appsettings__ZnodeAdminUri" {}
variable "appsettings__ZnodeApiGateway" {}
variable "appsettings__AzureBlobConnectionString" {}
variable "appsettings__AzureBlobContainerName" {}
variable "appsettings__ZnodeGoogleMapKey" {}
variable "ConnectionStrings__ZnodeMongoDBForLog" {}
variable "appsettings__IsGlobalAPIAuthorization" {}
variable "NEW_RELIC_LICENSE_KEY" {}
variable "NEW_RELIC_APP_NAME_ADMIN" {}
variable "NEW_RELIC_LABELS" {}
variable "appsettings__AuthenticationCookieExpireTimeSpan" {}
variable "appsettings__ZnodeCommercePortalRootUri" {}
variable "SessionState__IdleTimeout" {}


# Variables for customtable ConfigMap

variable "ConnectionStrings__ZnodeCustomTableEntities" {}
variable "ConnectionStrings__ZnodeFramework_Entities" {}
variable "ConnectionStrings__Znode_Entities" {}
variable "NEW_RELIC_APP_NAME_CUSTOMTABLE" {}
variable "NEW_RELIC_APP_NAME_CUSTOM_API" {}
variable "Caching__InMemoryCacheKeys_v2" {}
variable "Caching__InMemoryCacheKeys_api" {}


# Variables for payment ConfigMap
variable "appsettings__ValidateAuthHeader" {}
variable "appsettings__EnableBlobConfiguration" {}
variable "appsettings__containerKey" {}
variable "appsettings__connectionString" {}
variable "appsettings__ZnodeCorsAllowedURLS" {}

# Variables for dev-api-configmap
variable "Caching__Type" {}
variable "Caching__Type__Customapi" {}
variable "Caching__RedisCacheConnectionString" {}
variable "EventBus__RabbitMQManagementUrl" {}
variable "appsettings__PluginApiRootUri" {}
variable "appsettings__CustomAPIRootUri" {}
variable "appsettings__ZnodeApiV2RootUri" {}

variable "appsettings__EnableTokenBasedAuthorization" {}
variable "appsettings__PublishProductFetchChunkSize" {}
variable "appsettings__AzureBlobURL" {}
variable "appsettings__ERPConnectorFolder" {}
variable "appsettings__AdminWebsiteUrl" {}
variable "ConnectionStrings__ZnodeECommerceDB" {}
variable "ConnectionStrings__ZnodePublish_Entities" {}
variable "ConnectionStrings__ZnodeKlaviyo_Entities" {}
variable "ConnectionStrings__HangfireConnection" {}
variable "ConnectionStrings__ZnodeRecommendationDB" {}
variable "ConnectionStrings__ZnodeRecommendation_Entities" {}
variable "NEW_RELIC_APP_NAME_API" {}



# Variables for api-v2-configmap

variable "appsettings__IndexChunkSizeOnCategoryPublish" {}
variable "appsettings__SearchIndexChunkSize" {}
variable "appsettings__PublishCatalogConnectionTime" {} 
variable "appsettings__PublishProductFetchChunkSizes"  {}
variable "appsettings__ProductPublishChunkSize" {}
variable "EventBus__RabbitMQConnectionString" {}
variable "appsetting__ZnodeAdminURLCorsPolicy" {}
variable "appsettings__ElasticSearchRootUri" {}
variable "NEW_RELIC_APP_NAME_API_V2" {}



#variable for api-gateways

variable "AuthKeys__AuthRootKey" {}
variable "MicroServices__customapi" {}
variable "MicroServices__customtable" {}
variable "MicroServices__znodeengineapiv2" {}
variable "MicroServices__multifrontapi" {}
variable "MicroServices__paymentmanager" {}
variable "MicroServices__shippingmanager" {}

variable "MicroServices__ReportsApi" {}
variable "AuthKeys__JWTEncryptionKey" {}
variable "AuthKeys__JWTSigningKey" {}
variable "AuthKeys__JWTExpirySpan" {}
variable "AuthKeys__Issuer" {}
variable "AuthKeys__Audience" {}
variable "AuthKeys__AuthRootUri" {}
variable "SwaggerEndPoints__0__Key" {}
variable "SwaggerEndPoints__0__Config__0__Name" {}
variable "SwaggerEndPoints__0__Config__0__Version" {}
variable "SwaggerEndPoints__0__Config__0__Url" {}
variable "SwaggerEndPoints__1__Key" {}
variable "SwaggerEndPoints__0__Config__0__BaseUrl" {}
variable "SwaggerEndPoints__1__Config__0__Name" {}
variable "SwaggerEndPoints__1__Config__0__Version" {}
variable "SwaggerEndPoints__1__Config__0__Url" {}
variable "SwaggerEndPoints__1__Config__0__BaseUrl" {}
variable "SwaggerEndPoints__2__Key" {}
variable "SwaggerEndPoints__2__Config__0__Name" {}
variable "SwaggerEndPoints__2__Config__0__Version" {}
variable "SwaggerEndPoints__2__Config__0__Url" {}
variable "SwaggerEndPoints__2__Config__0__BaseUrl" {}
variable "SwaggerEndPoints__3__Key" {}
variable "SwaggerEndPoints__3__Config__0__Name" {}
variable "SwaggerEndPoints__3__Config__0__Version" {}
variable "SwaggerEndPoints__3__Config__0__Url" {}
variable "SwaggerEndPoints__3__Config__0__BaseUrl" {}
variable "SwaggerEndPoints__4__Key" {}
variable "SwaggerEndPoints__4__Config__0__Name" {}
variable "SwaggerEndPoints__4__Config__0__Version" {}
variable "SwaggerEndPoints__4__Config__0__Url" {}
variable "SwaggerEndPoints__4__Config__0__BaseUrl" {}
variable "SwaggerEndPoints__5__Key" {}
variable "SwaggerEndPoints__5__Config__0__Name" {}
variable "SwaggerEndPoints__5__Config__0__Version" {}
variable "SwaggerEndPoints__5__Config__0__Url" {}
variable "SwaggerEndPoints__5__Config__0__BaseUrl" {}
variable "SwaggerEndPoints__6__Key" {}
variable "SwaggerEndPoints__6__Config__0__Name" {}
variable "SwaggerEndPoints__6__Config__0__Version" {}
variable "SwaggerEndPoints__6__Config__0__Url" {}
variable "SwaggerEndPoints__6__Config__0__BaseUrl" {}
variable "SwaggerEndPoints__7__Key" {}
variable "SwaggerEndPoints__7__Config__0__Name" {}
variable "SwaggerEndPoints__7__Config__0__Version" {}
variable "SwaggerEndPoints__7__Config__0__Url" {}
variable "SwaggerEndPoints__7__Config__0__BaseUrl" {}
variable "appsettings__EnableJWTAuthorization" {}
variable "appsettings__directoryKey" {}
variable "NEW_RELIC_APP_NAME_API_GATEWAYS" {}
variable "appsettings__PrivateTokenAuthorization" {}


#variable for webstore
variable "PORT" {}
variable "X_CONTENT_TYPE_OPTIONS" {}
variable "PERMISSIONS_POLICY" {}
variable "REFERRER_POLICY" {}
variable "NODE_TLS_REJECT_UNAUTHORIZED" {}
variable "REDIS_CONNECTION_STRING" {}
variable "DEFAULT_THEME" {}
variable "API_Domain_Key" {}
variable "API_DOMAIN" {}
variable "NX_DAEMON" {}
variable "IS_301_REDIRECT" {}
variable "API_URL" {}
variable "APP_NAME" {}
variable "ENABLE_CACHE" {}
variable "STORAGE" {}
variable "NEXT_PUBLIC_GOOGLE_MAP_API_KEY" {}
variable "API_KEY" {}
variable "CACHE_MEMORY" {}
variable "NEXT_PUBLIC_GEO_CODE_URL" {}
variable "API_V2_DOMAIN" {}
variable "WEBSTORE_DOMAIN_NAME" {}
variable "WEBSTORE_DOMAIN_NAME_PAGE" {}
variable "LOGGING_METHOD" {}
variable "NEXTAUTH_SECRET" {}
variable "NX_DISABLE_DB" {}
variable "ENABLE_PAGE_CACHE" {}
variable "NEXTAUTH_URL" {}
variable "NODE_ENV" {}
variable "STRICT_TRANSPORT_SECURITY" {}
variable "CONTENT_SECURITY_POLICY" {}
variable "NEW_RELIC_APP_NAME_WEBSTORE" {}


# Variables for api-cp-configmap
variable "appsettings__EnableBasicAuthorization" {}
variable "ConnectionStrings__Znode_CommercePortalDBEntities" {}
variable "appsettings__ZnodeCpApiDomainName" {}
variable "NEW_RELIC_APP_NAME_API_CP" {}

#variable for api-gateways-cp
variable "AuthKeys__Issuer_cp" {}
variable "AuthKeys__Audience_cp" {}
variable "ZnodeTokenization__EnableTokenization" {}
variable "ZnodeTokenization__APIGatewayDomainName" {}
variable "ZnodeTokenization__APIGatewayDomainKey" {}
variable "MicroServices__cpapi" {}
variable "NEW_RELIC_APP_NAME_API_GATEWAYS_CP" {}

#variable for cp

variable "HTTPS" {}
variable "SSL_CRT_FILE" {}
variable "SSL_KEY_FILE" {}
variable "REACT_APP_Znode_Admin_Website" {}
variable "REACT_APP_API_URL" {}
variable "REACT_APP_BASE_URL" {}
variable "REACT_APP_THUMBNAIL_IMAGE_PATH" {}
variable "REACT_APP_CP_URL_PATH" {}
variable "REACT_APP_CUSTOM_API_GATEWAY" {}
variable "NEW_RELIC_APP_NAME_CP" {}


# Variables for AZfunctions ConfigMap
variable "RabbitMqConnectionString" {}
variable "SqlConnectionString" {}


# Payment Manager
variable "ASPNETCORE_URLS_2" {}
variable "ASPNETCORE_HTTP_PORT_2" {}
variable "appsettings__BraintreePluginApiRootUri" {}
variable "appsettings__SpreedlyPluginApiRootUri" {}
variable "appsettings__ZnodeCoreApiRootUri" {}
variable "appsettings__ZnodePrivateKey" {}
variable "appsetting__EnableTokenBasedAuthorization" {}
variable "appsetting__ZnodeApiRootUri" {}
#variable "appsetting__payment-manager-api-etna-qa.amla.io" {}
variable "Caching__SqlCacheConnectionString" {}

variable "ConnectionStrings__ZnodePaymentManager_Entities" {}
variable "appsettings__ZnodePaymentManagerApiRootUri" {}

# Shipping Manager

variable "AllowedHosts" {}
variable "appsettings__CORSDomains" {}
variable "appsettings__MinifiedJsonResponse" {}
variable "appsettings__Log4netInternalDebugging" {}
variable "appsettings__EnableDBLogging" {}
variable "appsettings__MinimumWorkerThreads" {}
variable "appsettings__MinimumIOCompletionThreads" {}
variable "Caching__Type__shippingmanager" {}
variable "Caching__AbsoluteExpiration" {}
variable "Caching__SlidingExpiration" {}
variable "Caching__CacheSchemaName" {}
variable "Caching__CacheTableName" {}
variable "Caching__DeletionInterval" {}
variable "Caching__RedisCacheInstanceName" {}
variable "Caching__InMemoryCacheKeys_shippingmanager" {}

# fedex

variable "appsettings__ZnodeApiUriItemSeparator" {}
variable "appsettings__ZnodeCommaReplacer" {}
variable "appsettings__ZnodeApiUriKeyValueSeparator" {}
variable "Logging__ApplicationInsights__Enabled" {}
variable "Logging__ApplicationInsights__RoleName" {}



# variables of ReportsApi
variable "ConnectionStrings__ZnodeReportEntities" {}



# ConfigMap for admin
resource "kubernetes_config_map" "znode10xadmin" {
  metadata {
    name = "znode10xadmin"
    namespace = "znode"
  }

  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTPS_PORT
    ASPNETCORE_Kestrel__Certificates__Default__Password = var.ASPNETCORE_Kestrel__Certificates__Default__Password
    ASPNETCORE_Kestrel__Certificates__Default__Path    = var.ASPNETCORE_Kestrel__Certificates__Default__Path
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    appsettings__ZnodeCommercePortalRootUri   = var.appsettings__ZnodeCommercePortalRootUri
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    appsettings__ZnodeAdminUri                = var.appsettings__ZnodeAdminUri
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    appsettings__ZnodeApiDomainKey            = var.appsettings__ZnodeApiDomainKey
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__AzureBlobConnectionString    = var.appsettings__AzureBlobConnectionString
    appsettings__AzureBlobContainerName       = var.appsettings__AzureBlobContainerName
    appsettings__AuthenticationCookieExpireTimeSpan = var.appsettings__AuthenticationCookieExpireTimeSpan
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    appsettings__ZnodeGoogleMapKey            = var.appsettings__ZnodeGoogleMapKey
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    SessionState__IdleTimeout                 = var.SessionState__IdleTimeout
    NEW_RELIC_LICENSE_KEY                     = var.NEW_RELIC_LICENSE_KEY
    NEW_RELIC_APP_NAME                        = var.NEW_RELIC_APP_NAME_ADMIN
    NEW_RELIC_LABELS                          = var.NEW_RELIC_LABELS
  }
}

# ConfigMap for custom-api
resource "kubernetes_config_map" "znode10customapi" {
  metadata {
    name = "znode10customapi"
    namespace = "znode"
  }

  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTPS_PORT
    ASPNETCORE_Kestrel__Certificates__Default__Password = var.ASPNETCORE_Kestrel__Certificates__Default__Password
    ASPNETCORE_Kestrel__Certificates__Default__Path    = var.ASPNETCORE_Kestrel__Certificates__Default__Path
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS
    appsettings__PluginApiRootUri             = var.appsettings__PluginApiRootUri
    Caching__Type                             = var.Caching__Type__Customapi
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    appsettings__EnableTokenBasedAuthorization = var.appsettings__EnableTokenBasedAuthorization
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName 
    appsetting__ZnodeAdminURLCorsPolicy        = var.appsetting__ZnodeAdminURLCorsPolicy
    appsettings__IsGlobalAPIAuthorization     = var.appsettings__IsGlobalAPIAuthorization
    appsettings__ZnodeCorsAllowedURLS = var.appsettings__ZnodeCorsAllowedURLS
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    NEW_RELIC_LICENSE_KEY                     = var.NEW_RELIC_LICENSE_KEY
    NEW_RELIC_APP_NAME                        = var.NEW_RELIC_APP_NAME_CUSTOM_API
    NEW_RELIC_LABELS                          = var.NEW_RELIC_LABELS
  }
}

# ConfigMap for customtable
resource "kubernetes_config_map" "znode10xcustomtable" {
  metadata {
    name = "znode10xcustomtable"
    namespace = "znode"
  }

  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_2
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_2
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    ConnectionStrings__ZnodeCustomTableEntities = var.ConnectionStrings__ZnodeCustomTableEntities
    ConnectionStrings__ZnodeFramework_Entities = var.ConnectionStrings__ZnodeFramework_Entities
    ConnectionStrings__Znode_Entities         = var.ConnectionStrings__Znode_Entities
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    appsettings__AzureBlobConnectionString    = var.appsettings__AzureBlobConnectionString
    appsettings__AzureBlobContainerName       = var.appsettings__AzureBlobContainerName
    NEW_RELIC_LICENSE_KEY                     = var.NEW_RELIC_LICENSE_KEY
    NEW_RELIC_APP_NAME                        = var.NEW_RELIC_APP_NAME_CUSTOMTABLE
    NEW_RELIC_LABELS                          = var.NEW_RELIC_LABELS
  }
}

# ConfigMap for dev-api
resource "kubernetes_config_map" "znode10xapi" {
  metadata {
    name = "znode10xapi"
    namespace = "znode"
  } 

  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTPS_PORT
    ASPNETCORE_Kestrel__Certificates__Default__Password = var.ASPNETCORE_Kestrel__Certificates__Default__Password
    ASPNETCORE_Kestrel__Certificates__Default__Path    = var.ASPNETCORE_Kestrel__Certificates__Default__Path
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    Caching__Type                             = var.Caching__Type
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString
    Caching__InMemoryCacheKeys                = var.Caching__InMemoryCacheKeys_api
    EventBus__RabbitMQManagementUrl           = var.EventBus__RabbitMQManagementUrl
    appsettings__PluginApiRootUri             = var.appsettings__PluginApiRootUri
    appsettings__CustomAPIRootUri             = var.appsettings__CustomAPIRootUri
    appsettings__ZnodeApiV2RootUri            = var.appsettings__ZnodeApiV2RootUri
    appsettings__EnableTokenBasedAuthorization = var.appsettings__EnableTokenBasedAuthorization
    appsettings__ValidateAuthHeader           = var.appsettings__ValidateAuthHeader
    appsettings__PublishProductFetchChunkSize = var.appsettings__PublishProductFetchChunkSize
    appsettings__AzureBlobConnectionString    = var.appsettings__AzureBlobConnectionString
    appsettings__AzureBlobURL                 = var.appsettings__AzureBlobURL
    appsettings__ERPConnectorFolder           = var.appsettings__ERPConnectorFolder
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    appsettings__ZnodeApiDomainKey            = var.appsettings__ZnodeApiDomainKey
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__AzureBlobContainerName       = var.appsettings__AzureBlobContainerName
    appsettings__AdminWebsiteUrl              = var.appsettings__AdminWebsiteUrl
    appsettings__ElasticSearchRootUri         = var.appsettings__ElasticSearchRootUri
    ConnectionStrings__ZnodeECommerceDB       = var.ConnectionStrings__ZnodeECommerceDB
    ConnectionStrings__Znode_Entities         = var.ConnectionStrings__Znode_Entities
    ConnectionStrings__ZnodePublish_Entities  = var.ConnectionStrings__ZnodePublish_Entities
    ConnectionStrings__ZnodeKlaviyo_Entities  = var.ConnectionStrings__ZnodeKlaviyo_Entities
    ConnectionStrings__ZnodeFramework_Entities = var.ConnectionStrings__ZnodeFramework_Entities
    ConnectionStrings__HangfireConnection     = var.ConnectionStrings__HangfireConnection
    ConnectionStrings__ZnodeRecommendationDB  = var.ConnectionStrings__ZnodeRecommendationDB
    ConnectionStrings__ZnodeRecommendation_Entities = var.ConnectionStrings__ZnodeRecommendation_Entities
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    NEW_RELIC_LICENSE_KEY                     = var.NEW_RELIC_LICENSE_KEY
    NEW_RELIC_APP_NAME                        = var.NEW_RELIC_APP_NAME_API
    NEW_RELIC_LABELS                          = var.NEW_RELIC_LABELS
  }
}

              
# ConfigMap for api-v2
resource "kubernetes_config_map" "znode10xapiv2" {
  metadata {
    name = "znode10xapiv2"
    namespace = "znode"
  }


  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_2
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_2
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    Caching__Type                             = var.Caching__Type
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString    
    ConnectionStrings__ZnodeECommerceDB       = var.ConnectionStrings__ZnodeECommerceDB
    ConnectionStrings__Znode_Entities         = var.ConnectionStrings__Znode_Entities
    ConnectionStrings__ZnodePublish_Entities  = var.ConnectionStrings__ZnodePublish_Entities
    ConnectionStrings__ZnodeKlaviyo_Entities  = var.ConnectionStrings__ZnodeKlaviyo_Entities
    ConnectionStrings__ZnodeFramework_Entities = var.ConnectionStrings__ZnodeFramework_Entities
    ConnectionStrings__HangfireConnection     = var.ConnectionStrings__HangfireConnection
    ConnectionStrings__ZnodeRecommendationDB  = var.ConnectionStrings__ZnodeRecommendationDB
    ConnectionStrings__ZnodeRecommendation_Entities = var.ConnectionStrings__ZnodeRecommendation_Entities
    appsettings__ProductPublishChunkSize      = var.appsettings__ProductPublishChunkSize
    appsettings__IndexChunkSizeOnCategoryPublish = var.appsettings__IndexChunkSizeOnCategoryPublish
    appsettings__ElasticSearchRootUri         = var.appsettings__ElasticSearchRootUri
    appsettings__SearchIndexChunkSize         = var.appsettings__SearchIndexChunkSize
    appsettings__PublishCatalogConnectionTime = var.appsettings__PublishCatalogConnectionTime
    appsettings__PublishProductFetchChunkSizes = var.appsettings__PublishProductFetchChunkSizes
    appsettings__ZnodeApiV2RootUri            = var.appsettings__ZnodeApiV2RootUri
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    Caching__InMemoryCacheKeys                = var.Caching__InMemoryCacheKeys_v2

    appsettings__CustomAPIRootUri             = var.appsettings__CustomAPIRootUri
    EventBus__RabbitMQConnectionString         = var.EventBus__RabbitMQConnectionString
    EventBus__RabbitMQManagementUrl            = var.EventBus__RabbitMQManagementUrl
    NEW_RELIC_LICENSE_KEY                     = var.NEW_RELIC_LICENSE_KEY
    NEW_RELIC_APP_NAME                        = var.NEW_RELIC_APP_NAME_API_V2
    NEW_RELIC_LABELS                          = var.NEW_RELIC_LABELS
    
  }
}


# ConfigMap for api-gateways
resource "kubernetes_config_map" "znode10xapigateways" {
  metadata {
    name      = "znode10xapigateways"
    namespace = "znode"
  }

  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTPS_PORT
    ASPNETCORE_Kestrel__Certificates__Default__Password = var.ASPNETCORE_Kestrel__Certificates__Default__Password
    ASPNETCORE_Kestrel__Certificates__Default__Path    = var.ASPNETCORE_Kestrel__Certificates__Default__Path
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    AuthKeys__AuthRootUri                     = var.AuthKeys__AuthRootUri
    AuthKeys__AuthRootKey                     = var.AuthKeys__AuthRootKey
    AuthKeys__JWTEncryptionKey                = var.AuthKeys__JWTEncryptionKey
    AuthKeys__JWTSigningKey                   = var.AuthKeys__JWTSigningKey
    AuthKeys__JWTExpirySpan                   = var.AuthKeys__JWTExpirySpan
    AuthKeys__Issuer                          = var.AuthKeys__Issuer
    AuthKeys__Audience                        = var.AuthKeys__Audience
    MicroServices__customapi                  = var.MicroServices__customapi
    MicroServices__customtable                = var.MicroServices__customtable
    MicroServices__znodeengineapiv2           = var.MicroServices__znodeengineapiv2
    MicroServices__paymentmanager             = var.MicroServices__paymentmanager
    MicroServices__shippingmanager            = var.MicroServices__shippingmanager

    MicroServices__multifrontapi              = var.MicroServices__multifrontapi
    MicroServices__cpapi                      = var.MicroServices__cpapi
    MicroServices__ReportsApi                 = var.MicroServices__ReportsApi
    SwaggerEndPoints__0__Key                  = var.SwaggerEndPoints__0__Key
    SwaggerEndPoints__0__Config__0__Name      = var.SwaggerEndPoints__0__Config__0__Name
    SwaggerEndPoints__0__Config__0__Version   = var.SwaggerEndPoints__0__Config__0__Version
    SwaggerEndPoints__0__Config__0__Url       = var.SwaggerEndPoints__0__Config__0__Url
    SwaggerEndPoints__0__Config__0__BaseUrl   = var.SwaggerEndPoints__0__Config__0__BaseUrl
    SwaggerEndPoints__1__Key                  = var.SwaggerEndPoints__1__Key
    SwaggerEndPoints__1__Config__0__Name      = var.SwaggerEndPoints__1__Config__0__Name
    SwaggerEndPoints__1__Config__0__Version   = var.SwaggerEndPoints__1__Config__0__Version
    SwaggerEndPoints__1__Config__0__Url       = var.SwaggerEndPoints__1__Config__0__Url
    SwaggerEndPoints__1__Config__0__BaseUrl   = var.SwaggerEndPoints__1__Config__0__BaseUrl
    SwaggerEndPoints__2__Key                  = var.SwaggerEndPoints__2__Key
    SwaggerEndPoints__2__Config__0__Name      = var.SwaggerEndPoints__2__Config__0__Name
    SwaggerEndPoints__2__Config__0__Version   = var.SwaggerEndPoints__2__Config__0__Version
    SwaggerEndPoints__2__Config__0__Url       = var.SwaggerEndPoints__2__Config__0__Url
    SwaggerEndPoints__2__Config__0__BaseUrl   = var.SwaggerEndPoints__2__Config__0__BaseUrl
    SwaggerEndPoints__3__Key                  = var.SwaggerEndPoints__3__Key
    SwaggerEndPoints__3__Config__0__Name      = var.SwaggerEndPoints__3__Config__0__Name
    SwaggerEndPoints__3__Config__0__Version   = var.SwaggerEndPoints__3__Config__0__Version
    SwaggerEndPoints__3__Config__0__Url       = var.SwaggerEndPoints__3__Config__0__Url
    SwaggerEndPoints__3__Config__0__BaseUrl   = var.SwaggerEndPoints__3__Config__0__BaseUrl
    SwaggerEndPoints__4__Key                  = var.SwaggerEndPoints__4__Key
    SwaggerEndPoints__4__Config__0__Name      = var.SwaggerEndPoints__4__Config__0__Name
    SwaggerEndPoints__4__Config__0__Version   = var.SwaggerEndPoints__4__Config__0__Version
    SwaggerEndPoints__4__Config__0__Url       = var.SwaggerEndPoints__4__Config__0__Url
    SwaggerEndPoints__4__Config__0__BaseUrl   = var.SwaggerEndPoints__4__Config__0__BaseUrl
    SwaggerEndPoints__5__Key                  = var.SwaggerEndPoints__5__Key
    SwaggerEndPoints__5__Config__0__Name      = var.SwaggerEndPoints__5__Config__0__Name
    SwaggerEndPoints__5__Config__0__Version   = var.SwaggerEndPoints__5__Config__0__Version
    SwaggerEndPoints__5__Config__0__Url       = var.SwaggerEndPoints__5__Config__0__Url
    SwaggerEndPoints__5__Config__0__BaseUrl   = var.SwaggerEndPoints__5__Config__0__BaseUrl
    SwaggerEndPoints__6__Key                  = var.SwaggerEndPoints__6__Key
    SwaggerEndPoints__6__Config__0__Name      = var.SwaggerEndPoints__6__Config__0__Name
    SwaggerEndPoints__6__Config__0__Version   = var.SwaggerEndPoints__6__Config__0__Version
    SwaggerEndPoints__6__Config__0__Url       = var.SwaggerEndPoints__6__Config__0__Url
    SwaggerEndPoints__6__Config__0__BaseUrl   = var.SwaggerEndPoints__6__Config__0__BaseUrl
    SwaggerEndPoints__7__Key                  = var.SwaggerEndPoints__7__Key
    SwaggerEndPoints__7__Config__0__Name      = var.SwaggerEndPoints__7__Config__0__Name
    SwaggerEndPoints__7__Config__0__Version   = var.SwaggerEndPoints__7__Config__0__Version
    SwaggerEndPoints__7__Config__0__Url       = var.SwaggerEndPoints__7__Config__0__Url
    SwaggerEndPoints__7__Config__0__BaseUrl   = var.SwaggerEndPoints__7__Config__0__BaseUrl
    appsettings__EnableJWTAuthorization       = var.appsettings__EnableJWTAuthorization
    appsettings__EnableBlobConfiguration      = var.appsettings__EnableBlobConfiguration
    appsettings__containerKey                 = var.appsettings__containerKey
    appSettings__HangfireConnection           = var.ConnectionStrings__HangfireConnection
    appSettings__HangfireConfigSection__HangfireDashboardAllowedOrigins = var.appsettings__ZnodeAdminUri
    appsettings__connectionString             = var.appsettings__connectionString
    appsettings__directoryKey                 = var.appsettings__directoryKey
    appsettings__PrivateTokenAuthorization    = var.appsettings__PrivateTokenAuthorization
    NEW_RELIC_LICENSE_KEY                     = var.NEW_RELIC_LICENSE_KEY
    NEW_RELIC_APP_NAME                        = var.NEW_RELIC_APP_NAME_API_GATEWAYS
    NEW_RELIC_LABELS                          = var.NEW_RELIC_LABELS

  }
}


# ConfigMap for webstore
resource "kubernetes_config_map" "znode10xwebstore" {
  metadata {
    name      = "znode10xwebstore"
    namespace = "znode"
  }

  data = {
    TZ                                  = var.TZ
    PORT                                = var.PORT
    CONTENT_SECURITY_POLICY             = var.CONTENT_SECURITY_POLICY
    X_CONTENT_TYPE_OPTIONS              = var.X_CONTENT_TYPE_OPTIONS
    PERMISSIONS_POLICY                  = var.PERMISSIONS_POLICY
    REFERRER_POLICY                     = var.REFERRER_POLICY
    NODE_TLS_REJECT_UNAUTHORIZED        = var.NODE_TLS_REJECT_UNAUTHORIZED
    REDIS_CONNECTION_STRING             = var.REDIS_CONNECTION_STRING
    DEFAULT_THEME                       = var.DEFAULT_THEME
    API_Domain_Key                      = var.API_Domain_Key
    NX_DISABLE_DB                       = var.NX_DISABLE_DB
    LOGGING_METHOD                      = var.LOGGING_METHOD
    API_DOMAIN                          = var.API_DOMAIN
    STORAGE                             = var.STORAGE
    ENABLE_PAGE_CACHE                   = var.ENABLE_PAGE_CACHE
    CACHE_MEMORY                        = var.CACHE_MEMORY
    ENABLE_CACHE                        = var.ENABLE_CACHE
    IS_301_REDIRECT                     = var.IS_301_REDIRECT
    API_KEY                             = var.API_KEY
    NEXT_PUBLIC_GOOGLE_MAP_API_KEY      = var.NEXT_PUBLIC_GOOGLE_MAP_API_KEY
    NEXT_PUBLIC_GEO_CODE_URL            = var.NEXT_PUBLIC_GEO_CODE_URL
    API_URL                             = var.API_URL
    API_V2_DOMAIN                       = var.API_V2_DOMAIN
    NX_DAEMON                           = var.NX_DAEMON
    WEBSTORE_DOMAIN_NAME                = var.WEBSTORE_DOMAIN_NAME
    NEXTAUTH_SECRET                     = var.NEXTAUTH_SECRET
    NEXTAUTH_URL                        = var.NEXTAUTH_URL
    NODE_ENV                            = var.NODE_ENV
    STRICT_TRANSPORT_SECURITY           = var.STRICT_TRANSPORT_SECURITY
    NEW_RELIC_LICENSE_KEY               = var.NEW_RELIC_LICENSE_KEY
    NEW_RELIC_APP_NAME                  = var.NEW_RELIC_APP_NAME_WEBSTORE
    NEW_RELIC_LABELS                    = var.NEW_RELIC_LABELS
  }
}
# ConfigMap for api-cp
resource "kubernetes_config_map" "znode10apicp" {
  metadata {
    name = "znode10apicp"
    namespace = "znode"
  }

  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_2
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_2
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__ElasticSearchRootUri         = var.appsettings__ElasticSearchRootUri
    appsettings__EnableTokenBasedAuthorization = var.appsettings__EnableTokenBasedAuthorization
    appsettings__ValidateAuthHeader           = var.appsettings__ValidateAuthHeader
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    appsettings__IsGlobalAPIAuthorization     = var.appsettings__IsGlobalAPIAuthorization
    Caching__Type                             = var.Caching__Type
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString
    Caching__InMemoryCacheKeys                = var.Caching__InMemoryCacheKeys
    appsettings__CustomAPIRootUri             = var.appsettings__CustomAPIRootUri
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    appsettings__ZnodeApiV2RootUri            = var.appsettings__ZnodeApiV2RootUri
    appsettings__PublishProductFetchChunkSize = var.appsettings__PublishProductFetchChunkSize
    appsettings__ZnodeCpApiDomainName         = var.appsettings__ZnodeCpApiDomainName 
    appsettings__ZnodeApiDomainKey            = var.appsettings__ZnodeApiDomainKey
    appsettings__ZnodeCommercePortalRootUri   = var.appsettings__ZnodeCommercePortalRootUri
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    ConnectionStrings__ZnodeECommerceDB       = var.ConnectionStrings__ZnodeECommerceDB
    ConnectionStrings__Znode_CommercePortalDBEntities = var.ConnectionStrings__Znode_CommercePortalDBEntities
    ConnectionStrings__Znode_Entities         = var.ConnectionStrings__Znode_Entities
    ConnectionStrings__ZnodePublish_Entities  = var.ConnectionStrings__ZnodePublish_Entities
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    ConnectionStrings__ZnodeFramework_Entities = var.ConnectionStrings__ZnodeFramework_Entities
    NEW_RELIC_LICENSE_KEY                     = var.NEW_RELIC_LICENSE_KEY
    NEW_RELIC_APP_NAME                        = var.NEW_RELIC_APP_NAME_API_CP
    NEW_RELIC_LABELS                          = var.NEW_RELIC_LABELS
      }
}    

# ConfigMap for commerce-portal
resource "kubernetes_config_map" "znode10xcp" {
  metadata {
    name = "znode10xcp"
    namespace = "znode"
  }
  data = {
    PORT                                      = var.PORT 
    HTTPS                                     = var.HTTPS
    SSL_CRT_FILE                              = var.SSL_CRT_FILE
    SSL_KEY_FILE                              = var.SSL_KEY_FILE
    REACT_APP_Znode_Admin_Website             = var.REACT_APP_Znode_Admin_Website
    REACT_APP_API_URL                         = var.REACT_APP_API_URL
    REACT_APP_BASE_URL                        = var.REACT_APP_BASE_URL
    REACT_APP_THUMBNAIL_IMAGE_PATH            = var.REACT_APP_THUMBNAIL_IMAGE_PATH
    REACT_APP_CP_URL_PATH                     = var.REACT_APP_CP_URL_PATH   
    REACT_APP_CUSTOM_API_GATEWAY              = var.REACT_APP_CUSTOM_API_GATEWAY
    NEW_RELIC_LICENSE_KEY                     = var.NEW_RELIC_LICENSE_KEY
    NEW_RELIC_APP_NAME                        = var.NEW_RELIC_APP_NAME_CP
    NEW_RELIC_LABELS                          = var.NEW_RELIC_LABELS
  }
}

resource "kubernetes_config_map" "azfunctions" {
  metadata {
    name = "znode10xazfunctions"
    namespace = "znode"
}
  data = {
    RabbitMqConnectionString                  = var.RabbitMqConnectionString
    SqlConnectionString                       = var.SqlConnectionString
   }
}

# ConfigMap for payment manager
resource "kubernetes_config_map" "znode10xpaymentmanager" {
  metadata {
    name = "znode10xpaymentmanager"
    namespace = "znode"
  }
  data = { 
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_2
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_2
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__BraintreePluginApiRootUri    = var.appsettings__BraintreePluginApiRootUri
    appsettings__SpreedlyPluginApiRootUri     = var.appsettings__SpreedlyPluginApiRootUri
    appsettings__ZnodeCoreApiRootUri          = var.appsettings__ZnodeCoreApiRootUri
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    appsettings__ZnodeApiDomainKey            = var.appsettings__ZnodeApiDomainKey
    appsettings__ZnodePrivateKey              = var.appsettings__ZnodePrivateKey
    appsetting__EnableTokenBasedAuthorization = var.appsetting__EnableTokenBasedAuthorization
    appsetting__ZnodeApiRootUri               = var.appsetting__ZnodeApiRootUri
    #appsetting__payment-manager-api-etna-qa.amla.io = var.appsetting__payment-manager-api-etna-qa.amla.io
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString
    Caching__SqlCacheConnectionString         = var.Caching__SqlCacheConnectionString
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
  }
}

# ConfigMap for pluginbraintree
resource "kubernetes_config_map" "znode10xpluginbraintree" {
  metadata {
    name = "znode10xpluginbraintree"
    namespace = "znode"
  }
  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_2
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_2
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    appsettings__ZnodePaymentManagerApiRootUri = var.appsettings__ZnodePaymentManagerApiRootUri
  }
}

# ConfigMap for pluginspreedly
resource "kubernetes_config_map" "znode10xpluginspreedly" {
  metadata {
    name = "znode10xpluginspreedly"
    namespace = "znode"
  }
  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_2
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_2
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    appsettings__ZnodePaymentManagerApiRootUri = var.appsettings__ZnodePaymentManagerApiRootUri
  }
}

# ConfigMap for ReportsApi
resource "kubernetes_config_map" "znode10xreportsapi" {
  metadata {
    name = "znode10xreportsapi"
    namespace = "znode"
  }
  data = {

    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_2
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_2
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    ConnectionStrings__ZnodeReportEntities    = var.ConnectionStrings__ZnodeReportEntities
  }
}



# ConfigMap for Pagebuilder
resource "kubernetes_config_map" "znode10xpagebuilder" {
  metadata {
    name = "znode10xpagebuilder"
    namespace = "znode"
  }
  data = {

    TZ                                        = var.TZ
    NODE_ENV                                  = var.NODE_ENV
    PORT                                      = var.PORT
    NEXTAUTH_SECRET                           = var.NEXTAUTH_SECRET
    NODE_TLS_REJECT_UNAUTHORIZED              = var.NODE_TLS_REJECT_UNAUTHORIZED
    NX_DAEMON                                 = var.NX_DAEMON
    NX_DISABLE_DB                             = var.NX_DISABLE_DB
    API_URL                                   = var.API_URL
    WEBSTORE_DOMAIN_NAME                      = var.WEBSTORE_DOMAIN_NAME_PAGE
    LOGGING_METHOD                            = var.LOGGING_METHOD
    API_DOMAIN                                = var.API_DOMAIN
    API_Domain_Key                            = var.API_Domain_Key
    API_V2_DOMAIN                             = var.API_V2_DOMAIN
    API_KEY                                   = var.API_KEY
    REDIS_CONNECTION_STRING                   = var.REDIS_CONNECTION_STRING

  }
}


resource "kubernetes_config_map" "znode10xshippingmanager" {
  metadata {
    name = "znode10xshippingmanager"
    namespace = "znode"
  }
  data = { 
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_2
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_2
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    ApplicationInsights__ZnodeMongoDBForLog   = var.ConnectionStrings__ZnodeMongoDBForLog
    AllowedHosts                              = var.AllowedHosts
    appsettings__CORSDomains                  = var.appsettings__CORSDomains
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__ZnodeCoreApiRootUri          = var.appsettings__ZnodeCoreApiRootUri
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    appsettings__MinifiedJsonResponse         = var.appsettings__MinifiedJsonResponse
    appsettings__IsGlobalAPIAuthorization     = var.appsettings__IsGlobalAPIAuthorization
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    appsettings__ZnodeApiDomainKey            = var.appsettings__ZnodeApiDomainKey
    appsettings__ZnodePrivateKey              = var.appsettings__ZnodePrivateKey
    appsettings__Log4netInternalDebugging     = var.appsettings__Log4netInternalDebugging
    appsettings__EnableDBLogging              = var.appsettings__EnableDBLogging
    appsetting__EnableTokenBasedAuthorization = var.appsetting__EnableTokenBasedAuthorization
    appsettings__MinimumWorkerThreads         = var.appsettings__MinimumWorkerThreads
    appsettings__MinimumIOCompletionThreads   = var.appsettings__MinimumIOCompletionThreads
    Caching__Type                             = var.Caching__Type__shippingmanager
    Caching__AbsoluteExpiration               = var.Caching__AbsoluteExpiration
    Caching__SlidingExpiration                = var.Caching__SlidingExpiration
    Caching__SqlCacheConnectionString         = var.ConnectionStrings__ZnodeECommerceDB
    Caching__CacheSchemaName                  = var.Caching__CacheSchemaName
    Caching__CacheTableName                   = var.Caching__CacheTableName
    Caching__DeletionInterval                 = var.Caching__DeletionInterval
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString
    Caching__RedisCacheInstanceName           = var.Caching__RedisCacheInstanceName
    Caching__InMemoryCacheKeys_shippingmanager = var.Caching__InMemoryCacheKeys_shippingmanager
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
  }
}


resource "kubernetes_config_map" "znode10xpluginfedex" {
  metadata {
    name = "znode10xpluginfedex"
    namespace = "znode"
  }
  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_2
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_2
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    ApplicationInsights__ZnodeMongoDBForLog   = var.ConnectionStrings__ZnodeMongoDBForLog
    Caching__Type                             = var.Caching__Type__shippingmanager
    Caching__AbsoluteExpiration               = var.Caching__AbsoluteExpiration
    Caching__SlidingExpiration                = var.Caching__SlidingExpiration
    Caching__SqlCacheConnectionString         = var.ConnectionStrings__ZnodeECommerceDB
    Caching__CacheSchemaName                  = var.Caching__CacheSchemaName
    Caching__CacheTableName                   = var.Caching__CacheTableName
    Caching__DeletionInterval                 = var.Caching__DeletionInterval
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString
    Caching__RedisCacheInstanceName           = var.Caching__RedisCacheInstanceName
    Caching__InMemoryCacheKeys_shippingmanager = var.Caching__InMemoryCacheKeys_shippingmanager
    AllowedHosts                              = var.AllowedHosts
    appsettings__ZnodeApiUriItemSeparator     = var.appsettings__ZnodeApiUriItemSeparator
    appsettings__MinimumWorkerThreads         = var.appsettings__MinimumWorkerThreads
    appsettings__MinimumIOCompletionThreads   = var.appsettings__MinimumIOCompletionThreads
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    appsettings__IsGlobalAPIAuthorization     = var.appsettings__IsGlobalAPIAuthorization
    appsettings__ZnodeCommaReplacer           = var.appsettings__ZnodeCommaReplacer
    appsettings__ZnodeApiUriKeyValueSeparator = var.appsettings__ZnodeApiUriKeyValueSeparator
    appsettings__EnableTokenBasedAuthorization = var.appsettings__EnableTokenBasedAuthorization
    Logging__ApplicationInsights__Enabled      = var.Logging__ApplicationInsights__Enabled
    Logging__ApplicationInsights__RoleName    = var.Logging__ApplicationInsights__RoleName
    Logging__ApplicationInsights__ZnodeMongoDBForLog = var.ConnectionStrings__ZnodeMongoDBForLog
  }
}

resource "kubernetes_config_map" "znode10xpluginups" {
  metadata {
    name = "znode10xpluginups"
    namespace = "znode"
  }
  data = {
    TZ                                        = var.TZ
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_2
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_2
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    Caching__Type                             = var.Caching__Type__shippingmanager
    Caching__AbsoluteExpiration               = var.Caching__AbsoluteExpiration
    Caching__SlidingExpiration                = var.Caching__SlidingExpiration
    Caching__SqlCacheConnectionString         = var.ConnectionStrings__ZnodeECommerceDB
    Caching__CacheSchemaName                  = var.Caching__CacheSchemaName
    Caching__CacheTableName                   = var.Caching__CacheTableName
    Caching__DeletionInterval                 = var.Caching__DeletionInterval
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString
    Caching__RedisCacheInstanceName           = var.Caching__RedisCacheInstanceName
    Caching__InMemoryCacheKeys_shippingmanager = var.Caching__InMemoryCacheKeys_shippingmanager
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    appsettings__EnableTokenBasedAuthorization = var.appsettings__EnableTokenBasedAuthorization
    appsettings__MinimumWorkerThreads         = var.appsettings__MinimumWorkerThreads
    appsettings__ZnodeApiUriItemSeparator     = var.appsettings__ZnodeApiUriItemSeparator
    appsettings__IsGlobalAPIAuthorization     = var.appsettings__IsGlobalAPIAuthorization
    appsettings__ZnodeCommaReplacer           = var.appsettings__ZnodeCommaReplacer
    appsettings__ZnodeApiUriKeyValueSeparator = var.appsettings__ZnodeApiUriKeyValueSeparator
    appsettings__MinimumIOCompletionThreads   = var.appsettings__MinimumIOCompletionThreads
    Logging__ApplicationInsights__Enabled      = var.Logging__ApplicationInsights__Enabled
    Logging__ApplicationInsights__RoleName    = var.Logging__ApplicationInsights__RoleName
    Logging__ApplicationInsights__ZnodeMongoDBForLog = var.ConnectionStrings__ZnodeMongoDBForLog

  }
}
