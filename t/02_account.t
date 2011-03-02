#!/usr/bin/perl

use strict;
use Test::More tests => 5;
use Net::CampaignMonitor;

my $cm = Net::CampaignMonitor->new({
		secure  => 1, 
		api_key => 'bede1bad6a17b4847b0db12352674303',
	  });
	  
ok( $cm->account_clients()->{'code'} eq '200', 'Clients' );

ok( $cm->account_countries()->{'code'} eq '200', 'Countries' );

ok( $cm->account_timezones()->{'code'} eq '200', 'Timezones' );

ok( $cm->account_systemdate()->{'code'} eq '200', 'System Date' );

ok( $cm->account_apikey("http://perltest.createsend.com/", "perltest", "tUvu3u8A")->{'code'} eq '200', 'API Key' );