import 'manifests/*.pp'

node default {
  include common
  include "${::hostname}"
}
