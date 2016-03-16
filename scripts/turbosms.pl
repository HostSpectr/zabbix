#!/usr/bin/perl

use strict;
use POSIX;
use DBI;
use utf8;

my $phone=@ARGV[0];
my $msg=@ARGV[2];

my $driver = "mysql";
my $mysqlhost = "94.249.146.189";
my $user = "GateLogin";
my $password = "GatePassword";
my $sign = "MySignature";
my $database = "users";
my $dsn = "DBI:$driver:host=$mysqlhost:3306;database=$database";
my $dbh = DBI->connect($dsn, $user, $password, {mysql_enable_utf8 => 1});

my $sql = $dbh->prepare("INSERT INTO $user (number, sign, message) VALUES ('$phone', '$sign', '$msg')");

$sql->execute;
