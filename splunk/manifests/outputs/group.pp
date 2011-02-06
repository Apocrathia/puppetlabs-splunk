# Define: splunk::outputs::group
#
#   Cody Herriges <cody@puppetlabs.com>
#   2010-01-28
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
define splunk::outputs::group(
  $ensure          = 'present',
  $app_id          = 'puppet_managed',
  $enable          = true,
  $index_forward   = false,
  $send_cooked     = true,
  $compress        = false,
  $max_queue       = '1000',
  $auto_lb         = false,
  $ssl_cert        = '',
  $password        = 'password',
  $root_ca         = '',
  $validate_server = false,
  $cn_check        = '',
  $cnalt_check     = '',
) {

  if ! ($ensure == 'present' or $ensure == 'absent') {
    fail('ensure must be present or absent')
  }

  splunk::fragment { "02_groupfrag_${name}":
    content     => template('splunk/outputfrag.erb'),
    config_id   => 'outputs',
    app_id      => $app_id,
  }
}
