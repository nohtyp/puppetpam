class pamconfig::pwquality inherits pamconfig {

  file { 'Modify pwquality file':
    path    => '/etc/security/pwquality.conf',
    ensure  => present,
    backup  => '.bak',
    mode    => 0644,
    owner   => 'root',
    group   => 'root',
    content => template('pamconfig/pwquality.erb'),
  }
}

