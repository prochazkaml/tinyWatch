; Assemble with NASM. No, I am not joking.

ORG 0

hex: db "0123456789ABCDEF"

monthlengths: db 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

daylist_ptrs: db \
	monday, \
	tuesday, \
	wednesday, \
	thursday, \
	friday, \
	saturday, \
	sunday

monthlist_ptrs: db \
	january, \
	february, \
	march, \
	april, \
	may, \
	june, \
	july, \
	august, \
	september, \
	october, \
	november, \
	december

setuplist_ptrs: db \
	hours, \
	minutes, \
	seconds, \
	weekday, \
	day, \
	month, \
	year

daylist_start:
	monday		db "Monday", 0
	tuesday		db "Tuesday", 0
	wednesday	db "Wednesday", 0
	thursday	db "Thursday", 0
	friday		db "Friday", 0
	saturday	db "Saturday", 0
	sunday		db "Sunday", 0

monthlist_start:
	january		db "January", 0
	february	db "February", 0
	march		db "March", 0
	april		db "April", 0
	may			db "May", 0
	june		db "June", 0
	july		db "July", 0
	august		db "August", 0
	september	db "September", 0
	october		db "October", 0
	november	db "November", 0
	december	db "December", 0
	
setuplist_start:
	hours		db "Hours", 0
	minutes		db "Minutes", 0
	seconds		db "Seconds", 0
	weekday		db "Weekday", 0
	day			db "Day", 0
	month		db "Month", 0
	year		db "Year", 0
	