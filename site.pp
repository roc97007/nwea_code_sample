node 'cody' {               #settings for node "cody"
	file {'/opt/nwea/html/index.html': #Install content on client
		ensure => file,
		mode => 644,
		source => "puppet:///modules/nginx-content/index.html",
	}
	class {'nginx':		# Latest version of nginx
		manage_repo => true,
		package_source => 'nginx-mainline'
	}
	nginx::resource::vhost{'doggie.cody.home': #Create server
                listen_port => '8888',
                www_root => '/opt/nwea/html',
	}
}
