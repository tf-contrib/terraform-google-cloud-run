<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_google"></a> [google](#requirement\_google) | < 6.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | < 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.10.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 5.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_cloud_run_domain_mapping.domain_map](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_cloud_run_domain_mapping) | resource |
| [google-beta_google_cloud_run_service.main](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_cloud_run_service) | resource |
| [google_cloud_run_service_iam_member.authorize](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Cloud Run service deployment location | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to deploy to | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the Cloud Run service to create | `string` | n/a | yes |
| <a name="input_certificate_mode"></a> [certificate\_mode](#input\_certificate\_mode) | The mode of the certificate (NONE or AUTOMATIC) | `string` | `"NONE"` | no |
| <a name="input_container_concurrency"></a> [container\_concurrency](#input\_container\_concurrency) | Concurrent request limits to the service | `number` | `null` | no |
| <a name="input_containers"></a> [containers](#input\_containers) | Containers Definitions<br>More info: https://cloud.google.com/run/docs/reference/yaml/v1 | <pre>list(object({<br>    # Name of the container<br>    name = optional(string, null)<br>    # GCR hosted image URL to deploy<br>    image = optional(string, null)<br>    # Resource limits to the container<br>    limits = optional(map(string), null)<br>    # Resource requests to the container<br>    requests = optional(map(string), null)<br>    # Port which the container listens to (http1 or h2c)<br>    ports = optional(object({<br>      name = string<br>      port = number<br>    }), null)<br>    # Arguments passed to the ENTRYPOINT command, include these only if image entrypoint needs arguments<br>    argument = optional(list(string), null)<br>    # Leave blank to use the ENTRYPOINT command defined in the container image, include these only if image entrypoint should be overwritten<br>    command = optional(list(string), null)<br>    # Startup probe of application within the container.<br>    # All other probes are disabled if a startup probe is provided, until it succeeds.<br>    # Container will not be added to service endpoints if the probe fails.<br>    # More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes<br>    startup_probe = optional(object({<br>      failure_threshold     = optional(number, null)<br>      initial_delay_seconds = optional(number, null)<br>      timeout_seconds       = optional(number, null)<br>      period_seconds        = optional(number, null)<br>      http_get = optional(object({<br>        path = optional(string)<br>        http_headers = optional(list(object({<br>          name  = string<br>          value = string<br>        })), null)<br>      }), null)<br>      tcp_socket = optional(object({<br>        port = optional(number)<br>      }), null)<br>      grpc = optional(object({<br>        port    = optional(number)<br>        service = optional(string)<br>      }), null)<br>    }), null)<br>    # Periodic probe of container liveness. Container will be restarted if the probe fails.<br>    # More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes<br>    liveness_probe = optional(object({<br>      failure_threshold     = optional(number, null)<br>      initial_delay_seconds = optional(number, null)<br>      timeout_seconds       = optional(number, null)<br>      period_seconds        = optional(number, null)<br>      http_get = optional(object({<br>        path = optional(string)<br>        http_headers = optional(list(object({<br>          name  = string<br>          value = string<br>        })), null)<br>      }), null)<br>      grpc = optional(object({<br>        port    = optional(number)<br>        service = optional(string)<br>      }), null)<br>    }), null)<br>    # Environment variables (cleartext)<br>    env_vars = optional(list(object({<br>      value = string<br>      name  = string<br>    })), null)<br>    # [Beta] Environment variables (Secret Manager)<br>    env_secret_vars = optional(list(object({<br>      name = string<br>      value_from = set(object({<br>        secret_key_ref = map(string)<br>      }))<br>    })), null)<br>    # [Beta] Volume Mounts to be attached to the container (when using secret)<br>    volume_mounts = optional(list(object({<br>      mount_path = string<br>      name       = string<br>    })), null)<br>  }))</pre> | `null` | no |
| <a name="input_domain_map_annotations"></a> [domain\_map\_annotations](#input\_domain\_map\_annotations) | Annotations to the domain map | `map(string)` | `{}` | no |
| <a name="input_domain_map_labels"></a> [domain\_map\_labels](#input\_domain\_map\_labels) | A set of key/value label pairs to assign to the Domain mapping | `map(string)` | `{}` | no |
| <a name="input_encryption_key"></a> [encryption\_key](#input\_encryption\_key) | CMEK encryption key self-link expected in the format projects/PROJECT/locations/LOCATION/keyRings/KEY-RING/cryptoKeys/CRYPTO-KEY. | `string` | `null` | no |
| <a name="input_force_override"></a> [force\_override](#input\_force\_override) | Option to force override existing mapping | `bool` | `false` | no |
| <a name="input_generate_revision_name"></a> [generate\_revision\_name](#input\_generate\_revision\_name) | Option to enable revision name generation | `bool` | `true` | no |
| <a name="input_members"></a> [members](#input\_members) | Users/SAs to be given invoker access to the service | `list(string)` | `[]` | no |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | Service Account email needed for the service | `string` | `""` | no |
| <a name="input_service_annotations"></a> [service\_annotations](#input\_service\_annotations) | Annotations to the service. Acceptable values all, internal, internal-and-cloud-load-balancing | `map(string)` | <pre>{<br>  "run.googleapis.com/ingress": "all"<br>}</pre> | no |
| <a name="input_service_labels"></a> [service\_labels](#input\_service\_labels) | A set of key/value label pairs to assign to the service | `map(string)` | `{}` | no |
| <a name="input_template_annotations"></a> [template\_annotations](#input\_template\_annotations) | Annotations to the container metadata including VPC Connector and SQL. See [more details](https://cloud.google.com/run/docs/reference/rpc/google.cloud.run.v1#revisiontemplate) | `map(string)` | <pre>{<br>  "autoscaling.knative.dev/maxScale": 2,<br>  "autoscaling.knative.dev/minScale": 1,<br>  "generated-by": "terraform",<br>  "run.googleapis.com/client-name": "terraform"<br>}</pre> | no |
| <a name="input_template_labels"></a> [template\_labels](#input\_template\_labels) | A set of key/value label pairs to assign to the container metadata | `map(string)` | `{}` | no |
| <a name="input_timeout_seconds"></a> [timeout\_seconds](#input\_timeout\_seconds) | Timeout for each request | `number` | `120` | no |
| <a name="input_traffic_split"></a> [traffic\_split](#input\_traffic\_split) | Managing traffic routing to the service | <pre>list(object({<br>    latest_revision = bool<br>    percent         = number<br>    revision_name   = string<br>    tag             = string<br>  }))</pre> | <pre>[<br>  {<br>    "latest_revision": true,<br>    "percent": 100,<br>    "revision_name": "v1-0-0",<br>    "tag": null<br>  }<br>]</pre> | no |
| <a name="input_verified_domain_name"></a> [verified\_domain\_name](#input\_verified\_domain\_name) | List of Custom Domain Name | `list(string)` | `[]` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | [Beta] Volumes needed for environment variables (when using secret) | <pre>list(object({<br>    name = string<br>    secret = set(object({<br>      secret_name = string<br>      items       = map(string)<br>    }))<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_map_id"></a> [domain\_map\_id](#output\_domain\_map\_id) | Unique Identifier for the created domain map |
| <a name="output_domain_map_status"></a> [domain\_map\_status](#output\_domain\_map\_status) | Status of Domain mapping |
| <a name="output_location"></a> [location](#output\_location) | Location in which the Cloud Run service was created |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Google Cloud project in which the service was created |
| <a name="output_revision"></a> [revision](#output\_revision) | Deployed revision for the service |
| <a name="output_service_id"></a> [service\_id](#output\_service\_id) | Unique Identifier for the created service |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Name of the created service |
| <a name="output_service_status"></a> [service\_status](#output\_service\_status) | Status of the created service |
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | The URL on which the deployed service is available |
| <a name="output_verified_domain_name"></a> [verified\_domain\_name](#output\_verified\_domain\_name) | List of Custom Domain Name |
<!-- END_TF_DOCS -->