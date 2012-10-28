import 'manifests/*.pp'

node default {
  require common
  include "${::hostname}"
}
