package Net::RRP::Server;

use strict;
use Private;
#use Net::Daemon::SSL;
use Net::RRP::Codec;
use Net::Daemon;
use Net::RRP::Protocol;
#use Net::Daemon::SSL;
#@Net::RRP::Server::ISA = qw (Net::Daemon::SSL);
@Net::RRP::Server::ISA = qw (Net::Daemon);

use constant MAX_ERROR_COUNT => 2;

sub Run
{
    my $this = shift;

    my $errorCount = 0;
    my $protocol   = new Net::RRP::Protocol ( socket => $this->{socket} );

    $protocol->sendHello ( registryName => "RU",
			   version      => '1.1.0',
			   buildDate    => 'Mon Jun 19 14:04:00 MSK 2000' );
    
    while ( 1 )
    {
	my ( $request, $response );

	$request = eval { $protocol->getRequest () };
	if ( $@ ) { warn $@; die $@ }

	use Data::Dumper; print STDERR Data::Dumper->Dump ( [ $request ], [ 'request' ] ) . "\n";
	
#	unless ( $request )
#	{
#	    $errorCount++;
#	    last;
#	}
#	else
#	{
#	    $response = eval { $request->execute } || new New::RRP::Response::n421;
#	}

	eval { $protocol->sendRequest ( $request ) };
	if ( $@ ) { warn $@; die $@ }

	last if $request->getName eq 'Quit';

#	$response->getCode == 220 && last;
    }
}

package main;

my $server = new Net::RRP::Server ( {}, \ @ARGV );
$server->Bind();

__END__

                                      |
                                      |
                                      v
                             +-----------------+   Timeout
                             |   Waiting for   |-------------------+
   Authentication Succeeded  |      Client     |                   |
                   +---------|  Authentication | Authentication    |
                   |         |      (PRE)      |-----+  Failed     |
                   |         +-----------------+     |             |
                   |                                 |             |
                   V                                 V             |
             +-----------+     Succeeded    +--------------------+ |
             |Waiting for|<-----------------|    Waiting for     | |
             |  Command  |----------+       |Authentication Retry| |
             |   (WFC)   |  Timeout |       |       (WFR)        | |
             +-----------+          |       +--------------------+ |
                 |   ^              |           |         |        |
                 |   |              |   Timeout |         | Failed |
         Request V   |Response      |           |         |        |
             +-----------+          |           V         V        V
             | Executing |          |          +--------------------+
             |  Command  |          +--------->|    Disconnected    |
             |   (EXE)   |-------------------->|       (DIS)        |
             +-----------+          QUIT       +--------------------+

                Figure 1: RRP Server Finite State Machine




        PRE     Waiting for client connection and authentication
        WFR     Waiting for authentication retry
        WFC     Waiting for a command from an authenticated client
        EXE     Executing a command
        DIS     Disconnected
