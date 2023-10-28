# Pre-Requisites
- Virtual Box 7.0 or above installed on Windows OS

## Post both master and agent are provisioned run below command on agent vm

> puppet ssl bootstrap

## On master vm , run below command to sign the certificate for agent

> sudo puppetserver ca sign --certname agent.localdomain

## On agent node run again the bootstrap command

> puppet ssl bootstrap

## On agent run below and verify the working with below commands

> puppet agent -t

> facter

## On master verify the puppet resource working.

> puppet resource user alice

```
[root@puppet ~]# puppet resource user alice

user { 'alice':
  ensure   => 'absent',
  provider => 'useradd',
}
```
> facter

## Verify with module

Copy `httpd` folder from `modules` folder to master vm under folder `/etc/puppetlabs/code/environments/production/modules` and add file `site.pp` at location `/etc/puppetlabs/code/environments/production/manifests` with below entries.

```
node 'agent.localdomain' {
  class { 'httpd' :
    port    => 80,
    docroot => '/var/www/html',
  }
```

Run below command again on agent vm and verify its working with httpd service running and enabled.

```
[root@agent ~]# puppet agent -t
Info: Using environment 'production'
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Loading facts
Info: Caching catalog for agent.localdomain
Info: Applying configuration version '1698460390'
Notice: Applied catalog in 1.02 seconds
```
