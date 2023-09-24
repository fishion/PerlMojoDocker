use utf8;
package MyApp::Schema::Result::Player;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Player

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<player>

=cut

__PACKAGE__->table("player");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'player_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 squad_number

  data_type: 'integer'
  is_nullable: 1

=head2 position

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 team

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 64

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "player_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "squad_number",
  { data_type => "integer", is_nullable => 1 },
  "position",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "team",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 64 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 team

Type: belongs_to

Related object: L<MyApp::Schema::Result::Team>

=cut

__PACKAGE__->belongs_to(
  "team",
  "MyApp::Schema::Result::Team",
  { name => "team" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-09-24 22:28:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eBBA669aJcoNHLUWZfkZEA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
