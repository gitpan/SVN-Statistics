package SVN::Statistics;

# $LastChangedDate: 2006-07-06 07:05:13 -0500 (Thu, 06 Jul 2006) $
# $LastChangedRevision: 18 $ 
# $LastChangedBy: markus.linke@linke.de $ 

use 5.008;
use strict;
use warnings;

use vars qw(@ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $VERSION);
use English;
use Data::Dumper::Simple;
use RRDTool::OO;
use IO::Toolkit;
use SVN::Log;

require Exporter;

our @ISA = qw(Exporter);
our %EXPORT_TAGS = (
    'all' => [
        qw(

          )
    ]);

our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

$VERSION = 0 + sprintf("%3f",((qw$LastChangedRevision: 18 $)[-1])/1000);


sub test {
}

1;

__END__

=head1 NAME

SVN::Statistics

=head1 ABSTRACT

SVN::Statistics - perl module to create subversion statistics

=head1 PREREQUISITS

RRDTool and Log4Perl required

=head1 SYNOPSIS

Sample Script (please also have a look into the samples directory):

   use SVN::Statistics;

=head1 DESCRIPTION

SVN::Statistics - perl module to create subversion statistics

=head1 EXPORT

none

=head1 SEE ALSO

   http://www.linke.de for my personal homepage
   Submit bugs at http://bugzilla.it-projects.com
   Hosted Subversion Version Control provided by http://svn.it-projects.com
      
=head1 AUTHOR

Markus Linke, markus.linke@linke.de

=head1 COPYRIGHT AND LICENSE

Copyright 2006 by Markus Linke

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut

