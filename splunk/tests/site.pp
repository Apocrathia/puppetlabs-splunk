class { 'splunk::users':
  virtual => false
}

class { 'splunk::package': }

class { 'splunk::service': }

class { 'splunk': }
class { 'splunk::app': }
class { 'splunk::inputs': }
class { 'splunk::inputs::ssl':
  server_cert   => '$SPLUNK_HOME/etc/auth/server.pem',
  password      => 'password',
  root_ca       => '$SPLUNK_HOME/etc/auth/cacert.pem',
  verify_client => false
}
splunk::inputs::target { 'messages':
    target => '/var/log/messages',
}
splunk::inputs::target { 'maillog':
    target => '/var/log/maillog';
}
splunk::inputs::receiver { '9999':
  receiver => true,
}
