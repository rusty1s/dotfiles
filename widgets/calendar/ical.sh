#!/bin/sh

EC="In Apps gefunden,In natürlicher Sprache gefunden,Geburtstage,Deutsche Feiertage,Erinnerungen,Birthdays,Found in Natural Language"
/usr/local/bin/icalBuddy -n -ec "$EC" -sd -nrd -b "* " -ss "" -df "%A %e %b" eventsToday+4 > "$HOME/ical.txt"
