use utf8;
package MyApp::Schema::Result::CompetitionTeam;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::CompetitionTeam

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<competition_team>

=cut

__PACKAGE__->table("competition_team");

=head1 ACCESSORS

=head2 competition

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 64

=head2 team

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 64

=cut

__PACKAGE__->add_columns(
  "competition",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 64 },
  "team",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 64 },
);

=head1 PRIMARY KEY

=over 4

=item * L</competition>

=item * L</team>

=back

=cut

__PACKAGE__->set_primary_key("competition", "team");

=head1 RELATIONS

=head2 competition

Type: belongs_to

Related object: L<MyApp::Schema::Result::Competition>

=cut

__PACKAGE__->belongs_to(
  "competition",
  "MyApp::Schema::Result::Competition",
  { name => "competition" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FririIdl3igxFCPD6cxMHA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
