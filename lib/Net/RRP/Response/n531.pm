package Net::RRP::Response::n531;

use strict;
use Net::RRP::Response;
@Net::RRP::Response::n531::ISA     = qw(Net::RRP::Response);
$Net::RRP::Response::n531::VERSION = '0.1';

=head1 NAME

Net::RRP::Response::n531 - the rrp response 531 representation

=head1 SYNOPSIS

 use Net::RRP::Response::n531;
 my $response = new Net::RRP::Response::n531;

=head1 DESCRIPTION

Net::RRP::Response::n531 - the 531 rrp response representation. See base class L<Net::RRP::Response(3)> for more details.

=cut

sub getCode { 531 };

1;

=head1 AUTHOR AND COPYRIGHT

 Net::RRP::Response::n531 (C) Zenon N.S.P. Michael Kulakov 2000
                        125124, 19, 1-st Jamskogo polja st,
                        Moscow, Russian Federation

                        mkul@cpan.org

 All rights reserved.

 You may distribute this package under the terms of either the GNU
 General Public License or the Artistic License, as specified in the
 Perl README file.

=head1 SEE ALSO

L<Net::RRP::Response(3)>, L<Net::RRP::Codec(3)>, RFC 2832

=cut

__END__

