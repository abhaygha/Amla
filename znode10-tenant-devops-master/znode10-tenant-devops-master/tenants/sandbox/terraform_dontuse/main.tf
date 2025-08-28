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
variable "appsettings__AzureBlobContainerName" {}
variable "appsettings__ZnodeCommercePortalRootUri" {}
variable "ConnectionStrings__ZnodeMongoDBForLog" {}
variable "appsettings__AzureBlobCommonContainerName" {}


# Variables for customtable ConfigMap

variable "ConnectionStrings__ZnodeCustomTableEntities" {}
variable "ConnectionStrings__ZnodeFramework_Entities" {}
variable "ConnectionStrings__Znode_Entities" {}

variable "ConnectionStrings__Znode_Entities_CustomSP" {}
variable "ConnectionStrings__ZnodeCustomStoreProcedureDB" {}

# Variables for payment ConfigMap
variable "appsettings__CORSDomains" {}
variable "appsettings__ValidateAuthHeader" {}
variable "appsetting__ZnodeAdminURLCorsPolicy" {}
variable "appsettings__ValidatePrivateKey" {}
variable "appsettings__AmazonPublicKey" {}
variable "ConnectionStrings__znode_multifront_paymentEntities" {}
variable "appsettings__ZnodePrivateKey" {}
variable "appsettings__AzureBlobKeys__EnableBlobConfiguration" {}
variable "appsettings__AzureBlobKeys__containerKey" {}
variable "appsettings__AzureBlobKeys__connectionString" {}



# Variables for dev-api-configmap
variable "Caching__Type" {}
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
variable "ConnectionStrings__ZnodeKlaviyo_Entities" {}
variable "ConnectionStrings__HangfireConnection" {}
variable "ConnectionStrings__ZnodeRecommendationDB" {}
variable "ConnectionStrings__ZnodeRecommendation_Entities" {}
variable "appsettings__ZnodeEngineApiV2" {}

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


#variable for api-gateways-cp
variable "AuthKeys__AuthRootUri" {}
variable "AuthKeys__JWTEncryptionKey" {}
variable "AuthKeys__JWTSigningKey" {}
variable "AuthKeys__JWTExpirySpan" {}
variable "AuthKeys__Issuer_cp" {}
variable "AuthKeys__Audience_cp" {}
variable "ZnodeTokenization__EnableTokenization" {}
variable "ZnodeTokenization__APIGatewayDomainName" {}
variable "ZnodeTokenization__APIGatewayDomainKey" {}
variable "SwaggerEndPoints__0__Key" {}
variable "SwaggerEndPoints__0__Config__0__Name" {}
variable "SwaggerEndPoints__0__Config__0__Version" {}
variable "SwaggerEndPoints__0__Config__0__Url" {}
variable "SwaggerEndPoints__0__Config__0__BaseUrl" {}
variable "MicroServices__cpapi" {}
variable "MicroServices__znodeapi" {}


#variable for api-gateways


