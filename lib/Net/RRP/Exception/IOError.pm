package Net::RRP::Exception::IOError;

$Net::RRP::Exception::IOError::VERSION = '0.02';
@Net::RRP::Exception::IOError::ISA     = qw ( Net::RRP::Exception );

use strict;
use Net::RRP::Exception;

sub new
{
    my $class = shift;
    $class->SUPER::new ( -text  => 'Invalid command name',
			 -value => 500 );
}

1;

