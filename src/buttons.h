#ifndef _BUTTONS
#define _BUTTONS

#include <avr/io.h>

#define pressed_matrix GPIO_GPIOR3
#define button_is_pressed(bit) (pressed_matrix & _BV(bit + 5))
#define button_is_held_down(bit) (!(VPORTA_IN & _BV(bit + 5)))

void buttons_update();

#endif

