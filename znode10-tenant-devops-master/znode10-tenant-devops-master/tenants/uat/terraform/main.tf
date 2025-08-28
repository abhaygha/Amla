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
variable "appsettings__PaymentApplicationUrl" {}
variable "appsettings__ZnodePaymentApiDomainName" {}
variable "appsettings__ZnodeApiGateway" {}
variable "appsettings__AzureBlobConnectionString" {}
variable "appsettings__ZnodeTenantManagerUri" {}
variable "appsettings__AzureBlobContainerName" {}
variable "appsettings__ZnodeCommercePortalRootUri" {}
variable "ConnectionStrings__ZnodeMongoDBForLog" {}

# Variables for customtable ConfigMap

variable "ConnectionStrings__ZnodeCustomTableEntities" {}
variable "ConnectionStrings__ZnodeFramework_Entities" {}
variable "ConnectionStrings__Znode_Entities" {}
variable "ConnectionStrings__Znode_Entities_CustomSP" {}
variable "ConnectionStrings__ZnodeCustomStoreProcedureDB" {}

# Variables for payment ConfigMap
variable "appsettings__CORSDomains" {}
variable "appsettings__ValidateAuthHeader" {}
variable "appsettings__ValidatePrivateKey" {}
variable "appsettings__AzureBlobKeys__EnableBlobConfiguration" {}
variable "appsettings__AzureBlobKeys__containerKey" {}
variable "appsettings__AzureBlobKeys__connectionString" {}
variable "ConnectionStrings__znode_multifront_paymentEntities" {}

# Variables for dev-api-configmap
variable "Caching__Type" {}
variable "Caching__Type__customapi" {}
variable "Caching__RedisCacheConnectionString" {}
variable "EventBus__RabbitMQManagementUrl" {}
variable "appsettings__PluginApiRootUri" {}
variable "appsettings__EnableTokenBasedAuthorization" {}
variable "appsettings__PublishProductFetchChunkSize" {}
variable "appsettings__AzureBlobURL" {}
variable "appsettings__ERPConnectorFolder" {}
variable "appsettings__AdminWebsiteUrl" {}
variable "ConnectionStrings__ZnodeECommerceDB" {}
variable "ConnectionStrings__ZnodePublish_Entities" {}
variable "appsettings__CacheTimeout" {}
variable "ConnectionStrings__ZnodeKlaviyo_Entities" {}
variable "ConnectionStrings__HangfireConnection" {}
variable "ConnectionStrings__ZnodeRecommendationDB" {}
variable "ConnectionStrings__ZnodeRecommendation_Entities" {}
variable "appsettings__CustomAPIRootUri" {}
variable "Caching__InMemoryCacheKeys_api" {}
variable "Caching__InMemoryCacheKeys_v2" {}
# Variables for api-cp-configmap
variable "appsettings__ElasticSearchRootUri" {}
variable "appsettings__EnableBasicAuthorization" {}
variable "appsettings__IsGlobalAPIAuthorization" {}
variable "ConnectionStrings__Znode_CommercePortalDBEntities" {}

# Variables for api-v2-configmap

variable "appsettings__IndexChunkSizeOnCategoryPublish" {}
variable "appsettings__SearchIndexChunkSize" {}
variable "appsettings__PublishCatalogConnectionTime" {} 
variable "appsettings__ProductPublishChunkSize" {}
variable "EventBus__RabbitMQConnectionString" {}
variable "    appsettings__ZnodeApiV2RootUri " {}
variable "ASPNETCORE_URLS_1" {}
variable "ASPNETCORE_HTTP_PORT_1" {}

#variable for api-gateways-cp
variable "AuthKeys__AuthRootUri" {}
variable "AuthKeys__JWTEncryptionKey" {}
variable "AuthKeys__JWTSigningKey" {}
variable "AuthKeys__JWTExpirySpan" {}
variable "MicroServices__cpapi" {}

#variable for api-gateways


variable "AuthKeys__AuthRootKey" {}
variable "MicroServices__customapi" {}
variable "MicroServices__customtable" {}
variable "MicroServices__znodeengineapiv2" {}
variable "MicroServices__paymentapi" {}
variable "MicroServices__multifrontapi" {}
variable "MicroServices__ReportsApi" {}
variable "appsettings__PrivateTokenAuthorization" {}

