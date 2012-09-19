import "manifests/*.pp"

node default {

  require apt
  
  include mysql
  include python
  include scientific 

  include java
  include refine

  Class[java] -> Class[refine]

}