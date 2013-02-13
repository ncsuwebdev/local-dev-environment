# Class: elasticsearch::params
#
#
class elasticsearch::params {
    $version = $elasticsearch_version ? {
        ''      => '0.18.5',
        default => $elasticsearch_version,
    }

    $unpack_root = $elasticsearch_unpack_root ? {
        ''      => '/opt',
        default => $elasticsearch_unpack_root,
    }

    $config_dir = $elasticsearch_config_dir ? {
        ''      => '/etc/elasticsearch',
        default => $elasticsearch_config_dir,
    }

    $log_dir = $elasticsearch_log_dir ? {
        ''      => '/var/log/elasticsearch',
        default => $elasticsearch_log_dir,
    }

    $data_dir = $elasticsearch_data_dir ? {
        ''      => '/var/lib/elasticsearch',
        default => $elasticsearch_data_dir,
    }

    $work_dir = $elasticsearch_work_dir ? {
        '' => '/tmp/elasticsearch',
        default => $elasticsearch_work_dir,
    }

    $home_dir    = "${unpack_root}/elasticsearch"
    $install_dir = "${unpack_root}/elasticsearch-${version}"

    $min_mem = $elasticsearch_min_mem ? {
        ''      => '256',
        default => $elasticsearch_min_mem,
    }

    $max_mem = $elasticsearch_max_mem ? {
        ''      => '256',
        default => $elasticsearch_max_mem,
    }
}
