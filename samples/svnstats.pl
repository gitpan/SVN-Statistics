#!/usr/local/rt3/perl/bin/perl
$VERSION = sprintf "%d.%05d", '$Revision:   1.4  $' =~ /(\d+)/g;

use strict;
use warnings;
use Murex::Base;
use Data::Dumper::Simple;
use RRDTool::OO;
use IO::Toolkit;
use SVN::Log;

# Initialize Logging -----------------------------------
use Log::Log4perl qw(get_logger);
Log::Log4perl->init_and_watch("log.conf", 60);
my $logger = get_logger();
$logger->info("Program started.");

# Command-line options ---------------------------------
my $repository;
my @extra_options = (
  			{ 
		  		Spec		=>  "repository=s",
		  		Variable  	=> \$repository,
		  		Help		=> "--repository=repository",
		  		Verbose		=> ["--repository=repository",
					    	    "Repository",
				   	   	   ] 
			},
   );

IO::Toolkit::commandline(@extra_options);
$repository="https://svn.it-projects.com/svn/markus" unless defined($repository);

$logger->info("Processing $repository");

my $revs = SVN::Log::retrieve ($repository, 1,'HEAD');
#$logger->debug(Dumper($revs));

foreach my $rev ($revs) {
   $logger->info(Dumper($rev->{revision}->{date}));
}
  
die;
        # Constructor     
    my $rrd = RRDTool::OO->new(
                 file => "myrrdfile.rrd" );

        # Create a round-robin database
    $rrd->create(
         step        => 1,  # one-second intervals
         data_source => { name      => "mydatasource",
                          type      => "GAUGE" },
         archive     => { rows      => 5 });

        # Update RRD with sample values, use current time.
    for(1..5) {
        $rrd->update($_);
        sleep(1);
    }

        # Start fetching values from one day back, 
        # but skip undefined ones first
    $rrd->fetch_start();
    $rrd->fetch_skip_undef();

        # Fetch stored values
    while(my($time, $value) = $rrd->fetch_next()) {
         print "$time: ", 
               defined $value ? $value : "[undef]", "\n";
    }

        # Draw a graph in a PNG image
    $rrd->graph(
      image          => "/var/www/html/mygraph.png",
      vertical_label => 'Commits',
      start          => time() - 10,
      draw           => {
          type   => "area",
          color  => '0000FF',
          legend => "svn.it-projects.com commits over Time",
      }
    );


$logger->info("Program ended.");
1;

__END__

# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

script.pl

=head1 SYNOPSIS

./svnstats.pl

=head1 ABSTRACT

  Abstract of the script
  
=head1 DESCRIPTION

Here comes the full description

=head2 EXPORT

None by default.

=head1 SEE ALSO

   Documentation:   http://linke.de/wiki/index.php/Software_Projects#SVN_STATS:_Subversion_Statistics
   Bug-Reports:     https://bugzilla.it-projects.com
   Source Control:  https://svn.it-projects.com/svn/svnstats

=head1 AUTHOR

Markus Linke, markus.linke@linke.de

=head1 COPYRIGHT AND LICENSE

Copyright 2006 by Markus Linke

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
    