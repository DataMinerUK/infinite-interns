################################################################################
#
# Rakefile for Infinite Interns
#
################################################################################

directory 'target'

boxes = [
  'python', 'ruby', 'java', 'nodejs',
  'pandas', 'refine', 'pig', 'r',  'bayes', 'sage', 'octave', 'vowpalwabbit',
  'mysql', 'elasticsearch', 'mongodb', 'neo4j',
  'nginx',
  'hadoop',
  'phantomjs', 'ocr',
  'dev'
]

puppetfiles = FileList['modules/**/*']


################################################################################
# Tasks
################################################################################

task :default => boxes.each { |box| "target/#{box}.box" }

task :clean do
  sh 'rm -fr target'
end

boxes.each do |box|
  file "target/#{box}.box" => (['target'] + puppetfiles) do
    sh "vagrant up #{box}"
    sh "vagrant package #{box} --output target/#{box}.box"
    sh "vagrant destroy -f #{box}"
  end
end

task :lint do
  sh 'puppet-lint --with-filename modules/infinite_interns'
end