variable "AuthKeys__Issuer" {}
variable "AuthKeys__Audience" {}
variable "SwaggerEndPoints__0__Key" {}
variable "SwaggerEndPoints__0__Config__0__Name" {}
variable "SwaggerEndPoints__0__Config__0__Version" {}
variable "SwaggerEndPoints__0__Config__0__Url" {}
variable "SwaggerEndPoints__0__Config__0__BaseUrl" {}
variable "SwaggerEndPoints__1__Key" {}
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
variable "appsettings__EnableBlobConfiguration" {}
variable "appsettings__containerKey" {}
variable "appsettings__connectionString" {}
variable "appsettings__directoryKey" {}



#variable for cp

variable "PORT" {} 
variable "HTTPS" {}
variable "SSL_CRT_FILE" {}
variable "SSL_KEY_FILE" {}
variable "REACT_APP_Znode_Admin_Website" {}
variable "REACT_APP_API_URL" {}
variable "REACT_APP_BASE_URL" {}
variable "REACT_APP_THUMBNAIL_IMAGE_PATH" {}
variable "REACT_APP_CP_URL_PATH" {}

#variable for webstore
variable "ALLOW_REFERRER" {}
variable "X_CONTENT_TYPE_OPTIONS" {}
variable "PERMISSIONS_POLICY" {}
variable "REFERRER_POLICY" {}
variable "NODE_TLS_REJECT_UNAUTHORIZED" {}
variable "MONGO_DB" {}
variable "MONGO_URL" {}
variable "CACHE_TOKEN" {}
variable "APPLICATION_INSIGHT_CONNECTION_STRING" {}
variable "APPLICATION_INSIGHT" {}
variable "ENABLE_CACHE" {}
variable "REDIS_CONNECTION_STRING" {}
variable "REDIS_CONNECTION_STRING_API" {}
variable "REDIS_CONNECTION_STRING_APICP" {} 
variable "PAYMENT_DOMAIN_NAME" {}
variable "DEFAULT_THEME" {}
variable "CACHE_MEMORY" {}
variable "CACHE_KEY" {}
variable "IS_301_REDIRECT" {}
variable "ENABLE_PAGE_CACHE" {}
variable "REVALIDATE_URL" {}
variable "IS_MESSAGE_BROKER_REGISTERED" {}
variable "PaymentAPI_PrivateKey" {}
variable "API_Domain_Key" {}
variable "API_Domain" {}
variable "FACEBOOK_CLIENT_SECRET" {}
variable "FACEBOOK_CLIENT_ID" {}
variable "GOOGLE_CLIENT_SECRET" {}
variable "GOOGLE_CLIENT_ID" {}
variable "API" {}
variable "STORAGE" {}
variable "MONGO" {}
variable "ENABLE_LOGGING" {}
variable "WEBSTORE_DOMAIN_NAME" {}
variable "BASE_API_URL" {}
variable "NEXTAUTH_SECRET" {}
variable "NEXTAUTH_URL" {}
variable "NODE_ENV" {}
variable "BASE_URL" {}
variable "STRICT_TRANSPORT_SECURITY" {}
variable "CONTENT_SECURITY_POLICY" {}

# Payment Manager
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

