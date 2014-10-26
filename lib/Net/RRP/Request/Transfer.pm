package Net::RRP::Request::Transfer;

use strict;
use Net::RRP::Request;
@Net::RRP::Request::Transfer::ISA = qw(Net::RRP::Request);
$Net::RRP::Request::Transfer::VERSION = '0.1';

=head1 NAME

Net::RRP::Request::Transfer - rrp transfer request representation.

=head1 SYNOPSIS

 use Net::RRP::Request::Transfer;
 my $transferRequest = new Net::RRP::Request::Transfer
    ( entity  => new Net::RRP::Entity::Domain ( DomainName => [ 'domain.ru' ] ),
      options => { Approve => 'no' } )
 my $transferRequest1 = new Net::RRP::Request::Transfer ();
 $transferRequest1->setEntity ( new Net::RRP::Entity::Domain ( DomainName => [ 'domain.ru' ] );
 $transferRequest1->setOption ( Approve => 'no' );

=head1 DESCRIPTION

This is a rrp transfer request representation class.

=cut

=head2 getName

return a 'Transfer'

=cut

sub getName { 'Transfer' };

=head2 setEntity

say "die" unless entity is Net::RRP::Entity::Domain

=cut

sub setEntity
{
    my ( $this, $entity ) = @_;
    my $ref = ref ( $entity ) || die "wrong entity";
    $ref eq 'Net::RRP::Entity::Domain' || die "wrong entity";
    $this->SUPER::setEntity ( $entity );
}

=head2 setOption

Pass only Approve option and yes/no value

=cut

sub setOption
{
    my ( $this, $key, $value ) = @_;
    die "wrong option" if $key ne "Approve";
    die "wrong option" unless $value =~ /^Yes|No$/;
    $this->SUPER::setOption ( $key => $value );
}

=head1 AUTHOR AND COPYRIGHT

 Net::RRP::Request::Transfer (C) Michael Kulakov, Zenon N.S.P. 2000
                        125124, 19, 1-st Jamskogo polja st,
                        Moscow, Russian Federation

                        mkul@cpan.org

 All rights reserved.

 You may distribute this package under the terms of either the GNU
 General Public License or the Artistic License, as specified in the
 Perl README file.

=head1 SEE ALSO

L<Net::RRP::Request(3)>, L<Net::RRP::Codec(3)>, L<Net::RRP::Entity::Domain(3)>,
RFC 2832

=cut

1;

__END__
