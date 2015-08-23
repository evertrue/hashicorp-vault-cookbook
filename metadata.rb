name 'et_hashicorp-vault'
maintainer 'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license 'Apache 2.0'
description 'Application cookbook for installing and configuring Vault.'
long_description 'Application cookbook for installing and configuring Vault.'
version '1.3.1'

supports 'ubuntu', '= 14.04'
supports 'redhat', '>= 6.4'
supports 'centos', '>= 6.4'

depends 'chef-vault', '~> 1.3'
depends 'golang', '~> 1.5'
depends 'libartifact', '~> 1.3'
depends 'poise', '~> 2.2'
depends 'poise-service', '~> 1.0'
depends 'selinux', '~> 0.9'
depends 'magic', '~> 1.1'