variable "MicroServices__paymentmanager" {}


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
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__AzureBlobConnectionString     = var.appsettings__AzureBlobConnectionString
    appsettings__PaymentApplicationUrl        = var.appsettings__PaymentApplicationUrl
    appsettings__ZnodePaymentApiDomainName    = var.appsettings__ZnodePaymentApiDomainName
    appsettings__AzureBlobContainerName = var.appsettings__AzureBlobContainerName
    appsettings__ZnodeCommercePortalRootUri   = var.appsettings__ZnodeCommercePortalRootUri
    appsettings__ZnodeTenantManagerUri        = var.appsettings__ZnodeTenantManagerUri
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
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
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_1
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_1
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    Caching__Type                             = var.Caching__Type__customapi
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString
    appsettings__PluginApiRootUri             = var.appsettings__PluginApiRootUri
    appsettings__PaymentApplicationUrl        = var.appsettings__PaymentApplicationUrl
    appsettings__ZnodePaymentApiDomainName    = var.appsettings__ZnodePaymentApiDomainName
    appsettings__EnableTokenBasedAuthorization = var.appsettings__EnableTokenBasedAuthorization
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    appsettings__ZnodeApiDomainKey            = var.appsettings__ZnodeApiDomainKey
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
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
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_1
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_1
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    ConnectionStrings__ZnodeCustomTableEntities = var.ConnectionStrings__ZnodeCustomTableEntities
    ConnectionStrings__ZnodeFramework_Entities = var.ConnectionStrings__ZnodeFramework_Entities
    ConnectionStrings__Znode_Entities         = var.ConnectionStrings__Znode_Entities
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    ConnectionStrings__Znode_Entities_CustomSP = var.ConnectionStrings__Znode_Entities_CustomSP
    ConnectionStrings__ZnodeCustomStoreProcedureDB = var.ConnectionStrings__ZnodeCustomStoreProcedureDB
  }
}

