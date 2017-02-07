class profile::webserver {

  include stdlib

  class { 'apache':
    default_vhost => false,
    default_mods  => false,
  }

  apache::vhost { 'rea_challenge':
  	servername     => 'rea_challenge',
  	port           => '80',
  	docroot        => '/var/www/html/simple-sinatra-app/public',
  	manage_docroot => false,
  }

  class { 'apache::mod::passenger': }

  vcsrepo { '/var/www/html/simple-sinatra-app':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/tnh/simple-sinatra-app.git',
    require  => [ Class['apache'], Class['apache::mod::passenger'] ]
  }

  file { '/var/www/html/simple-sinatra-app':
    ensure  => directory,
    owner   => 'apache',
    group   => 'apache',
    mode    => '0755',
    recurse => true,
    ignore  => '.git',
    require => Vcsrepo['/var/www/html/simple-sinatra-app'],
  }

}