variable "AuthKeys__AuthRootKey" {}
variable "MicroServices__customapi" {}
variable "MicroServices__customtable" {}
variable "MicroServices__znodeengineapiv2" {}
variable "MicroServices__paymentapi" {}
variable "MicroServices__multifrontapi" {}
variable "AuthKeys__Issuer" {}
variable "AuthKeys__Audience" {}
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
variable "BASE_URL" {}
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
variable "PAYMENT_DOMAIN_NAME" {}
variable "DEFAULT_THEME" {}
variable "CACHE_KEY" {}
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
variable "MONGO" {}
variable "ENABLE_LOGGING" {}
variable "WEBSTORE_DOMAIN_NAME" {}
variable "BASE_API_URL" {}
variable "NEXTAUTH_SECRET" {}
variable "NEXTAUTH_URL" {}
variable "NODE_ENV" {}
variable "STRICT_TRANSPORT_SECURITY" {}
variable "CONTENT_SECURITY_POLICY" {}
variable "X_FRAME_OPTION" {}





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
    appsettings__PaymentApplicationUrl        = var.appsettings__PaymentApplicationUrl
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    appsettings__ZnodePaymentApiDomainName    = var.appsettings__ZnodePaymentApiDomainName
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__AzureBlobConnectionString    = var.appsettings__AzureBlobConnectionString
    appsettings__ZnodeCommercePortalRootUri   = var.appsettings__ZnodeCommercePortalRootUri
    appsettings__AzureBlobCommonContainerName = var.appsettings__AzureBlobCommonContainerName
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
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTPS_PORT
    ASPNETCORE_Kestrel__Certificates__Default__Password = var.ASPNETCORE_Kestrel__Certificates__Default__Password
    ASPNETCORE_Kestrel__Certificates__Default__Path    = var.ASPNETCORE_Kestrel__Certificates__Default__Path
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS
    appsettings__PluginApiRootUri             = var.appsettings__PluginApiRootUri
    appsettings__PaymentApplicationUrl        = var.appsettings__PaymentApplicationUrl
    appsettings__ZnodePaymentApiDomainName    = var.appsettings__ZnodePaymentApiDomainName
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsetting__ZnodeAdminURLCorsPolicy       = var.appsetting__ZnodeAdminURLCorsPolicy
    appsettings__EnableTokenBasedAuthorization = var.appsettings__EnableTokenBasedAuthorization
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    appsettings__IsGlobalAPIAuthorization     = var.appsettings__IsGlobalAPIAuthorization
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
    ASPNETCORE_HTTPS_PORT                     = var.ASPNETCORE_HTTPS_PORT
    ASPNETCORE_Kestrel__Certificates__Default__Password = var.ASPNETCORE_Kestrel__Certificates__Default__Password
    ASPNETCORE_Kestrel__Certificates__Default__Path    = var.ASPNETCORE_Kestrel__Certificates__Default__Path
    ASPNETCORE_URLS                           = var.ASPNETCORE_URLS
    ASPNETCORE_CULTURE                        = var.ASPNETCORE_CULTURE
    ASPNETCORE_UI_CULTURE                     = var.ASPNETCORE_UI_CULTURE
    ConnectionStrings__ZnodeCustomTableEntities = var.ConnectionStrings__ZnodeCustomTableEntities
    ConnectionStrings__ZnodeFramework_Entities = var.ConnectionStrings__ZnodeFramework_Entities
    ConnectionStrings__Znode_Entities         = var.ConnectionStrings__Znode_Entities
    ConnectionStrings__Znode_Entities_CustomSP = var.ConnectionStrings__Znode_Entities_CustomSP
    ConnectionStrings__ZnodeCustomStoreProcedureDB = var.ConnectionStrings__ZnodeCustomStoreProcedureDB
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
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
    appsettings__AzureBlobKeys__containerKey  = var.appsettings__AzureBlobKeys__containerKey
    appsettings__AzureBlobKeys__EnableBlobConfiguration = var.appsettings__AzureBlobKeys__EnableBlobConfiguration
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
    EventBus__RabbitMQManagementUrl           = var.EventBus__RabbitMQManagementUrl
    appsettings__PluginApiRootUri             = var.appsettings__PluginApiRootUri
    appsettings__PaymentApplicationUrl        = var.appsettings__PaymentApplicationUrl
    appsettings__ZnodePaymentApiDomainName    = var.appsettings__ZnodePaymentApiDomainName
    appsettings__EnableTokenBasedAuthorization = var.appsettings__EnableTokenBasedAuthorization
    appsettings__ValidateAuthHeader           = var.appsettings__ValidateAuthHeader
    appsettings__AzureBlobConnectionString    = var.appsettings__AzureBlobConnectionString
    appsettings__ZnodeApiGateway              = var.appsettings__ZnodeApiGateway
    appsettings__AdminWebsiteUrl              = var.appsettings__AdminWebsiteUrl
    appsettings__ZnodeEngineApiV2             = var.appsettings__ZnodeEngineApiV2
    appsettings__AzureBlobCommonContainerName = var.appsettings__AzureBlobCommonContainerName
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
    appsettings__ZnodeApiDomainName           = var.appsettings__ZnodeApiDomainName
    appsettings__ValidateAuthHeader           = var.appsettings__ValidateAuthHeader
    Caching__Type                             = var.Caching__Type
    Caching__RedisCacheConnectionString       = var.Caching__RedisCacheConnectionString
    Caching__InMemoryCacheKeys                = var.Caching__InMemoryCacheKeys
    appsettings__ZnodeApiRootUri              = var.appsettings__ZnodeApiRootUri
    appsettings__PublishProductFetchChunkSize = var.appsettings__PublishProductFetchChunkSize
    appsettings__ZnodeApiDomainKey            = var.appsettings__ZnodeApiDomainKey
    appsettings__ZnodeCommercePortalRootUri   = var.appsettings__ZnodeCommercePortalRootUri
    ConnectionStrings__ZnodeECommerceDB       = var.ConnectionStrings__ZnodeECommerceDB
    ConnectionStrings__ZnodeKlaviyo_Entities  = var.ConnectionStrings__ZnodeKlaviyo_Entities
    ConnectionStrings__Znode_CommercePortalDBEntities = var.ConnectionStrings__Znode_CommercePortalDBEntities
    ConnectionStrings__Znode_Entities         = var.ConnectionStrings__Znode_Entities
    ConnectionStrings__ZnodePublish_Entities  = var.ConnectionStrings__ZnodePublish_Entities
    ConnectionStrings__ZnodeMongoDBForLog     = var.ConnectionStrings__ZnodeMongoDBForLog
    ConnectionStrings__ZnodeFramework_Entities = var.ConnectionStrings__ZnodeFramework_Entities
      }
}               

