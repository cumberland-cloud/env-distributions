locals {
    # constants
    domain                                  = "cumberland-cloud.com"
    metadata_keys                           = [ "namespace" ]
    # master configuration
    namespaces                              = {
        namespace                           = "cumberland-cloud"
        tenant                              = {
            namespace                       = "tenant"
            cafe_mark                       = {
                namespace                   = "cafe-mark"
            }
            sunshine_daze                   = {
                namespace                   = "sunshine-daze"
            }
        }
        system                              = {
            namespace                       = "system"
            console                         = {
                namespace                   = "console"
            }
        }
    }
    # intermediate calculations
    tenant_distributions            = { 
        for key, tenant in local.namespaces.tenant:
            key                     => {
                name                = "/${local.namespaces.namespace}/${local.namespaces.tenant.namespace}/${tenant.namespace}"
            }
            if !contains(local.metadata_keys, key)       
    }
    system_distributions            = { 
        for key, system in local.namespaces.system:
            key                     => {
                name                = "/${local.namespaces.namespace}/${local.namespaces.system.namespace}/${system.namespace}"
            }
            if !contains(local.metadata_keys, key)       
    }
    # pre deployment locals
    distributions                   = merge(local.tenant_distributions, local.system_distributions)

}