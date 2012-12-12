define tomcat::redhat::server($tomcat_version) {

  include yum

  $tomcat_major_version = regsubst($tomcat_version, '^(\d+)\.(\d+)\.(\d+)-(\d+)$','\1')

  debug("tomcat_major_version=${tomcat_major_version}")
  debug("tomcat_version=${tomcat_version}")

  Package['httplog'] -> Package["cegeka-tomcat${tomcat_major_version}"]

  package { "cegeka-tomcat${tomcat_major_version}":
    ensure => $tomcat_version,
  }

  package { 'httplog':
    ensure => present,
  }

}