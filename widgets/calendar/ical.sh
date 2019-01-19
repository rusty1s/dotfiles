#!/bin/sh

EC="In Apps gefunden,In natürlicher Sprache gefunden,Geburtstage,Deutsche Feiertage,Erinnerungen"

icalBuddy -ec "$EC" -sd -nrd -b "- " -ss "" -df "%A, %e. %b" eventsToday+4
