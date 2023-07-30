module "cloudfront"{
    for_each            = local.distributions

    source              = "git::https://github.com/cumberland-cloud/modules-cloudfront.git?ref=v1.0.0"

    distribution        = {
        name            = each.value
    }
    domain              = local.domain
    wildcard_cert       = true
}