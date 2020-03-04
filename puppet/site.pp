node 'ip-172-31-32-32.ap-south-1.compute.internal'{
 class{'linux':}
}
node 'ubuntu'{
 class{'linux':}
}
class linux{
 $httpdservice=$osfamily?{
   'RedHat' => 'httpd',
   'Debian' => 'apache2',
	default => 'httpd',
}
 $admintools=['git','nano','screen']
  package{$admintools:
	ensure => 'present',
  }
  file{'/info1.txt':
   ensure => 'present',
   content => "Created by Puppet",
}
  package{'httpd':
   ensure => 'present',
 }
   service{$httpdservice:
	ensure => 'running',
	enable => true,
 }
}

