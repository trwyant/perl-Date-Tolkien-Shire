# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..4\n"; }
END {print "not ok 1\n" unless $loaded;}
use Date::Tolkien::Shire;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

use Time::Local;

#This chunk tests the constructor, part of set_date, and time_in_seconds
$ok = true;
@lengths = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
foreach $year (1935..1937, 1999..2000, 2035..2037 ) {
    if ((($year % 4 == 0) && ($year % 100 != 0)) || ($year % 400 == 0)) { 
	$lengths[1] = 29;
	$date2 = Date::Tolkien::Shire->new($date); #we'll use this next chunk
    }
    else { $lengths[1] = 28; }
    for ($month = 0; $month < 12; ++$month) {
	for ($day = 1; $day <= $lengths[$month]; ++$day) {
	    $time = timelocal(0,0,0,$day, $month, $year);
	    $date = Date::Tolkien::Shire->new($time);
	    $ok = 0 if Date::Tolkien::Shire->error;
	    $ok = 0 if $time != $date->time_in_seconds;
	    $ok = 0 if Date::Tolkien::Shire->error;
	}
    }
}
$ok = 0 if $date->day != 9;
if ($ok) { print "ok 2\n"; }
else { print "not ok 2\n"; }

#Now check the comparison operator and the other half of set_date
$ok = 1;
$ok = 0 if ($date <= $date2);
$ok = 0 if Date::Tolkien::Shire->error;
$date2->set_date($date);
$ok = 0 if Date::Tolkien::Shire->error;
$ok = 0 if $date != $date2;
$ok = 0 if Date::Tolkien::Shire->error;if ($ok) { print "ok 3\n"; }
else { print "not ok 3\n"; }

#Finally Check the accessor methods and the on_date function
$ok = 1;
$date->weekday;
$ok = 0 if Date::Tolkien::Shire->error;
$date->trad_weekday;
$ok = 0 if Date::Tolkien::Shire->error;
$date->day;
$ok = 0 if Date::Tolkien::Shire->error;
$date->month;
$ok = 0 if Date::Tolkien::Shire->error;
$date->year;
$ok = 0 if Date::Tolkien::Shire->error;
$date->on_date;
$ok = 0 if Date::Tolkien::Shire->error;
if ($ok) { print "ok 4\n"; }
else { print "not ok 4\n"; }
