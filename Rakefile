require 'rubygems'
require 'rake'
require 'rake/clean'

  PUPPET_DIR        = "puppet"
  MODULE_PATH       = "modules/"
  MANIFEST_FILE     = "manifests/main.pp"
  FACTS_DIR         = "facter/"
  FACTER_DEST_DIR   = "/etc/facter/facts.d/"



  desc "install apache, passeneger and the hello world app"
  task :default do |t, args|
    install_puppetforge_modules()
    run_puppet(false)
  end

  def run_cmd(cmd)
    puts cmd
    system(cmd)
  end

  def run_puppet(noop)
    Dir.chdir(PUPPET_DIR) do
      puts "NOTICE: Using dummy passwords in hiera for local testing"
      run_cmd("bundle exec puppet apply --verbose --detailed-exitcodes --modulepath #{MODULE_PATH} #{MANIFEST_FILE}")
      puppet_exit_status = $?.exitstatus
      fail "err: puppet run had errors" unless puppet_exit_status == 0 || puppet_exit_status == 2
    end
  end


  def install_puppetforge_modules ()
    Dir.chdir(PUPPET_DIR) do
      run_cmd("bundle exec puppet module install puppetlabs-apache --target-dir #{MODULE_PATH}")
      run_cmd("bundle exec puppet module install puppetlabs-vcsrepo --target-dir #{MODULE_PATH}")
    end
  end 