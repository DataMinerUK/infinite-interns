directory 'target'

# Export path for box
def target(box)
   return "target/#{box}.box"
end

boxes = [
  'python', 'ruby', 'jruby', 'java', 'nodejs',
  'pandas', 'pylucene', 'refine', 'refinebeta', 'r', 'bugs', 'sage', 'octave', 'vowpalwabbit', 'datavis', 'saiku',
  'mysql', 'infinidb', 'elasticsearch', 'mongodb', 'neo4j', 'postgresql',
  'nginx',
  'tomcat',
  'hadoop',
  'phantomjs', 'slimerjs', 'casperjs', 'tabula', 'ocr',
  'dev', 'boxgrinder'
]

puppetfiles = FileList['site.pp', 'modules/**/*']



################################################################################
# Build Tasks
################################################################################

task :default => boxes.map { |box| target(box) }

task :clean do
  sh 'vagrant destroy -f'
  boxes.each do |box|
    sh "vagrant box remove #{box} virtualbox || true"
  end
  sh 'rm -fr target'
end

boxes.each do |box|
  # Target for exporting a box is the destination location in target/
  file target(box) => (['target'] + puppetfiles) do
    sh "vagrant destroy -f #{box}"
    sh "vagrant box remove #{box} virtualbox || true"
    sh "vagrant up #{box}"
    sh "rm -f #{target(box)}"
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
  :test_python, :test_ruby, :test_jruby, :test_java, :test_nodejs,
  :test_pandas, :test_pylucene, :test_refine, :test_refinebeta, :test_r,  :test_bugs, :test_sage,
    :test_octave, :test_vowpalwabbit, :test_datavis, :test_saiku,
  :test_mysql, :test_infinidb, :test_elasticsearch, :test_mongodb, :test_neo4j,
    :test_postgresql,
  :test_nginx,
  :test_tomcat,
  :test_hadoop,
  :test_phantomjs, :test_slimerjs, :test_casperjs, :test_tabula, :test_ocr,
  :test_dev, :test_boxgrinder
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

task :test_jruby => ['jruby'] do
  # TODO: Include java box tests
  sh 'vagrant ssh jruby -c "/usr/local/rvm/bin/rvm version"'
  sh 'vagrant ssh jruby -c "jruby --version"'
  sh 'vagrant destroy -f jruby'
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

task :test_pylucene => ['pylucene'] do
  # TODO: Add tests
  sh 'vagrant ssh pylucene -c "python --version"'
  # Check extra python libraries installed
  # Check ipython-notebook socket
  sh 'vagrant destroy -f pylucene'
end

task :test_refine => ['refine'] do
  # TODO: Include java box tests
  # TODO: Add tests
  # Check refine socket
  sh 'vagrant destroy -f refine'
end

task :test_refinebeta => ['refinebeta'] do
  # TODO: Include java box tests
  # TODO: Add tests
  # Check refine socket
  sh 'vagrant destroy -f refinebeta'
end

task :test_r => ['r'] do
  # TODO: Add tests
  # Check r executable
  # Check RStudio executable
  sh 'vagrant destroy -f r'
end

task :test_bugs => ['bugs'] do
  # TODO: Include java box tests
  # TODO: Add tests
  # Check OpenBUGS executable
  # Check JAGS executable
  sh 'vagrant destroy -f bugs'
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

task :test_datavis => ['datavis'] do
  # TODO: Add tests
  # Check graphviz executable
  sh 'vagrant destroy -f datavis'
end

task :test_saiku => ['saiku'] do
  # TODO: Add tests
  # Check infinidb and tomcat tests
  sh 'vagrant destroy -f saiku'
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

task :test_postgresql => ['postgresql'] do
  # TODO: Add tests
  # Check postgresql executable
  # Check postgresql socket
  sh 'vagrant destroy -f postgresql'
end

task :test_nginx => ['nginx'] do
  # TODO: Add tests
  # Check nginx executable
  # Check nginx socket
  # Check default site
  sh 'vagrant destroy -f nginx'
end

task :test_tomcat => ['tomcat'] do
  # TODO: Add tests
  # Check tomcat executable
  # Check tomcat socket
  sh 'vagrant destroy -f tomcat'
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

task :test_slimerjs => ['slimerjs'] do
  # TODO: Add tests
  # Check slimerjs executable
  sh 'vagrant destroy -f slimerjs'
end

task :test_casperjs => ['casperjs'] do
  # TODO: Add tests
  # Include tests for phantomjs
  # Include tests for slimerjs
  # Check casperjs executable
  sh 'vagrant destroy -f casperjs'
end

task :test_tabula => ['tabula'] do
  # TODO: Add tests
  # Check tabula executable
  sh 'vagrant destroy -f tabula'
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

task :test_dev => ['boxgrinder'] do
  # TODO: Add tests
  # Check boxgrinder executable
  sh 'vagrant destroy -f boxgrinder'
end
