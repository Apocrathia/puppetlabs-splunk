# Define: splunk::inputs
#
#   Creates entries in inputs.conf under the puppet
#   Splunk app.  inputs.conf controls the files that
#   are indexed or if the Splunk instance is a
#   receiver of Splunk forwarders.
#
#   Cody Herriges <cody@puppetlabs.com>
#   2010-12-22
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
define splunk::inputs(
  $target,
  $enable    = true,
  $index     = 'default',
  $ensure    = present,
  $basepath  = $splunk::users::home,
  $port      = '',
  $receiver  = false
  ) {

  if ! ($ensure == 'present' or $ensure == 'absent') {
    fail("ensure must be present or absent")
  }

  if ! ($enable == true or $enable == false) {
    fail("enable must be true or false")
  }

  if ! ($receiver == true or $receiver == false) {
    fail("receiver must be true or false")
  }

  if ($receiver == true and $port == '') {
    fail("must set a port if receiver is set to true")
  }

  require Splunk::app["puppet_${name}"]

  file { "${basepath}/etc/apps/puppet_${name}/default/inputs.conf":
     ensure => $ensure,
     owner  => splunk,
     group  => splunk,
     mode   => '0755',
     content => template('splunk/inputsconf.erb'),
  }
}
