#!/usr/bin/perl
use strict;
use warnings;

# Icon Weather Forecast for Geektool
#
# [version] 1.1
# [lastmod] 2012-06
# [author]	1024jp <http://wolfrosch.com/>
# [licence]	Creative Commons Attribution-NonCommercial 3.0 Unported License
# [original] 2011-03-16


# setting 
# ---------------------------------------

# location codes (WOEID)
my %locations = (
	'Cupertino' => '2388327',
	'Tokyo'     => '1118370',
);

# condition codes
# see: http://developer.yahoo.com/weather/
my %categories = (
	'sun'      => [32,34,36],
	'moon'     => [31,33],
	'cloud'    => [26],
	'partsun'  => [28,30,44],
	'partmoon' => [27,29],
	'rain'     => [10,11,12,40],
	'hardrain' => [1,2,3,4,37,38,39,45,47],
	'snow'     => [5,6,7,13,14,15,16,17,18,35,41,42,43,46],
	'fog'      => [8,9,19,20,21,22],
	'others'   => [0,23,24,25,3200]
);

# image extention
my $extention = 'png';


# main
# ---------------------------------------

# set condition codes
my @icon_names;

foreach my $name (keys %categories) {
	foreach my $code (@{$categories{$name}}) {
		$icon_names[$code] = $name;
	}
}


# get forecast from Yahoo! Weather
use XML::Simple;
use LWP::Simple;

my %codes;

foreach my $location (keys %locations) {
	my $weatherAPI = 'http://weather.yahooapis.com/forecastrss?w='.$locations{$location};
	
	my $xml      = new XML::Simple(keyattr => []);
	my $data     = $xml->XMLin(get($weatherAPI));
	my $forecast = $data->{channel}->{item}->{'yweather:forecast'};
	
	$codes{$location.'_today'}    = $forecast->[0]->{code};
	$codes{$location.'_tomorrow'} = $forecast->[1]->{code};
}


# put image file into results folder
use FindBin;
use File::Copy;

my $path = $FindBin::Bin;

foreach my $key (keys %codes) {
	my $result_path = $path.'/results/'.$key.'.'.$extention;
	my $icon_path   = $path.'/icons/'.$icon_names[$codes{$key}].'.'.$extention;
	
	copy($icon_path, $result_path) or die;
}
