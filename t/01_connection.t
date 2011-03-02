#!/usr/bin/perl

use strict;
use Test::More tests => 5;

use_ok( 'Net::CampaignMonitor' );


my $cm_secure_apikey = Net::CampaignMonitor->new({
			secure  => 1,
			api_key => 'bede1bad6a17b4847b0db12352674303',
		  });

my $cm_insecure_apikey = Net::CampaignMonitor->new({
			secure  => 0,
			api_key => 'bede1bad6a17b4847b0db12352674303',
		  });
		  
my $cm_secure = Net::CampaignMonitor->new({
			secure  => 1,
		  });

my $cm_insecure = Net::CampaignMonitor->new({
			secure  => 0,
		  });

isa_ok( $cm_secure_apikey, 'Net::CampaignMonitor' );
isa_ok( $cm_insecure_apikey, 'Net::CampaignMonitor' );
isa_ok( $cm_secure, 'Net::CampaignMonitor' );
isa_ok( $cm_insecure, 'Net::CampaignMonitor' );