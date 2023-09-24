use utf8;
package Model::Schema::Result::Team;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Model::Schema::Result::Team

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<team>

=cut

__PACKAGE__->table("team");

=head1 ACCESSORS

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 location

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=cut

__PACKAGE__->add_columns(
  "name",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "location",
  { data_type => "varchar", is_nullable => 0, size => 32 },
);

=head1 PRIMARY KEY

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->set_primary_key("name");

=head1 RELATIONS

=head2 competition_teams

Type: has_many

Related object: L<Model::Schema::Result::CompetitionTeam>

=cut

__PACKAGE__->has_many(
  "competition_teams",
  "Model::Schema::Result::CompetitionTeam",
  { "foreign.team" => "self.name" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 players

Type: has_many

Related object: L<Model::Schema::Result::Player>

=cut

__PACKAGE__->has_many(
  "players",
  "Model::Schema::Result::Player",
  { "foreign.team" => "self.name" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 competitions

Type: many_to_many

Composing rels: L</competition_teams> -> competition

=cut

__PACKAGE__->many_to_many("competitions", "competition_teams", "competition");


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-09-24 19:18:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:F4ohio6o5VLACi0aHkmVjw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
