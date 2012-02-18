package MT::Plugin::IfAssetExisting;
use strict;
use base qw( MT::Plugin );

use constant NAME => ( split /::/, __PACKAGE__ )[-1];

my $plugin = __PACKAGE__->new({
    name        => NAME,
    id          => lc NAME,
    key         => lc NAME,
    l10n_class  => NAME . '::L10N',
    version     => '1.00',
    author_name => 'masiuchi',
    author_link => 'https://github.com/masiuchi',
    description => '<__trans phrase="Judging the asset existing or not in asset block tags.">',
    registry => {
        tags => {
            block => {
                'IfAssetExisting?'    => '$'.NAME.'::'.NAME.'::Tags::Conditional::if_asset_existing',
                'IfAssetNotExisting?' => '$'.NAME.'::'.NAME.'::Tags::Conditional::if_asset_not_existing',
            },
        },
    },
});
MT->add_plugin( $plugin );

1;
__END__
