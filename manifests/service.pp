class icinga::service {
  $servicegroups = hiera('servicegroups')

  icinga::service::servicegroups { $servicegroups: }

  Nagios_service <<||>> {
    notify  => Exec['fix-permissions'],
    require => File['objects'],
  }

  Nagios_servicegroup <||> {
    notify  => Exec['fix-permissions'],
    require => File['objects'],
  }
}