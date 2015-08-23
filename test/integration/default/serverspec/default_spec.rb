require 'spec_helper'

describe command('which vault') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match '/usr/local/bin/vault' }
end

describe group('vault') do
  it { should exist }
end

describe user('vault') do
  it { should exist }
end

describe file('/home/vault/.vault.json') do
  it { should be_file }
  it { should be_mode 640 }
  it { should be_owned_by('vault') }
  it { should be_grouped_into('vault') }
  describe '#content' do
    subject { super().content }
    it { is_expected.to include '"address": "127.0.0.1:8200"' }
    it { is_expected.to include '"tls_cert_file": "/etc/vault/ssl/certs/vault.crt"' }
    it { is_expected.to include '"tls_key_file": "/etc/vault/ssl/private/vault.key"' }
    it { is_expected.to include '"disable_mlock": false' }
    it { is_expected.to match(/"inmem": {\s+}/) }
  end
end

describe service('vault') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/ssl/certs/vault.crt') do
  it { should contain '-----BEGIN CERTIFICATE-----' }
  it { should contain '-----END CERTIFICATE-----' }
  it { should be_file }
  it { should be_owned_by('vault') }
  it { should be_grouped_into('vault') }
  it { should be_mode 644 }
end

describe file('/etc/ssl/private/vault.key') do
  it { should contain '-----BEGIN RSA PRIVATE KEY-----' }
  it { should contain '-----END RSA PRIVATE KEY-----' }
  it { should be_file }
  it { should be_owned_by('vault') }
  it { should be_grouped_into('vault') }
  it { should be_mode 640 }
end
