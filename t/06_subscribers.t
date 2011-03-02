#!/usr/bin/perl

use strict;
use Test::More tests => 5;
use Net::CampaignMonitor;

my $cm = Net::CampaignMonitor->new({
		secure  => 1, 
		api_key => 'bede1bad6a17b4847b0db12352674303',
	  });

my $client_id = $cm->account_clients()->{response}->[0]->{ClientID};
my $list_id   = $cm->client_lists($client_id)->{response}->[0]->{ListID};

my %subscriber = (
	  'Resubscribe'  => 'true',
	  'CustomFields' => [
			      {
				'Value' => 'http://example.com',
				'Key'   => 'website'
			      },
			      {
				'Value' => 'magic',
				'Key'   => 'interests'
			      },
			      {
				'Value' => 'romantic walks',
				'Key'   => 'interests'
			      }
			    ],
	  'Name'         => 'New Subscriber',
	  'EmailAddress' => 'subscriber@example.com',
	  'listid'       => $list_id,
);

my %new_subscribers = (
  'Subscribers' => [
		   {
		     'CustomFields' => [
			 {
			   'Value' => 'http://example.com',
			   'Key' => 'website'
			 },
			 {
			   'Value' => 'magic',
			   'Key' => 'interests'
			 },
			 {
			   'Value' => 'romantic walks',
			   'Key' => 'interests'
			 }
		       ],
		     'Name' => 'New Subscriber One',
		     'EmailAddress' => 'subscriber1@example.com'
		   },
		   {
		     'Name' => 'New Subscriber Two',
		     'EmailAddress' => 'subscriber2@example.com'
		   },
		   {
		     'Name' => 'New Subscriber Three',
		     'EmailAddress' => 'subscriber3@example.com'
		   }
		 ],
  'Resubscribe' => 'true',
  'listid'       => $list_id,
);

my %existing_subscriber = (
	'email'  => 'subscriber@example.com',
	'listid' => $list_id,
);

my %existing_subscriber2 = (
	'email'  => 'subscriber@example.com',
	'listid' => $list_id,
);

my %remove_subscriber = (
	'EmailAddress'  => 'subscriber@example.com',
	'listid'        => $list_id,
);

ok( $cm->subscribers(%subscriber)->{code} eq '201', 'Subscriber created' );
ok( $cm->subscribers_import(%new_subscribers)->{code} eq '201', 'Subscribers created' );
ok( $cm->subscribers(%existing_subscriber)->{code} eq '200', 'Got subscriber' );
ok( $cm->subscribers_history(%existing_subscriber2)->{code} eq '200', 'Got subscriber history' );
ok( $cm->subscribers_unsubscribe(%remove_subscriber)->{code} eq '200', 'Unsubscribed subscriber' );
























