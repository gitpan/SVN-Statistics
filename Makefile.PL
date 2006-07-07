use 5.008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'SVN::Statistics',
    'VERSION_FROM'	=> 'Statistics.pm', # finds $VERSION
    'PREREQ_PM'		=> {'RRDTool::OO'},
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'Statistics.pm', # retrieve abstract from module
       AUTHOR     => 'Markus Linke <markus.linke@linke.de>') : ()),
    dist => {
	PREOP => 'svn log Statistics.pm > Changes;pod2text Statistics.pm > README;pod2html Statistics.pm > README.html',
    },
);
sub MY::libscan {
    my $path = $_[1];
    return '' if $path =~ /\B\.svn\b/;
    return $path;
}
