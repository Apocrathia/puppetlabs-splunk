class { 'splunk::users':
  virtual => false
}

class { 'splunk::package':
  pkg_base => 'http://tia.cat.pdx.edu',
  pkg_file => 'splunk-4.1.6-89596-linux-2.6-x86_64.rpm',
  has_repo => false,
}

class { 'splunk::service': }

class { 'splunk': }
class { 'splunk::app': }
class { 'splunk::lwf': }
class { 'splunk::inputs': }
splunk::inputs::target {
  'yum':
    target => '/var/log/yum.log',
}
class { 'splunk::outputs': }
class { 'splunk::outputs::global':
  default_group => 'my_indexers',
}
splunk::outputs::group { 'my_indexers':
}
splunk::outputs::server { 'splunk':
    port            => '9999',
    root_ca         => '$SPLUNK_HOME/etc/auth/cacert.pem',
    ssl_cert        => '$SPLUNK_HOME/etc/auth/server.pem',
    cn_check        => 'SplunkServerDefaultCert',
    validate_server => true,
}
