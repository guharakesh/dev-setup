Exec {
  path =>  ['/usr/sbin', '/usr/bin', '/sbin', '/bin', '/bin', '/usr/local/bin']
}

# --- Preinstall Stage --- #

stage { 'preinstall':
  before => Stage['main']
}

# Define the install_packages class
class install_packages {
  package { ['curl', 'build-essential', 'libfontconfig1', 'python', 'nodejs', 'npm', 'g++', 'make', 'wget', 'tar', 'mc', 'htop']:
    ensure => present
  }
}

# Declare (invoke) install_packages
class { 'install_packages':
  stage => preinstall
}

# Setup locale to avoid warnings
file { '/etc/default/locale':
  content => "LANG=\"en_US.UTF-8\"\nLC_ALL=\"en_US.UTF-8\"\n"
}

# --- NodeJS --- #

# Add a symlink so 'node' points to 'nodejs'
file { '/usr/bin/node':
  ensure => 'link',
  target => "/usr/bin/nodejs",
}
