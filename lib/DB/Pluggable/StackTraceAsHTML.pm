use 5.008;
use strict;
use warnings;

package DB::Pluggable::StackTraceAsHTML;
our $VERSION = '1.100850';
# ABSTRACT: Add debugger command to see stack trace as HTML
use Devel::StackTrace::WithLexicals;
use Devel::StackTrace::AsHTML;
use File::Slurp qw(write_file);
use Browser::Open qw(open_browser);
use parent qw(DB::Pluggable::Plugin);

sub register {
    my ($self, $context) = @_;
    $self->make_command(
        Th => sub {
            my $filename = 'devel-stacktrace.html';
            write_file $filename,
              Devel::StackTrace::WithLexicals->new(ignore_package => 'DB')
              ->as_html;
            open_browser $filename;
        }
    );
}
1;


__END__
=pod

=for test_synopsis 1;
__END__

=head1 NAME

DB::Pluggable::StackTraceAsHTML - Add debugger command to see stack trace as HTML

=head1 VERSION

version 1.100850

=head1 SYNOPSIS

    $ cat ~/.perldb

    use DB::Pluggable;
    use YAML;

    $DB::PluginHandler = DB::Pluggable->new(config => Load <<EOYAML);
    global:
      log:
        level: error

    plugins:
      - module: StackTraceAsHTML
    EOYAML

    $DB::PluginHandler->run;

    $ perl -d foo.pl

    Loading DB routines from perl5db.pl version 1.28
    Editor support available.

    Enter h or `h h' for help, or `man perldebug' for more help.

    1..9
    ...
      DB<1> Th

=head1 DESCRIPTION

This plugin for L<DB::Pluggable> adds the C<Th> command to the debugger, which
displays a stack trace in HTML format, with lexical variables, using
L<Devel::StackTrace::AsHTML>. It then opens the page in the default browser
using L<Browser::Open>.

The command name C<Th> was chosen because the C<T> command shows a plain text
stack trace and C<h> indicates that the output is HTML.

=head1 METHODS

=head2 register

Adds the C<Th> command to the Perl debugger.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org/Public/Dist/Display.html?Name=DB-Pluggable-StackTraceAsHTML>.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you, or see
L<http://search.cpan.org/dist/DB-Pluggable-StackTraceAsHTML/>.

The development version lives at
L<http://github.com/hanekomu/DB-Pluggable-StackTraceAsHTML/>.
Instead of sending patches, please fork this project using the standard git
and github infrastructure.

=head1 AUTHOR

  Marcel Gruenauer <marcel@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Marcel Gruenauer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

