package Net::RRP::Request::Add;

use strict;
use Net::RRP::Request;
@Net::RRP::Request::Add::ISA = qw(Net::RRP::Request);
$Net::RRP::Request::Add::VERSION = '0.1';

=head1 NAME

Net::RRP::Request::Add - rrp add request representation.

=head1 SYNOPSIS

 use Net::RRP::Request::Add;
 my $addRequest = new Net::RRP::Request::Add 
    ( entity  => new Net::RRP::Entity::Domain 
      ( DomainName => [ 'domain.ru' ],
	NameServer => [ 'ns1.domain.ru' ] ),
      options => { Period => 10 } );
 my $addRequest1 = new Net::RRP::Request::Add ();
 $addRequest1->setEntity ( new Net::RRP::Entity::Domain
			   ( DomainName => [ 'domain.ru' ],
			     NameServer => [ 'ns1.domain.ru' ] ) );
 $addRequest1->setOption ( Period => 10 );

=head1 DESCRIPTION

This is a rrp add request representation class.

=cut

=head2 getName

return a 'Add'

=cut

sub getName { 'Add' };

=head2 setEntity

say "die" unless entity is Net::RRP::Entity::Domain or Net::RRP::Entity::NameServer

=cut

sub setEntity
{
    my ( $this, $entity ) = @_;
    my $ref = ref ( $entity ) || die "wrong entity";
    { 'Net::RRP::Entity::Domain' => 1, 'Net::RRP::Entity::NameServer' => 1  }->{ $ref } || die "wrong entity";
    $this->SUPER::setEntity ( $entity );
}

=head2 setOption

Pass only Period option

=cut

sub setOption
{
    my ( $this, $key, $value ) = @_;
    my $ref = ref ( $this->getEntity );
    die "wrong option" unless $ref;
    die "wrong option" if ( ( $ref ) && ( $ref eq 'Net::RRP::Entity::NameServer' ) );
    { Period => 1 }->{ $key } || die "wrong option";
    $this->SUPER::setOption ( $key => $value );
}

=head1 AUTHOR AND COPYRIGHT

 Net::RRP::Request::Add (C) Michael Kulakov, Zenon N.S.P. 2000
                        125124, 19, 1-st Jamskogo polja st,
                        Moscow, Russian Federation

                        mkul@cpan.org

 All rights reserved.

 You may distribute this package under the terms of either the GNU
 General Public License or the Artistic License, as specified in the
 Perl README file.

=head1 SEE ALSO

L<Net::RRP::Request(3)>, L<Net::RRP::Codec(3)>, L<Net::RRP::Entity::Domain(3)>,
L<Net::RRP::Entity::NameServer(3)>, RFC 2832

=cut

1;

__END__
