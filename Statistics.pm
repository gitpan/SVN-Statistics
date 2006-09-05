package SVN::Statistics;

# $LastChangedDate: 2006-09-05 14:36:32 -0500 (Tue, 05 Sep 2006) $
# $LastChangedRevision: 41 $ 
# $LastChangedBy: markus.linke@linke.de $ 

use 5.008;
use strict;
use warnings;

use vars qw(@ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $VERSION);
use English;
use Data::Dumper::Simple;
#use RRDTool::OO;
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

$VERSION = 0 + sprintf("%3f",((qw$LastChangedRevision: 41 $)[-1])/1000);


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

SVN::Statistics - perl module to create subversion statistics. 

I found a product (fisheye http://www.cenqua.com/fisheye/), which has most of
the features I was looking for; because of this and a lack of time to work on
this I have decided not to continue with the project. If you would like to take
over, please let me know and I will give full repository access.

=head1 EXPORT

none

=head1 SEE ALSO

   http://www.linke.de for my personal homepage and
   http://trac.it-projects.com/svnstats for the project TRAC pages
   
   Please submit bugs at http://bugzilla.it-projects.com
   
   Hosted Subversion Version Control provided by http://svn.it-projects.com
   Checkout the latest version at https://svn.it-projects.com/svn/svnstats


=head1 AUTHOR

Markus Linke, markus.linke@linke.de

=head1 COPYRIGHT AND LICENSE

Copyright 2006 by Markus Linke

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut

