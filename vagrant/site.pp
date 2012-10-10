import 'manifests/*.pp'

node default {

  require apt

  include mysql
  include python
  include scientific
  include refine
  include mongodb
  include nodejs
  include ocr 

}
