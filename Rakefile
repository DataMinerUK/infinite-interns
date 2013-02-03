directory 'target'

# Export path for box
def target(box)
   return "target/#{box}.box"
end

boxes = [
  'python', 'ruby', 'java', 'nodejs',
  'pandas', 'refine', 'pig', 'r',  'bayes', 'sage', 'octave', 'vowpalwabbit',
  'mysql', 'elasticsearch', 'mongodb', 'neo4j',
  'nginx',
  'hadoop',
  'phantomjs', 'ocr',
  'dev'
]

dependencies = {
  'pandas' => 'python',
  'refine' => 'java',
  'pig' => 'java',
  'bayes' => 'java',
  'sage' => 'bayes',
  'elasticseach' => 'java',
  'neo4j' => 'java',
  'hadoop' => 'java',
  'dev' => 'ruby'
}

puppetfiles = FileList['modules/**/*']

dependencies = Hash[dependencies.map {|k,v| [k, [target(v), 'target'] + puppetfiles]}]
dependencies.default = ['target'] + puppetfiles



################################################################################
# Tasks
################################################################################

task :default => boxes.each { |box| target(box) }

task :clean do
  sh 'vagrant destroy -f'
  boxes.each do |box|
    sh "vagrant box remove #{box} || true"
  end
  sh 'rm -fr target'
end

boxes.each do |box|
  # Target for testing a box is just the name of the box
  # TODO: Change to run as `rake run <box>`
  task box => dependencies[box] do
    sh "vagrant destroy -f #{box}"
    sh "vagrant box remove #{box} || true"
    sh "vagrant up #{box}"
  end

  # TODO: Add a `rake stop <box>` task

  # Target for exporting a box is the destination location in target/
  file target(box) => [box] do
    sh "vagrant package #{box} --output #{target(box)}"
    sh "vagrant destroy -f #{box}"
  end
end

task :lint do
  sh 'puppet-lint --with-filename modules/infinite_interns'
end


################################################################################
# Tests
################################################################################

# TODO: Aggregate into single :test target
# TODO: Organise dependencies on boxes so no rebuilding
task :test => [
  :test_python, :test_ruby, :test_java, :test_nodejs,
  :test_pandas, :test_refine, :test_pig, :test_r,  :test_bayes, :test_sage,
    :test_octave, :test_vowpalwabbit, :test_vowpalwabbit,
  :test_mysql, :test_elasticsearch, :test_mongodb, :test_neo4j,
  :test_nginx,
  :test_hadoop,
  :test_phantomjs, :test_ocr,
  :test_dev
]

# TODO: Make tests into: rake test <box>

task :test_python => ['python'] do
  # TODO: Add tests
  sh 'vagrant ssh python -c "python --version"'
  # Check extra python libraries installed
  # Check ipython-notebook socket
  sh 'vagrant destroy -f python'
end

task :test_ruby => ['ruby'] do
  sh 'vagrant ssh ruby -c "ruby --version"'
  sh 'vagrant ssh ruby -c "rake --version"'
  sh 'vagrant ssh ruby -c "irb --version"'
  sh 'vagrant ssh ruby -c "gem --version"'
  sh 'vagrant destroy -f ruby'
end

task :test_java => ['java'] do
  sh 'vagrant ssh java -c "java -version"'
  sh 'vagrant destroy -f java'
end

task :test_nodejs => ['nodejs'] do
  # TODO: Add tests
  # Check nodejs executable
  sh 'vagrant destroy -f nodejs'
end

task :test_pandas => ['pandas'] do
  # TODO: Include python box tests
  # TODO: Add tests
  sh 'vagrant destroy -f pandas'
end

task :test_refine => ['refine'] do
  # TODO: Include java box tests
  # TODO: Add tests
  # Check refine socket
  sh 'vagrant destroy -f refine'
end

task :test_pig => ['pig'] do
  # TODO: Include java box tests
  # TODO: Add tests
  # Check pig executable
  sh 'vagrant destroy -f pig'
end

task :test_r => ['r'] do
  # TODO: Add tests
  # Check r executable
  # Check RStudio executable
  sh 'vagrant destroy -f r'
end

task :test_bayes => ['bayes'] do
  # TODO: Include java box tests
  # TODO: Add tests
  # Check OpenBUGS executable
  # Check JAGS executable
  sh 'vagrant destroy -f bayes'
end

task :test_sage => ['sage'] do
  # TODO: Include bayes box tests
  # TODO: Add tests
  # Check sage executable
  # Check sage socket
  # Check extra R packages
  sh 'vagrant destroy -f sage'
end

task :test_octave => ['octave'] do
  # TODO: Add tests
  # Check octave executable
  # Check gnuplot executable
  sh 'vagrant destroy -f octave'
end

task :test_vowpalwabbit => ['vowpalwabbit'] do
  sh 'vagrant ssh vowpalwabbit -c "vw --version"'
  sh 'vagrant destroy -f vowpalwabbit'
end

task :test_mysql => ['mysql'] do
  # TODO: Add tests
  # Check mysql executable
  # Check mysql socket
  sh 'vagrant destroy -f mysql'
end

task :test_elasticsearch => ['elasticsearch'] do
  # TODO: Include java box tests
  # TODO: Add tests
  # Check elasticsearch executable
  # Check elasticsearch socket
  # Check plugins
  sh 'vagrant destroy -f elasticsearch'
end

task :test_mongodb => ['mongodb'] do
  # TODO: Add tests
  # Check mongodb executable
  # Check mongodb socket
  sh 'vagrant destroy -f mongodb'
end

task :test_neo4j => ['neo4j'] do
  # TODO: Include java box tests
  # TODO: Add tests
  # Check neo4j executable
  # Check neo4j socket
  sh 'vagrant destroy -f neo4j'
end

task :test_nginx => ['nginx'] do
  # TODO: Add tests
  # Check nginx executable
  # Check nginx socket
  # Check default site
  sh 'vagrant destroy -f nginx'
end

task :test_hadoop => ['hadoop'] do
  # TODO: Include java box tests
  # TODO: Add tests
  # Check hadoop executable
  # Check hadoop sockets
  # Check test job
  sh 'vagrant destroy -f hadoop'
end

task :test_phantomjs => ['phantomjs'] do
  # TODO: Add tests
  # Check phantomjs executable
  sh 'vagrant destroy -f phantomjs'
end

task :test_ocr => ['ocr'] do
  # TODO: Add tests
  # Check tesseract-ocr executable
  sh 'vagrant destroy -f ocr'
end

task :test_dev => ['dev'] do
  # TODO: Include ruby box tests
  sh 'vagrant ssh dev -c "git --version"'
  sh 'vagrant ssh dev -c "puppet-lint --version"'
  sh 'vagrant ssh dev -c "librarian-puppet version"'
  sh 'vagrant destroy -f dev'
end
