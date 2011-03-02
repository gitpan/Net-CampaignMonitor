#!/usr/bin/perl

use strict;
use Test::More tests => 2;
use Net::CampaignMonitor;

my $cm = Net::CampaignMonitor->new({
		secure  => 1, 
		api_key => 'bede1bad6a17b4847b0db12352674303',
	  });

my $client_id = $cm->account_clients()->{response}->[0]->{ClientID};
my $list_id   = $cm->client_lists($client_id)->{response}->[0]->{ListID};

ok( $cm->list_delete($list_id)->{code} eq '200', 'Deleted list');
ok( $cm->client_delete($client_id)->{code} eq '200', 'Deleted client' );