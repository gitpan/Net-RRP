package Net::RRP::Request::Quit;

use strict;
use Net::RRP::Request;
@Net::RRP::Request::Quit::ISA = qw(Net::RRP::Request);
$Net::RRP::Request::Quit::VERSION = '0.1';

=head1 NAME

Net::RRP::Request::Quit - rrp quit request representation.

=head1 SYNOPSIS

 use Net::RRP::Request::Quit;
 my $quitRequest = new Net::RRP::Request::Quit ()

=head1 DESCRIPTION

This is a rrp quit request representation class.

=cut

=head2 getName

return a 'Quit'

=cut

sub getName { 'Quit' };

=head2 setEntity

say "die" immediate

=cut

sub setEntity
{
    die "you can't setup entity for quit request";
}

=head2 setOption

say "die" immediate

=cut

sub setOption
{
    die "you can't setup any option for quit request";
}

=head2 isSuccessResponse

Only 200 response successfull for quit.

=cut

sub isSuccessResponse
{
    my ( $this, $response ) = @_;
    return { 200 => 1 }->{ $response->getCode() };
}


=head1 AUTHOR AND COPYRIGHT

 Net::RRP::Request::Quit (C) Michael Kulakov, Zenon N.S.P. 2000
                        125124, 19, 1-st Jamskogo polja st,
                        Moscow, Russian Federation

                        mkul@cpan.org

 All rights reserved.

 You may distribute this package under the terms of either the GNU
 General Public License or the Artistic License, as specified in the
 Perl README file.

=head1 SEE ALSO

L<Net::RRP::Request(3)>, L<Net::RRP::Codec(3)>, RFC 2832

=cut

1;

__END__

