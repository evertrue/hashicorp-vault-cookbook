source 'https://supermarket.chef.io'
cookbook 'chef-vault', git: 'https://github.com/johnbellone/chef-vault-cookbook'
metadata

group :integration do
  cookbook 'zookeeper', '~> 2.0'
  cookbook 'runit', github: 'hw-cookbooks/runit', ref: 'ee15ff5'
  cookbook 'hashicorp-vault_tester', path: 'test/cookbooks/hashicorp-vault_tester'
end
