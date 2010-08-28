#!/usr/bin/perl -w

use strict;
use Device::SerialPort;

my $port = Device::SerialPort->new("/dev/ttyUSB0");

$port->baudrate(115200);
$port->parity("none");
$port->handshake("none");
$port->databits(8);
$port->stopbits(1);
$port->read_char_time(0);
$port->read_const_time(20);

$port->write("hello\n");

my $response = "";
my $timeout_tries = 50;

while ($timeout_tries > 0) {
	my ($count, $data) = $port->read(255);

	if ($count > 0) {
		$response .= $data;
		last if ($data =~ /\n/);
	}

	$timeout_tries--;
}

if ($timeout_tries) {
	print "$response\n";
}
else {
	print "Arduino is not responding\n";
}

