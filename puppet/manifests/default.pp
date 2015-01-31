class apt_update {
  exec {
    command => "sudo apt-get update",
    path => ["/bin", "/usr/bin"]
  }
}

class othertools {
  package { "git":
    ensure => latest,
    require => Exec["aptGetUpdate"]
  }
}

include apt_update
include othertools
