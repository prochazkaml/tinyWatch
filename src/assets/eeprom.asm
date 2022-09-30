.eseg
.org 0

// Convenient hex digit lookup

EE_hex: .db "0123456789ABCDEF"

// Lengths of each month (not accounting for February in leap years, but who cares)

EE_monthlengths: .db 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

// Pointers to the strings below

EE_daylist: .db \
	EE_monday, \
	EE_tuesday, \
	EE_wednesday, \
	EE_thursday, \
	EE_friday, \
	EE_saturday, \
	EE_sunday

EE_monthlist: .db \
	EE_january, \
	EE_february, \
	EE_march, \
	EE_april, \
	EE_may, \
	EE_june, \
	EE_july, \
	EE_august, \
	EE_september, \
	EE_october, \
	EE_november, \
	EE_december

EE_setuplist: .db \
	EE_seconds, \
	EE_minutes, \
	EE_hours, \
	EE_weekday, \
	EE_day, \
	EE_month

EE_misc: .db \
	EE_stopwatch, \
	EE_calibmenu, \
	EE_done, \
	EE_end & 0xFF

EE_monday:		.db "Monday"
EE_tuesday:		.db "Tuesday"
EE_wednesday:	.db "Wednesday"
EE_thursday:	.db "Thursday"
EE_friday:		.db "Friday"
EE_saturday:	.db "Saturday"
EE_sunday:		.db "Sunday"

EE_january:		.db "January"
EE_february:	.db "February"
EE_march:		.db "March"
EE_april:		.db "April"
EE_may:			.db "May"
EE_june:		.db "June"
EE_july:		.db "July"
EE_august:		.db "August"
EE_september:	.db "September"
EE_october:		.db "October"
EE_november:	.db "November"
EE_december:	.db "December"

EE_seconds:		.db "Seconds"
EE_minutes:		.db "Minutes"
EE_hours:		.db "Hours"
EE_weekday:		.db "Weekday"
EE_day:			.db "Day"
EE_month:		.db "Month"

EE_stopwatch:	.db "Stopwatch"
EE_calibmenu:	.db "Oscillator calibration"
EE_done:		.db "Done"
EE_end:

.cseg
