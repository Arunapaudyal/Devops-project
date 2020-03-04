class deploy {
   package{'docker':
       ensure => 'present',
       }
   service{'docker':
        ensure => 'running',
        enable => true,
  }

  docker::image { 'ubuntu':
  image_tag => 'latest'
 }
 vcsrepo { '/tmp/gitrepo':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/devops-trainer/dockerdemo.git',
}
  docker::image { 'deploy:puppet':
  docker_file => '/tmp/gitrepo/dockerfile'
}
  docker::run { 'deploycontainer':
  image   => 'deploy:puppet',
  ports  => '8080',
 }
}

