package IfAssetExisting::Tags::Conditional;
use strict;

use MT::FileMgr;

our $FMGR = MT::FileMgr->new( 'Local' );
our $FMGR;

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
    my $file_path = $asset->file_path;
    return $func->( $file_path );
}

1;
__END__
