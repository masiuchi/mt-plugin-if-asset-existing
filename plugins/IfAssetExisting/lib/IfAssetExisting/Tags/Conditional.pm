package IfAssetExisting::Tags::Conditional;
use strict;

use MT::FileMgr;

our $FMGR = MT::FileMgr->new( 'Local' );

sub if_asset_existing {
    my $func = sub { return $_[0] && $FMGR->exists( $_[0] ); };
    return _common( @_, $func );
}

sub if_asset_not_existing {
    my $func = sub { return !( $_[0] && $FMGR->exists( $_[0] ) ); };
    return _common( @_, $func );
}

sub _common {
    my ( $ctx, $args, $cond, $func ) = @_;
    my $asset = $ctx->stash( 'asset' ) or return;
    return $func->( $asset->file_path );
}

1;
__END__
