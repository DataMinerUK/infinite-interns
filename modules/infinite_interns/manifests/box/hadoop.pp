# Hadoop Infinite Intern
class infinite_interns::box::hadoop {

  include infinite_interns::hadoop::core
  include infinite_interns::hadoop::configuration
  include infinite_interns::hadoop::hdfs
  include infinite_interns::hadoop::mapper
  include pig

  Class['infinite_interns::hadoop::core'] ->
    Class['infinite_interns::hadoop::configuration'] ->
    Class['infinite_interns::hadoop::hdfs'] ->
    Class['infinite_interns::hadoop::mapper'] ->
    Class['pig']
}
