class { "splunk::users":
  virtual => false
}

class { "splunk::package":
  pkg_base => "http://tia.cat.pdx.edu",
  pkg_file => "splunk-4.1.6-89596-linux-2.6-x86_64.rpm",
  has_repo => false,
}

class { "splunk::service": }

class { "splunk": }
class { "splunk::app": }
class { "splunk::lwf": }
class { "splunk::inputs": }
splunk::inputs::target {
  "yum":
    target => "/var/log/yum.log",
}
class { "splunk::outputs::global": }
#splunk::outputs::fragment {
#  "splunk":
#    port => "9999",
#}
