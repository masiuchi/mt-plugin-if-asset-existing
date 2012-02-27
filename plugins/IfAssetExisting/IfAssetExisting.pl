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
    plugin_link => 'https://github.com/masiuchi/mt-plugin-if-asset-existing',
    description => '<__trans phrase="Judging the asset existing or not in asset block tags.">',
});
MT->add_plugin( $plugin );

sub init_registry {
    my ( $p ) = @_;
    my $pkg = '$'.NAME.'::'.NAME.'::Tags::Conditional::';
    $p->registry( 'tags', 'block', {
        'IfAssetExisting?'    => $pkg . 'if_asset_existing',
        'IfAssetNotExisting?' => $pkg . 'if_asset_not_existing',
    });
}

1;
__END__
