#!/usr/bin/perl

use strict;
use POSIX;
use DBI;

my $phone=@ARGV[0];
my $subj=@ARGV[1];
my $msg=@ARGV[2];

my $driver = "mysql";
my $user = "MyLogin";
my $password = "MyPassword";
my $database = "users";
my $dsn = "DBI:$driver:host=94.249.146.189:3306;database=$database";
my $dbh = DBI->connect($dsn, $user, $password);

my $sql = $dbh->prepare("INSERT INTO HostspectrLogin (number, sign, message) VALUES ('$phone', 'MySignature', '$msg')");

$sql->execute;