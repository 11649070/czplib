#
#===============================================================================
#
#         FILE:  MyConfig.pm
#
#  DESCRIPTION:  Package to work space configuration
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Chaolin Zhang (cz), czhang@rockefeller.edu
#      COMPANY:  Rockefeller University
#      VERSION:  1.0
#      CREATED:  11/22/2004
#     REVISION:  ---
#===============================================================================


package MyConfig;

require Exporter;

@ISA = qw (Exporter);

@EXPORT = qw (
	getDefaultCache
	getGenomeDir
);


use strict;
use warnings;




=head1 Bed

Subroutines to handle workspace 

=cut

use Carp;


my $projHome = "/home2/zhangc/proj";
$projHome = $ENV {"PROJDIR"} if exists $ENV{"PROJDIR"};

sub getDefaultCache
{
	my $base = "cache";
   	$base = $_[0] if (@_ > 0);
	
	my $cacheHome = ".";
	$cacheHome = $ENV{'CACHEHOME'} if exists $ENV{'CACHEHOME'};
	my $cache = "$cacheHome/$base" . "_" . time() . "_" . rand();
	return $cache;
}


sub getDefaultTmpDir
{
	return getDefaultCache (@_);
}


sub getGenomeDir
{
	my $species =$_[0];
	my $genomeDir = "$projHome/data/genomes";
	return "$genomeDir/mm5"	if ($species eq 'mm5');
	return "$genomeDir/mm6" if ($species eq 'mm6');
	return "$genomeDir/mm8" if ($species eq 'mm8');
	return "$genomeDir/mm9" if ($species eq 'mm9');
	return "$genomeDir/hg17" if ($species eq 'hg17');
	return "$genomeDir/hg18" if ($species eq 'hg18');
	return "$genomeDir/rn4" if ($species eq 'rn4');
	return "$genomeDir/danRer4" if ($species eq 'danRer4');
	return "$genomeDir/dm2" if ($species eq 'dm2');
	return "$genomeDir/ce2" if ($species eq 'ce2');
	return "$genomeDir/sacCer1" if ($species eq 'sacCer1');
	Carp::croak "can not find the directory for $species\n";
}

1;


