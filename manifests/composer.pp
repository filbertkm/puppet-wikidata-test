class wikidata_test::composer() {

    require wikidata_test::mwextensions

    define wikidata_test::composer::install_bin() {
        class { 'composer::install_bin':
            composer_home => '/tmp/composer',
            install_dir => '/usr/local/bin',
            source_dir => '/srv/common';
        }
    }

    define wikidata_test::composer::update(
        $user
    ) {
        class { 'composer::update':
            composer_home => '/tmp/composer',
            install_dir => '/usr/local/bin',
            target => "/srv/common/extensions/${title}",
            user => $user;
        }
    }

    wikidata_test::composer::install_bin { ['WikidataBuild']: }
    wikidata_test::composer::update { ['WikidataBuild']:
        user => 'mwdeploy'
    }

}
