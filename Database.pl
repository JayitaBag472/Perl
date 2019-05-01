#!/usr/bin/perl

use DBI;
use strict;

my $driver  = "Pg"; 
my $database = "testdb";
my $dsn = "DBI:$driver:dbname = $database;host = 142.133.141.123;port = 1523";
my $userid = "postgres";
my $dbh = DBI->connect($dsn, $userid,{ RaiseError => 1 }) 
   or die $DBI::errstr;

print "Opened database successfully\n";