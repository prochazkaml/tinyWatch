ISR(RTC_CNT_vect) {
	second++;

	if(second >= 60) {
		second = 0;
		minute++;

		if(minute >= 60) {
			minute = 0;
			hour++;

			if(hour >= 24) {
				hour = 0;
				day++;
				weekday++;

				if(weekday >= 7) weekday = 0;

				if(day > ((month == 1 && !(year & 3)) ? 29 : (EEBYTE(EE_monthlengths + month)))) {
					day = 1;
					month++;

					if(month >= 12) {
						month = 0;
						year++;
					}
				}
			}
		}
	}

	if(wakeuptimeout <= WUT_MAXTIMEOUT && wakeuptimeout) wakeuptimeout--;

	if((PORTA.IN & (_BV(5) | _BV(6) | _BV(7))) != (_BV(5) | _BV(6) | _BV(7))) {
		if(wakeuptimeout)
			wakeuptimeout = WUT_MAXTIMEOUT;
		else
			wakeuptimeout = WUT_JUSTWOKEUP;
	}

	RTC.INTFLAGS |= RTC_OVF_bm;
	clockupdated |= 1;
}
