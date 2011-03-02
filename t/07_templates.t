#!/usr/bin/perl

use strict;
use Test::More tests => 4;
use Net::CampaignMonitor;
	
my $cm = Net::CampaignMonitor->new({
		secure  => 1, 
		api_key => 'bede1bad6a17b4847b0db12352674303',
	  });

my $client_id = $cm->account_clients()->{response}->[0]->{ClientID};

my %template = (
	'ZipFileURL'    => 'http://media.netcomm.com.au/public/assets/file/0005/70835/images.zip',
	'HtmlPageURL'   => 'http://media.netcomm.com.au/public/assets/file/0003/70833/full_width.html',
	'ScreenshotURL' => 'http://media.netcomm.com.au/public/assets/image/0020/46640/MyZone_Web_banner.jpg',
	'Name'          => 'Template Two',
	'clientid'      => $client_id
);

my $created_template = $cm->templates(%template);

ok( $created_template->{code} eq '201', 'Created template' );

my $template_id = $created_template->{'response'};

my %updated_template = (
	'ZipFileURL'        => 'http://media.netcomm.com.au/public/assets/file/0005/70835/images.zip',
	'HtmlPageURL'       => 'http://media.netcomm.com.au/public/assets/file/0003/70833/full_width.html',
	'ScreenshotURL'     => 'http://media.netcomm.com.au/public/assets/image/0020/46640/MyZone_Web_banner.jpg',
	'Name'              => 'Template Three',
	'templateid'        => $template_id,
);

ok( $cm->templates($template_id)->{code} eq '200', 'Got template' );
ok( $cm->templates(%updated_template)->{code} eq '200', 'Updated template' );
ok( $cm->templates_delete($template_id)->{code} eq '200', 'Deleted template' );