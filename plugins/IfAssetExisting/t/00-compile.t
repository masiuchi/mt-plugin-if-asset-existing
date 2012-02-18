use strict;
use warnings;

use lib qw( ../../../lib );
use lib qw( lib );

use Test::More tests => 4;

use MT;
MT->new;

ok( MT->component( 'IfAssetExisting' ), "IfAssetExisting plugin loaded correctly" );

my $plugin = MT->component( 'IfAssetExisting' );

use_ok( $plugin->NAME . '::Tags::Conditional' );

use_ok( $plugin->NAME . '::L10N' );
use_ok( $plugin->NAME . '::L10N::ja' );

done_testing;

1;
__END__