# ConfigMap for payment
resource "kubernetes_config_map" "znode10xpayment" {
  metadata {
    name = "znode10xpayment"
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
    appsettings__CORSDomains                  = var.appsettings__CORSDomains
    appsettings__ValidateAuthHeader           = var.appsettings__ValidateAuthHeader
    appsettings__ValidatePrivateKey           = var.appsettings__ValidatePrivateKey 
    appsettings__AzureBlobKeys__EnableBlobConfiguration = var.appsettings__AzureBlobKeys__EnableBlobConfiguration
    appsettings__AzureBlobKeys__containerKey  = var.appsettings__AzureBlobKeys__containerKey
    appsettings__AzureBlobKeys__connectionString = var.appsettings__AzureBlobKeys__connectionString
    appsettings__ZnodePrivateKey              = var.appsettings__ZnodePrivateKey
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    ConnectionStrings__znode_multifront_paymentEntities = var.ConnectionStrings__znode_multifront_paymentEntities
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
    appsettings__PaymentApplicationUrl        = var.appsettings__PaymentApplicationUrl
    appsettings__CustomAPIRootUri             = var.appsettings__CustomAPIRootUri
    appsettings__ZnodePaymentApiDomainName    = var.appsettings__ZnodePaymentApiDomainName
    appsettings__EnableTokenBasedAuthorization = var.appsettings__EnableTokenBasedAuthorization
    appsettings__ValidateAuthHeader           = var.appsettings__ValidateAuthHeader
    appsettings__PublishProductFetchChunkSize = var.appsettings__PublishProductFetchChunkSize
    appsettings__AzureBlobConnectionString    = var.appsettings__AzureBlobConnectionString
    appsettings__AzureBlobURL                 = var.appsettings__AzureBlobURL
    appsettings__ERPConnectorFolder           = var.appsettings__ERPConnectorFolder
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    appsettings__ZnodeApiDomainKey            = var.appsettings__ZnodeApiDomainKey
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    appsettings__AzureBlobContainerName       = var.appsettings__AzureBlobContainerName
    appsettings__CacheTimeout                 = var.appsettings__CacheTimeout
    appsettings__AdminWebsiteUrl              = var.appsettings__AdminWebsiteUrl
    appsettings__ZnodeApiV2RootUri              = var.    appsettings__ZnodeApiV2RootUri 
    appsettings__AzureBlobContainerName        = var.appsettings__AzureBlobContainerName
    REDIS_CONNECTION_STRING                   = var.REDIS_CONNECTION_STRING_API
    ConnectionStrings__ZnodeECommerceDB       = var.ConnectionStrings__ZnodeECommerceDB
    ConnectionStrings__Znode_Entities         = var.ConnectionStrings__Znode_Entities
    ConnectionStrings__ZnodePublish_Entities  = var.ConnectionStrings__ZnodePublish_Entities
    ConnectionStrings__ZnodeKlaviyo_Entities  = var.ConnectionStrings__ZnodeKlaviyo_Entities
    ConnectionStrings__ZnodeFramework_Entities = var.ConnectionStrings__ZnodeFramework_Entities
    ConnectionStrings__HangfireConnection     = var.ConnectionStrings__HangfireConnection
    ConnectionStrings__ZnodeRecommendationDB  = var.ConnectionStrings__ZnodeRecommendationDB
    ConnectionStrings__ZnodeRecommendation_Entities = var.ConnectionStrings__ZnodeRecommendation_Entities
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
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
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTPS_PORT
    ASPNETCORE_Kestrel__Certificates__Default__Password = var.ASPNETCORE_Kestrel__Certificates__Default__Password
    ASPNETCORE_Kestrel__Certificates__Default__Path    = var.ASPNETCORE_Kestrel__Certificates__Default__Path
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__ElasticSearchRootUri         = var.appsettings__ElasticSearchRootUri
    appsettings__EnableTokenBasedAuthorization = var.appsettings__EnableTokenBasedAuthorization
    appsettings__PaymentApplicationUrl        = var.appsettings__PaymentApplicationUrl
    appsettings__ZnodePaymentApiDomainName    = var.appsettings__ZnodePaymentApiDomainName
    appsettings__ValidateAuthHeader           = var.appsettings__ValidateAuthHeader
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    appsettings__IsGlobalAPIAuthorization     = var.appsettings__IsGlobalAPIAuthorization
    appsettings__CustomAPIRootUri             = var.appsettings__CustomAPIRootUri
    appsettings__ZnodeApiV2RootUri            = var.appsettings__ZnodeApiV2RootUri

    Caching__Type                             = var.Caching__Type
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString
    Caching__InMemoryCacheKeys                = var.Caching__InMemoryCacheKeys
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    appsettings__PublishProductFetchChunkSize = var.appsettings__PublishProductFetchChunkSize
    appsettings__ZnodeApiDomainKey            = var.appsettings__ZnodeApiDomainKey
    REDIS_CONNECTION_STRING                   = var.REDIS_CONNECTION_STRING_APICP
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    appsettings__ZnodeCommercePortalRootUri   = var.appsettings__ZnodeCommercePortalRootUri
    ConnectionStrings__ZnodeECommerceDB       = var.ConnectionStrings__ZnodeECommerceDB
    ConnectionStrings__Znode_CommercePortalDBEntities = var.ConnectionStrings__Znode_CommercePortalDBEntities
    ConnectionStrings__Znode_Entities         = var.ConnectionStrings__Znode_Entities
    ConnectionStrings__ZnodePublish_Entities  = var.ConnectionStrings__ZnodePublish_Entities
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    ConnectionStrings__ZnodeFramework_Entities = var.ConnectionStrings__ZnodeFramework_Entities
    ConnectionStrings__ZnodeKlaviyo_Entities  = var.ConnectionStrings__ZnodeKlaviyo_Entities
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
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_1
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_1
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
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
    appsettings__CustomAPIRootUri             = var.appsettings__CustomAPIRootUri
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    Caching__InMemoryCacheKeys                = var.Caching__InMemoryCacheKeys_v2
    
    appsettings__ZnodeApiV2RootUri              = var.    appsettings__ZnodeApiV2RootUri        
    appsettings__SearchIndexChunkSize         = var.appsettings__SearchIndexChunkSize
    appsettings__PublishCatalogConnectionTime = var.appsettings__PublishCatalogConnectionTime
    appsettings__PublishProductFetchChunkSize = var.appsettings__PublishProductFetchChunkSize
    EventBus__RabbitMQConnectionString         = var.EventBus__RabbitMQConnectionString
    EventBus__RabbitMQManagementUrl            = var.EventBus__RabbitMQManagementUrl
    
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
    MicroServices__paymentapi                 = var.MicroServices__paymentapi
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
    appsettings__ValidateAuthHeader           = var.appsettings__ValidateAuthHeader
    appsettings__PrivateTokenAuthorization    = var.appsettings__PrivateTokenAuthorization
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    appsettings__EnableJWTAuthorization       = var.appsettings__EnableJWTAuthorization
    appsettings__EnableBlobConfiguration      = var.appsettings__EnableBlobConfiguration
    appsettings__containerKey                 = var.appsettings__containerKey
    appsettings__connectionString             = var.appsettings__connectionString
    appsettings__directoryKey                 = var.appsettings__directoryKey
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
    ASPNETCORE_HTTPS_PORT               = var.ASPNETCORE_HTTPS_PORT
    ASPNETCORE_Kestrel__Certificates__Default__Password = var.ASPNETCORE_Kestrel__Certificates__Default__Password
    ASPNETCORE_Kestrel__Certificates__Default__Path    = var.ASPNETCORE_Kestrel__Certificates__Default__Path
    ASPNETCORE_URLS                     = var.ASPNETCORE_URLS
    ASPNETCORE_CULTURE                  = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE               = var.ASPNETCORE_UI_CULTURE
    SSL_CRT_FILE                        = var.SSL_CRT_FILE
    SSL_KEY_FILE                        = var.SSL_KEY_FILE
    PORT                                = var.PORT
    HTTPS                               = var.HTTPS
    CONTENT_SECURITY_POLICY             = var.CONTENT_SECURITY_POLICY
    ALLOW_REFERRER                      = var.ALLOW_REFERRER
    STORAGE                             = var.STORAGE
    X_CONTENT_TYPE_OPTIONS              = var.X_CONTENT_TYPE_OPTIONS
    BASE_URL                            = var.BASE_URL
    PERMISSIONS_POLICY                  = var.PERMISSIONS_POLICY
    REFERRER_POLICY                     = var.REFERRER_POLICY
    ENABLE_PAGE_CACHE                   = var.ENABLE_PAGE_CACHE
    NODE_TLS_REJECT_UNAUTHORIZED        = var.NODE_TLS_REJECT_UNAUTHORIZED
    MONGO_DB                            = var.MONGO_DB
    MONGO_URL                           = var.MONGO_URL
    CACHE_MEMORY                        = var.CACHE_MEMORY
    CACHE_TOKEN                         = var.CACHE_TOKEN
    APPLICATION_INSIGHT_CONNECTION_STRING = var.APPLICATION_INSIGHT_CONNECTION_STRING
    APPLICATION_INSIGHT                 = var.APPLICATION_INSIGHT
    ENABLE_CACHE                        = var.ENABLE_CACHE
    IS_301_REDIRECT                     = var.IS_301_REDIRECT
    REDIS_CONNECTION_STRING             = var.REDIS_CONNECTION_STRING
    PAYMENT_DOMAIN_NAME                 = var.PAYMENT_DOMAIN_NAME
    DEFAULT_THEME                       = var.DEFAULT_THEME
    CACHE_KEY                           = var.CACHE_KEY
    REVALIDATE_URL                      = var.REVALIDATE_URL
    IS_MESSAGE_BROKER_REGISTERED        = var.IS_MESSAGE_BROKER_REGISTERED
    PaymentAPI_PrivateKey               = var.PaymentAPI_PrivateKey
    API_Domain_Key                      = var.API_Domain_Key
    API_Domain                          = var.API_Domain
    FACEBOOK_CLIENT_SECRET              = var.FACEBOOK_CLIENT_SECRET
    FACEBOOK_CLIENT_ID                  = var.FACEBOOK_CLIENT_ID
    GOOGLE_CLIENT_SECRET                = var.GOOGLE_CLIENT_SECRET
    GOOGLE_CLIENT_ID                    = var.GOOGLE_CLIENT_ID
    API                                 = var.API
    MONGO                               = var.MONGO
    ENABLE_LOGGING                      = var.ENABLE_LOGGING
    WEBSTORE_DOMAIN_NAME                = var.WEBSTORE_DOMAIN_NAME
    BASE_API_URL                        = var.BASE_API_URL
    NEXTAUTH_SECRET                     = var.NEXTAUTH_SECRET
    NEXTAUTH_URL                        = var.NEXTAUTH_URL
    NODE_ENV                            = var.NODE_ENV
    STRICT_TRANSPORT_SECURITY           = var.STRICT_TRANSPORT_SECURITY
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
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_1
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_1
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
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_1
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_1
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
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_1
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_1
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
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTP_PORT_1
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS_1
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    ConnectionStrings__ZnodeReportEntities    = var.ConnectionStrings__ZnodeReportEntities
  }
}