# ConfigMap for api-v2
resource "kubernetes_config_map" "znode10xcustomer" {
  metadata {
    name = "znode10xcustomer"
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
    appsettings__ElasticSearchRootUri            = var.appsettings__ElasticSearchRootUri
    
    appsettings__SearchIndexChunkSize         = var.appsettings__SearchIndexChunkSize
    appsettings__PublishCatalogConnectionTime = var.appsettings__PublishCatalogConnectionTime
    appsettings__PublishProductFetchChunkSize = var.appsettings__PublishProductFetchChunkSize
    EventBus__RabbitMQConnectionString         = var.EventBus__RabbitMQConnectionString
    EventBus__RabbitMQManagementUrl            = var.EventBus__RabbitMQManagementUrl   
  }
}

# ConfigMap for api-gateways-cp
resource "kubernetes_config_map" "znode10xapigateway-cp" {
  metadata {
    name = "znode10xapigateway-cp"
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
    AuthKeys__JWTEncryptionKey                = var.AuthKeys__JWTEncryptionKey
    AuthKeys__JWTSigningKey                   = var.AuthKeys__JWTSigningKey
    AuthKeys__JWTExpirySpan                   = var.AuthKeys__JWTExpirySpan
    AuthKeys__Issuer                         = var.AuthKeys__Issuer_cp
    AuthKeys__Audience                      = var.AuthKeys__Audience_cp
    ZnodeTokenization__EnableTokenization     = var.ZnodeTokenization__EnableTokenization
    ZnodeTokenization__APIGatewayDomainName  = var.ZnodeTokenization__APIGatewayDomainName
    ZnodeTokenization__APIGatewayDomainKey    = var.ZnodeTokenization__APIGatewayDomainKey
    MicroServices__cpapi                      = var.MicroServices__cpapi
    MicroServices__znodeapi                   = var.MicroServices__znodeapi
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
    appsettings__ValidateAuthHeader           = var.appsettings__ValidateAuthHeader
    appsettings__EnableBasicAuthorization     = var.appsettings__EnableBasicAuthorization
    appsettings__EnableJWTAuthorization       = var.appsettings__EnableJWTAuthorization
    appsettings__EnableBlobConfiguration = var.appsettings__EnableBlobConfiguration
    appsettings__containerKey  = var.appsettings__containerKey
    appsettings__connectionString = var.appsettings__connectionString
    appsettings__directoryKey = var.appsettings__directoryKey
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
    BASE_URL                            = var.BASE_URL
    SSL_CRT_FILE                        = var.SSL_CRT_FILE
    SSL_KEY_FILE                        = var.SSL_KEY_FILE
    PORT                                = var.PORT
    CONTENT_SECURITY_POLICY             = var.CONTENT_SECURITY_POLICY
    ALLOW_REFERRER                      = var.ALLOW_REFERRER
    X_FRAME_OPTION                      = var.X_FRAME_OPTION
    X_CONTENT_TYPE_OPTIONS              = var.X_CONTENT_TYPE_OPTIONS
    PERMISSIONS_POLICY                  = var.PERMISSIONS_POLICY
    REFERRER_POLICY                     = var.REFERRER_POLICY
    NODE_TLS_REJECT_UNAUTHORIZED        = var.NODE_TLS_REJECT_UNAUTHORIZED
    MONGO_DB                            = var.MONGO_DB
    MONGO_URL                           = var.MONGO_URL
    CACHE_TOKEN                         = var.CACHE_TOKEN
    APPLICATION_INSIGHT_CONNECTION_STRING = var.APPLICATION_INSIGHT_CONNECTION_STRING
    APPLICATION_INSIGHT                 = var.APPLICATION_INSIGHT
    ENABLE_CACHE                        = var.ENABLE_CACHE
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
  }
}
