# Class: elasticsearch

class elasticsearch {    
    require elasticsearch::params
    include elasticsearch::install, elasticsearch::config, elasticsearch::service
}
