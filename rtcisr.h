#define update_val(varname) { val = varname; val++; varname = val; }

ISR(RTC_CNT_vect) {
	uint8_t val;

	update_val(second);

	if(val >= 60) {
		second = 0;
		update_val(minute);

		if(val >= 60) {
			minute = 0;
			update_val(hour);

			if(val >= 24) {
				hour = 0;

				update_val(weekday);
				
				if(val >= 7) weekday = 0;

				update_val(day);

				if(val > EEBYTE(EE_monthlengths + month)) {
					day = 1;
					update_val(month);

					if(val >= 12) {
						month = 0;
						year++;
					}
				}
			}
		}
	}

	val = wakeuptimeout;

	if(val <= WUT_MAXTIMEOUT && val) val--;

	if((VPORTA_IN & (_BV(5) | _BV(6) | _BV(7))) != (_BV(5) | _BV(6) | _BV(7))) {
		if(val)
			val = WUT_MAXTIMEOUT;
		else
			val = WUT_JUSTWOKEUP;
	}

	wakeuptimeout = val;

	RTC.INTFLAGS |= RTC_OVF_bm;
	clockupdated |= 1;
}
