## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_control.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |
| [aws_s3_bucket.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [random_id.bucket_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn) | ARN of ACM certificate for custom domain (must be in us-east-1) | `string` | `null` | no |
| <a name="input_aliases"></a> [aliases](#input\_aliases) | Alternate domain names (CNAMEs) for the distribution | `list(string)` | `[]` | no |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Prefix for the S3 bucket name | `string` | n/a | yes |
| <a name="input_cloudfront_functions"></a> [cloudfront\_functions](#input\_cloudfront\_functions) | CloudFront Functions to associate with the distribution | <pre>list(object({<br>    event_type   = string<br>    function_arn = string<br>  }))</pre> | `[]` | no |
| <a name="input_comment"></a> [comment](#input\_comment) | Comment for the CloudFront distribution | `string` | `"CloudFront distribution for S3 bucket"` | no |
| <a name="input_compress"></a> [compress](#input\_compress) | Enable automatic compression | `bool` | `true` | no |
| <a name="input_custom_error_responses"></a> [custom\_error\_responses](#input\_custom\_error\_responses) | Custom error responses | <pre>list(object({<br>    error_code            = number<br>    response_code         = number<br>    response_page_path    = string<br>    error_caching_min_ttl = number<br>  }))</pre> | <pre>[<br>  {<br>    "error_caching_min_ttl": 300,<br>    "error_code": 404,<br>    "response_code": 404,<br>    "response_page_path": "/404.html"<br>  },<br>  {<br>    "error_caching_min_ttl": 300,<br>    "error_code": 403,<br>    "response_code": 403,<br>    "response_page_path": "/403.html"<br>  }<br>]</pre> | no |
| <a name="input_default_cache_allowed_methods"></a> [default\_cache\_allowed\_methods](#input\_default\_cache\_allowed\_methods) | HTTP methods that CloudFront processes and forwards | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD",<br>  "OPTIONS"<br>]</pre> | no |
| <a name="input_default_cache_cached_methods"></a> [default\_cache\_cached\_methods](#input\_default\_cache\_cached\_methods) | HTTP methods for which CloudFront caches responses | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD"<br>]</pre> | no |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | Object that CloudFront returns when the root URL is requested | `string` | `"index.html"` | no |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | Default TTL in seconds | `number` | `3600` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Allow bucket deletion even when not empty | `bool` | `false` | no |
| <a name="input_forward_cookies"></a> [forward\_cookies](#input\_forward\_cookies) | Cookie forwarding policy (none, whitelist, all) | `string` | `"none"` | no |
| <a name="input_forward_headers"></a> [forward\_headers](#input\_forward\_headers) | Headers to forward to the origin | `list(string)` | `[]` | no |
| <a name="input_forward_query_string"></a> [forward\_query\_string](#input\_forward\_query\_string) | Forward query strings to the origin | `bool` | `false` | no |
| <a name="input_geo_restriction_locations"></a> [geo\_restriction\_locations](#input\_geo\_restriction\_locations) | List of country codes for geo restriction | `list(string)` | `[]` | no |
| <a name="input_geo_restriction_type"></a> [geo\_restriction\_type](#input\_geo\_restriction\_type) | Geo restriction type (none, whitelist, blacklist) | `string` | `"none"` | no |
| <a name="input_ipv6_enabled"></a> [ipv6\_enabled](#input\_ipv6\_enabled) | Enable IPv6 for CloudFront distribution | `bool` | `true` | no |
| <a name="input_logging_bucket"></a> [logging\_bucket](#input\_logging\_bucket) | S3 bucket for CloudFront access logs (must end with .s3.amazonaws.com) | `string` | `""` | no |
| <a name="input_logging_include_cookies"></a> [logging\_include\_cookies](#input\_logging\_include\_cookies) | Include cookies in access logs | `bool` | `false` | no |
| <a name="input_logging_prefix"></a> [logging\_prefix](#input\_logging\_prefix) | Prefix for CloudFront log files | `string` | `"cloudfront/"` | no |
| <a name="input_max_ttl"></a> [max\_ttl](#input\_max\_ttl) | Maximum TTL in seconds | `number` | `86400` | no |
| <a name="input_min_ttl"></a> [min\_ttl](#input\_min\_ttl) | Minimum TTL in seconds | `number` | `0` | no |
| <a name="input_minimum_protocol_version"></a> [minimum\_protocol\_version](#input\_minimum\_protocol\_version) | Minimum TLS protocol version | `string` | `"TLSv1.2_2021"` | no |
| <a name="input_ordered_cache_behaviors"></a> [ordered\_cache\_behaviors](#input\_ordered\_cache\_behaviors) | Ordered list of cache behaviors | <pre>list(object({<br>    path_pattern           = string<br>    allowed_methods        = list(string)<br>    cached_methods         = list(string)<br>    viewer_protocol_policy = string<br>    min_ttl                = number<br>    default_ttl            = number<br>    max_ttl                = number<br>    compress               = bool<br>    forward_query_string   = bool<br>    forward_headers        = list(string)<br>    forward_cookies        = string<br>  }))</pre> | `[]` | no |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | Price class for CloudFront distribution (PriceClass\_All, PriceClass\_200, PriceClass\_100) | `string` | `"PriceClass_100"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region for the S3 bucket | `string` | `"eu-west-3"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags | `map(string)` | `{}` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | Enable versioning for the S3 bucket | `bool` | `false` | no |
| <a name="input_viewer_protocol_policy"></a> [viewer\_protocol\_policy](#input\_viewer\_protocol\_policy) | Protocol policy (allow-all, https-only, redirect-to-https) | `string` | `"redirect-to-https"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN of the S3 bucket |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | ID of the S3 bucket |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Name of the S3 bucket |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | Regional domain name of the S3 bucket |
| <a name="output_cloudfront_distribution_arn"></a> [cloudfront\_distribution\_arn](#output\_cloudfront\_distribution\_arn) | ARN of the CloudFront distribution |
| <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id) | ID of the CloudFront distribution |
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | Domain name of the CloudFront distribution |
| <a name="output_cloudfront_hosted_zone_id"></a> [cloudfront\_hosted\_zone\_id](#output\_cloudfront\_hosted\_zone\_id) | CloudFront Route 53 zone ID |
| <a name="output_cloudfront_status"></a> [cloudfront\_status](#output\_cloudfront\_status) | Current status of the CloudFront distribution |
| <a name="output_origin_access_control_id"></a> [origin\_access\_control\_id](#output\_origin\_access\_control\_id) | ID of the CloudFront Origin Access Control |
