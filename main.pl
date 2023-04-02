#!/user/bin/perl
use warnings;
use strict;

my %roman_map = (1000 =>  "M",
		 900  => "CM",
		 500  =>  "D",
		 400  => "CD",
		 100  =>  "C",
		 90   => "XC",
		 50   =>  "L",
		 40   => "XL",
		 10   =>  "X",
		 9    => "IX",
		 5    =>  "V",
		 4    => "IV",
		 1    =>  "I"
	       );
# get a list of roman keys insert order
my @roman_keys =  reverse sort {$a <=> $b} keys %roman_map;
sub to_roman{
  my $number = shift;
  my $roman = "";
  foreach (@roman_keys){
    my $difference = $number - ($number % $_);
    my $amount = $difference / $_;
    $roman .=  $roman_map{$_} x $amount;
    $number -= $difference;
  }return $roman;
}

my $roman = to_roman(3724);
print "$roman\n"; 

