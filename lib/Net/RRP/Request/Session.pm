package Net::RRP::Request::Session;

use strict;
use Net::RRP::Request;
@Net::RRP::Request::Session::ISA = qw(Net::RRP::Request);
$Net::RRP::Request::Session::VERSION = '0.1';

=head1 NAME

Net::RRP::Request::Session - rrp session request representation.

=head1 SYNOPSIS

 use Net::RRP::Request::Session;
 my $sessionRequest = new Net::RRP::Request::Session ( Id       => 'reg1',
						       Password => '***' );
 my $sessionRequest1 = new Net::RRP::Request::Session ();
 $sessionRequest1->setOption ( Id          => 'reg1' );
 $sessionRequest1->setOption ( Password    => '***'  );
 $sessionRequest1->setOption ( NewPassword => '****' );

=head1 DESCRIPTION

This is a rrp session request representation class.

=cut

=head2 getName

return a 'Session'

=cut

sub getName { 'Session' };

=head2 setEntity

say "die" immediate

=cut

sub setEntity
{
    die "you can't setup entity for session request";
}

=head2 setOption

Pass only Id, Password, NewPassword options

=cut

sub setOption
{
    my ( $this, $key, $value ) = @_;
    { Id => 1, Password => 1, NewPassword => 1 }->{ $key } || die "wrong option";
    $this->SUPER::setOption ( $key => $value );
}

=head1 AUTHOR AND COPYRIGHT

 Net::RRP::Request::Session (C) Michael Kulakov, Zenon N.S.P. 2000
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

