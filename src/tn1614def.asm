//***** THIS IS A MACHINE GENERATED FILE - DO NOT EDIT ********************

//*************************************************************************
//* A P P L I C A T I O N   N O T E   F O R   T H E   A V R   F A M I L Y
//*
//* Number            : AVR000
//* File Name         : tn1614def.inc
//* Title             : Register/Bit Definitions for the ATtiny1614
//* Created           : 2017-10-02 18:57
//* Version           : 1.00
//* Support e-mail    : avr@atmel.com
//* Target MCU        : ATtiny1614
//*
//* DESCRIPTION
//* When including this file in the assembly program file, all I/O register
//* names and I/O register bit names appearing in the data book can be used.
//* In addition, the six registers forming the three data pointers X, Y and
//* Z have been assigned names XL - ZH. Highest RAM address for Internal
//* SRAM is also defined
//*
//*************************************************************************

#ifndef _TN1614DEF_INC_
#define _TN1614DEF_INC_


//#pragma partinc 0

// ***** SPECIFY DEVICE ***************************************************
//.device	ATtiny1614

//#pragma AVRPART ADMIN PART_NAME ATtiny1614

#define	SIGNATURE_000	0x1E
#define	SIGNATURE_001	0x94
#define	SIGNATURE_002	0x22

//#pragma AVRPART CORE CORE_VERSION V3X


// ***** ABSOLUTE I/O REGISTER LOCATIONS **********************************


//*************************************************************************
//** AC0 - Analog Comparator
//*************************************************************************

#define AC0_CTRLA 1664                    // Control A
#define AC0_MUXCTRLA 1666                 // Mux Control A
#define AC0_INTCTRL 1670                  // Interrupt Control
#define AC0_STATUS 1671                   // Status

//*************************************************************************
//** AC1 - Analog Comparator
//*************************************************************************

#define AC1_CTRLA 1672                    // Control A
#define AC1_MUXCTRLA 1674                 // Mux Control A
#define AC1_INTCTRL 1678                  // Interrupt Control
#define AC1_STATUS 1679                   // Status

//*************************************************************************
//** AC2 - Analog Comparator
//*************************************************************************

#define AC2_CTRLA 1680                    // Control A
#define AC2_MUXCTRLA 1682                 // Mux Control A
#define AC2_INTCTRL 1686                  // Interrupt Control
#define AC2_STATUS 1687                   // Status

//*************************************************************************
//** ADC0 - Analog to Digital Converter
//*************************************************************************

#define ADC0_CTRLA 1536                   // Control A
#define ADC0_CTRLB 1537                   // Control B
#define ADC0_CTRLC 1538                   // Control C
#define ADC0_CTRLD 1539                   // Control D
#define ADC0_CTRLE 1540                   // Control E
#define ADC0_SAMPCTRL 1541                // Sample Control
#define ADC0_MUXPOS 1542                  // Positive mux input
#define ADC0_COMMAND 1544                 // Command
#define ADC0_EVCTRL 1545                  // Event Control
#define ADC0_INTCTRL 1546                 // Interrupt Control
#define ADC0_INTFLAGS 1547                // Interrupt Flags
#define ADC0_DBGCTRL 1548                 // Debug Control
#define ADC0_TEMP 1549                    // Temporary Data
#define ADC0_RES 1552                     // ADC Accumulator Result
#define ADC0_RESL 1552                    // ADC Accumulator Result low byte
#define ADC0_RESH 1553                    // ADC Accumulator Result hi byte
#define ADC0_WINLT 1554                   // Window comparator low threshold
#define ADC0_WINLTL 1554                  // Window comparator low threshold low byte
#define ADC0_WINLTH 1555                  // Window comparator low threshold hi byte
#define ADC0_WINHT 1556                   // Window comparator high threshold
#define ADC0_WINHTL 1556                  // Window comparator high threshold low byte
#define ADC0_WINHTH 1557                  // Window comparator high threshold hi byte
#define ADC0_CALIB 1558                   // Calibration

//*************************************************************************
//** ADC1 - Analog to Digital Converter
//*************************************************************************

#define ADC1_CTRLA 1600                   // Control A
#define ADC1_CTRLB 1601                   // Control B
#define ADC1_CTRLC 1602                   // Control C
#define ADC1_CTRLD 1603                   // Control D
#define ADC1_CTRLE 1604                   // Control E
#define ADC1_SAMPCTRL 1605                // Sample Control
#define ADC1_MUXPOS 1606                  // Positive mux input
#define ADC1_COMMAND 1608                 // Command
#define ADC1_EVCTRL 1609                  // Event Control
#define ADC1_INTCTRL 1610                 // Interrupt Control
#define ADC1_INTFLAGS 1611                // Interrupt Flags
#define ADC1_DBGCTRL 1612                 // Debug Control
#define ADC1_TEMP 1613                    // Temporary Data
#define ADC1_RES 1616                     // ADC Accumulator Result
#define ADC1_RESL 1616                    // ADC Accumulator Result low byte
#define ADC1_RESH 1617                    // ADC Accumulator Result hi byte
#define ADC1_WINLT 1618                   // Window comparator low threshold
#define ADC1_WINLTL 1618                  // Window comparator low threshold low byte
#define ADC1_WINLTH 1619                  // Window comparator low threshold hi byte
#define ADC1_WINHT 1620                   // Window comparator high threshold
#define ADC1_WINHTL 1620                  // Window comparator high threshold low byte
#define ADC1_WINHTH 1621                  // Window comparator high threshold hi byte
#define ADC1_CALIB 1622                   // Calibration

//*************************************************************************
//** BOD - Bod interface
//*************************************************************************

#define BOD_CTRLA 128                     // Control A
#define BOD_CTRLB 129                     // Control B
#define BOD_VLMCTRLA 136                  // Voltage level monitor Control
#define BOD_INTCTRL 137                   // Voltage level monitor interrupt Control
#define BOD_INTFLAGS 138                  // Voltage level monitor interrupt Flags
#define BOD_STATUS 139                    // Voltage level monitor status

//*************************************************************************
//** CCL - Configurable Custom Logic
//*************************************************************************

#define CCL_CTRLA 448                     // Control Register A
#define CCL_SEQCTRL0 449                  // Sequential Control 0
#define CCL_LUT0CTRLA 453                 // LUT Control 0 A
#define CCL_LUT0CTRLB 454                 // LUT Control 0 B
#define CCL_LUT0CTRLC 455                 // LUT Control 0 C
#define CCL_TRUTH0 456                    // Truth 0
#define CCL_LUT1CTRLA 457                 // LUT Control 1 A
#define CCL_LUT1CTRLB 458                 // LUT Control 1 B
#define CCL_LUT1CTRLC 459                 // LUT Control 1 C
#define CCL_TRUTH1 460                    // Truth 1

//*************************************************************************
//** CLKCTRL - Clock controller
//*************************************************************************

#define CLKCTRL_MCLKCTRLA 96              // MCLK Control A
#define CLKCTRL_MCLKCTRLB 97              // MCLK Control B
#define CLKCTRL_MCLKLOCK 98               // MCLK Lock
#define CLKCTRL_MCLKSTATUS 99             // MCLK Status
#define CLKCTRL_OSC20MCTRLA 112           // OSC20M Control A
#define CLKCTRL_OSC20MCALIBA 113          // OSC20M Calibration A
#define CLKCTRL_OSC20MCALIBB 114          // OSC20M Calibration B
#define CLKCTRL_OSC32KCTRLA 120           // OSC32K Control A
#define CLKCTRL_XOSC32KCTRLA 124          // XOSC32K Control A

//*************************************************************************
//** CPU - CPU
//*************************************************************************

#define CPU_CCP 52                        // Configuration Change Protection
#define CPU_SPL 61                        // Stack Pointer Low
#define CPU_SPH 62                        // Stack Pointer High
#define CPU_SREG 63                       // Status Register

//*************************************************************************
//** CPUINT - Interrupt Controller
//*************************************************************************

#define CPUINT_CTRLA 272                  // Control A
#define CPUINT_STATUS 273                 // Status
#define CPUINT_LVL0PRI 274                // Interrupt Level 0 Priority
#define CPUINT_LVL1VEC 275                // Interrupt Level 1 Priority Vector

//*************************************************************************
//** CRCSCAN - CRCSCAN
//*************************************************************************

#define CRCSCAN_CTRLA 288                 // Control A
#define CRCSCAN_CTRLB 289                 // Control B
#define CRCSCAN_STATUS 290                // Status

//*************************************************************************
//** DAC0 - Digital to Analog Converter
//*************************************************************************

#define DAC0_CTRLA 1696                   // Control Register A
#define DAC0_DATA 1697                    // DATA Register

//*************************************************************************
//** DAC1 - Digital to Analog Converter
//*************************************************************************

#define DAC1_CTRLA 1704                   // Control Register A
#define DAC1_DATA 1705                    // DATA Register

//*************************************************************************
//** DAC2 - Digital to Analog Converter
//*************************************************************************

#define DAC2_CTRLA 1712                   // Control Register A
#define DAC2_DATA 1713                    // DATA Register

//*************************************************************************
//** EVSYS - Event System
//*************************************************************************

#define EVSYS_ASYNCSTROBE 384             // Asynchronous Channel Strobe
#define EVSYS_SYNCSTROBE 385              // Synchronous Channel Strobe
#define EVSYS_ASYNCCH0 386                // Asynchronous Channel 0 Generator Selection
#define EVSYS_ASYNCCH1 387                // Asynchronous Channel 1 Generator Selection
#define EVSYS_ASYNCCH2 388                // Asynchronous Channel 2 Generator Selection
#define EVSYS_ASYNCCH3 389                // Asynchronous Channel 3 Generator Selection
#define EVSYS_SYNCCH0 394                 // Synchronous Channel 0 Generator Selection
#define EVSYS_SYNCCH1 395                 // Synchronous Channel 1 Generator Selection
#define EVSYS_ASYNCUSER0 402              // Asynchronous User Ch 0 Input Selection - TCB0
#define EVSYS_ASYNCUSER1 403              // Asynchronous User Ch 1 Input Selection - ADC0
#define EVSYS_ASYNCUSER2 404              // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0
#define EVSYS_ASYNCUSER3 405              // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0
#define EVSYS_ASYNCUSER4 406              // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1
#define EVSYS_ASYNCUSER5 407              // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1
#define EVSYS_ASYNCUSER6 408              // Asynchronous User Ch 6 Input Selection - TCD0 Event 0
#define EVSYS_ASYNCUSER7 409              // Asynchronous User Ch 7 Input Selection - TCD0 Event 1
#define EVSYS_ASYNCUSER8 410              // Asynchronous User Ch 8 Input Selection - Event Out 0
#define EVSYS_ASYNCUSER9 411              // Asynchronous User Ch 9 Input Selection - Event Out 1
#define EVSYS_ASYNCUSER10 412             // Asynchronous User Ch 10 Input Selection - Event Out 2
#define EVSYS_ASYNCUSER11 413             // Asynchronous User Ch 11 Input Selection - TCB1
#define EVSYS_ASYNCUSER12 414             // Asynchronous User Ch 12 Input Selection - ADC1
#define EVSYS_SYNCUSER0 418               // Synchronous User Ch 0 - TCA0
#define EVSYS_SYNCUSER1 419               // Synchronous User Ch 1 - USART0

//*************************************************************************
//** FUSE - Fuses
//*************************************************************************

#define FUSE_WDTCFG 4736                  // Watchdog Configuration
#define FUSE_BODCFG 4737                  // BOD Configuration
#define FUSE_OSCCFG 4738                  // Oscillator Configuration
#define FUSE_TCD0CFG 4740                 // TCD0 Configuration
#define FUSE_SYSCFG0 4741                 // System Configuration 0
#define FUSE_SYSCFG1 4742                 // System Configuration 1
#define FUSE_APPEND 4743                  // Application Code Section End
#define FUSE_BOOTEND 4744                 // Boot Section End

//*************************************************************************
//** GPIO - General Purpose IO
//*************************************************************************

#define GPIO_GPIOR0 28                    // General Purpose IO Register 0
#define GPIO_GPIOR1 29                    // General Purpose IO Register 1
#define GPIO_GPIOR2 30                    // General Purpose IO Register 2
#define GPIO_GPIOR3 31                    // General Purpose IO Register 3

//*************************************************************************
//** LOCKBIT - Lockbit
//*************************************************************************

#define LOCKBIT_LOCKBIT 4746              // Lock bits

//*************************************************************************
//** NVMCTRL - Non-volatile Memory Controller
//*************************************************************************

#define NVMCTRL_CTRLA 4096                // Control A
#define NVMCTRL_CTRLB 4097                // Control B
#define NVMCTRL_STATUS 4098               // Status
#define NVMCTRL_INTCTRL 4099              // Interrupt Control
#define NVMCTRL_INTFLAGS 4100             // Interrupt Flags
#define NVMCTRL_DATA 4102                 // Data
#define NVMCTRL_DATAL 4102                // Data low byte
#define NVMCTRL_DATAH 4103                // Data hi byte
#define NVMCTRL_ADDR 4104                 // Address
#define NVMCTRL_ADDRL 4104                // Address low byte
#define NVMCTRL_ADDRH 4105                // Address hi byte

//*************************************************************************
//** PORTA - I/O Ports
//*************************************************************************

#define PORTA_DIR 1024                    // Data Direction
#define PORTA_DIRSET 1025                 // Data Direction Set
#define PORTA_DIRCLR 1026                 // Data Direction Clear
#define PORTA_DIRTGL 1027                 // Data Direction Toggle
#define PORTA_OUT 1028                    // Output Value
#define PORTA_OUTSET 1029                 // Output Value Set
#define PORTA_OUTCLR 1030                 // Output Value Clear
#define PORTA_OUTTGL 1031                 // Output Value Toggle
#define PORTA_IN 1032                     // Input Value
#define PORTA_INTFLAGS 1033               // Interrupt Flags
#define PORTA_PIN0CTRL 1040               // Pin 0 Control
#define PORTA_PIN1CTRL 1041               // Pin 1 Control
#define PORTA_PIN2CTRL 1042               // Pin 2 Control
#define PORTA_PIN3CTRL 1043               // Pin 3 Control
#define PORTA_PIN4CTRL 1044               // Pin 4 Control
#define PORTA_PIN5CTRL 1045               // Pin 5 Control
#define PORTA_PIN6CTRL 1046               // Pin 6 Control
#define PORTA_PIN7CTRL 1047               // Pin 7 Control

//*************************************************************************
//** PORTB - I/O Ports
//*************************************************************************

#define PORTB_DIR 1056                    // Data Direction
#define PORTB_DIRSET 1057                 // Data Direction Set
#define PORTB_DIRCLR 1058                 // Data Direction Clear
#define PORTB_DIRTGL 1059                 // Data Direction Toggle
#define PORTB_OUT 1060                    // Output Value
#define PORTB_OUTSET 1061                 // Output Value Set
#define PORTB_OUTCLR 1062                 // Output Value Clear
#define PORTB_OUTTGL 1063                 // Output Value Toggle
#define PORTB_IN 1064                     // Input Value
#define PORTB_INTFLAGS 1065               // Interrupt Flags
#define PORTB_PIN0CTRL 1072               // Pin 0 Control
#define PORTB_PIN1CTRL 1073               // Pin 1 Control
#define PORTB_PIN2CTRL 1074               // Pin 2 Control
#define PORTB_PIN3CTRL 1075               // Pin 3 Control
#define PORTB_PIN4CTRL 1076               // Pin 4 Control
#define PORTB_PIN5CTRL 1077               // Pin 5 Control
#define PORTB_PIN6CTRL 1078               // Pin 6 Control
#define PORTB_PIN7CTRL 1079               // Pin 7 Control

//*************************************************************************
//** PORTC - I/O Ports
//*************************************************************************

#define PORTC_DIR 1088                    // Data Direction
#define PORTC_DIRSET 1089                 // Data Direction Set
#define PORTC_DIRCLR 1090                 // Data Direction Clear
#define PORTC_DIRTGL 1091                 // Data Direction Toggle
#define PORTC_OUT 1092                    // Output Value
#define PORTC_OUTSET 1093                 // Output Value Set
#define PORTC_OUTCLR 1094                 // Output Value Clear
#define PORTC_OUTTGL 1095                 // Output Value Toggle
#define PORTC_IN 1096                     // Input Value
#define PORTC_INTFLAGS 1097               // Interrupt Flags
#define PORTC_PIN0CTRL 1104               // Pin 0 Control
#define PORTC_PIN1CTRL 1105               // Pin 1 Control
#define PORTC_PIN2CTRL 1106               // Pin 2 Control
#define PORTC_PIN3CTRL 1107               // Pin 3 Control
#define PORTC_PIN4CTRL 1108               // Pin 4 Control
#define PORTC_PIN5CTRL 1109               // Pin 5 Control
#define PORTC_PIN6CTRL 1110               // Pin 6 Control
#define PORTC_PIN7CTRL 1111               // Pin 7 Control

//*************************************************************************
//** PORTMUX - Port Multiplexer
//*************************************************************************

#define PORTMUX_CTRLA 512                 // Port Multiplexer Control A
#define PORTMUX_CTRLB 513                 // Port Multiplexer Control B
#define PORTMUX_CTRLC 514                 // Port Multiplexer Control C
#define PORTMUX_CTRLD 515                 // Port Multiplexer Control D

//*************************************************************************
//** RSTCTRL - Reset controller
//*************************************************************************

#define RSTCTRL_RSTFR 64                  // Reset Flags
#define RSTCTRL_SWRR 65                   // Software Reset

//*************************************************************************
//** RTC - Real-Time Counter
//*************************************************************************

#define RTC_CTRLA 320                     // Control A
#define RTC_STATUS 321                    // Status
#define RTC_INTCTRL 322                   // Interrupt Control
#define RTC_INTFLAGS 323                  // Interrupt Flags
#define RTC_TEMP 324                      // Temporary
#define RTC_DBGCTRL 325                   // Debug control
#define RTC_CLKSEL 327                    // Clock Select
#define RTC_CNT 328                       // Counter
#define RTC_CNTL 328                      // Counter low byte
#define RTC_CNTH 329                      // Counter hi byte
#define RTC_PER 330                       // Period
#define RTC_PERL 330                      // Period low byte
#define RTC_PERH 331                      // Period hi byte
#define RTC_CMP 332                       // Compare
#define RTC_CMPL 332                      // Compare low byte
#define RTC_CMPH 333                      // Compare hi byte
#define RTC_PITCTRLA 336                  // PIT Control A
#define RTC_PITSTATUS 337                 // PIT Status
#define RTC_PITINTCTRL 338                // PIT Interrupt Control
#define RTC_PITINTFLAGS 339               // PIT Interrupt Flags
#define RTC_PITDBGCTRL 341                // PIT Debug control

//*************************************************************************
//** SIGROW - Signature row
//*************************************************************************

#define SIGROW_DEVICEID0 4352             // Device ID Byte 0
#define SIGROW_DEVICEID1 4353             // Device ID Byte 1
#define SIGROW_DEVICEID2 4354             // Device ID Byte 2
#define SIGROW_SERNUM0 4355               // Serial Number Byte 0
#define SIGROW_SERNUM1 4356               // Serial Number Byte 1
#define SIGROW_SERNUM2 4357               // Serial Number Byte 2
#define SIGROW_SERNUM3 4358               // Serial Number Byte 3
#define SIGROW_SERNUM4 4359               // Serial Number Byte 4
#define SIGROW_SERNUM5 4360               // Serial Number Byte 5
#define SIGROW_SERNUM6 4361               // Serial Number Byte 6
#define SIGROW_SERNUM7 4362               // Serial Number Byte 7
#define SIGROW_SERNUM8 4363               // Serial Number Byte 8
#define SIGROW_SERNUM9 4364               // Serial Number Byte 9
#define SIGROW_TEMPSENSE0 4384            // Temperature Sensor Calibration Byte 0
#define SIGROW_TEMPSENSE1 4385            // Temperature Sensor Calibration Byte 1
#define SIGROW_OSC16ERR3V 4386            // OSC16 error at 3V
#define SIGROW_OSC16ERR5V 4387            // OSC16 error at 5V
#define SIGROW_OSC20ERR3V 4388            // OSC20 error at 3V
#define SIGROW_OSC20ERR5V 4389            // OSC20 error at 5V

//*************************************************************************
//** SLPCTRL - Sleep Controller
//*************************************************************************

#define SLPCTRL_CTRLA 80                  // Control

//*************************************************************************
//** SPI0 - Serial Peripheral Interface
//*************************************************************************

#define SPI0_CTRLA 2080                   // Control A
#define SPI0_CTRLB 2081                   // Control B
#define SPI0_INTCTRL 2082                 // Interrupt Control
#define SPI0_INTFLAGS 2083                // Interrupt Flags
#define SPI0_DATA 2084                    // Data

//*************************************************************************
//** SYSCFG - System Configuration Registers
//*************************************************************************

#define SYSCFG_REVID 3841                 // Revision ID
#define SYSCFG_EXTBRK 3842                // External Break

//*************************************************************************
//** TCA0 - 16-bit Timer/Counter Type A
//*************************************************************************

#define TCA0_SINGLE_CTRLA 2560            // SINGLE Control A
#define TCA0_SINGLE_CTRLB 2561            // SINGLE Control B
#define TCA0_SINGLE_CTRLC 2562            // SINGLE Control C
#define TCA0_SINGLE_CTRLD 2563            // SINGLE Control D
#define TCA0_SINGLE_CTRLECLR 2564         // SINGLE Control E Clear
#define TCA0_SINGLE_CTRLESET 2565         // SINGLE Control E Set
#define TCA0_SINGLE_CTRLFCLR 2566         // SINGLE Control F Clear
#define TCA0_SINGLE_CTRLFSET 2567         // SINGLE Control F Set
#define TCA0_SINGLE_EVCTRL 2569           // SINGLE Event Control
#define TCA0_SINGLE_INTCTRL 2570          // SINGLE Interrupt Control
#define TCA0_SINGLE_INTFLAGS 2571         // SINGLE Interrupt Flags
#define TCA0_SINGLE_DBGCTRL 2574          // SINGLE Degbug Control
#define TCA0_SINGLE_TEMP 2575             // SINGLE Temporary data for 16-bit Access
#define TCA0_SINGLE_CNT 2592              // SINGLE Count
#define TCA0_SINGLE_PER 2598              // SINGLE Period
#define TCA0_SINGLE_CMP0 2600             // SINGLE Compare 0
#define TCA0_SINGLE_CMP1 2602             // SINGLE Compare 1
#define TCA0_SINGLE_CMP2 2604             // SINGLE Compare 2
#define TCA0_SINGLE_PERBUF 2614           // SINGLE Period Buffer
#define TCA0_SINGLE_CMP0BUF 2616          // SINGLE Compare 0 Buffer
#define TCA0_SINGLE_CMP1BUF 2618          // SINGLE Compare 1 Buffer
#define TCA0_SINGLE_CMP2BUF 2620          // SINGLE Compare 2 Buffer
#define TCA0_SPLIT_CTRLA 2560             // SPLIT Control A
#define TCA0_SPLIT_CTRLB 2561             // SPLIT Control B
#define TCA0_SPLIT_CTRLC 2562             // SPLIT Control C
#define TCA0_SPLIT_CTRLD 2563             // SPLIT Control D
#define TCA0_SPLIT_CTRLECLR 2564          // SPLIT Control E Clear
#define TCA0_SPLIT_CTRLESET 2565          // SPLIT Control E Set
#define TCA0_SPLIT_INTCTRL 2570           // SPLIT Interrupt Control
#define TCA0_SPLIT_INTFLAGS 2571          // SPLIT Interrupt Flags
#define TCA0_SPLIT_DBGCTRL 2574           // SPLIT Degbug Control
#define TCA0_SPLIT_LCNT 2592              // SPLIT Low Count
#define TCA0_SPLIT_HCNT 2593              // SPLIT High Count
#define TCA0_SPLIT_LPER 2598              // SPLIT Low Period
#define TCA0_SPLIT_HPER 2599              // SPLIT High Period
#define TCA0_SPLIT_LCMP0 2600             // SPLIT Low Compare
#define TCA0_SPLIT_HCMP0 2601             // SPLIT High Compare
#define TCA0_SPLIT_LCMP1 2602             // SPLIT Low Compare
#define TCA0_SPLIT_HCMP1 2603             // SPLIT High Compare
#define TCA0_SPLIT_LCMP2 2604             // SPLIT Low Compare
#define TCA0_SPLIT_HCMP2 2605             // SPLIT High Compare

//*************************************************************************
//** TCB0 - 16-bit Timer Type B
//*************************************************************************

#define TCB0_CTRLA 2624                   // Control A
#define TCB0_CTRLB 2625                   // Control Register B
#define TCB0_EVCTRL 2628                  // Event Control
#define TCB0_INTCTRL 2629                 // Interrupt Control
#define TCB0_INTFLAGS 2630                // Interrupt Flags
#define TCB0_STATUS 2631                  // Status
#define TCB0_DBGCTRL 2632                 // Debug Control
#define TCB0_TEMP 2633                    // Temporary Value
#define TCB0_CNT 2634                     // Count
#define TCB0_CNTL 2634                    // Count low byte
#define TCB0_CNTH 2635                    // Count hi byte
#define TCB0_CCMP 2636                    // Compare or Capture
#define TCB0_CCMPL 2636                   // Compare or Capture low byte
#define TCB0_CCMPH 2637                   // Compare or Capture hi byte

//*************************************************************************
//** TCB1 - 16-bit Timer Type B
//*************************************************************************

#define TCB1_CTRLA 2640                   // Control A
#define TCB1_CTRLB 2641                   // Control Register B
#define TCB1_EVCTRL 2644                  // Event Control
#define TCB1_INTCTRL 2645                 // Interrupt Control
#define TCB1_INTFLAGS 2646                // Interrupt Flags
#define TCB1_STATUS 2647                  // Status
#define TCB1_DBGCTRL 2648                 // Debug Control
#define TCB1_TEMP 2649                    // Temporary Value
#define TCB1_CNT 2650                     // Count
#define TCB1_CNTL 2650                    // Count low byte
#define TCB1_CNTH 2651                    // Count hi byte
#define TCB1_CCMP 2652                    // Compare or Capture
#define TCB1_CCMPL 2652                   // Compare or Capture low byte
#define TCB1_CCMPH 2653                   // Compare or Capture hi byte

//*************************************************************************
//** TCD0 - Timer Counter D
//*************************************************************************

#define TCD0_CTRLA 2688                   // Control A
#define TCD0_CTRLB 2689                   // Control B
#define TCD0_CTRLC 2690                   // Control C
#define TCD0_CTRLD 2691                   // Control D
#define TCD0_CTRLE 2692                   // Control E
#define TCD0_EVCTRLA 2696                 // EVCTRLA
#define TCD0_EVCTRLB 2697                 // EVCTRLB
#define TCD0_INTCTRL 2700                 // Interrupt Control
#define TCD0_INTFLAGS 2701                // Interrupt Flags
#define TCD0_STATUS 2702                  // Status
#define TCD0_INPUTCTRLA 2704              // Input Control A
#define TCD0_INPUTCTRLB 2705              // Input Control B
#define TCD0_FAULTCTRL 2706               // Fault Control
#define TCD0_DLYCTRL 2708                 // Delay Control
#define TCD0_DLYVAL 2709                  // Delay value
#define TCD0_DITCTRL 2712                 // Dither Control A
#define TCD0_DITVAL 2713                  // Dither value
#define TCD0_DBGCTRL 2718                 // Debug Control
#define TCD0_CAPTUREA 2722                // Capture A
#define TCD0_CAPTUREAL 2722               // Capture A low byte
#define TCD0_CAPTUREAH 2723               // Capture A hi byte
#define TCD0_CAPTUREB 2724                // Capture B
#define TCD0_CAPTUREBL 2724               // Capture B low byte
#define TCD0_CAPTUREBH 2725               // Capture B hi byte
#define TCD0_CMPASET 2728                 // Compare A Set
#define TCD0_CMPASETL 2728                // Compare A Set low byte
#define TCD0_CMPASETH 2729                // Compare A Set hi byte
#define TCD0_CMPACLR 2730                 // Compare A Clear
#define TCD0_CMPACLRL 2730                // Compare A Clear low byte
#define TCD0_CMPACLRH 2731                // Compare A Clear hi byte
#define TCD0_CMPBSET 2732                 // Compare B Set
#define TCD0_CMPBSETL 2732                // Compare B Set low byte
#define TCD0_CMPBSETH 2733                // Compare B Set hi byte
#define TCD0_CMPBCLR 2734                 // Compare B Clear
#define TCD0_CMPBCLRL 2734                // Compare B Clear low byte
#define TCD0_CMPBCLRH 2735                // Compare B Clear hi byte

//*************************************************************************
//** TWI0 - Two-Wire Interface
//*************************************************************************

#define TWI0_CTRLA 2064                   // Control A
#define TWI0_DBGCTRL 2066                 // Debug Control Register
#define TWI0_MCTRLA 2067                  // Master Control A
#define TWI0_MCTRLB 2068                  // Master Control B
#define TWI0_MSTATUS 2069                 // Master Status
#define TWI0_MBAUD 2070                   // Master Baurd Rate Control
#define TWI0_MADDR 2071                   // Master Address
#define TWI0_MDATA 2072                   // Master Data
#define TWI0_SCTRLA 2073                  // Slave Control A
#define TWI0_SCTRLB 2074                  // Slave Control B
#define TWI0_SSTATUS 2075                 // Slave Status
#define TWI0_SADDR 2076                   // Slave Address
#define TWI0_SDATA 2077                   // Slave Data
#define TWI0_SADDRMASK 2078               // Slave Address Mask

//*************************************************************************
//** USART0 - Universal Synchronous and Asynchronous Receiver and Transmitter
//*************************************************************************

#define USART0_RXDATAL 2048               // Receive Data Low Byte
#define USART0_RXDATAH 2049               // Receive Data High Byte
#define USART0_TXDATAL 2050               // Transmit Data Low Byte
#define USART0_TXDATAH 2051               // Transmit Data High Byte
#define USART0_STATUS 2052                // Status
#define USART0_CTRLA 2053                 // Control A
#define USART0_CTRLB 2054                 // Control B
#define USART0_CTRLC 2055                 // Control C
#define USART0_BAUD 2056                  // Baud Rate
#define USART0_BAUDL 2056                 // Baud Rate low byte
#define USART0_BAUDH 2057                 // Baud Rate hi byte
#define USART0_DBGCTRL 2059               // Debug Control
#define USART0_EVCTRL 2060                // Event Control
#define USART0_TXPLCTRL 2061              // IRCOM Transmitter Pulse Length Control
#define USART0_RXPLCTRL 2062              // IRCOM Receiver Pulse Length Control

//*************************************************************************
//** USERROW - User Row
//*************************************************************************

#define USERROW_USERROW0 4864             // User Row Byte 0
#define USERROW_USERROW1 4865             // User Row Byte 1
#define USERROW_USERROW2 4866             // User Row Byte 2
#define USERROW_USERROW3 4867             // User Row Byte 3
#define USERROW_USERROW4 4868             // User Row Byte 4
#define USERROW_USERROW5 4869             // User Row Byte 5
#define USERROW_USERROW6 4870             // User Row Byte 6
#define USERROW_USERROW7 4871             // User Row Byte 7
#define USERROW_USERROW8 4872             // User Row Byte 8
#define USERROW_USERROW9 4873             // User Row Byte 9
#define USERROW_USERROW10 4874            // User Row Byte 10
#define USERROW_USERROW11 4875            // User Row Byte 11
#define USERROW_USERROW12 4876            // User Row Byte 12
#define USERROW_USERROW13 4877            // User Row Byte 13
#define USERROW_USERROW14 4878            // User Row Byte 14
#define USERROW_USERROW15 4879            // User Row Byte 15
#define USERROW_USERROW16 4880            // User Row Byte 16
#define USERROW_USERROW17 4881            // User Row Byte 17
#define USERROW_USERROW18 4882            // User Row Byte 18
#define USERROW_USERROW19 4883            // User Row Byte 19
#define USERROW_USERROW20 4884            // User Row Byte 20
#define USERROW_USERROW21 4885            // User Row Byte 21
#define USERROW_USERROW22 4886            // User Row Byte 22
#define USERROW_USERROW23 4887            // User Row Byte 23
#define USERROW_USERROW24 4888            // User Row Byte 24
#define USERROW_USERROW25 4889            // User Row Byte 25
#define USERROW_USERROW26 4890            // User Row Byte 26
#define USERROW_USERROW27 4891            // User Row Byte 27
#define USERROW_USERROW28 4892            // User Row Byte 28
#define USERROW_USERROW29 4893            // User Row Byte 29
#define USERROW_USERROW30 4894            // User Row Byte 30
#define USERROW_USERROW31 4895            // User Row Byte 31

//*************************************************************************
//** VPORTA - Virtual Ports
//*************************************************************************

#define VPORTA_DIR 0                      // Data Direction
#define VPORTA_OUT 1                      // Output Value
#define VPORTA_IN 2                       // Input Value
#define VPORTA_INTFLAGS 3                 // Interrupt Flags

//*************************************************************************
//** VPORTB - Virtual Ports
//*************************************************************************

#define VPORTB_DIR 4                      // Data Direction
#define VPORTB_OUT 5                      // Output Value
#define VPORTB_IN 6                       // Input Value
#define VPORTB_INTFLAGS 7                 // Interrupt Flags

//*************************************************************************
//** VPORTC - Virtual Ports
//*************************************************************************

#define VPORTC_DIR 8                      // Data Direction
#define VPORTC_OUT 9                      // Output Value
#define VPORTC_IN 10                      // Input Value
#define VPORTC_INTFLAGS 11                // Interrupt Flags

//*************************************************************************
//** VREF - Voltage reference
//*************************************************************************

#define VREF_CTRLA 160                    // Control A
#define VREF_CTRLB 161                    // Control B
#define VREF_CTRLC 162                    // Control C
#define VREF_CTRLD 163                    // Control D

//*************************************************************************
//** WDT - Watch-Dog Timer
//*************************************************************************

#define WDT_CTRLA 256                     // Control A
#define WDT_STATUS 257                    // Status


// ***** ALL MODULE BASE ADRESSES *****************************************

#define AC0_base 0x0680                   // Analog Comparator
#define AC1_base 0x0688                   // Analog Comparator
#define AC2_base 0x0690                   // Analog Comparator
#define ADC0_base 0x0600                  // Analog to Digital Converter
#define ADC1_base 0x0640                  // Analog to Digital Converter
#define BOD_base 0x0080                   // Bod interface
#define CCL_base 0x01C0                   // Configurable Custom Logic
#define CLKCTRL_base 0x0060               // Clock controller
#define CPU_base 0x0030                   // CPU
#define CPUINT_base 0x0110                // Interrupt Controller
#define CRCSCAN_base 0x0120               // CRCSCAN
#define DAC0_base 0x06A0                  // Digital to Analog Converter
#define DAC1_base 0x06A8                  // Digital to Analog Converter
#define DAC2_base 0x06B0                  // Digital to Analog Converter
#define EVSYS_base 0x0180                 // Event System
#define FUSE_base 0x1280                  // Fuses
#define GPIO_base 0x001C                  // General Purpose IO
#define LOCKBIT_base 0x128A               // Lockbit
#define NVMCTRL_base 0x1000               // Non-volatile Memory Controller
#define PORTA_base 0x0400                 // I/O Ports
#define PORTB_base 0x0420                 // I/O Ports
#define PORTC_base 0x0440                 // I/O Ports
#define PORTMUX_base 0x0200               // Port Multiplexer
#define RSTCTRL_base 0x0040               // Reset controller
#define RTC_base 0x0140                   // Real-Time Counter
#define SIGROW_base 0x1100                // Signature row
#define SLPCTRL_base 0x0050               // Sleep Controller
#define SPI0_base 0x0820                  // Serial Peripheral Interface
#define SYSCFG_base 0x0F00                // System Configuration Registers
#define TCA0_base 0x0A00                  // 16-bit Timer/Counter Type A
#define TCB0_base 0x0A40                  // 16-bit Timer Type B
#define TCB1_base 0x0A50                  // 16-bit Timer Type B
#define TCD0_base 0x0A80                  // Timer Counter D
#define TWI0_base 0x0810                  // Two-Wire Interface
#define USART0_base 0x0800                // Universal Synchronous and Asynchronous Receiver and Transmitter
#define USERROW_base 0x1300               // User Row
#define VPORTA_base 0x0000                // Virtual Ports
#define VPORTB_base 0x0004                // Virtual Ports
#define VPORTC_base 0x0008                // Virtual Ports
#define VREF_base 0x00A0                  // Voltage reference
#define WDT_base 0x0100                   // Watch-Dog Timer


// ***** IO REGISTER OFFSETS **********************************************


//*************************************************************************
//** AC - Analog Comparator
//*************************************************************************
#define AC_CTRLA_offset 0x00              // Control A
#define AC_MUXCTRLA_offset 0x02           // Mux Control A
#define AC_INTCTRL_offset 0x06            // Interrupt Control
#define AC_STATUS_offset 0x07             // Status

//*************************************************************************
//** ADC - Analog to Digital Converter
//*************************************************************************
#define ADC_CTRLA_offset 0x00             // Control A
#define ADC_CTRLB_offset 0x01             // Control B
#define ADC_CTRLC_offset 0x02             // Control C
#define ADC_CTRLD_offset 0x03             // Control D
#define ADC_CTRLE_offset 0x04             // Control E
#define ADC_SAMPCTRL_offset 0x05          // Sample Control
#define ADC_MUXPOS_offset 0x06            // Positive mux input
#define ADC_COMMAND_offset 0x08           // Command
#define ADC_EVCTRL_offset 0x09            // Event Control
#define ADC_INTCTRL_offset 0x0A           // Interrupt Control
#define ADC_INTFLAGS_offset 0x0B          // Interrupt Flags
#define ADC_DBGCTRL_offset 0x0C           // Debug Control
#define ADC_TEMP_offset 0x0D              // Temporary Data
#define ADC_RES_offset 0x10               // ADC Accumulator Result
#define ADC_WINLT_offset 0x12             // Window comparator low threshold
#define ADC_WINHT_offset 0x14             // Window comparator high threshold
#define ADC_CALIB_offset 0x16             // Calibration

//*************************************************************************
//** BOD - Bod interface
//*************************************************************************
#define BOD_CTRLA_offset 0x00             // Control A
#define BOD_CTRLB_offset 0x01             // Control B
#define BOD_VLMCTRLA_offset 0x08          // Voltage level monitor Control
#define BOD_INTCTRL_offset 0x09           // Voltage level monitor interrupt Control
#define BOD_INTFLAGS_offset 0x0A          // Voltage level monitor interrupt Flags
#define BOD_STATUS_offset 0x0B            // Voltage level monitor status

//*************************************************************************
//** CCL - Configurable Custom Logic
//*************************************************************************
#define CCL_CTRLA_offset 0x00             // Control Register A
#define CCL_SEQCTRL0_offset 0x01          // Sequential Control 0
#define CCL_LUT0CTRLA_offset 0x05         // LUT Control 0 A
#define CCL_LUT0CTRLB_offset 0x06         // LUT Control 0 B
#define CCL_LUT0CTRLC_offset 0x07         // LUT Control 0 C
#define CCL_TRUTH0_offset 0x08            // Truth 0
#define CCL_LUT1CTRLA_offset 0x09         // LUT Control 1 A
#define CCL_LUT1CTRLB_offset 0x0A         // LUT Control 1 B
#define CCL_LUT1CTRLC_offset 0x0B         // LUT Control 1 C
#define CCL_TRUTH1_offset 0x0C            // Truth 1

//*************************************************************************
//** CLKCTRL - Clock controller
//*************************************************************************
#define CLKCTRL_MCLKCTRLA_offset 0x00     // MCLK Control A
#define CLKCTRL_MCLKCTRLB_offset 0x01     // MCLK Control B
#define CLKCTRL_MCLKLOCK_offset 0x02      // MCLK Lock
#define CLKCTRL_MCLKSTATUS_offset 0x03    // MCLK Status
#define CLKCTRL_OSC20MCTRLA_offset 0x10   // OSC20M Control A
#define CLKCTRL_OSC20MCALIBA_offset 0x11  // OSC20M Calibration A
#define CLKCTRL_OSC20MCALIBB_offset 0x12  // OSC20M Calibration B
#define CLKCTRL_OSC32KCTRLA_offset 0x18   // OSC32K Control A
#define CLKCTRL_XOSC32KCTRLA_offset 0x1C  // XOSC32K Control A

//*************************************************************************
//** CPU - CPU
//*************************************************************************
#define CPU_CCP_offset 0x04               // Configuration Change Protection
#define CPU_SPL_offset 0x0D               // Stack Pointer Low
#define CPU_SPH_offset 0x0E               // Stack Pointer High
#define CPU_SREG_offset 0x0F              // Status Register

//*************************************************************************
//** CPUINT - Interrupt Controller
//*************************************************************************
#define CPUINT_CTRLA_offset 0x00          // Control A
#define CPUINT_STATUS_offset 0x01         // Status
#define CPUINT_LVL0PRI_offset 0x02        // Interrupt Level 0 Priority
#define CPUINT_LVL1VEC_offset 0x03        // Interrupt Level 1 Priority Vector

//*************************************************************************
//** CRCSCAN - CRCSCAN
//*************************************************************************
#define CRCSCAN_CTRLA_offset 0x00         // Control A
#define CRCSCAN_CTRLB_offset 0x01         // Control B
#define CRCSCAN_STATUS_offset 0x02        // Status

//*************************************************************************
//** DAC - Digital to Analog Converter
//*************************************************************************
#define DAC_CTRLA_offset 0x00             // Control Register A
#define DAC_DATA_offset 0x01              // DATA Register

//*************************************************************************
//** EVSYS - Event System
//*************************************************************************
#define EVSYS_ASYNCSTROBE_offset 0x00     // Asynchronous Channel Strobe
#define EVSYS_SYNCSTROBE_offset 0x01      // Synchronous Channel Strobe
#define EVSYS_ASYNCCH0_offset 0x02        // Asynchronous Channel 0 Generator Selection
#define EVSYS_ASYNCCH1_offset 0x03        // Asynchronous Channel 1 Generator Selection
#define EVSYS_ASYNCCH2_offset 0x04        // Asynchronous Channel 2 Generator Selection
#define EVSYS_ASYNCCH3_offset 0x05        // Asynchronous Channel 3 Generator Selection
#define EVSYS_SYNCCH0_offset 0x0A         // Synchronous Channel 0 Generator Selection
#define EVSYS_SYNCCH1_offset 0x0B         // Synchronous Channel 1 Generator Selection
#define EVSYS_ASYNCUSER0_offset 0x12      // Asynchronous User Ch 0 Input Selection - TCB0
#define EVSYS_ASYNCUSER1_offset 0x13      // Asynchronous User Ch 1 Input Selection - ADC0
#define EVSYS_ASYNCUSER2_offset 0x14      // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0
#define EVSYS_ASYNCUSER3_offset 0x15      // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0
#define EVSYS_ASYNCUSER4_offset 0x16      // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1
#define EVSYS_ASYNCUSER5_offset 0x17      // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1
#define EVSYS_ASYNCUSER6_offset 0x18      // Asynchronous User Ch 6 Input Selection - TCD0 Event 0
#define EVSYS_ASYNCUSER7_offset 0x19      // Asynchronous User Ch 7 Input Selection - TCD0 Event 1
#define EVSYS_ASYNCUSER8_offset 0x1A      // Asynchronous User Ch 8 Input Selection - Event Out 0
#define EVSYS_ASYNCUSER9_offset 0x1B      // Asynchronous User Ch 9 Input Selection - Event Out 1
#define EVSYS_ASYNCUSER10_offset 0x1C     // Asynchronous User Ch 10 Input Selection - Event Out 2
#define EVSYS_ASYNCUSER11_offset 0x1D     // Asynchronous User Ch 11 Input Selection - TCB1
#define EVSYS_ASYNCUSER12_offset 0x1E     // Asynchronous User Ch 12 Input Selection - ADC1
#define EVSYS_SYNCUSER0_offset 0x22       // Synchronous User Ch 0 - TCA0
#define EVSYS_SYNCUSER1_offset 0x23       // Synchronous User Ch 1 - USART0

//*************************************************************************
//** FUSE - Fuses
//*************************************************************************
#define FUSE_WDTCFG_offset 0x00           // Watchdog Configuration
#define FUSE_BODCFG_offset 0x01           // BOD Configuration
#define FUSE_OSCCFG_offset 0x02           // Oscillator Configuration
#define FUSE_TCD0CFG_offset 0x04          // TCD0 Configuration
#define FUSE_SYSCFG0_offset 0x05          // System Configuration 0
#define FUSE_SYSCFG1_offset 0x06          // System Configuration 1
#define FUSE_APPEND_offset 0x07           // Application Code Section End
#define FUSE_BOOTEND_offset 0x08          // Boot Section End

//*************************************************************************
//** GPIO - General Purpose IO
//*************************************************************************
#define GPIO_GPIOR0_offset 0x00           // General Purpose IO Register 0
#define GPIO_GPIOR1_offset 0x01           // General Purpose IO Register 1
#define GPIO_GPIOR2_offset 0x02           // General Purpose IO Register 2
#define GPIO_GPIOR3_offset 0x03           // General Purpose IO Register 3

//*************************************************************************
//** LOCKBIT - Lockbit
//*************************************************************************
#define LOCKBIT_LOCKBIT_offset 0x00       // Lock bits

//*************************************************************************
//** NVMCTRL - Non-volatile Memory Controller
//*************************************************************************
#define NVMCTRL_CTRLA_offset 0x00         // Control A
#define NVMCTRL_CTRLB_offset 0x01         // Control B
#define NVMCTRL_STATUS_offset 0x02        // Status
#define NVMCTRL_INTCTRL_offset 0x03       // Interrupt Control
#define NVMCTRL_INTFLAGS_offset 0x04      // Interrupt Flags
#define NVMCTRL_DATA_offset 0x06          // Data
#define NVMCTRL_ADDR_offset 0x08          // Address

//*************************************************************************
//** PORT - I/O Ports
//*************************************************************************
#define PORT_DIR_offset 0x00              // Data Direction
#define PORT_DIRSET_offset 0x01           // Data Direction Set
#define PORT_DIRCLR_offset 0x02           // Data Direction Clear
#define PORT_DIRTGL_offset 0x03           // Data Direction Toggle
#define PORT_OUT_offset 0x04              // Output Value
#define PORT_OUTSET_offset 0x05           // Output Value Set
#define PORT_OUTCLR_offset 0x06           // Output Value Clear
#define PORT_OUTTGL_offset 0x07           // Output Value Toggle
#define PORT_IN_offset 0x08               // Input Value
#define PORT_INTFLAGS_offset 0x09         // Interrupt Flags
#define PORT_PIN0CTRL_offset 0x10         // Pin 0 Control
#define PORT_PIN1CTRL_offset 0x11         // Pin 1 Control
#define PORT_PIN2CTRL_offset 0x12         // Pin 2 Control
#define PORT_PIN3CTRL_offset 0x13         // Pin 3 Control
#define PORT_PIN4CTRL_offset 0x14         // Pin 4 Control
#define PORT_PIN5CTRL_offset 0x15         // Pin 5 Control
#define PORT_PIN6CTRL_offset 0x16         // Pin 6 Control
#define PORT_PIN7CTRL_offset 0x17         // Pin 7 Control

//*************************************************************************
//** PORTMUX - Port Multiplexer
//*************************************************************************
#define PORTMUX_CTRLA_offset 0x00         // Port Multiplexer Control A
#define PORTMUX_CTRLB_offset 0x01         // Port Multiplexer Control B
#define PORTMUX_CTRLC_offset 0x02         // Port Multiplexer Control C
#define PORTMUX_CTRLD_offset 0x03         // Port Multiplexer Control D

//*************************************************************************
//** PTC - Peripherial Touch Controller
//*************************************************************************

//*************************************************************************
//** RSTCTRL - Reset controller
//*************************************************************************
#define RSTCTRL_RSTFR_offset 0x00         // Reset Flags
#define RSTCTRL_SWRR_offset 0x01          // Software Reset

//*************************************************************************
//** RTC - Real-Time Counter
//*************************************************************************
#define RTC_CTRLA_offset 0x00             // Control A
#define RTC_STATUS_offset 0x01            // Status
#define RTC_INTCTRL_offset 0x02           // Interrupt Control
#define RTC_INTFLAGS_offset 0x03          // Interrupt Flags
#define RTC_TEMP_offset 0x04              // Temporary
#define RTC_DBGCTRL_offset 0x05           // Debug control
#define RTC_CLKSEL_offset 0x07            // Clock Select
#define RTC_CNT_offset 0x08               // Counter
#define RTC_PER_offset 0x0A               // Period
#define RTC_CMP_offset 0x0C               // Compare
#define RTC_PITCTRLA_offset 0x10          // PIT Control A
#define RTC_PITSTATUS_offset 0x11         // PIT Status
#define RTC_PITINTCTRL_offset 0x12        // PIT Interrupt Control
#define RTC_PITINTFLAGS_offset 0x13       // PIT Interrupt Flags
#define RTC_PITDBGCTRL_offset 0x15        // PIT Debug control

//*************************************************************************
//** SIGROW - Signature row
//*************************************************************************
#define SIGROW_DEVICEID0_offset 0x00      // Device ID Byte 0
#define SIGROW_DEVICEID1_offset 0x01      // Device ID Byte 1
#define SIGROW_DEVICEID2_offset 0x02      // Device ID Byte 2
#define SIGROW_SERNUM0_offset 0x03        // Serial Number Byte 0
#define SIGROW_SERNUM1_offset 0x04        // Serial Number Byte 1
#define SIGROW_SERNUM2_offset 0x05        // Serial Number Byte 2
#define SIGROW_SERNUM3_offset 0x06        // Serial Number Byte 3
#define SIGROW_SERNUM4_offset 0x07        // Serial Number Byte 4
#define SIGROW_SERNUM5_offset 0x08        // Serial Number Byte 5
#define SIGROW_SERNUM6_offset 0x09        // Serial Number Byte 6
#define SIGROW_SERNUM7_offset 0x0A        // Serial Number Byte 7
#define SIGROW_SERNUM8_offset 0x0B        // Serial Number Byte 8
#define SIGROW_SERNUM9_offset 0x0C        // Serial Number Byte 9
#define SIGROW_TEMPSENSE0_offset 0x20     // Temperature Sensor Calibration Byte 0
#define SIGROW_TEMPSENSE1_offset 0x21     // Temperature Sensor Calibration Byte 1
#define SIGROW_OSC16ERR3V_offset 0x22     // OSC16 error at 3V
#define SIGROW_OSC16ERR5V_offset 0x23     // OSC16 error at 5V
#define SIGROW_OSC20ERR3V_offset 0x24     // OSC20 error at 3V
#define SIGROW_OSC20ERR5V_offset 0x25     // OSC20 error at 5V

//*************************************************************************
//** SLPCTRL - Sleep Controller
//*************************************************************************
#define SLPCTRL_CTRLA_offset 0x00         // Control

//*************************************************************************
//** SPI - Serial Peripheral Interface
//*************************************************************************
#define SPI_CTRLA_offset 0x00             // Control A
#define SPI_CTRLB_offset 0x01             // Control B
#define SPI_INTCTRL_offset 0x02           // Interrupt Control
#define SPI_INTFLAGS_offset 0x03          // Interrupt Flags
#define SPI_DATA_offset 0x04              // Data

//*************************************************************************
//** SYSCFG - System Configuration Registers
//*************************************************************************
#define SYSCFG_REVID_offset 0x01          // Revision ID
#define SYSCFG_EXTBRK_offset 0x02         // External Break

//*************************************************************************
//** TCA - 16-bit Timer/Counter Type A
//*************************************************************************
#define TCA_SINGLE_CTRLA_offset 0x00      // Control A
#define TCA_SINGLE_CTRLB_offset 0x01      // Control B
#define TCA_SINGLE_CTRLC_offset 0x02      // Control C
#define TCA_SINGLE_CTRLD_offset 0x03      // Control D
#define TCA_SINGLE_CTRLECLR_offset 0x04   // Control E Clear
#define TCA_SINGLE_CTRLESET_offset 0x05   // Control E Set
#define TCA_SINGLE_CTRLFCLR_offset 0x06   // Control F Clear
#define TCA_SINGLE_CTRLFSET_offset 0x07   // Control F Set
#define TCA_SINGLE_EVCTRL_offset 0x09     // Event Control
#define TCA_SINGLE_INTCTRL_offset 0x0A    // Interrupt Control
#define TCA_SINGLE_INTFLAGS_offset 0x0B   // Interrupt Flags
#define TCA_SINGLE_DBGCTRL_offset 0x0E    // Degbug Control
#define TCA_SINGLE_TEMP_offset 0x0F       // Temporary data for 16-bit Access
#define TCA_SINGLE_CNT_offset 0x20        // Count
#define TCA_SINGLE_PER_offset 0x26        // Period
#define TCA_SINGLE_CMP0_offset 0x28       // Compare 0
#define TCA_SINGLE_CMP1_offset 0x2A       // Compare 1
#define TCA_SINGLE_CMP2_offset 0x2C       // Compare 2
#define TCA_SINGLE_PERBUF_offset 0x36     // Period Buffer
#define TCA_SINGLE_CMP0BUF_offset 0x38    // Compare 0 Buffer
#define TCA_SINGLE_CMP1BUF_offset 0x3A    // Compare 1 Buffer
#define TCA_SINGLE_CMP2BUF_offset 0x3C    // Compare 2 Buffer
#define TCA_SPLIT_CTRLA_offset 0x00       // Control A
#define TCA_SPLIT_CTRLB_offset 0x01       // Control B
#define TCA_SPLIT_CTRLC_offset 0x02       // Control C
#define TCA_SPLIT_CTRLD_offset 0x03       // Control D
#define TCA_SPLIT_CTRLECLR_offset 0x04    // Control E Clear
#define TCA_SPLIT_CTRLESET_offset 0x05    // Control E Set
#define TCA_SPLIT_INTCTRL_offset 0x0A     // Interrupt Control
#define TCA_SPLIT_INTFLAGS_offset 0x0B    // Interrupt Flags
#define TCA_SPLIT_DBGCTRL_offset 0x0E     // Degbug Control
#define TCA_SPLIT_LCNT_offset 0x20        // Low Count
#define TCA_SPLIT_HCNT_offset 0x21        // High Count
#define TCA_SPLIT_LPER_offset 0x26        // Low Period
#define TCA_SPLIT_HPER_offset 0x27        // High Period
#define TCA_SPLIT_LCMP0_offset 0x28       // Low Compare
#define TCA_SPLIT_HCMP0_offset 0x29       // High Compare
#define TCA_SPLIT_LCMP1_offset 0x2A       // Low Compare
#define TCA_SPLIT_HCMP1_offset 0x2B       // High Compare
#define TCA_SPLIT_LCMP2_offset 0x2C       // Low Compare
#define TCA_SPLIT_HCMP2_offset 0x2D       // High Compare
#define TCA_SINGLE_offset 0x00            // 
#define TCA_SPLIT_offset 0x00             // 

//*************************************************************************
//** TCB - 16-bit Timer Type B
//*************************************************************************
#define TCB_CTRLA_offset 0x00             // Control A
#define TCB_CTRLB_offset 0x01             // Control Register B
#define TCB_EVCTRL_offset 0x04            // Event Control
#define TCB_INTCTRL_offset 0x05           // Interrupt Control
#define TCB_INTFLAGS_offset 0x06          // Interrupt Flags
#define TCB_STATUS_offset 0x07            // Status
#define TCB_DBGCTRL_offset 0x08           // Debug Control
#define TCB_TEMP_offset 0x09              // Temporary Value
#define TCB_CNT_offset 0x0A               // Count
#define TCB_CCMP_offset 0x0C              // Compare or Capture

//*************************************************************************
//** TCD - Timer Counter D
//*************************************************************************
#define TCD_CTRLA_offset 0x00             // Control A
#define TCD_CTRLB_offset 0x01             // Control B
#define TCD_CTRLC_offset 0x02             // Control C
#define TCD_CTRLD_offset 0x03             // Control D
#define TCD_CTRLE_offset 0x04             // Control E
#define TCD_EVCTRLA_offset 0x08           // EVCTRLA
#define TCD_EVCTRLB_offset 0x09           // EVCTRLB
#define TCD_INTCTRL_offset 0x0C           // Interrupt Control
#define TCD_INTFLAGS_offset 0x0D          // Interrupt Flags
#define TCD_STATUS_offset 0x0E            // Status
#define TCD_INPUTCTRLA_offset 0x10        // Input Control A
#define TCD_INPUTCTRLB_offset 0x11        // Input Control B
#define TCD_FAULTCTRL_offset 0x12         // Fault Control
#define TCD_DLYCTRL_offset 0x14           // Delay Control
#define TCD_DLYVAL_offset 0x15            // Delay value
#define TCD_DITCTRL_offset 0x18           // Dither Control A
#define TCD_DITVAL_offset 0x19            // Dither value
#define TCD_DBGCTRL_offset 0x1E           // Debug Control
#define TCD_CAPTUREA_offset 0x22          // Capture A
#define TCD_CAPTUREB_offset 0x24          // Capture B
#define TCD_CMPASET_offset 0x28           // Compare A Set
#define TCD_CMPACLR_offset 0x2A           // Compare A Clear
#define TCD_CMPBSET_offset 0x2C           // Compare B Set
#define TCD_CMPBCLR_offset 0x2E           // Compare B Clear

//*************************************************************************
//** TWI - Two-Wire Interface
//*************************************************************************
#define TWI_CTRLA_offset 0x00             // Control A
#define TWI_DBGCTRL_offset 0x02           // Debug Control Register
#define TWI_MCTRLA_offset 0x03            // Master Control A
#define TWI_MCTRLB_offset 0x04            // Master Control B
#define TWI_MSTATUS_offset 0x05           // Master Status
#define TWI_MBAUD_offset 0x06             // Master Baurd Rate Control
#define TWI_MADDR_offset 0x07             // Master Address
#define TWI_MDATA_offset 0x08             // Master Data
#define TWI_SCTRLA_offset 0x09            // Slave Control A
#define TWI_SCTRLB_offset 0x0A            // Slave Control B
#define TWI_SSTATUS_offset 0x0B           // Slave Status
#define TWI_SADDR_offset 0x0C             // Slave Address
#define TWI_SDATA_offset 0x0D             // Slave Data
#define TWI_SADDRMASK_offset 0x0E         // Slave Address Mask

//*************************************************************************
//** USART - Universal Synchronous and Asynchronous Receiver and Transmitter
//*************************************************************************
#define USART_RXDATAL_offset 0x00         // Receive Data Low Byte
#define USART_RXDATAH_offset 0x01         // Receive Data High Byte
#define USART_TXDATAL_offset 0x02         // Transmit Data Low Byte
#define USART_TXDATAH_offset 0x03         // Transmit Data High Byte
#define USART_STATUS_offset 0x04          // Status
#define USART_CTRLA_offset 0x05           // Control A
#define USART_CTRLB_offset 0x06           // Control B
#define USART_CTRLC_offset 0x07           // Control C
#define USART_BAUD_offset 0x08            // Baud Rate
#define USART_DBGCTRL_offset 0x0B         // Debug Control
#define USART_EVCTRL_offset 0x0C          // Event Control
#define USART_TXPLCTRL_offset 0x0D        // IRCOM Transmitter Pulse Length Control
#define USART_RXPLCTRL_offset 0x0E        // IRCOM Receiver Pulse Length Control

//*************************************************************************
//** USERROW - User Row
//*************************************************************************
#define USERROW_USERROW0_offset 0x00      // User Row Byte 0
#define USERROW_USERROW1_offset 0x01      // User Row Byte 1
#define USERROW_USERROW2_offset 0x02      // User Row Byte 2
#define USERROW_USERROW3_offset 0x03      // User Row Byte 3
#define USERROW_USERROW4_offset 0x04      // User Row Byte 4
#define USERROW_USERROW5_offset 0x05      // User Row Byte 5
#define USERROW_USERROW6_offset 0x06      // User Row Byte 6
#define USERROW_USERROW7_offset 0x07      // User Row Byte 7
#define USERROW_USERROW8_offset 0x08      // User Row Byte 8
#define USERROW_USERROW9_offset 0x09      // User Row Byte 9
#define USERROW_USERROW10_offset 0x0A     // User Row Byte 10
#define USERROW_USERROW11_offset 0x0B     // User Row Byte 11
#define USERROW_USERROW12_offset 0x0C     // User Row Byte 12
#define USERROW_USERROW13_offset 0x0D     // User Row Byte 13
#define USERROW_USERROW14_offset 0x0E     // User Row Byte 14
#define USERROW_USERROW15_offset 0x0F     // User Row Byte 15
#define USERROW_USERROW16_offset 0x10     // User Row Byte 16
#define USERROW_USERROW17_offset 0x11     // User Row Byte 17
#define USERROW_USERROW18_offset 0x12     // User Row Byte 18
#define USERROW_USERROW19_offset 0x13     // User Row Byte 19
#define USERROW_USERROW20_offset 0x14     // User Row Byte 20
#define USERROW_USERROW21_offset 0x15     // User Row Byte 21
#define USERROW_USERROW22_offset 0x16     // User Row Byte 22
#define USERROW_USERROW23_offset 0x17     // User Row Byte 23
#define USERROW_USERROW24_offset 0x18     // User Row Byte 24
#define USERROW_USERROW25_offset 0x19     // User Row Byte 25
#define USERROW_USERROW26_offset 0x1A     // User Row Byte 26
#define USERROW_USERROW27_offset 0x1B     // User Row Byte 27
#define USERROW_USERROW28_offset 0x1C     // User Row Byte 28
#define USERROW_USERROW29_offset 0x1D     // User Row Byte 29
#define USERROW_USERROW30_offset 0x1E     // User Row Byte 30
#define USERROW_USERROW31_offset 0x1F     // User Row Byte 31

//*************************************************************************
//** VPORT - Virtual Ports
//*************************************************************************
#define VPORT_DIR_offset 0x00             // Data Direction
#define VPORT_OUT_offset 0x01             // Output Value
#define VPORT_IN_offset 0x02              // Input Value
#define VPORT_INTFLAGS_offset 0x03        // Interrupt Flags

//*************************************************************************
//** VREF - Voltage reference
//*************************************************************************
#define VREF_CTRLA_offset 0x00            // Control A
#define VREF_CTRLB_offset 0x01            // Control B
#define VREF_CTRLC_offset 0x02            // Control C
#define VREF_CTRLD_offset 0x03            // Control D

//*************************************************************************
//** WDT - Watch-Dog Timer
//*************************************************************************
#define WDT_CTRLA_offset 0x00             // Control A
#define WDT_STATUS_offset 0x01            // Status


// ***** LOCKBIT REGISTER LOCATIONS ***************************************




// ***** FUSE REGISTER LOCATIONS ******************************************




// ***** BIT AND VALUE DEFINITIONS ****************************************


//*************************************************************************
//** AC - Analog Comparator
//*************************************************************************

// AC_CTRLA masks
#define AC_ENABLE_bm 0x01                 // Enable bit mask
#define AC_ENABLE_bp 0                    // Enable bit position
#define AC_HYSMODE_gm 0x06                // Hysteresis Mode group mask
#define AC_HYSMODE_gp 1                   // Hysteresis Mode group position
#define AC_HYSMODE0_bm (1<<1)             // Hysteresis Mode bit 0 mask
#define AC_HYSMODE0_bp 1                  // Hysteresis Mode bit 0 position
#define AC_HYSMODE1_bm (1<<2)             // Hysteresis Mode bit 1 mask
#define AC_HYSMODE1_bp 2                  // Hysteresis Mode bit 1 position
#define AC_INTMODE_gm 0x30                // Interrupt Mode group mask
#define AC_INTMODE_gp 4                   // Interrupt Mode group position
#define AC_INTMODE0_bm (1<<4)             // Interrupt Mode bit 0 mask
#define AC_INTMODE0_bp 4                  // Interrupt Mode bit 0 position
#define AC_INTMODE1_bm (1<<5)             // Interrupt Mode bit 1 mask
#define AC_INTMODE1_bp 5                  // Interrupt Mode bit 1 position
#define AC_LPMODE_bm 0x08                 // Low Power Mode bit mask
#define AC_LPMODE_bp 3                    // Low Power Mode bit position
#define AC_OUTEN_bm 0x40                  // Output Buffer Enable bit mask
#define AC_OUTEN_bp 6                     // Output Buffer Enable bit position
#define AC_RUNSTDBY_bm 0x80               // Run in Standby Mode bit mask
#define AC_RUNSTDBY_bp 7                  // Run in Standby Mode bit position

// AC_INTCTRL masks
#define AC_CMP_bm 0x01                    // Analog Comparator 0 Interrupt Enable bit mask
#define AC_CMP_bp 0                       // Analog Comparator 0 Interrupt Enable bit position

// AC_MUXCTRLA masks
#define AC_INVERT_bm 0x80                 // Invert AC Output bit mask
#define AC_INVERT_bp 7                    // Invert AC Output bit position
#define AC_MUXNEG_gm 0x03                 // Negative Input MUX Selection group mask
#define AC_MUXNEG_gp 0                    // Negative Input MUX Selection group position
#define AC_MUXNEG0_bm (1<<0)              // Negative Input MUX Selection bit 0 mask
#define AC_MUXNEG0_bp 0                   // Negative Input MUX Selection bit 0 position
#define AC_MUXNEG1_bm (1<<1)              // Negative Input MUX Selection bit 1 mask
#define AC_MUXNEG1_bp 1                   // Negative Input MUX Selection bit 1 position
#define AC_MUXPOS_gm 0x18                 // Positive Input MUX Selection group mask
#define AC_MUXPOS_gp 3                    // Positive Input MUX Selection group position
#define AC_MUXPOS0_bm (1<<3)              // Positive Input MUX Selection bit 0 mask
#define AC_MUXPOS0_bp 3                   // Positive Input MUX Selection bit 0 position
#define AC_MUXPOS1_bm (1<<4)              // Positive Input MUX Selection bit 1 mask
#define AC_MUXPOS1_bp 4                   // Positive Input MUX Selection bit 1 position

// AC_STATUS masks
// Masks for AC_CMP already defined
#define AC_STATE_bm 0x10                  // Analog Comparator State bit mask
#define AC_STATE_bp 4                     // Analog Comparator State bit position

// Hysteresis Mode select
#define AC_HYSMODE_OFF_gc (0x00<<1)       // No hysteresis
#define AC_HYSMODE_10mV_gc (0x01<<1)      // 10mV hysteresis
#define AC_HYSMODE_25mV_gc (0x02<<1)      // 25mV hysteresis
#define AC_HYSMODE_50mV_gc (0x03<<1)      // 50mV hysteresis

// Interrupt Mode select
#define AC_INTMODE_BOTHEDGE_gc (0x00<<4)  // Any Edge
#define AC_INTMODE_NEGEDGE_gc (0x02<<4)   // Negative Edge
#define AC_INTMODE_POSEDGE_gc (0x03<<4)   // Positive Edge

// Low Power Mode select
#define AC_LPMODE_DIS_gc (0x00<<3)        // Low power mode disabled
#define AC_LPMODE_EN_gc (0x01<<3)         // Low power mode enabled

// Negative Input MUX Selection select
#define AC_MUXNEG_PIN0_gc (0x00<<0)       // Negative Pin 0
#define AC_MUXNEG_PIN1_gc (0x01<<0)       // Negative Pin 1
#define AC_MUXNEG_VREF_gc (0x02<<0)       // Voltage Reference
#define AC_MUXNEG_DAC_gc (0x03<<0)        // DAC output

// Positive Input MUX Selection select
#define AC_MUXPOS_PIN0_gc (0x00<<3)       // Positive Pin 0
#define AC_MUXPOS_PIN1_gc (0x01<<3)       // Positive Pin 1
#define AC_MUXPOS_PIN2_gc (0x02<<3)       // Positive Pin 2
#define AC_MUXPOS_PIN3_gc (0x03<<3)       // Positive Pin 3


//*************************************************************************
//** ADC - Analog to Digital Converter
//*************************************************************************

// ADC_CALIB masks
#define ADC_DUTYCYC_bm 0x01               // Duty Cycle bit mask
#define ADC_DUTYCYC_bp 0                  // Duty Cycle bit position

// ADC_COMMAND masks
#define ADC_STCONV_bm 0x01                // Start Conversion Operation bit mask
#define ADC_STCONV_bp 0                   // Start Conversion Operation bit position

// ADC_CTRLA masks
#define ADC_ENABLE_bm 0x01                // ADC Enable bit mask
#define ADC_ENABLE_bp 0                   // ADC Enable bit position
#define ADC_FREERUN_bm 0x02               // ADC Freerun mode bit mask
#define ADC_FREERUN_bp 1                  // ADC Freerun mode bit position
#define ADC_RESSEL_bm 0x04                // ADC Resolution bit mask
#define ADC_RESSEL_bp 2                   // ADC Resolution bit position
#define ADC_RUNSTBY_bm 0x80               // Run standby mode bit mask
#define ADC_RUNSTBY_bp 7                  // Run standby mode bit position

// ADC_CTRLB masks
#define ADC_SAMPNUM_gm 0x07               // Accumulation Samples group mask
#define ADC_SAMPNUM_gp 0                  // Accumulation Samples group position
#define ADC_SAMPNUM0_bm (1<<0)            // Accumulation Samples bit 0 mask
#define ADC_SAMPNUM0_bp 0                 // Accumulation Samples bit 0 position
#define ADC_SAMPNUM1_bm (1<<1)            // Accumulation Samples bit 1 mask
#define ADC_SAMPNUM1_bp 1                 // Accumulation Samples bit 1 position
#define ADC_SAMPNUM2_bm (1<<2)            // Accumulation Samples bit 2 mask
#define ADC_SAMPNUM2_bp 2                 // Accumulation Samples bit 2 position

// ADC_CTRLC masks
#define ADC_PRESC_gm 0x07                 // Clock Pre-scaler group mask
#define ADC_PRESC_gp 0                    // Clock Pre-scaler group position
#define ADC_PRESC0_bm (1<<0)              // Clock Pre-scaler bit 0 mask
#define ADC_PRESC0_bp 0                   // Clock Pre-scaler bit 0 position
#define ADC_PRESC1_bm (1<<1)              // Clock Pre-scaler bit 1 mask
#define ADC_PRESC1_bp 1                   // Clock Pre-scaler bit 1 position
#define ADC_PRESC2_bm (1<<2)              // Clock Pre-scaler bit 2 mask
#define ADC_PRESC2_bp 2                   // Clock Pre-scaler bit 2 position
#define ADC_REFSEL_gm 0x30                // Reference Selection group mask
#define ADC_REFSEL_gp 4                   // Reference Selection group position
#define ADC_REFSEL0_bm (1<<4)             // Reference Selection bit 0 mask
#define ADC_REFSEL0_bp 4                  // Reference Selection bit 0 position
#define ADC_REFSEL1_bm (1<<5)             // Reference Selection bit 1 mask
#define ADC_REFSEL1_bp 5                  // Reference Selection bit 1 position
#define ADC_SAMPCAP_bm 0x40               // Sample Capacitance Selection bit mask
#define ADC_SAMPCAP_bp 6                  // Sample Capacitance Selection bit position

// ADC_CTRLD masks
#define ADC_ASDV_bm 0x10                  // Automatic Sampling Delay Variation bit mask
#define ADC_ASDV_bp 4                     // Automatic Sampling Delay Variation bit position
#define ADC_INITDLY_gm 0xE0               // Initial Delay Selection group mask
#define ADC_INITDLY_gp 5                  // Initial Delay Selection group position
#define ADC_INITDLY0_bm (1<<5)            // Initial Delay Selection bit 0 mask
#define ADC_INITDLY0_bp 5                 // Initial Delay Selection bit 0 position
#define ADC_INITDLY1_bm (1<<6)            // Initial Delay Selection bit 1 mask
#define ADC_INITDLY1_bp 6                 // Initial Delay Selection bit 1 position
#define ADC_INITDLY2_bm (1<<7)            // Initial Delay Selection bit 2 mask
#define ADC_INITDLY2_bp 7                 // Initial Delay Selection bit 2 position
#define ADC_SAMPDLY_gm 0x0F               // Sampling Delay Selection group mask
#define ADC_SAMPDLY_gp 0                  // Sampling Delay Selection group position
#define ADC_SAMPDLY0_bm (1<<0)            // Sampling Delay Selection bit 0 mask
#define ADC_SAMPDLY0_bp 0                 // Sampling Delay Selection bit 0 position
#define ADC_SAMPDLY1_bm (1<<1)            // Sampling Delay Selection bit 1 mask
#define ADC_SAMPDLY1_bp 1                 // Sampling Delay Selection bit 1 position
#define ADC_SAMPDLY2_bm (1<<2)            // Sampling Delay Selection bit 2 mask
#define ADC_SAMPDLY2_bp 2                 // Sampling Delay Selection bit 2 position
#define ADC_SAMPDLY3_bm (1<<3)            // Sampling Delay Selection bit 3 mask
#define ADC_SAMPDLY3_bp 3                 // Sampling Delay Selection bit 3 position

// ADC_CTRLE masks
#define ADC_WINCM_gm 0x07                 // Window Comparator Mode group mask
#define ADC_WINCM_gp 0                    // Window Comparator Mode group position
#define ADC_WINCM0_bm (1<<0)              // Window Comparator Mode bit 0 mask
#define ADC_WINCM0_bp 0                   // Window Comparator Mode bit 0 position
#define ADC_WINCM1_bm (1<<1)              // Window Comparator Mode bit 1 mask
#define ADC_WINCM1_bp 1                   // Window Comparator Mode bit 1 position
#define ADC_WINCM2_bm (1<<2)              // Window Comparator Mode bit 2 mask
#define ADC_WINCM2_bp 2                   // Window Comparator Mode bit 2 position

// ADC_DBGCTRL masks
#define ADC_DBGRUN_bm 0x01                // Debug run bit mask
#define ADC_DBGRUN_bp 0                   // Debug run bit position

// ADC_EVCTRL masks
#define ADC_STARTEI_bm 0x01               // Start Event Input Enable bit mask
#define ADC_STARTEI_bp 0                  // Start Event Input Enable bit position

// ADC_INTCTRL masks
#define ADC_RESRDY_bm 0x01                // Result Ready Interrupt Enable bit mask
#define ADC_RESRDY_bp 0                   // Result Ready Interrupt Enable bit position
#define ADC_WCMP_bm 0x02                  // Window Comparator Interrupt Enable bit mask
#define ADC_WCMP_bp 1                     // Window Comparator Interrupt Enable bit position

// ADC_INTFLAGS masks
// Masks for ADC_RESRDY already defined
// Masks for ADC_WCMP already defined

// ADC_MUXPOS masks
#define ADC_MUXPOS_gm 0x1F                // Analog Channel Selection Bits group mask
#define ADC_MUXPOS_gp 0                   // Analog Channel Selection Bits group position
#define ADC_MUXPOS0_bm (1<<0)             // Analog Channel Selection Bits bit 0 mask
#define ADC_MUXPOS0_bp 0                  // Analog Channel Selection Bits bit 0 position
#define ADC_MUXPOS1_bm (1<<1)             // Analog Channel Selection Bits bit 1 mask
#define ADC_MUXPOS1_bp 1                  // Analog Channel Selection Bits bit 1 position
#define ADC_MUXPOS2_bm (1<<2)             // Analog Channel Selection Bits bit 2 mask
#define ADC_MUXPOS2_bp 2                  // Analog Channel Selection Bits bit 2 position
#define ADC_MUXPOS3_bm (1<<3)             // Analog Channel Selection Bits bit 3 mask
#define ADC_MUXPOS3_bp 3                  // Analog Channel Selection Bits bit 3 position
#define ADC_MUXPOS4_bm (1<<4)             // Analog Channel Selection Bits bit 4 mask
#define ADC_MUXPOS4_bp 4                  // Analog Channel Selection Bits bit 4 position

// ADC_SAMPCTRL masks
#define ADC_SAMPLEN_gm 0x1F               // Sample lenght group mask
#define ADC_SAMPLEN_gp 0                  // Sample lenght group position
#define ADC_SAMPLEN0_bm (1<<0)            // Sample lenght bit 0 mask
#define ADC_SAMPLEN0_bp 0                 // Sample lenght bit 0 position
#define ADC_SAMPLEN1_bm (1<<1)            // Sample lenght bit 1 mask
#define ADC_SAMPLEN1_bp 1                 // Sample lenght bit 1 position
#define ADC_SAMPLEN2_bm (1<<2)            // Sample lenght bit 2 mask
#define ADC_SAMPLEN2_bp 2                 // Sample lenght bit 2 position
#define ADC_SAMPLEN3_bm (1<<3)            // Sample lenght bit 3 mask
#define ADC_SAMPLEN3_bp 3                 // Sample lenght bit 3 position
#define ADC_SAMPLEN4_bm (1<<4)            // Sample lenght bit 4 mask
#define ADC_SAMPLEN4_bp 4                 // Sample lenght bit 4 position

// ADC_TEMP masks
#define ADC_TEMP_gm 0xFF                  // Temporary group mask
#define ADC_TEMP_gp 0                     // Temporary group position
#define ADC_TEMP0_bm (1<<0)               // Temporary bit 0 mask
#define ADC_TEMP0_bp 0                    // Temporary bit 0 position
#define ADC_TEMP1_bm (1<<1)               // Temporary bit 1 mask
#define ADC_TEMP1_bp 1                    // Temporary bit 1 position
#define ADC_TEMP2_bm (1<<2)               // Temporary bit 2 mask
#define ADC_TEMP2_bp 2                    // Temporary bit 2 position
#define ADC_TEMP3_bm (1<<3)               // Temporary bit 3 mask
#define ADC_TEMP3_bp 3                    // Temporary bit 3 position
#define ADC_TEMP4_bm (1<<4)               // Temporary bit 4 mask
#define ADC_TEMP4_bp 4                    // Temporary bit 4 position
#define ADC_TEMP5_bm (1<<5)               // Temporary bit 5 mask
#define ADC_TEMP5_bp 5                    // Temporary bit 5 position
#define ADC_TEMP6_bm (1<<6)               // Temporary bit 6 mask
#define ADC_TEMP6_bp 6                    // Temporary bit 6 position
#define ADC_TEMP7_bm (1<<7)               // Temporary bit 7 mask
#define ADC_TEMP7_bp 7                    // Temporary bit 7 position

// Duty Cycle select
#define ADC_DUTYCYC_DUTY50_gc (0x00<<0)   // 50% Duty cycle
#define ADC_DUTYCYC_DUTY25_gc (0x01<<0)   // 25% Duty cycle

// ADC Resolution select
#define ADC_RESSEL_10BIT_gc (0x00<<2)     // 10-bit mode
#define ADC_RESSEL_8BIT_gc (0x01<<2)      // 8-bit mode

// Accumulation Samples select
#define ADC_SAMPNUM_ACC1_gc (0x00<<0)     // 1 ADC sample
#define ADC_SAMPNUM_ACC2_gc (0x01<<0)     // Accumulate 2 samples
#define ADC_SAMPNUM_ACC4_gc (0x02<<0)     // Accumulate 4 samples
#define ADC_SAMPNUM_ACC8_gc (0x03<<0)     // Accumulate 8 samples
#define ADC_SAMPNUM_ACC16_gc (0x04<<0)    // Accumulate 16 samples
#define ADC_SAMPNUM_ACC32_gc (0x05<<0)    // Accumulate 32 samples
#define ADC_SAMPNUM_ACC64_gc (0x06<<0)    // Accumulate 64 samples

// Clock Pre-scaler select
#define ADC_PRESC_DIV2_gc (0x00<<0)       // CLK_PER divided by 2
#define ADC_PRESC_DIV4_gc (0x01<<0)       // CLK_PER divided by 4
#define ADC_PRESC_DIV8_gc (0x02<<0)       // CLK_PER divided by 8
#define ADC_PRESC_DIV16_gc (0x03<<0)      // CLK_PER divided by 16
#define ADC_PRESC_DIV32_gc (0x04<<0)      // CLK_PER divided by 32
#define ADC_PRESC_DIV64_gc (0x05<<0)      // CLK_PER divided by 64
#define ADC_PRESC_DIV128_gc (0x06<<0)     // CLK_PER divided by 128
#define ADC_PRESC_DIV256_gc (0x07<<0)     // CLK_PER divided by 256

// Reference Selection select
#define ADC_REFSEL_INTREF_gc (0x00<<4)    // Internal reference
#define ADC_REFSEL_VDDREF_gc (0x01<<4)    // VDD
#define ADC_REFSEL_VREFA_gc (0x02<<4)     // External reference

// Automatic Sampling Delay Variation select
#define ADC_ASDV_ASVOFF_gc (0x00<<4)      // The Automatic Sampling Delay Variation is disabled
#define ADC_ASDV_ASVON_gc (0x01<<4)       // The Automatic Sampling Delay Variation is enabled

// Initial Delay Selection select
#define ADC_INITDLY_DLY0_gc (0x00<<5)     // Delay 0 CLK_ADC cycles
#define ADC_INITDLY_DLY16_gc (0x01<<5)    // Delay 16 CLK_ADC cycles
#define ADC_INITDLY_DLY32_gc (0x02<<5)    // Delay 32 CLK_ADC cycles
#define ADC_INITDLY_DLY64_gc (0x03<<5)    // Delay 64 CLK_ADC cycles
#define ADC_INITDLY_DLY128_gc (0x04<<5)   // Delay 128 CLK_ADC cycles
#define ADC_INITDLY_DLY256_gc (0x05<<5)   // Delay 256 CLK_ADC cycles

// Window Comparator Mode select
#define ADC_WINCM_NONE_gc (0x00<<0)       // No Window Comparison
#define ADC_WINCM_BELOW_gc (0x01<<0)      // Below Window
#define ADC_WINCM_ABOVE_gc (0x02<<0)      // Above Window
#define ADC_WINCM_INSIDE_gc (0x03<<0)     // Inside Window
#define ADC_WINCM_OUTSIDE_gc (0x04<<0)    // Outside Window

// Analog Channel Selection Bits select
#define ADC_MUXPOS_AIN0_gc (0x00<<0)      // ADC input pin 0
#define ADC_MUXPOS_AIN1_gc (0x01<<0)      // ADC input pin 1
#define ADC_MUXPOS_AIN2_gc (0x02<<0)      // ADC input pin 2
#define ADC_MUXPOS_AIN3_gc (0x03<<0)      // ADC input pin 3
#define ADC_MUXPOS_AIN4_gc (0x04<<0)      // ADC input pin 4
#define ADC_MUXPOS_AIN5_gc (0x05<<0)      // ADC input pin 5
#define ADC_MUXPOS_AIN6_gc (0x06<<0)      // ADC input pin 6
#define ADC_MUXPOS_AIN7_gc (0x07<<0)      // ADC input pin 7
#define ADC_MUXPOS_AIN8_gc (0x08<<0)      // ADC input pin 8
#define ADC_MUXPOS_AIN9_gc (0x09<<0)      // ADC input pin 9
#define ADC_MUXPOS_AIN10_gc (0x0A<<0)     // ADC input pin 10
#define ADC_MUXPOS_AIN11_gc (0x0B<<0)     // ADC input pin 11
#define ADC_MUXPOS_PTC_gc (0x1B<<0)       // PTC/DAC2
#define ADC_MUXPOS_DAC0_gc (0x1C<<0)      // DAC0/DAC0
#define ADC_MUXPOS_INTREF_gc (0x1D<<0)    // Internal Ref
#define ADC_MUXPOS_TEMPSENSE_gc (0x1E<<0) // Temp sensor/DAC1
#define ADC_MUXPOS_GND_gc (0x1F<<0)       // GND


//*************************************************************************
//** BOD - Bod interface
//*************************************************************************

// BOD_CTRLA masks
#define BOD_ACTIVE_gm 0x0C                // Operation in active mode group mask
#define BOD_ACTIVE_gp 2                   // Operation in active mode group position
#define BOD_ACTIVE0_bm (1<<2)             // Operation in active mode bit 0 mask
#define BOD_ACTIVE0_bp 2                  // Operation in active mode bit 0 position
#define BOD_ACTIVE1_bm (1<<3)             // Operation in active mode bit 1 mask
#define BOD_ACTIVE1_bp 3                  // Operation in active mode bit 1 position
#define BOD_SAMPFREQ_bm 0x10              // Sample frequency bit mask
#define BOD_SAMPFREQ_bp 4                 // Sample frequency bit position
#define BOD_SLEEP_gm 0x03                 // Operation in sleep mode group mask
#define BOD_SLEEP_gp 0                    // Operation in sleep mode group position
#define BOD_SLEEP0_bm (1<<0)              // Operation in sleep mode bit 0 mask
#define BOD_SLEEP0_bp 0                   // Operation in sleep mode bit 0 position
#define BOD_SLEEP1_bm (1<<1)              // Operation in sleep mode bit 1 mask
#define BOD_SLEEP1_bp 1                   // Operation in sleep mode bit 1 position

// BOD_CTRLB masks
#define BOD_LVL_gm 0x07                   // Bod level group mask
#define BOD_LVL_gp 0                      // Bod level group position
#define BOD_LVL0_bm (1<<0)                // Bod level bit 0 mask
#define BOD_LVL0_bp 0                     // Bod level bit 0 position
#define BOD_LVL1_bm (1<<1)                // Bod level bit 1 mask
#define BOD_LVL1_bp 1                     // Bod level bit 1 position
#define BOD_LVL2_bm (1<<2)                // Bod level bit 2 mask
#define BOD_LVL2_bp 2                     // Bod level bit 2 position

// BOD_INTCTRL masks
#define BOD_VLMCFG_gm 0x06                // Configuration group mask
#define BOD_VLMCFG_gp 1                   // Configuration group position
#define BOD_VLMCFG0_bm (1<<1)             // Configuration bit 0 mask
#define BOD_VLMCFG0_bp 1                  // Configuration bit 0 position
#define BOD_VLMCFG1_bm (1<<2)             // Configuration bit 1 mask
#define BOD_VLMCFG1_bp 2                  // Configuration bit 1 position
#define BOD_VLMIE_bm 0x01                 // voltage level monitor interrrupt enable bit mask
#define BOD_VLMIE_bp 0                    // voltage level monitor interrrupt enable bit position

// BOD_INTFLAGS masks
#define BOD_VLMIF_bm 0x01                 // Voltage level monitor interrupt flag bit mask
#define BOD_VLMIF_bp 0                    // Voltage level monitor interrupt flag bit position

// BOD_STATUS masks
#define BOD_VLMS_bm 0x01                  // Voltage level monitor status bit mask
#define BOD_VLMS_bp 0                     // Voltage level monitor status bit position

// BOD_VLMCTRLA masks
#define BOD_VLMLVL_gm 0x03                // voltage level monitor level group mask
#define BOD_VLMLVL_gp 0                   // voltage level monitor level group position
#define BOD_VLMLVL0_bm (1<<0)             // voltage level monitor level bit 0 mask
#define BOD_VLMLVL0_bp 0                  // voltage level monitor level bit 0 position
#define BOD_VLMLVL1_bm (1<<1)             // voltage level monitor level bit 1 mask
#define BOD_VLMLVL1_bp 1                  // voltage level monitor level bit 1 position

// Operation in active mode select
#define BOD_ACTIVE_DIS_gc (0x00<<2)       // Disabled
#define BOD_ACTIVE_ENABLED_gc (0x01<<2)   // Enabled
#define BOD_ACTIVE_SAMPLED_gc (0x02<<2)   // Sampled
#define BOD_ACTIVE_ENWAKE_gc (0x03<<2)    // Enabled with wake-up halted until BOD is ready

// Sample frequency select
#define BOD_SAMPFREQ_1KHZ_gc (0x00<<4)    // 1kHz sampling frequency
#define BOD_SAMPFREQ_125HZ_gc (0x01<<4)   // 125kHz sampling frequency

// Operation in sleep mode select
#define BOD_SLEEP_DIS_gc (0x00<<0)        // Disabled
#define BOD_SLEEP_ENABLED_gc (0x01<<0)    // Enabled
#define BOD_SLEEP_SAMPLED_gc (0x02<<0)    // Sampled

// Bod level select
#define BOD_LVL_BODLEVEL0_gc (0x00<<0)    // 1.8 V
#define BOD_LVL_BODLEVEL1_gc (0x01<<0)    // 2.1 V
#define BOD_LVL_BODLEVEL2_gc (0x02<<0)    // 2.6 V
#define BOD_LVL_BODLEVEL3_gc (0x03<<0)    // 2.9 V
#define BOD_LVL_BODLEVEL4_gc (0x04<<0)    // 3.3 V
#define BOD_LVL_BODLEVEL5_gc (0x05<<0)    // 3.7 V
#define BOD_LVL_BODLEVEL6_gc (0x06<<0)    // 4.0 V
#define BOD_LVL_BODLEVEL7_gc (0x07<<0)    // 4.2 V

// Configuration select
#define BOD_VLMCFG_BELOW_gc (0x00<<1)     // Interrupt when supply goes below VLM level
#define BOD_VLMCFG_ABOVE_gc (0x01<<1)     // Interrupt when supply goes above VLM level
#define BOD_VLMCFG_CROSS_gc (0x02<<1)     // Interrupt when supply crosses VLM level

// voltage level monitor level select
#define BOD_VLMLVL_5ABOVE_gc (0x00<<0)    // VLM threshold 5% above BOD level
#define BOD_VLMLVL_15ABOVE_gc (0x01<<0)   // VLM threshold 15% above BOD level
#define BOD_VLMLVL_25ABOVE_gc (0x02<<0)   // VLM threshold 25% above BOD level


//*************************************************************************
//** CCL - Configurable Custom Logic
//*************************************************************************

// CCL_CTRLA masks
#define CCL_ENABLE_bm 0x01                // Enable bit mask
#define CCL_ENABLE_bp 0                   // Enable bit position
#define CCL_RUNSTDBY_bm 0x40              // Run in Standby bit mask
#define CCL_RUNSTDBY_bp 6                 // Run in Standby bit position

// CCL_LUT0CTRLA masks
#define CCL_CLKSRC_bm 0x40                // Clock Source Selection bit mask
#define CCL_CLKSRC_bp 6                   // Clock Source Selection bit position
#define CCL_EDGEDET_bm 0x80               // Edge Detection Enable bit mask
#define CCL_EDGEDET_bp 7                  // Edge Detection Enable bit position
// Masks for CCL_ENABLE already defined
#define CCL_FILTSEL_gm 0x30               // Filter Selection group mask
#define CCL_FILTSEL_gp 4                  // Filter Selection group position
#define CCL_FILTSEL0_bm (1<<4)            // Filter Selection bit 0 mask
#define CCL_FILTSEL0_bp 4                 // Filter Selection bit 0 position
#define CCL_FILTSEL1_bm (1<<5)            // Filter Selection bit 1 mask
#define CCL_FILTSEL1_bp 5                 // Filter Selection bit 1 position
#define CCL_OUTEN_bm 0x08                 // Output Enable bit mask
#define CCL_OUTEN_bp 3                    // Output Enable bit position

// CCL_LUT0CTRLB masks
#define CCL_INSEL0_gm 0x0F                // LUT Input 0 Source Selection group mask
#define CCL_INSEL0_gp 0                   // LUT Input 0 Source Selection group position
#define CCL_INSEL00_bm (1<<0)             // LUT Input 0 Source Selection bit 0 mask
#define CCL_INSEL00_bp 0                  // LUT Input 0 Source Selection bit 0 position
#define CCL_INSEL01_bm (1<<1)             // LUT Input 0 Source Selection bit 1 mask
#define CCL_INSEL01_bp 1                  // LUT Input 0 Source Selection bit 1 position
#define CCL_INSEL02_bm (1<<2)             // LUT Input 0 Source Selection bit 2 mask
#define CCL_INSEL02_bp 2                  // LUT Input 0 Source Selection bit 2 position
#define CCL_INSEL03_bm (1<<3)             // LUT Input 0 Source Selection bit 3 mask
#define CCL_INSEL03_bp 3                  // LUT Input 0 Source Selection bit 3 position
#define CCL_INSEL1_gm 0xF0                // LUT Input 1 Source Selection group mask
#define CCL_INSEL1_gp 4                   // LUT Input 1 Source Selection group position
#define CCL_INSEL10_bm (1<<4)             // LUT Input 1 Source Selection bit 0 mask
#define CCL_INSEL10_bp 4                  // LUT Input 1 Source Selection bit 0 position
#define CCL_INSEL11_bm (1<<5)             // LUT Input 1 Source Selection bit 1 mask
#define CCL_INSEL11_bp 5                  // LUT Input 1 Source Selection bit 1 position
#define CCL_INSEL12_bm (1<<6)             // LUT Input 1 Source Selection bit 2 mask
#define CCL_INSEL12_bp 6                  // LUT Input 1 Source Selection bit 2 position
#define CCL_INSEL13_bm (1<<7)             // LUT Input 1 Source Selection bit 3 mask
#define CCL_INSEL13_bp 7                  // LUT Input 1 Source Selection bit 3 position

// CCL_LUT0CTRLC masks
#define CCL_INSEL2_gm 0x0F                // LUT Input 2 Source Selection group mask
#define CCL_INSEL2_gp 0                   // LUT Input 2 Source Selection group position
#define CCL_INSEL20_bm (1<<0)             // LUT Input 2 Source Selection bit 0 mask
#define CCL_INSEL20_bp 0                  // LUT Input 2 Source Selection bit 0 position
#define CCL_INSEL21_bm (1<<1)             // LUT Input 2 Source Selection bit 1 mask
#define CCL_INSEL21_bp 1                  // LUT Input 2 Source Selection bit 1 position
#define CCL_INSEL22_bm (1<<2)             // LUT Input 2 Source Selection bit 2 mask
#define CCL_INSEL22_bp 2                  // LUT Input 2 Source Selection bit 2 position
#define CCL_INSEL23_bm (1<<3)             // LUT Input 2 Source Selection bit 3 mask
#define CCL_INSEL23_bp 3                  // LUT Input 2 Source Selection bit 3 position

// CCL_LUT1CTRLA masks
// Masks for CCL_CLKSRC already defined
// Masks for CCL_EDGEDET already defined
// Masks for CCL_ENABLE already defined
// Masks for CCL_FILTSEL already defined
// Masks for CCL_OUTEN already defined

// CCL_LUT1CTRLB masks
// Masks for CCL_INSEL0 already defined
// Masks for CCL_INSEL1 already defined

// CCL_LUT1CTRLC masks
// Masks for CCL_INSEL2 already defined

// CCL_SEQCTRL0 masks
#define CCL_SEQSEL_gm 0x07                // Sequential Selection group mask
#define CCL_SEQSEL_gp 0                   // Sequential Selection group position
#define CCL_SEQSEL0_bm (1<<0)             // Sequential Selection bit 0 mask
#define CCL_SEQSEL0_bp 0                  // Sequential Selection bit 0 position
#define CCL_SEQSEL1_bm (1<<1)             // Sequential Selection bit 1 mask
#define CCL_SEQSEL1_bp 1                  // Sequential Selection bit 1 position
#define CCL_SEQSEL2_bm (1<<2)             // Sequential Selection bit 2 mask
#define CCL_SEQSEL2_bp 2                  // Sequential Selection bit 2 position

// Edge Detection Enable select
#define CCL_EDGEDET_DIS_gc (0x00<<7)      // Edge detector is disabled
#define CCL_EDGEDET_EN_gc (0x01<<7)       // Edge detector is enabled

// Filter Selection select
#define CCL_FILTSEL_DISABLE_gc (0x00<<4)  // Filter disabled
#define CCL_FILTSEL_SYNCH_gc (0x01<<4)    // Synchronizer enabled
#define CCL_FILTSEL_FILTER_gc (0x02<<4)   // Filter enabled

// LUT Input 0 Source Selection select
#define CCL_INSEL0_MASK_gc (0x00<<0)      // Masked input
#define CCL_INSEL0_FEEDBACK_gc (0x01<<0)  // Feedback input source
#define CCL_INSEL0_LINK_gc (0x02<<0)      // Linked LUT input source
#define CCL_INSEL0_EVENT0_gc (0x03<<0)    // Event input source 0
#define CCL_INSEL0_EVENT1_gc (0x04<<0)    // Event input source 1
#define CCL_INSEL0_IO_gc (0x05<<0)        // IO pin LUTn-IN0 input source
#define CCL_INSEL0_AC0_gc (0x06<<0)       // AC0 OUT input source
#define CCL_INSEL0_TCB0_gc (0x07<<0)      // TCB0 WO input source
#define CCL_INSEL0_TCA0_gc (0x08<<0)      // TCA0 WO0 input source
#define CCL_INSEL0_TCD0_gc (0x09<<0)      // TCD0 WOA input source
#define CCL_INSEL0_USART0_gc (0x0A<<0)    // USART0 XCK input source
#define CCL_INSEL0_SPI0_gc (0x0B<<0)      // SPI0 SCK source

// LUT Input 1 Source Selection select
#define CCL_INSEL1_MASK_gc (0x00<<4)      // Masked input
#define CCL_INSEL1_FEEDBACK_gc (0x01<<4)  // Feedback input source
#define CCL_INSEL1_LINK_gc (0x02<<4)      // Linked LUT input source
#define CCL_INSEL1_EVENT0_gc (0x03<<4)    // Event input source 0
#define CCL_INSEL1_EVENT1_gc (0x04<<4)    // Event input source 1
#define CCL_INSEL1_IO_gc (0x05<<4)        // IO pin LUTn-N1 input source
#define CCL_INSEL1_AC0_gc (0x06<<4)       // AC0 OUT input source
#define CCL_INSEL1_TCB0_gc (0x07<<4)      // TCB0 WO input source
#define CCL_INSEL1_TCA0_gc (0x08<<4)      // TCA0 WO1 input source
#define CCL_INSEL1_TCD0_gc (0x09<<4)      // TCD0 WOB input source
#define CCL_INSEL1_USART0_gc (0x0A<<4)    // USART0 TXD input source
#define CCL_INSEL1_SPI0_gc (0x0B<<4)      // SPI0 MOSI input source

// LUT Input 2 Source Selection select
#define CCL_INSEL2_MASK_gc (0x00<<0)      // Masked input
#define CCL_INSEL2_FEEDBACK_gc (0x01<<0)  // Feedback input source
#define CCL_INSEL2_LINK_gc (0x02<<0)      // Linked LUT input source
#define CCL_INSEL2_EVENT0_gc (0x03<<0)    // Event input source 0
#define CCL_INSEL2_EVENT1_gc (0x04<<0)    // Event input source 1
#define CCL_INSEL2_IO_gc (0x05<<0)        // IO pin LUTn-IN2 input source
#define CCL_INSEL2_AC0_gc (0x06<<0)       // AC0 OUT input source
#define CCL_INSEL2_TCB0_gc (0x07<<0)      // TCB0 WO input source
#define CCL_INSEL2_TCA0_gc (0x08<<0)      // TCA0 WO2 input source
#define CCL_INSEL2_TCD0_gc (0x09<<0)      // TCD0 WOA input source
#define CCL_INSEL2_SPI0_gc (0x0B<<0)      // SPI0 MISO source

// Sequential Selection select
#define CCL_SEQSEL_DISABLE_gc (0x00<<0)   // Sequential logic disabled
#define CCL_SEQSEL_DFF_gc (0x01<<0)       // D FlipFlop
#define CCL_SEQSEL_JK_gc (0x02<<0)        // JK FlipFlop
#define CCL_SEQSEL_LATCH_gc (0x03<<0)     // D Latch
#define CCL_SEQSEL_RS_gc (0x04<<0)        // RS Latch


//*************************************************************************
//** CLKCTRL - Clock controller
//*************************************************************************

// CLKCTRL_MCLKCTRLA masks
#define CLKCTRL_CLKOUT_bm 0x80            // System clock out bit mask
#define CLKCTRL_CLKOUT_bp 7               // System clock out bit position
#define CLKCTRL_CLKSEL_gm 0x03            // clock select group mask
#define CLKCTRL_CLKSEL_gp 0               // clock select group position
#define CLKCTRL_CLKSEL0_bm (1<<0)         // clock select bit 0 mask
#define CLKCTRL_CLKSEL0_bp 0              // clock select bit 0 position
#define CLKCTRL_CLKSEL1_bm (1<<1)         // clock select bit 1 mask
#define CLKCTRL_CLKSEL1_bp 1              // clock select bit 1 position

// CLKCTRL_MCLKCTRLB masks
#define CLKCTRL_PDIV_gm 0x1E              // Prescaler division group mask
#define CLKCTRL_PDIV_gp 1                 // Prescaler division group position
#define CLKCTRL_PDIV0_bm (1<<1)           // Prescaler division bit 0 mask
#define CLKCTRL_PDIV0_bp 1                // Prescaler division bit 0 position
#define CLKCTRL_PDIV1_bm (1<<2)           // Prescaler division bit 1 mask
#define CLKCTRL_PDIV1_bp 2                // Prescaler division bit 1 position
#define CLKCTRL_PDIV2_bm (1<<3)           // Prescaler division bit 2 mask
#define CLKCTRL_PDIV2_bp 3                // Prescaler division bit 2 position
#define CLKCTRL_PDIV3_bm (1<<4)           // Prescaler division bit 3 mask
#define CLKCTRL_PDIV3_bp 4                // Prescaler division bit 3 position
#define CLKCTRL_PEN_bm 0x01               // Prescaler enable bit mask
#define CLKCTRL_PEN_bp 0                  // Prescaler enable bit position

// CLKCTRL_MCLKLOCK masks
#define CLKCTRL_LOCKEN_bm 0x01            // lock ebable bit mask
#define CLKCTRL_LOCKEN_bp 0               // lock ebable bit position

// CLKCTRL_MCLKSTATUS masks
#define CLKCTRL_EXTS_bm 0x80              // External Clock status bit mask
#define CLKCTRL_EXTS_bp 7                 // External Clock status bit position
#define CLKCTRL_OSC20MS_bm 0x10           // 20MHz oscillator status bit mask
#define CLKCTRL_OSC20MS_bp 4              // 20MHz oscillator status bit position
#define CLKCTRL_OSC32KS_bm 0x20           // 32KHz oscillator status bit mask
#define CLKCTRL_OSC32KS_bp 5              // 32KHz oscillator status bit position
#define CLKCTRL_SOSC_bm 0x01              // System Oscillator changing bit mask
#define CLKCTRL_SOSC_bp 0                 // System Oscillator changing bit position
#define CLKCTRL_XOSC32KS_bm 0x40          // 32.768 kHz Crystal Oscillator status bit mask
#define CLKCTRL_XOSC32KS_bp 6             // 32.768 kHz Crystal Oscillator status bit position

// CLKCTRL_OSC20MCALIBA masks
#define CLKCTRL_CALSEL20M_gm 0xC0         // Calibration freq select group mask
#define CLKCTRL_CALSEL20M_gp 6            // Calibration freq select group position
#define CLKCTRL_CALSEL20M0_bm (1<<6)      // Calibration freq select bit 0 mask
#define CLKCTRL_CALSEL20M0_bp 6           // Calibration freq select bit 0 position
#define CLKCTRL_CALSEL20M1_bm (1<<7)      // Calibration freq select bit 1 mask
#define CLKCTRL_CALSEL20M1_bp 7           // Calibration freq select bit 1 position
#define CLKCTRL_CAL20M_gm 0x3F            // Calibration group mask
#define CLKCTRL_CAL20M_gp 0               // Calibration group position
#define CLKCTRL_CAL20M0_bm (1<<0)         // Calibration bit 0 mask
#define CLKCTRL_CAL20M0_bp 0              // Calibration bit 0 position
#define CLKCTRL_CAL20M1_bm (1<<1)         // Calibration bit 1 mask
#define CLKCTRL_CAL20M1_bp 1              // Calibration bit 1 position
#define CLKCTRL_CAL20M2_bm (1<<2)         // Calibration bit 2 mask
#define CLKCTRL_CAL20M2_bp 2              // Calibration bit 2 position
#define CLKCTRL_CAL20M3_bm (1<<3)         // Calibration bit 3 mask
#define CLKCTRL_CAL20M3_bp 3              // Calibration bit 3 position
#define CLKCTRL_CAL20M4_bm (1<<4)         // Calibration bit 4 mask
#define CLKCTRL_CAL20M4_bp 4              // Calibration bit 4 position
#define CLKCTRL_CAL20M5_bm (1<<5)         // Calibration bit 5 mask
#define CLKCTRL_CAL20M5_bp 5              // Calibration bit 5 position

// CLKCTRL_OSC20MCALIBB masks
#define CLKCTRL_LOCK_bm 0x80              // Lock bit mask
#define CLKCTRL_LOCK_bp 7                 // Lock bit position
#define CLKCTRL_TEMPCAL20M_gm 0x0F        // Oscillator temperature coefficient group mask
#define CLKCTRL_TEMPCAL20M_gp 0           // Oscillator temperature coefficient group position
#define CLKCTRL_TEMPCAL20M0_bm (1<<0)     // Oscillator temperature coefficient bit 0 mask
#define CLKCTRL_TEMPCAL20M0_bp 0          // Oscillator temperature coefficient bit 0 position
#define CLKCTRL_TEMPCAL20M1_bm (1<<1)     // Oscillator temperature coefficient bit 1 mask
#define CLKCTRL_TEMPCAL20M1_bp 1          // Oscillator temperature coefficient bit 1 position
#define CLKCTRL_TEMPCAL20M2_bm (1<<2)     // Oscillator temperature coefficient bit 2 mask
#define CLKCTRL_TEMPCAL20M2_bp 2          // Oscillator temperature coefficient bit 2 position
#define CLKCTRL_TEMPCAL20M3_bm (1<<3)     // Oscillator temperature coefficient bit 3 mask
#define CLKCTRL_TEMPCAL20M3_bp 3          // Oscillator temperature coefficient bit 3 position

// CLKCTRL_OSC20MCTRLA masks
#define CLKCTRL_RUNSTDBY_bm 0x02          // Run standby bit mask
#define CLKCTRL_RUNSTDBY_bp 1             // Run standby bit position

// CLKCTRL_OSC32KCTRLA masks
// Masks for CLKCTRL_RUNSTDBY already defined

// CLKCTRL_XOSC32KCTRLA masks
#define CLKCTRL_CSUT_gm 0x30              // Crystal startup time group mask
#define CLKCTRL_CSUT_gp 4                 // Crystal startup time group position
#define CLKCTRL_CSUT0_bm (1<<4)           // Crystal startup time bit 0 mask
#define CLKCTRL_CSUT0_bp 4                // Crystal startup time bit 0 position
#define CLKCTRL_CSUT1_bm (1<<5)           // Crystal startup time bit 1 mask
#define CLKCTRL_CSUT1_bp 5                // Crystal startup time bit 1 position
#define CLKCTRL_ENABLE_bm 0x01            // Enable bit mask
#define CLKCTRL_ENABLE_bp 0               // Enable bit position
// Masks for CLKCTRL_RUNSTDBY already defined
#define CLKCTRL_SEL_bm 0x04               // Select bit mask
#define CLKCTRL_SEL_bp 2                  // Select bit position

// clock select select
#define CLKCTRL_CLKSEL_OSC20M_gc (0x00<<0) // 20MHz internal oscillator
#define CLKCTRL_CLKSEL_OSCULP32K_gc (0x01<<0) // 32KHz internal Ultra Low Power oscillator
#define CLKCTRL_CLKSEL_XOSC32K_gc (0x02<<0) // 32.768kHz external crystal oscillator
#define CLKCTRL_CLKSEL_EXTCLK_gc (0x03<<0) // External clock

// Prescaler division select
#define CLKCTRL_PDIV_2X_gc (0x00<<1)      // 2X
#define CLKCTRL_PDIV_4X_gc (0x01<<1)      // 4X
#define CLKCTRL_PDIV_8X_gc (0x02<<1)      // 8X
#define CLKCTRL_PDIV_16X_gc (0x03<<1)     // 16X
#define CLKCTRL_PDIV_32X_gc (0x04<<1)     // 32X
#define CLKCTRL_PDIV_64X_gc (0x05<<1)     // 64X
#define CLKCTRL_PDIV_6X_gc (0x08<<1)      // 6X
#define CLKCTRL_PDIV_10X_gc (0x09<<1)     // 10X
#define CLKCTRL_PDIV_12X_gc (0x0A<<1)     // 12X
#define CLKCTRL_PDIV_24X_gc (0x0B<<1)     // 24X
#define CLKCTRL_PDIV_48X_gc (0x0C<<1)     // 48X

// Crystal startup time select
#define CLKCTRL_CSUT_1K_gc (0x00<<4)      // 1K cycles
#define CLKCTRL_CSUT_16K_gc (0x01<<4)     // 16K cycles
#define CLKCTRL_CSUT_32K_gc (0x02<<4)     // 32K cycles
#define CLKCTRL_CSUT_64K_gc (0x03<<4)     // 64K cycles


//*************************************************************************
//** CPU - CPU
//*************************************************************************

// CPU_CCP masks
#define CPU_CCP_gm 0xFF                   // CCP signature group mask
#define CPU_CCP_gp 0                      // CCP signature group position
#define CPU_CCP0_bm (1<<0)                // CCP signature bit 0 mask
#define CPU_CCP0_bp 0                     // CCP signature bit 0 position
#define CPU_CCP1_bm (1<<1)                // CCP signature bit 1 mask
#define CPU_CCP1_bp 1                     // CCP signature bit 1 position
#define CPU_CCP2_bm (1<<2)                // CCP signature bit 2 mask
#define CPU_CCP2_bp 2                     // CCP signature bit 2 position
#define CPU_CCP3_bm (1<<3)                // CCP signature bit 3 mask
#define CPU_CCP3_bp 3                     // CCP signature bit 3 position
#define CPU_CCP4_bm (1<<4)                // CCP signature bit 4 mask
#define CPU_CCP4_bp 4                     // CCP signature bit 4 position
#define CPU_CCP5_bm (1<<5)                // CCP signature bit 5 mask
#define CPU_CCP5_bp 5                     // CCP signature bit 5 position
#define CPU_CCP6_bm (1<<6)                // CCP signature bit 6 mask
#define CPU_CCP6_bp 6                     // CCP signature bit 6 position
#define CPU_CCP7_bm (1<<7)                // CCP signature bit 7 mask
#define CPU_CCP7_bp 7                     // CCP signature bit 7 position

// CPU_SREG masks
#define CPU_C_bm 0x01                     // Carry Flag bit mask
#define CPU_C_bp 0                        // Carry Flag bit position
#define CPU_H_bm 0x20                     // Half Carry Flag bit mask
#define CPU_H_bp 5                        // Half Carry Flag bit position
#define CPU_I_bm 0x80                     // Global Interrupt Enable Flag bit mask
#define CPU_I_bp 7                        // Global Interrupt Enable Flag bit position
#define CPU_N_bm 0x04                     // Negative Flag bit mask
#define CPU_N_bp 2                        // Negative Flag bit position
#define CPU_S_bm 0x10                     // N Exclusive Or V Flag bit mask
#define CPU_S_bp 4                        // N Exclusive Or V Flag bit position
#define CPU_T_bm 0x40                     // Transfer Bit bit mask
#define CPU_T_bp 6                        // Transfer Bit bit position
#define CPU_V_bm 0x08                     // Two's Complement Overflow Flag bit mask
#define CPU_V_bp 3                        // Two's Complement Overflow Flag bit position
#define CPU_Z_bm 0x02                     // Zero Flag bit mask
#define CPU_Z_bp 1                        // Zero Flag bit position

// CCP signature select
#define CPU_CCP_SPM_gc (0x9D<<0)          // SPM Instruction Protection
#define CPU_CCP_IOREG_gc (0xD8<<0)        // IO Register Protection


//*************************************************************************
//** CPUINT - Interrupt Controller
//*************************************************************************

// CPUINT_CTRLA masks
#define CPUINT_CVT_bm 0x20                // Compact Vector Table bit mask
#define CPUINT_CVT_bp 5                   // Compact Vector Table bit position
#define CPUINT_IVSEL_bm 0x40              // Interrupt Vector Select bit mask
#define CPUINT_IVSEL_bp 6                 // Interrupt Vector Select bit position
#define CPUINT_LVL0RR_bm 0x01             // Round-robin Scheduling Enable bit mask
#define CPUINT_LVL0RR_bp 0                // Round-robin Scheduling Enable bit position

// CPUINT_LVL0PRI masks
#define CPUINT_LVL0PRI_gm 0xFF            // Interrupt Level Priority group mask
#define CPUINT_LVL0PRI_gp 0               // Interrupt Level Priority group position
#define CPUINT_LVL0PRI0_bm (1<<0)         // Interrupt Level Priority bit 0 mask
#define CPUINT_LVL0PRI0_bp 0              // Interrupt Level Priority bit 0 position
#define CPUINT_LVL0PRI1_bm (1<<1)         // Interrupt Level Priority bit 1 mask
#define CPUINT_LVL0PRI1_bp 1              // Interrupt Level Priority bit 1 position
#define CPUINT_LVL0PRI2_bm (1<<2)         // Interrupt Level Priority bit 2 mask
#define CPUINT_LVL0PRI2_bp 2              // Interrupt Level Priority bit 2 position
#define CPUINT_LVL0PRI3_bm (1<<3)         // Interrupt Level Priority bit 3 mask
#define CPUINT_LVL0PRI3_bp 3              // Interrupt Level Priority bit 3 position
#define CPUINT_LVL0PRI4_bm (1<<4)         // Interrupt Level Priority bit 4 mask
#define CPUINT_LVL0PRI4_bp 4              // Interrupt Level Priority bit 4 position
#define CPUINT_LVL0PRI5_bm (1<<5)         // Interrupt Level Priority bit 5 mask
#define CPUINT_LVL0PRI5_bp 5              // Interrupt Level Priority bit 5 position
#define CPUINT_LVL0PRI6_bm (1<<6)         // Interrupt Level Priority bit 6 mask
#define CPUINT_LVL0PRI6_bp 6              // Interrupt Level Priority bit 6 position
#define CPUINT_LVL0PRI7_bm (1<<7)         // Interrupt Level Priority bit 7 mask
#define CPUINT_LVL0PRI7_bp 7              // Interrupt Level Priority bit 7 position

// CPUINT_LVL1VEC masks
#define CPUINT_LVL1VEC_gm 0xFF            // Interrupt Vector with High Priority group mask
#define CPUINT_LVL1VEC_gp 0               // Interrupt Vector with High Priority group position
#define CPUINT_LVL1VEC0_bm (1<<0)         // Interrupt Vector with High Priority bit 0 mask
#define CPUINT_LVL1VEC0_bp 0              // Interrupt Vector with High Priority bit 0 position
#define CPUINT_LVL1VEC1_bm (1<<1)         // Interrupt Vector with High Priority bit 1 mask
#define CPUINT_LVL1VEC1_bp 1              // Interrupt Vector with High Priority bit 1 position
#define CPUINT_LVL1VEC2_bm (1<<2)         // Interrupt Vector with High Priority bit 2 mask
#define CPUINT_LVL1VEC2_bp 2              // Interrupt Vector with High Priority bit 2 position
#define CPUINT_LVL1VEC3_bm (1<<3)         // Interrupt Vector with High Priority bit 3 mask
#define CPUINT_LVL1VEC3_bp 3              // Interrupt Vector with High Priority bit 3 position
#define CPUINT_LVL1VEC4_bm (1<<4)         // Interrupt Vector with High Priority bit 4 mask
#define CPUINT_LVL1VEC4_bp 4              // Interrupt Vector with High Priority bit 4 position
#define CPUINT_LVL1VEC5_bm (1<<5)         // Interrupt Vector with High Priority bit 5 mask
#define CPUINT_LVL1VEC5_bp 5              // Interrupt Vector with High Priority bit 5 position
#define CPUINT_LVL1VEC6_bm (1<<6)         // Interrupt Vector with High Priority bit 6 mask
#define CPUINT_LVL1VEC6_bp 6              // Interrupt Vector with High Priority bit 6 position
#define CPUINT_LVL1VEC7_bm (1<<7)         // Interrupt Vector with High Priority bit 7 mask
#define CPUINT_LVL1VEC7_bp 7              // Interrupt Vector with High Priority bit 7 position

// CPUINT_STATUS masks
#define CPUINT_LVL0EX_bm 0x01             // Level 0 Interrupt Executing bit mask
#define CPUINT_LVL0EX_bp 0                // Level 0 Interrupt Executing bit position
#define CPUINT_LVL1EX_bm 0x02             // Level 1 Interrupt Executing bit mask
#define CPUINT_LVL1EX_bp 1                // Level 1 Interrupt Executing bit position
#define CPUINT_NMIEX_bm 0x80              // Non-maskable Interrupt Executing bit mask
#define CPUINT_NMIEX_bp 7                 // Non-maskable Interrupt Executing bit position


//*************************************************************************
//** CRCSCAN - CRCSCAN
//*************************************************************************

// CRCSCAN_CTRLA masks
#define CRCSCAN_ENABLE_bm 0x01            // Enable CRC scan bit mask
#define CRCSCAN_ENABLE_bp 0               // Enable CRC scan bit position
#define CRCSCAN_NMIEN_bm 0x02             // Enable NMI Trigger bit mask
#define CRCSCAN_NMIEN_bp 1                // Enable NMI Trigger bit position
#define CRCSCAN_RESET_bm 0x80             // Reset CRC scan bit mask
#define CRCSCAN_RESET_bp 7                // Reset CRC scan bit position

// CRCSCAN_CTRLB masks
#define CRCSCAN_MODE_gm 0x30              // CRC Flash Access Mode group mask
#define CRCSCAN_MODE_gp 4                 // CRC Flash Access Mode group position
#define CRCSCAN_MODE0_bm (1<<4)           // CRC Flash Access Mode bit 0 mask
#define CRCSCAN_MODE0_bp 4                // CRC Flash Access Mode bit 0 position
#define CRCSCAN_MODE1_bm (1<<5)           // CRC Flash Access Mode bit 1 mask
#define CRCSCAN_MODE1_bp 5                // CRC Flash Access Mode bit 1 position
#define CRCSCAN_SRC_gm 0x03               // CRC Source group mask
#define CRCSCAN_SRC_gp 0                  // CRC Source group position
#define CRCSCAN_SRC0_bm (1<<0)            // CRC Source bit 0 mask
#define CRCSCAN_SRC0_bp 0                 // CRC Source bit 0 position
#define CRCSCAN_SRC1_bm (1<<1)            // CRC Source bit 1 mask
#define CRCSCAN_SRC1_bp 1                 // CRC Source bit 1 position

// CRCSCAN_STATUS masks
#define CRCSCAN_BUSY_bm 0x01              // CRC Busy bit mask
#define CRCSCAN_BUSY_bp 0                 // CRC Busy bit position
#define CRCSCAN_OK_bm 0x02                // CRC Ok bit mask
#define CRCSCAN_OK_bp 1                   // CRC Ok bit position

// CRC Flash Access Mode select
#define CRCSCAN_MODE_PRIORITY_gc (0x00<<4) // Priority to flash
#define CRCSCAN_MODE_RESERVED_gc (0x01<<4) // Reserved
#define CRCSCAN_MODE_BACKGROUND_gc (0x02<<4) // Lowest priority to flash
#define CRCSCAN_MODE_CONTINUOUS_gc (0x03<<4) // Continuous checks in background

// CRC Source select
#define CRCSCAN_SRC_FLASH_gc (0x00<<0)    // CRC on entire flash
#define CRCSCAN_SRC_APPLICATION_gc (0x01<<0) // CRC on boot and appl section of flash
#define CRCSCAN_SRC_BOOT_gc (0x02<<0)     // CRC on boot section of flash


//*************************************************************************
//** DAC - Digital to Analog Converter
//*************************************************************************

// DAC_CTRLA masks
#define DAC_ENABLE_bm 0x01                // DAC Enable bit mask
#define DAC_ENABLE_bp 0                   // DAC Enable bit position
#define DAC_OUTEN_bm 0x40                 // Output Buffer Enable bit mask
#define DAC_OUTEN_bp 6                    // Output Buffer Enable bit position
#define DAC_RUNSTDBY_bm 0x80              // Run in Standby Mode bit mask
#define DAC_RUNSTDBY_bp 7                 // Run in Standby Mode bit position


//*************************************************************************
//** EVSYS - Event System
//*************************************************************************

// EVSYS_ASYNCCH0 masks
#define EVSYS_ASYNCCH0_gm 0xFF            // Asynchronous Channel 0 Generator Selection group mask
#define EVSYS_ASYNCCH0_gp 0               // Asynchronous Channel 0 Generator Selection group position
#define EVSYS_ASYNCCH00_bm (1<<0)         // Asynchronous Channel 0 Generator Selection bit 0 mask
#define EVSYS_ASYNCCH00_bp 0              // Asynchronous Channel 0 Generator Selection bit 0 position
#define EVSYS_ASYNCCH01_bm (1<<1)         // Asynchronous Channel 0 Generator Selection bit 1 mask
#define EVSYS_ASYNCCH01_bp 1              // Asynchronous Channel 0 Generator Selection bit 1 position
#define EVSYS_ASYNCCH02_bm (1<<2)         // Asynchronous Channel 0 Generator Selection bit 2 mask
#define EVSYS_ASYNCCH02_bp 2              // Asynchronous Channel 0 Generator Selection bit 2 position
#define EVSYS_ASYNCCH03_bm (1<<3)         // Asynchronous Channel 0 Generator Selection bit 3 mask
#define EVSYS_ASYNCCH03_bp 3              // Asynchronous Channel 0 Generator Selection bit 3 position
#define EVSYS_ASYNCCH04_bm (1<<4)         // Asynchronous Channel 0 Generator Selection bit 4 mask
#define EVSYS_ASYNCCH04_bp 4              // Asynchronous Channel 0 Generator Selection bit 4 position
#define EVSYS_ASYNCCH05_bm (1<<5)         // Asynchronous Channel 0 Generator Selection bit 5 mask
#define EVSYS_ASYNCCH05_bp 5              // Asynchronous Channel 0 Generator Selection bit 5 position
#define EVSYS_ASYNCCH06_bm (1<<6)         // Asynchronous Channel 0 Generator Selection bit 6 mask
#define EVSYS_ASYNCCH06_bp 6              // Asynchronous Channel 0 Generator Selection bit 6 position
#define EVSYS_ASYNCCH07_bm (1<<7)         // Asynchronous Channel 0 Generator Selection bit 7 mask
#define EVSYS_ASYNCCH07_bp 7              // Asynchronous Channel 0 Generator Selection bit 7 position

// EVSYS_ASYNCCH1 masks
#define EVSYS_ASYNCCH1_gm 0xFF            // Asynchronous Channel 1 Generator Selection group mask
#define EVSYS_ASYNCCH1_gp 0               // Asynchronous Channel 1 Generator Selection group position
#define EVSYS_ASYNCCH10_bm (1<<0)         // Asynchronous Channel 1 Generator Selection bit 0 mask
#define EVSYS_ASYNCCH10_bp 0              // Asynchronous Channel 1 Generator Selection bit 0 position
#define EVSYS_ASYNCCH11_bm (1<<1)         // Asynchronous Channel 1 Generator Selection bit 1 mask
#define EVSYS_ASYNCCH11_bp 1              // Asynchronous Channel 1 Generator Selection bit 1 position
#define EVSYS_ASYNCCH12_bm (1<<2)         // Asynchronous Channel 1 Generator Selection bit 2 mask
#define EVSYS_ASYNCCH12_bp 2              // Asynchronous Channel 1 Generator Selection bit 2 position
#define EVSYS_ASYNCCH13_bm (1<<3)         // Asynchronous Channel 1 Generator Selection bit 3 mask
#define EVSYS_ASYNCCH13_bp 3              // Asynchronous Channel 1 Generator Selection bit 3 position
#define EVSYS_ASYNCCH14_bm (1<<4)         // Asynchronous Channel 1 Generator Selection bit 4 mask
#define EVSYS_ASYNCCH14_bp 4              // Asynchronous Channel 1 Generator Selection bit 4 position
#define EVSYS_ASYNCCH15_bm (1<<5)         // Asynchronous Channel 1 Generator Selection bit 5 mask
#define EVSYS_ASYNCCH15_bp 5              // Asynchronous Channel 1 Generator Selection bit 5 position
#define EVSYS_ASYNCCH16_bm (1<<6)         // Asynchronous Channel 1 Generator Selection bit 6 mask
#define EVSYS_ASYNCCH16_bp 6              // Asynchronous Channel 1 Generator Selection bit 6 position
#define EVSYS_ASYNCCH17_bm (1<<7)         // Asynchronous Channel 1 Generator Selection bit 7 mask
#define EVSYS_ASYNCCH17_bp 7              // Asynchronous Channel 1 Generator Selection bit 7 position

// EVSYS_ASYNCCH2 masks
#define EVSYS_ASYNCCH2_gm 0xFF            // Asynchronous Channel 2 Generator Selection group mask
#define EVSYS_ASYNCCH2_gp 0               // Asynchronous Channel 2 Generator Selection group position
#define EVSYS_ASYNCCH20_bm (1<<0)         // Asynchronous Channel 2 Generator Selection bit 0 mask
#define EVSYS_ASYNCCH20_bp 0              // Asynchronous Channel 2 Generator Selection bit 0 position
#define EVSYS_ASYNCCH21_bm (1<<1)         // Asynchronous Channel 2 Generator Selection bit 1 mask
#define EVSYS_ASYNCCH21_bp 1              // Asynchronous Channel 2 Generator Selection bit 1 position
#define EVSYS_ASYNCCH22_bm (1<<2)         // Asynchronous Channel 2 Generator Selection bit 2 mask
#define EVSYS_ASYNCCH22_bp 2              // Asynchronous Channel 2 Generator Selection bit 2 position
#define EVSYS_ASYNCCH23_bm (1<<3)         // Asynchronous Channel 2 Generator Selection bit 3 mask
#define EVSYS_ASYNCCH23_bp 3              // Asynchronous Channel 2 Generator Selection bit 3 position
#define EVSYS_ASYNCCH24_bm (1<<4)         // Asynchronous Channel 2 Generator Selection bit 4 mask
#define EVSYS_ASYNCCH24_bp 4              // Asynchronous Channel 2 Generator Selection bit 4 position
#define EVSYS_ASYNCCH25_bm (1<<5)         // Asynchronous Channel 2 Generator Selection bit 5 mask
#define EVSYS_ASYNCCH25_bp 5              // Asynchronous Channel 2 Generator Selection bit 5 position
#define EVSYS_ASYNCCH26_bm (1<<6)         // Asynchronous Channel 2 Generator Selection bit 6 mask
#define EVSYS_ASYNCCH26_bp 6              // Asynchronous Channel 2 Generator Selection bit 6 position
#define EVSYS_ASYNCCH27_bm (1<<7)         // Asynchronous Channel 2 Generator Selection bit 7 mask
#define EVSYS_ASYNCCH27_bp 7              // Asynchronous Channel 2 Generator Selection bit 7 position

// EVSYS_ASYNCCH3 masks
#define EVSYS_ASYNCCH3_gm 0xFF            // Asynchronous Channel 3 Generator Selection group mask
#define EVSYS_ASYNCCH3_gp 0               // Asynchronous Channel 3 Generator Selection group position
#define EVSYS_ASYNCCH30_bm (1<<0)         // Asynchronous Channel 3 Generator Selection bit 0 mask
#define EVSYS_ASYNCCH30_bp 0              // Asynchronous Channel 3 Generator Selection bit 0 position
#define EVSYS_ASYNCCH31_bm (1<<1)         // Asynchronous Channel 3 Generator Selection bit 1 mask
#define EVSYS_ASYNCCH31_bp 1              // Asynchronous Channel 3 Generator Selection bit 1 position
#define EVSYS_ASYNCCH32_bm (1<<2)         // Asynchronous Channel 3 Generator Selection bit 2 mask
#define EVSYS_ASYNCCH32_bp 2              // Asynchronous Channel 3 Generator Selection bit 2 position
#define EVSYS_ASYNCCH33_bm (1<<3)         // Asynchronous Channel 3 Generator Selection bit 3 mask
#define EVSYS_ASYNCCH33_bp 3              // Asynchronous Channel 3 Generator Selection bit 3 position
#define EVSYS_ASYNCCH34_bm (1<<4)         // Asynchronous Channel 3 Generator Selection bit 4 mask
#define EVSYS_ASYNCCH34_bp 4              // Asynchronous Channel 3 Generator Selection bit 4 position
#define EVSYS_ASYNCCH35_bm (1<<5)         // Asynchronous Channel 3 Generator Selection bit 5 mask
#define EVSYS_ASYNCCH35_bp 5              // Asynchronous Channel 3 Generator Selection bit 5 position
#define EVSYS_ASYNCCH36_bm (1<<6)         // Asynchronous Channel 3 Generator Selection bit 6 mask
#define EVSYS_ASYNCCH36_bp 6              // Asynchronous Channel 3 Generator Selection bit 6 position
#define EVSYS_ASYNCCH37_bm (1<<7)         // Asynchronous Channel 3 Generator Selection bit 7 mask
#define EVSYS_ASYNCCH37_bp 7              // Asynchronous Channel 3 Generator Selection bit 7 position

// EVSYS_ASYNCUSER0 masks
#define EVSYS_ASYNCUSER0_gm 0xFF          // Asynchronous User Ch 0 Input Selection - TCB0 group mask
#define EVSYS_ASYNCUSER0_gp 0             // Asynchronous User Ch 0 Input Selection - TCB0 group position
#define EVSYS_ASYNCUSER00_bm (1<<0)       // Asynchronous User Ch 0 Input Selection - TCB0 bit 0 mask
#define EVSYS_ASYNCUSER00_bp 0            // Asynchronous User Ch 0 Input Selection - TCB0 bit 0 position
#define EVSYS_ASYNCUSER01_bm (1<<1)       // Asynchronous User Ch 0 Input Selection - TCB0 bit 1 mask
#define EVSYS_ASYNCUSER01_bp 1            // Asynchronous User Ch 0 Input Selection - TCB0 bit 1 position
#define EVSYS_ASYNCUSER02_bm (1<<2)       // Asynchronous User Ch 0 Input Selection - TCB0 bit 2 mask
#define EVSYS_ASYNCUSER02_bp 2            // Asynchronous User Ch 0 Input Selection - TCB0 bit 2 position
#define EVSYS_ASYNCUSER03_bm (1<<3)       // Asynchronous User Ch 0 Input Selection - TCB0 bit 3 mask
#define EVSYS_ASYNCUSER03_bp 3            // Asynchronous User Ch 0 Input Selection - TCB0 bit 3 position
#define EVSYS_ASYNCUSER04_bm (1<<4)       // Asynchronous User Ch 0 Input Selection - TCB0 bit 4 mask
#define EVSYS_ASYNCUSER04_bp 4            // Asynchronous User Ch 0 Input Selection - TCB0 bit 4 position
#define EVSYS_ASYNCUSER05_bm (1<<5)       // Asynchronous User Ch 0 Input Selection - TCB0 bit 5 mask
#define EVSYS_ASYNCUSER05_bp 5            // Asynchronous User Ch 0 Input Selection - TCB0 bit 5 position
#define EVSYS_ASYNCUSER06_bm (1<<6)       // Asynchronous User Ch 0 Input Selection - TCB0 bit 6 mask
#define EVSYS_ASYNCUSER06_bp 6            // Asynchronous User Ch 0 Input Selection - TCB0 bit 6 position
#define EVSYS_ASYNCUSER07_bm (1<<7)       // Asynchronous User Ch 0 Input Selection - TCB0 bit 7 mask
#define EVSYS_ASYNCUSER07_bp 7            // Asynchronous User Ch 0 Input Selection - TCB0 bit 7 position

// EVSYS_ASYNCUSER1 masks
#define EVSYS_ASYNCUSER1_gm 0xFF          // Asynchronous User Ch 1 Input Selection - ADC0 group mask
#define EVSYS_ASYNCUSER1_gp 0             // Asynchronous User Ch 1 Input Selection - ADC0 group position
#define EVSYS_ASYNCUSER10_bm (1<<0)       // Asynchronous User Ch 1 Input Selection - ADC0 bit 0 mask
#define EVSYS_ASYNCUSER10_bp 0            // Asynchronous User Ch 1 Input Selection - ADC0 bit 0 position
#define EVSYS_ASYNCUSER11_bm (1<<1)       // Asynchronous User Ch 1 Input Selection - ADC0 bit 1 mask
#define EVSYS_ASYNCUSER11_bp 1            // Asynchronous User Ch 1 Input Selection - ADC0 bit 1 position
#define EVSYS_ASYNCUSER12_bm (1<<2)       // Asynchronous User Ch 1 Input Selection - ADC0 bit 2 mask
#define EVSYS_ASYNCUSER12_bp 2            // Asynchronous User Ch 1 Input Selection - ADC0 bit 2 position
#define EVSYS_ASYNCUSER13_bm (1<<3)       // Asynchronous User Ch 1 Input Selection - ADC0 bit 3 mask
#define EVSYS_ASYNCUSER13_bp 3            // Asynchronous User Ch 1 Input Selection - ADC0 bit 3 position
#define EVSYS_ASYNCUSER14_bm (1<<4)       // Asynchronous User Ch 1 Input Selection - ADC0 bit 4 mask
#define EVSYS_ASYNCUSER14_bp 4            // Asynchronous User Ch 1 Input Selection - ADC0 bit 4 position
#define EVSYS_ASYNCUSER15_bm (1<<5)       // Asynchronous User Ch 1 Input Selection - ADC0 bit 5 mask
#define EVSYS_ASYNCUSER15_bp 5            // Asynchronous User Ch 1 Input Selection - ADC0 bit 5 position
#define EVSYS_ASYNCUSER16_bm (1<<6)       // Asynchronous User Ch 1 Input Selection - ADC0 bit 6 mask
#define EVSYS_ASYNCUSER16_bp 6            // Asynchronous User Ch 1 Input Selection - ADC0 bit 6 position
#define EVSYS_ASYNCUSER17_bm (1<<7)       // Asynchronous User Ch 1 Input Selection - ADC0 bit 7 mask
#define EVSYS_ASYNCUSER17_bp 7            // Asynchronous User Ch 1 Input Selection - ADC0 bit 7 position

// EVSYS_ASYNCUSER2 masks
#define EVSYS_ASYNCUSER2_gm 0xFF          // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 group mask
#define EVSYS_ASYNCUSER2_gp 0             // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 group position
#define EVSYS_ASYNCUSER20_bm (1<<0)       // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 0 mask
#define EVSYS_ASYNCUSER20_bp 0            // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 0 position
#define EVSYS_ASYNCUSER21_bm (1<<1)       // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 1 mask
#define EVSYS_ASYNCUSER21_bp 1            // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 1 position
#define EVSYS_ASYNCUSER22_bm (1<<2)       // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 2 mask
#define EVSYS_ASYNCUSER22_bp 2            // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 2 position
#define EVSYS_ASYNCUSER23_bm (1<<3)       // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 3 mask
#define EVSYS_ASYNCUSER23_bp 3            // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 3 position
#define EVSYS_ASYNCUSER24_bm (1<<4)       // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 4 mask
#define EVSYS_ASYNCUSER24_bp 4            // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 4 position
#define EVSYS_ASYNCUSER25_bm (1<<5)       // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 5 mask
#define EVSYS_ASYNCUSER25_bp 5            // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 5 position
#define EVSYS_ASYNCUSER26_bm (1<<6)       // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 6 mask
#define EVSYS_ASYNCUSER26_bp 6            // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 6 position
#define EVSYS_ASYNCUSER27_bm (1<<7)       // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 7 mask
#define EVSYS_ASYNCUSER27_bp 7            // Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 bit 7 position

// EVSYS_ASYNCUSER3 masks
#define EVSYS_ASYNCUSER3_gm 0xFF          // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 group mask
#define EVSYS_ASYNCUSER3_gp 0             // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 group position
#define EVSYS_ASYNCUSER30_bm (1<<0)       // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 0 mask
#define EVSYS_ASYNCUSER30_bp 0            // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 0 position
#define EVSYS_ASYNCUSER31_bm (1<<1)       // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 1 mask
#define EVSYS_ASYNCUSER31_bp 1            // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 1 position
#define EVSYS_ASYNCUSER32_bm (1<<2)       // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 2 mask
#define EVSYS_ASYNCUSER32_bp 2            // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 2 position
#define EVSYS_ASYNCUSER33_bm (1<<3)       // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 3 mask
#define EVSYS_ASYNCUSER33_bp 3            // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 3 position
#define EVSYS_ASYNCUSER34_bm (1<<4)       // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 4 mask
#define EVSYS_ASYNCUSER34_bp 4            // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 4 position
#define EVSYS_ASYNCUSER35_bm (1<<5)       // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 5 mask
#define EVSYS_ASYNCUSER35_bp 5            // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 5 position
#define EVSYS_ASYNCUSER36_bm (1<<6)       // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 6 mask
#define EVSYS_ASYNCUSER36_bp 6            // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 6 position
#define EVSYS_ASYNCUSER37_bm (1<<7)       // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 7 mask
#define EVSYS_ASYNCUSER37_bp 7            // Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 bit 7 position

// EVSYS_ASYNCUSER4 masks
#define EVSYS_ASYNCUSER4_gm 0xFF          // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 group mask
#define EVSYS_ASYNCUSER4_gp 0             // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 group position
#define EVSYS_ASYNCUSER40_bm (1<<0)       // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 0 mask
#define EVSYS_ASYNCUSER40_bp 0            // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 0 position
#define EVSYS_ASYNCUSER41_bm (1<<1)       // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 1 mask
#define EVSYS_ASYNCUSER41_bp 1            // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 1 position
#define EVSYS_ASYNCUSER42_bm (1<<2)       // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 2 mask
#define EVSYS_ASYNCUSER42_bp 2            // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 2 position
#define EVSYS_ASYNCUSER43_bm (1<<3)       // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 3 mask
#define EVSYS_ASYNCUSER43_bp 3            // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 3 position
#define EVSYS_ASYNCUSER44_bm (1<<4)       // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 4 mask
#define EVSYS_ASYNCUSER44_bp 4            // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 4 position
#define EVSYS_ASYNCUSER45_bm (1<<5)       // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 5 mask
#define EVSYS_ASYNCUSER45_bp 5            // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 5 position
#define EVSYS_ASYNCUSER46_bm (1<<6)       // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 6 mask
#define EVSYS_ASYNCUSER46_bp 6            // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 6 position
#define EVSYS_ASYNCUSER47_bm (1<<7)       // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 7 mask
#define EVSYS_ASYNCUSER47_bp 7            // Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 bit 7 position

// EVSYS_ASYNCUSER5 masks
#define EVSYS_ASYNCUSER5_gm 0xFF          // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 group mask
#define EVSYS_ASYNCUSER5_gp 0             // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 group position
#define EVSYS_ASYNCUSER50_bm (1<<0)       // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 0 mask
#define EVSYS_ASYNCUSER50_bp 0            // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 0 position
#define EVSYS_ASYNCUSER51_bm (1<<1)       // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 1 mask
#define EVSYS_ASYNCUSER51_bp 1            // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 1 position
#define EVSYS_ASYNCUSER52_bm (1<<2)       // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 2 mask
#define EVSYS_ASYNCUSER52_bp 2            // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 2 position
#define EVSYS_ASYNCUSER53_bm (1<<3)       // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 3 mask
#define EVSYS_ASYNCUSER53_bp 3            // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 3 position
#define EVSYS_ASYNCUSER54_bm (1<<4)       // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 4 mask
#define EVSYS_ASYNCUSER54_bp 4            // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 4 position
#define EVSYS_ASYNCUSER55_bm (1<<5)       // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 5 mask
#define EVSYS_ASYNCUSER55_bp 5            // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 5 position
#define EVSYS_ASYNCUSER56_bm (1<<6)       // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 6 mask
#define EVSYS_ASYNCUSER56_bp 6            // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 6 position
#define EVSYS_ASYNCUSER57_bm (1<<7)       // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 7 mask
#define EVSYS_ASYNCUSER57_bp 7            // Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 bit 7 position

// EVSYS_ASYNCUSER6 masks
#define EVSYS_ASYNCUSER6_gm 0xFF          // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 group mask
#define EVSYS_ASYNCUSER6_gp 0             // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 group position
#define EVSYS_ASYNCUSER60_bm (1<<0)       // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 0 mask
#define EVSYS_ASYNCUSER60_bp 0            // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 0 position
#define EVSYS_ASYNCUSER61_bm (1<<1)       // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 1 mask
#define EVSYS_ASYNCUSER61_bp 1            // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 1 position
#define EVSYS_ASYNCUSER62_bm (1<<2)       // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 2 mask
#define EVSYS_ASYNCUSER62_bp 2            // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 2 position
#define EVSYS_ASYNCUSER63_bm (1<<3)       // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 3 mask
#define EVSYS_ASYNCUSER63_bp 3            // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 3 position
#define EVSYS_ASYNCUSER64_bm (1<<4)       // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 4 mask
#define EVSYS_ASYNCUSER64_bp 4            // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 4 position
#define EVSYS_ASYNCUSER65_bm (1<<5)       // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 5 mask
#define EVSYS_ASYNCUSER65_bp 5            // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 5 position
#define EVSYS_ASYNCUSER66_bm (1<<6)       // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 6 mask
#define EVSYS_ASYNCUSER66_bp 6            // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 6 position
#define EVSYS_ASYNCUSER67_bm (1<<7)       // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 7 mask
#define EVSYS_ASYNCUSER67_bp 7            // Asynchronous User Ch 6 Input Selection - TCD0 Event 0 bit 7 position

// EVSYS_ASYNCUSER7 masks
#define EVSYS_ASYNCUSER7_gm 0xFF          // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 group mask
#define EVSYS_ASYNCUSER7_gp 0             // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 group position
#define EVSYS_ASYNCUSER70_bm (1<<0)       // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 0 mask
#define EVSYS_ASYNCUSER70_bp 0            // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 0 position
#define EVSYS_ASYNCUSER71_bm (1<<1)       // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 1 mask
#define EVSYS_ASYNCUSER71_bp 1            // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 1 position
#define EVSYS_ASYNCUSER72_bm (1<<2)       // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 2 mask
#define EVSYS_ASYNCUSER72_bp 2            // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 2 position
#define EVSYS_ASYNCUSER73_bm (1<<3)       // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 3 mask
#define EVSYS_ASYNCUSER73_bp 3            // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 3 position
#define EVSYS_ASYNCUSER74_bm (1<<4)       // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 4 mask
#define EVSYS_ASYNCUSER74_bp 4            // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 4 position
#define EVSYS_ASYNCUSER75_bm (1<<5)       // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 5 mask
#define EVSYS_ASYNCUSER75_bp 5            // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 5 position
#define EVSYS_ASYNCUSER76_bm (1<<6)       // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 6 mask
#define EVSYS_ASYNCUSER76_bp 6            // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 6 position
#define EVSYS_ASYNCUSER77_bm (1<<7)       // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 7 mask
#define EVSYS_ASYNCUSER77_bp 7            // Asynchronous User Ch 7 Input Selection - TCD0 Event 1 bit 7 position

// EVSYS_ASYNCUSER8 masks
#define EVSYS_ASYNCUSER8_gm 0xFF          // Asynchronous User Ch 8 Input Selection - Event Out 0 group mask
#define EVSYS_ASYNCUSER8_gp 0             // Asynchronous User Ch 8 Input Selection - Event Out 0 group position
#define EVSYS_ASYNCUSER80_bm (1<<0)       // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 0 mask
#define EVSYS_ASYNCUSER80_bp 0            // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 0 position
#define EVSYS_ASYNCUSER81_bm (1<<1)       // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 1 mask
#define EVSYS_ASYNCUSER81_bp 1            // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 1 position
#define EVSYS_ASYNCUSER82_bm (1<<2)       // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 2 mask
#define EVSYS_ASYNCUSER82_bp 2            // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 2 position
#define EVSYS_ASYNCUSER83_bm (1<<3)       // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 3 mask
#define EVSYS_ASYNCUSER83_bp 3            // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 3 position
#define EVSYS_ASYNCUSER84_bm (1<<4)       // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 4 mask
#define EVSYS_ASYNCUSER84_bp 4            // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 4 position
#define EVSYS_ASYNCUSER85_bm (1<<5)       // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 5 mask
#define EVSYS_ASYNCUSER85_bp 5            // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 5 position
#define EVSYS_ASYNCUSER86_bm (1<<6)       // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 6 mask
#define EVSYS_ASYNCUSER86_bp 6            // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 6 position
#define EVSYS_ASYNCUSER87_bm (1<<7)       // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 7 mask
#define EVSYS_ASYNCUSER87_bp 7            // Asynchronous User Ch 8 Input Selection - Event Out 0 bit 7 position

// EVSYS_ASYNCUSER9 masks
#define EVSYS_ASYNCUSER9_gm 0xFF          // Asynchronous User Ch 9 Input Selection - Event Out 1 group mask
#define EVSYS_ASYNCUSER9_gp 0             // Asynchronous User Ch 9 Input Selection - Event Out 1 group position
#define EVSYS_ASYNCUSER90_bm (1<<0)       // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 0 mask
#define EVSYS_ASYNCUSER90_bp 0            // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 0 position
#define EVSYS_ASYNCUSER91_bm (1<<1)       // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 1 mask
#define EVSYS_ASYNCUSER91_bp 1            // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 1 position
#define EVSYS_ASYNCUSER92_bm (1<<2)       // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 2 mask
#define EVSYS_ASYNCUSER92_bp 2            // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 2 position
#define EVSYS_ASYNCUSER93_bm (1<<3)       // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 3 mask
#define EVSYS_ASYNCUSER93_bp 3            // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 3 position
#define EVSYS_ASYNCUSER94_bm (1<<4)       // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 4 mask
#define EVSYS_ASYNCUSER94_bp 4            // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 4 position
#define EVSYS_ASYNCUSER95_bm (1<<5)       // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 5 mask
#define EVSYS_ASYNCUSER95_bp 5            // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 5 position
#define EVSYS_ASYNCUSER96_bm (1<<6)       // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 6 mask
#define EVSYS_ASYNCUSER96_bp 6            // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 6 position
#define EVSYS_ASYNCUSER97_bm (1<<7)       // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 7 mask
#define EVSYS_ASYNCUSER97_bp 7            // Asynchronous User Ch 9 Input Selection - Event Out 1 bit 7 position

// EVSYS_ASYNCUSER10 masks
#define EVSYS_ASYNCUSER10_gm 0xFF         // Asynchronous User Ch 10 Input Selection - Event Out 2 group mask
#define EVSYS_ASYNCUSER10_gp 0            // Asynchronous User Ch 10 Input Selection - Event Out 2 group position
#define EVSYS_ASYNCUSER100_bm (1<<0)      // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 0 mask
#define EVSYS_ASYNCUSER100_bp 0           // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 0 position
#define EVSYS_ASYNCUSER101_bm (1<<1)      // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 1 mask
#define EVSYS_ASYNCUSER101_bp 1           // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 1 position
#define EVSYS_ASYNCUSER102_bm (1<<2)      // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 2 mask
#define EVSYS_ASYNCUSER102_bp 2           // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 2 position
#define EVSYS_ASYNCUSER103_bm (1<<3)      // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 3 mask
#define EVSYS_ASYNCUSER103_bp 3           // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 3 position
#define EVSYS_ASYNCUSER104_bm (1<<4)      // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 4 mask
#define EVSYS_ASYNCUSER104_bp 4           // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 4 position
#define EVSYS_ASYNCUSER105_bm (1<<5)      // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 5 mask
#define EVSYS_ASYNCUSER105_bp 5           // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 5 position
#define EVSYS_ASYNCUSER106_bm (1<<6)      // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 6 mask
#define EVSYS_ASYNCUSER106_bp 6           // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 6 position
#define EVSYS_ASYNCUSER107_bm (1<<7)      // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 7 mask
#define EVSYS_ASYNCUSER107_bp 7           // Asynchronous User Ch 10 Input Selection - Event Out 2 bit 7 position

// EVSYS_ASYNCUSER11 masks
#define EVSYS_ASYNCUSER11_gm 0xFF         // Asynchronous User Ch 11 Input Selection - TCB1 group mask
#define EVSYS_ASYNCUSER11_gp 0            // Asynchronous User Ch 11 Input Selection - TCB1 group position
#define EVSYS_ASYNCUSER110_bm (1<<0)      // Asynchronous User Ch 11 Input Selection - TCB1 bit 0 mask
#define EVSYS_ASYNCUSER110_bp 0           // Asynchronous User Ch 11 Input Selection - TCB1 bit 0 position
#define EVSYS_ASYNCUSER111_bm (1<<1)      // Asynchronous User Ch 11 Input Selection - TCB1 bit 1 mask
#define EVSYS_ASYNCUSER111_bp 1           // Asynchronous User Ch 11 Input Selection - TCB1 bit 1 position
#define EVSYS_ASYNCUSER112_bm (1<<2)      // Asynchronous User Ch 11 Input Selection - TCB1 bit 2 mask
#define EVSYS_ASYNCUSER112_bp 2           // Asynchronous User Ch 11 Input Selection - TCB1 bit 2 position
#define EVSYS_ASYNCUSER113_bm (1<<3)      // Asynchronous User Ch 11 Input Selection - TCB1 bit 3 mask
#define EVSYS_ASYNCUSER113_bp 3           // Asynchronous User Ch 11 Input Selection - TCB1 bit 3 position
#define EVSYS_ASYNCUSER114_bm (1<<4)      // Asynchronous User Ch 11 Input Selection - TCB1 bit 4 mask
#define EVSYS_ASYNCUSER114_bp 4           // Asynchronous User Ch 11 Input Selection - TCB1 bit 4 position
#define EVSYS_ASYNCUSER115_bm (1<<5)      // Asynchronous User Ch 11 Input Selection - TCB1 bit 5 mask
#define EVSYS_ASYNCUSER115_bp 5           // Asynchronous User Ch 11 Input Selection - TCB1 bit 5 position
#define EVSYS_ASYNCUSER116_bm (1<<6)      // Asynchronous User Ch 11 Input Selection - TCB1 bit 6 mask
#define EVSYS_ASYNCUSER116_bp 6           // Asynchronous User Ch 11 Input Selection - TCB1 bit 6 position
#define EVSYS_ASYNCUSER117_bm (1<<7)      // Asynchronous User Ch 11 Input Selection - TCB1 bit 7 mask
#define EVSYS_ASYNCUSER117_bp 7           // Asynchronous User Ch 11 Input Selection - TCB1 bit 7 position

// EVSYS_ASYNCUSER12 masks
#define EVSYS_ASYNCUSER12_gm 0xFF         // Asynchronous User Ch 12 Input Selection - ADC0 group mask
#define EVSYS_ASYNCUSER12_gp 0            // Asynchronous User Ch 12 Input Selection - ADC0 group position
#define EVSYS_ASYNCUSER120_bm (1<<0)      // Asynchronous User Ch 12 Input Selection - ADC0 bit 0 mask
#define EVSYS_ASYNCUSER120_bp 0           // Asynchronous User Ch 12 Input Selection - ADC0 bit 0 position
#define EVSYS_ASYNCUSER121_bm (1<<1)      // Asynchronous User Ch 12 Input Selection - ADC0 bit 1 mask
#define EVSYS_ASYNCUSER121_bp 1           // Asynchronous User Ch 12 Input Selection - ADC0 bit 1 position
#define EVSYS_ASYNCUSER122_bm (1<<2)      // Asynchronous User Ch 12 Input Selection - ADC0 bit 2 mask
#define EVSYS_ASYNCUSER122_bp 2           // Asynchronous User Ch 12 Input Selection - ADC0 bit 2 position
#define EVSYS_ASYNCUSER123_bm (1<<3)      // Asynchronous User Ch 12 Input Selection - ADC0 bit 3 mask
#define EVSYS_ASYNCUSER123_bp 3           // Asynchronous User Ch 12 Input Selection - ADC0 bit 3 position
#define EVSYS_ASYNCUSER124_bm (1<<4)      // Asynchronous User Ch 12 Input Selection - ADC0 bit 4 mask
#define EVSYS_ASYNCUSER124_bp 4           // Asynchronous User Ch 12 Input Selection - ADC0 bit 4 position
#define EVSYS_ASYNCUSER125_bm (1<<5)      // Asynchronous User Ch 12 Input Selection - ADC0 bit 5 mask
#define EVSYS_ASYNCUSER125_bp 5           // Asynchronous User Ch 12 Input Selection - ADC0 bit 5 position
#define EVSYS_ASYNCUSER126_bm (1<<6)      // Asynchronous User Ch 12 Input Selection - ADC0 bit 6 mask
#define EVSYS_ASYNCUSER126_bp 6           // Asynchronous User Ch 12 Input Selection - ADC0 bit 6 position
#define EVSYS_ASYNCUSER127_bm (1<<7)      // Asynchronous User Ch 12 Input Selection - ADC0 bit 7 mask
#define EVSYS_ASYNCUSER127_bp 7           // Asynchronous User Ch 12 Input Selection - ADC0 bit 7 position

// EVSYS_SYNCCH0 masks
#define EVSYS_SYNCCH0_gm 0xFF             // Synchronous Channel 0 Generator Selection group mask
#define EVSYS_SYNCCH0_gp 0                // Synchronous Channel 0 Generator Selection group position
#define EVSYS_SYNCCH00_bm (1<<0)          // Synchronous Channel 0 Generator Selection bit 0 mask
#define EVSYS_SYNCCH00_bp 0               // Synchronous Channel 0 Generator Selection bit 0 position
#define EVSYS_SYNCCH01_bm (1<<1)          // Synchronous Channel 0 Generator Selection bit 1 mask
#define EVSYS_SYNCCH01_bp 1               // Synchronous Channel 0 Generator Selection bit 1 position
#define EVSYS_SYNCCH02_bm (1<<2)          // Synchronous Channel 0 Generator Selection bit 2 mask
#define EVSYS_SYNCCH02_bp 2               // Synchronous Channel 0 Generator Selection bit 2 position
#define EVSYS_SYNCCH03_bm (1<<3)          // Synchronous Channel 0 Generator Selection bit 3 mask
#define EVSYS_SYNCCH03_bp 3               // Synchronous Channel 0 Generator Selection bit 3 position
#define EVSYS_SYNCCH04_bm (1<<4)          // Synchronous Channel 0 Generator Selection bit 4 mask
#define EVSYS_SYNCCH04_bp 4               // Synchronous Channel 0 Generator Selection bit 4 position
#define EVSYS_SYNCCH05_bm (1<<5)          // Synchronous Channel 0 Generator Selection bit 5 mask
#define EVSYS_SYNCCH05_bp 5               // Synchronous Channel 0 Generator Selection bit 5 position
#define EVSYS_SYNCCH06_bm (1<<6)          // Synchronous Channel 0 Generator Selection bit 6 mask
#define EVSYS_SYNCCH06_bp 6               // Synchronous Channel 0 Generator Selection bit 6 position
#define EVSYS_SYNCCH07_bm (1<<7)          // Synchronous Channel 0 Generator Selection bit 7 mask
#define EVSYS_SYNCCH07_bp 7               // Synchronous Channel 0 Generator Selection bit 7 position

// EVSYS_SYNCCH1 masks
#define EVSYS_SYNCCH1_gm 0xFF             // Synchronous Channel 1 Generator Selection group mask
#define EVSYS_SYNCCH1_gp 0                // Synchronous Channel 1 Generator Selection group position
#define EVSYS_SYNCCH10_bm (1<<0)          // Synchronous Channel 1 Generator Selection bit 0 mask
#define EVSYS_SYNCCH10_bp 0               // Synchronous Channel 1 Generator Selection bit 0 position
#define EVSYS_SYNCCH11_bm (1<<1)          // Synchronous Channel 1 Generator Selection bit 1 mask
#define EVSYS_SYNCCH11_bp 1               // Synchronous Channel 1 Generator Selection bit 1 position
#define EVSYS_SYNCCH12_bm (1<<2)          // Synchronous Channel 1 Generator Selection bit 2 mask
#define EVSYS_SYNCCH12_bp 2               // Synchronous Channel 1 Generator Selection bit 2 position
#define EVSYS_SYNCCH13_bm (1<<3)          // Synchronous Channel 1 Generator Selection bit 3 mask
#define EVSYS_SYNCCH13_bp 3               // Synchronous Channel 1 Generator Selection bit 3 position
#define EVSYS_SYNCCH14_bm (1<<4)          // Synchronous Channel 1 Generator Selection bit 4 mask
#define EVSYS_SYNCCH14_bp 4               // Synchronous Channel 1 Generator Selection bit 4 position
#define EVSYS_SYNCCH15_bm (1<<5)          // Synchronous Channel 1 Generator Selection bit 5 mask
#define EVSYS_SYNCCH15_bp 5               // Synchronous Channel 1 Generator Selection bit 5 position
#define EVSYS_SYNCCH16_bm (1<<6)          // Synchronous Channel 1 Generator Selection bit 6 mask
#define EVSYS_SYNCCH16_bp 6               // Synchronous Channel 1 Generator Selection bit 6 position
#define EVSYS_SYNCCH17_bm (1<<7)          // Synchronous Channel 1 Generator Selection bit 7 mask
#define EVSYS_SYNCCH17_bp 7               // Synchronous Channel 1 Generator Selection bit 7 position

// EVSYS_SYNCUSER0 masks
#define EVSYS_SYNCUSER0_gm 0xFF           // Synchronous User Ch 0 - TCA0 group mask
#define EVSYS_SYNCUSER0_gp 0              // Synchronous User Ch 0 - TCA0 group position
#define EVSYS_SYNCUSER00_bm (1<<0)        // Synchronous User Ch 0 - TCA0 bit 0 mask
#define EVSYS_SYNCUSER00_bp 0             // Synchronous User Ch 0 - TCA0 bit 0 position
#define EVSYS_SYNCUSER01_bm (1<<1)        // Synchronous User Ch 0 - TCA0 bit 1 mask
#define EVSYS_SYNCUSER01_bp 1             // Synchronous User Ch 0 - TCA0 bit 1 position
#define EVSYS_SYNCUSER02_bm (1<<2)        // Synchronous User Ch 0 - TCA0 bit 2 mask
#define EVSYS_SYNCUSER02_bp 2             // Synchronous User Ch 0 - TCA0 bit 2 position
#define EVSYS_SYNCUSER03_bm (1<<3)        // Synchronous User Ch 0 - TCA0 bit 3 mask
#define EVSYS_SYNCUSER03_bp 3             // Synchronous User Ch 0 - TCA0 bit 3 position
#define EVSYS_SYNCUSER04_bm (1<<4)        // Synchronous User Ch 0 - TCA0 bit 4 mask
#define EVSYS_SYNCUSER04_bp 4             // Synchronous User Ch 0 - TCA0 bit 4 position
#define EVSYS_SYNCUSER05_bm (1<<5)        // Synchronous User Ch 0 - TCA0 bit 5 mask
#define EVSYS_SYNCUSER05_bp 5             // Synchronous User Ch 0 - TCA0 bit 5 position
#define EVSYS_SYNCUSER06_bm (1<<6)        // Synchronous User Ch 0 - TCA0 bit 6 mask
#define EVSYS_SYNCUSER06_bp 6             // Synchronous User Ch 0 - TCA0 bit 6 position
#define EVSYS_SYNCUSER07_bm (1<<7)        // Synchronous User Ch 0 - TCA0 bit 7 mask
#define EVSYS_SYNCUSER07_bp 7             // Synchronous User Ch 0 - TCA0 bit 7 position

// EVSYS_SYNCUSER1 masks
#define EVSYS_SYNCUSER1_gm 0xFF           // Synchronous User Ch 1 - USART0 group mask
#define EVSYS_SYNCUSER1_gp 0              // Synchronous User Ch 1 - USART0 group position
#define EVSYS_SYNCUSER10_bm (1<<0)        // Synchronous User Ch 1 - USART0 bit 0 mask
#define EVSYS_SYNCUSER10_bp 0             // Synchronous User Ch 1 - USART0 bit 0 position
#define EVSYS_SYNCUSER11_bm (1<<1)        // Synchronous User Ch 1 - USART0 bit 1 mask
#define EVSYS_SYNCUSER11_bp 1             // Synchronous User Ch 1 - USART0 bit 1 position
#define EVSYS_SYNCUSER12_bm (1<<2)        // Synchronous User Ch 1 - USART0 bit 2 mask
#define EVSYS_SYNCUSER12_bp 2             // Synchronous User Ch 1 - USART0 bit 2 position
#define EVSYS_SYNCUSER13_bm (1<<3)        // Synchronous User Ch 1 - USART0 bit 3 mask
#define EVSYS_SYNCUSER13_bp 3             // Synchronous User Ch 1 - USART0 bit 3 position
#define EVSYS_SYNCUSER14_bm (1<<4)        // Synchronous User Ch 1 - USART0 bit 4 mask
#define EVSYS_SYNCUSER14_bp 4             // Synchronous User Ch 1 - USART0 bit 4 position
#define EVSYS_SYNCUSER15_bm (1<<5)        // Synchronous User Ch 1 - USART0 bit 5 mask
#define EVSYS_SYNCUSER15_bp 5             // Synchronous User Ch 1 - USART0 bit 5 position
#define EVSYS_SYNCUSER16_bm (1<<6)        // Synchronous User Ch 1 - USART0 bit 6 mask
#define EVSYS_SYNCUSER16_bp 6             // Synchronous User Ch 1 - USART0 bit 6 position
#define EVSYS_SYNCUSER17_bm (1<<7)        // Synchronous User Ch 1 - USART0 bit 7 mask
#define EVSYS_SYNCUSER17_bp 7             // Synchronous User Ch 1 - USART0 bit 7 position

// Asynchronous Channel 0 Generator Selection select
#define EVSYS_ASYNCCH0_OFF_gc (0x00<<0)   // Off
#define EVSYS_ASYNCCH0_CCL_LUT0_gc (0x01<<0) // Configurable Custom Logic LUT0
#define EVSYS_ASYNCCH0_CCL_LUT1_gc (0x02<<0) // Configurable Custom Logic LUT1
#define EVSYS_ASYNCCH0_AC0_OUT_gc (0x03<<0) // Analog Comparator 0 out
#define EVSYS_ASYNCCH0_TCD0_CMPBCLR_gc (0x04<<0) // Timer/Counter D0 compare B clear
#define EVSYS_ASYNCCH0_TCD0_CMPASET_gc (0x05<<0) // Timer/Counter D0 compare A set
#define EVSYS_ASYNCCH0_TCD0_CMPBSET_gc (0x06<<0) // Timer/Counter D0 compare B set
#define EVSYS_ASYNCCH0_TCD0_PROGEV_gc (0x07<<0) // Timer/Counter D0 program event
#define EVSYS_ASYNCCH0_RTC_OVF_gc (0x08<<0) // Real Time Counter overflow
#define EVSYS_ASYNCCH0_RTC_CMP_gc (0x09<<0) // Real Time Counter compare
#define EVSYS_ASYNCCH0_PORTA_PIN0_gc (0x0A<<0) // Asynchronous Event from Pin PA0
#define EVSYS_ASYNCCH0_PORTA_PIN1_gc (0x0B<<0) // Asynchronous Event from Pin PA1
#define EVSYS_ASYNCCH0_PORTA_PIN2_gc (0x0C<<0) // Asynchronous Event from Pin PA2
#define EVSYS_ASYNCCH0_PORTA_PIN3_gc (0x0D<<0) // Asynchronous Event from Pin PA3
#define EVSYS_ASYNCCH0_PORTA_PIN4_gc (0x0E<<0) // Asynchronous Event from Pin PA4
#define EVSYS_ASYNCCH0_PORTA_PIN5_gc (0x0F<<0) // Asynchronous Event from Pin PA5
#define EVSYS_ASYNCCH0_PORTA_PIN6_gc (0x10<<0) // Asynchronous Event from Pin PA6
#define EVSYS_ASYNCCH0_PORTA_PIN7_gc (0x11<<0) // Asynchronous Event from Pin PA7
#define EVSYS_ASYNCCH0_UPDI_gc (0x12<<0)  // Unified Program and debug interface
#define EVSYS_ASYNCCH0_AC1_OUT_gc (0x13<<0) // Analog Comparator 1 out
#define EVSYS_ASYNCCH0_AC2_OUT_gc (0x14<<0) // Analog Comparator 2 out

// Asynchronous Channel 1 Generator Selection select
#define EVSYS_ASYNCCH1_OFF_gc (0x00<<0)   // Off
#define EVSYS_ASYNCCH1_CCL_LUT0_gc (0x01<<0) // Configurable custom logic LUT0
#define EVSYS_ASYNCCH1_CCL_LUT1_gc (0x02<<0) // Configurable custom logic LUT1
#define EVSYS_ASYNCCH1_AC0_OUT_gc (0x03<<0) // Analog Comparator 0 out
#define EVSYS_ASYNCCH1_TCD0_CMPBCLR_gc (0x04<<0) // Timer/Counter D0 compare B clear
#define EVSYS_ASYNCCH1_TCD0_CMPASET_gc (0x05<<0) // Timer/Counter D0 compare A set
#define EVSYS_ASYNCCH1_TCD0_CMPBSET_gc (0x06<<0) // Timer/Counter D0 compare B set
#define EVSYS_ASYNCCH1_TCD0_PROGEV_gc (0x07<<0) // Timer/Counter D0 program event
#define EVSYS_ASYNCCH1_RTC_OVF_gc (0x08<<0) // Real Time Counter overflow
#define EVSYS_ASYNCCH1_RTC_CMP_gc (0x09<<0) // Real Time Counter compare
#define EVSYS_ASYNCCH1_PORTB_PIN0_gc (0x0A<<0) // Asynchronous Event from Pin PB0
#define EVSYS_ASYNCCH1_PORTB_PIN1_gc (0x0B<<0) // Asynchronous Event from Pin PB1
#define EVSYS_ASYNCCH1_PORTB_PIN2_gc (0x0C<<0) // Asynchronous Event from Pin PB2
#define EVSYS_ASYNCCH1_PORTB_PIN3_gc (0x0D<<0) // Asynchronous Event from Pin PB3
#define EVSYS_ASYNCCH1_PORTB_PIN4_gc (0x0E<<0) // Asynchronous Event from Pin PB4
#define EVSYS_ASYNCCH1_PORTB_PIN5_gc (0x0F<<0) // Asynchronous Event from Pin PB5
#define EVSYS_ASYNCCH1_PORTB_PIN6_gc (0x10<<0) // Asynchronous Event from Pin PB6
#define EVSYS_ASYNCCH1_PORTB_PIN7_gc (0x11<<0) // Asynchronous Event from Pin PB7
#define EVSYS_ASYNCCH1_AC1_OUT_gc (0x12<<0) // Analog Comparator 1 out
#define EVSYS_ASYNCCH1_AC2_OUT_gc (0x13<<0) // Analog Comparator 2 out

// Asynchronous Channel 2 Generator Selection select
#define EVSYS_ASYNCCH2_OFF_gc (0x00<<0)   // Off
#define EVSYS_ASYNCCH2_CCL_LUT0_gc (0x01<<0) // Configurable Custom Logic LUT0
#define EVSYS_ASYNCCH2_CCL_LUT1_gc (0x02<<0) // Configurable Custom Logic LUT1
#define EVSYS_ASYNCCH2_AC0_OUT_gc (0x03<<0) // Analog Comparator 0 out
#define EVSYS_ASYNCCH2_TCD0_CMPBCLR_gc (0x04<<0) // Timer/Counter D0 compare B clear
#define EVSYS_ASYNCCH2_TCD0_CMPASET_gc (0x05<<0) // Timer/Counter D0 compare A set
#define EVSYS_ASYNCCH2_TCD0_CMPBSET_gc (0x06<<0) // Timer/Counter D0 compare B set
#define EVSYS_ASYNCCH2_TCD0_PROGEV_gc (0x07<<0) // Timer/Counter D0 program event
#define EVSYS_ASYNCCH2_RTC_OVF_gc (0x08<<0) // Real Time Counter overflow
#define EVSYS_ASYNCCH2_RTC_CMP_gc (0x09<<0) // Real Time Counter compare
#define EVSYS_ASYNCCH2_PORTC_PIN0_gc (0x0A<<0) // Asynchronous Event from Pin PC0
#define EVSYS_ASYNCCH2_PORTC_PIN1_gc (0x0B<<0) // Asynchronous Event from Pin PC1
#define EVSYS_ASYNCCH2_PORTC_PIN2_gc (0x0C<<0) // Asynchronous Event from Pin PC2
#define EVSYS_ASYNCCH2_PORTC_PIN3_gc (0x0D<<0) // Asynchronous Event from Pin PC3
#define EVSYS_ASYNCCH2_PORTC_PIN4_gc (0x0E<<0) // Asynchronous Event from Pin PC4
#define EVSYS_ASYNCCH2_PORTC_PIN5_gc (0x0F<<0) // Asynchronous Event from Pin PC5
#define EVSYS_ASYNCCH2_AC1_OUT_gc (0x10<<0) // Analog Comparator 1 out
#define EVSYS_ASYNCCH2_AC2_OUT_gc (0x11<<0) // Analog Comparator 2 out

// Asynchronous Channel 3 Generator Selection select
#define EVSYS_ASYNCCH3_OFF_gc (0x00<<0)   // Off
#define EVSYS_ASYNCCH3_CCL_LUT0_gc (0x01<<0) // Configurable custom logic LUT0
#define EVSYS_ASYNCCH3_CCL_LUT1_gc (0x02<<0) // Configurable custom logic LUT1
#define EVSYS_ASYNCCH3_AC0_OUT_gc (0x03<<0) // Analog Comparator 0 out
#define EVSYS_ASYNCCH3_TCD0_CMPBCLR_gc (0x04<<0) // Timer/Counter type D compare B clear
#define EVSYS_ASYNCCH3_TCD0_CMPASET_gc (0x05<<0) // Timer/Counter type D compare A set
#define EVSYS_ASYNCCH3_TCD0_CMPBSET_gc (0x06<<0) // Timer/Counter type D compare B set
#define EVSYS_ASYNCCH3_TCD0_PROGEV_gc (0x07<<0) // Timer/Counter type D program event
#define EVSYS_ASYNCCH3_RTC_OVF_gc (0x08<<0) // Real Time Counter overflow
#define EVSYS_ASYNCCH3_RTC_CMP_gc (0x09<<0) // Real Time Counter compare
#define EVSYS_ASYNCCH3_PIT_DIV8192_gc (0x0A<<0) // Periodic Interrupt CLK_RTC div 8192
#define EVSYS_ASYNCCH3_PIT_DIV4096_gc (0x0B<<0) // Periodic Interrupt CLK_RTC div 4096
#define EVSYS_ASYNCCH3_PIT_DIV2048_gc (0x0C<<0) // Periodic Interrupt CLK_RTC div 2048
#define EVSYS_ASYNCCH3_PIT_DIV1024_gc (0x0D<<0) // Periodic Interrupt CLK_RTC div 1024
#define EVSYS_ASYNCCH3_PIT_DIV512_gc (0x0E<<0) // Periodic Interrupt CLK_RTC div 512
#define EVSYS_ASYNCCH3_PIT_DIV256_gc (0x0F<<0) // Periodic Interrupt CLK_RTC div 256
#define EVSYS_ASYNCCH3_PIT_DIV128_gc (0x10<<0) // Periodic Interrupt CLK_RTC div 128
#define EVSYS_ASYNCCH3_PIT_DIV64_gc (0x11<<0) // Periodic Interrupt CLK_RTC div 64
#define EVSYS_ASYNCCH3_AC1_OUT_gc (0x12<<0) // Analog Comparator 1 out
#define EVSYS_ASYNCCH3_AC2_OUT_gc (0x13<<0) // Analog Comparator 2 out

// Asynchronous User Ch 0 Input Selection - TCB0 select
#define EVSYS_ASYNCUSER0_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER0_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER0_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER0_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER0_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER0_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER0_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 1 Input Selection - ADC0 select
#define EVSYS_ASYNCUSER1_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER1_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER1_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER1_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER1_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER1_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER1_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 2 Input Selection - CCL LUT0 Event 0 select
#define EVSYS_ASYNCUSER2_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER2_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER2_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER2_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER2_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER2_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER2_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 3 Input Selection - CCL LUT1 Event 0 select
#define EVSYS_ASYNCUSER3_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER3_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER3_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER3_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER3_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER3_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER3_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 4 Input Selection - CCL LUT0 Event 1 select
#define EVSYS_ASYNCUSER4_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER4_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER4_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER4_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER4_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER4_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER4_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 5 Input Selection - CCL LUT1 Event 1 select
#define EVSYS_ASYNCUSER5_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER5_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER5_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER5_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER5_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER5_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER5_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 6 Input Selection - TCD0 Event 0 select
#define EVSYS_ASYNCUSER6_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER6_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER6_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER6_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER6_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER6_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER6_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 7 Input Selection - TCD0 Event 1 select
#define EVSYS_ASYNCUSER7_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER7_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER7_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER7_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER7_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER7_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER7_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 8 Input Selection - Event Out 0 select
#define EVSYS_ASYNCUSER8_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER8_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER8_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER8_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER8_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER8_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER8_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 9 Input Selection - Event Out 1 select
#define EVSYS_ASYNCUSER9_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER9_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER9_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER9_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER9_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER9_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER9_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 10 Input Selection - Event Out 2 select
#define EVSYS_ASYNCUSER10_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER10_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER10_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER10_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER10_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER10_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER10_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 11 Input Selection - TCB1 select
#define EVSYS_ASYNCUSER11_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER11_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER11_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER11_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER11_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER11_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER11_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Asynchronous User Ch 12 Input Selection - ADC0 select
#define EVSYS_ASYNCUSER12_OFF_gc (0x00<<0) // Off
#define EVSYS_ASYNCUSER12_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_ASYNCUSER12_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1
#define EVSYS_ASYNCUSER12_ASYNCCH0_gc (0x03<<0) // Asynchronous Event Channel 0
#define EVSYS_ASYNCUSER12_ASYNCCH1_gc (0x04<<0) // Asynchronous Event Channel 1
#define EVSYS_ASYNCUSER12_ASYNCCH2_gc (0x05<<0) // Asynchronous Event Channel 2
#define EVSYS_ASYNCUSER12_ASYNCCH3_gc (0x06<<0) // Asynchronous Event Channel 3

// Synchronous Channel 0 Generator Selection select
#define EVSYS_SYNCCH0_OFF_gc (0x00<<0)    // Off
#define EVSYS_SYNCCH0_TCB0_gc (0x01<<0)   // Timer/Counter B0
#define EVSYS_SYNCCH0_TCA0_OVF_LUNF_gc (0x02<<0) // Timer/Counter A0 overflow
#define EVSYS_SYNCCH0_TCA0_HUNF_gc (0x03<<0) // Timer/Counter A0 underflow high byte (split mode)
#define EVSYS_SYNCCH0_TCA0_CMP0_gc (0x04<<0) // Timer/Counter A0 compare 0
#define EVSYS_SYNCCH0_TCA0_CMP1_gc (0x05<<0) // Timer/Counter A0 compare 1
#define EVSYS_SYNCCH0_TCA0_CMP2_gc (0x06<<0) // Timer/Counter A0 compare 2
#define EVSYS_SYNCCH0_PORTC_PIN0_gc (0x07<<0) // Synchronous Event from Pin PC0
#define EVSYS_SYNCCH0_PORTC_PIN1_gc (0x08<<0) // Synchronous Event from Pin PC1
#define EVSYS_SYNCCH0_PORTC_PIN2_gc (0x09<<0) // Synchronous Event from Pin PC2
#define EVSYS_SYNCCH0_PORTC_PIN3_gc (0x0A<<0) // Synchronous Event from Pin PC3
#define EVSYS_SYNCCH0_PORTC_PIN4_gc (0x0B<<0) // Synchronous Event from Pin PC4
#define EVSYS_SYNCCH0_PORTC_PIN5_gc (0x0C<<0) // Synchronous Event from Pin PC5
#define EVSYS_SYNCCH0_PORTA_PIN0_gc (0x0D<<0) // Synchronous Event from Pin PA0
#define EVSYS_SYNCCH0_PORTA_PIN1_gc (0x0E<<0) // Synchronous Event from Pin PA1
#define EVSYS_SYNCCH0_PORTA_PIN2_gc (0x0F<<0) // Synchronous Event from Pin PA2
#define EVSYS_SYNCCH0_PORTA_PIN3_gc (0x10<<0) // Synchronous Event from Pin PA3
#define EVSYS_SYNCCH0_PORTA_PIN4_gc (0x11<<0) // Synchronous Event from Pin PA4
#define EVSYS_SYNCCH0_PORTA_PIN5_gc (0x12<<0) // Synchronous Event from Pin PA5
#define EVSYS_SYNCCH0_PORTA_PIN6_gc (0x13<<0) // Synchronous Event from Pin PA6
#define EVSYS_SYNCCH0_PORTA_PIN7_gc (0x14<<0) // Synchronous Event from Pin PA7
#define EVSYS_SYNCCH0_TCB1_gc (0x15<<0)   // Timer/Counter B1

// Synchronous Channel 1 Generator Selection select
#define EVSYS_SYNCCH1_OFF_gc (0x00<<0)    // Off
#define EVSYS_SYNCCH1_TCB0_gc (0x01<<0)   // Timer/Counter B0
#define EVSYS_SYNCCH1_TCA0_OVF_LUNF_gc (0x02<<0) // Timer/Counter A0 overflow
#define EVSYS_SYNCCH1_TCA0_HUNF_gc (0x03<<0) // Timer/Counter A0 underflow high byte (split mode)
#define EVSYS_SYNCCH1_TCA0_CMP0_gc (0x04<<0) // Timer/Counter A0 compare 0
#define EVSYS_SYNCCH1_TCA0_CMP1_gc (0x05<<0) // Timer/Counter A0 compare 1
#define EVSYS_SYNCCH1_TCA0_CMP2_gc (0x06<<0) // Timer/Counter A0 compare 2
#define EVSYS_SYNCCH1_PORTB_PIN0_gc (0x08<<0) // Synchronous Event from Pin PB0
#define EVSYS_SYNCCH1_PORTB_PIN1_gc (0x09<<0) // Synchronous Event from Pin PB1
#define EVSYS_SYNCCH1_PORTB_PIN2_gc (0x0A<<0) // Synchronous Event from Pin PB2
#define EVSYS_SYNCCH1_PORTB_PIN3_gc (0x0B<<0) // Synchronous Event from Pin PB3
#define EVSYS_SYNCCH1_PORTB_PIN4_gc (0x0C<<0) // Synchronous Event from Pin PB4
#define EVSYS_SYNCCH1_PORTB_PIN5_gc (0x0D<<0) // Synchronous Event from Pin PB5
#define EVSYS_SYNCCH1_PORTB_PIN6_gc (0x0E<<0) // Synchronous Event from Pin PB6
#define EVSYS_SYNCCH1_PORTB_PIN7_gc (0x0F<<0) // Synchronous Event from Pin PB7
#define EVSYS_SYNCCH1_TCB1_gc (0x10<<0)   // Timer/Counter B1

// Synchronous User Ch 0 - TCA0 select
#define EVSYS_SYNCUSER0_OFF_gc (0x00<<0)  // Off
#define EVSYS_SYNCUSER0_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_SYNCUSER0_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1

// Synchronous User Ch 1 - USART0 select
#define EVSYS_SYNCUSER1_OFF_gc (0x00<<0)  // Off
#define EVSYS_SYNCUSER1_SYNCCH0_gc (0x01<<0) // Synchronous Event Channel 0
#define EVSYS_SYNCUSER1_SYNCCH1_gc (0x02<<0) // Synchronous Event Channel 1


//*************************************************************************
//** FUSE - Fuses
//*************************************************************************

// FUSE_BODCFG masks
#define FUSE_ACTIVE_gm 0x0C               // BOD Operation in Active Mode group mask
#define FUSE_ACTIVE_gp 2                  // BOD Operation in Active Mode group position
#define FUSE_ACTIVE0_bm (1<<2)            // BOD Operation in Active Mode bit 0 mask
#define FUSE_ACTIVE0_bp 2                 // BOD Operation in Active Mode bit 0 position
#define FUSE_ACTIVE1_bm (1<<3)            // BOD Operation in Active Mode bit 1 mask
#define FUSE_ACTIVE1_bp 3                 // BOD Operation in Active Mode bit 1 position
#define FUSE_LVL_gm 0xE0                  // BOD Level group mask
#define FUSE_LVL_gp 5                     // BOD Level group position
#define FUSE_LVL0_bm (1<<5)               // BOD Level bit 0 mask
#define FUSE_LVL0_bp 5                    // BOD Level bit 0 position
#define FUSE_LVL1_bm (1<<6)               // BOD Level bit 1 mask
#define FUSE_LVL1_bp 6                    // BOD Level bit 1 position
#define FUSE_LVL2_bm (1<<7)               // BOD Level bit 2 mask
#define FUSE_LVL2_bp 7                    // BOD Level bit 2 position
#define FUSE_SAMPFREQ_bm 0x10             // BOD Sample Frequency bit mask
#define FUSE_SAMPFREQ_bp 4                // BOD Sample Frequency bit position
#define FUSE_SLEEP_gm 0x03                // BOD Operation in Sleep Mode group mask
#define FUSE_SLEEP_gp 0                   // BOD Operation in Sleep Mode group position
#define FUSE_SLEEP0_bm (1<<0)             // BOD Operation in Sleep Mode bit 0 mask
#define FUSE_SLEEP0_bp 0                  // BOD Operation in Sleep Mode bit 0 position
#define FUSE_SLEEP1_bm (1<<1)             // BOD Operation in Sleep Mode bit 1 mask
#define FUSE_SLEEP1_bp 1                  // BOD Operation in Sleep Mode bit 1 position

// FUSE_OSCCFG masks
#define FUSE_FREQSEL_gm 0x03              // Frequency Select group mask
#define FUSE_FREQSEL_gp 0                 // Frequency Select group position
#define FUSE_FREQSEL0_bm (1<<0)           // Frequency Select bit 0 mask
#define FUSE_FREQSEL0_bp 0                // Frequency Select bit 0 position
#define FUSE_FREQSEL1_bm (1<<1)           // Frequency Select bit 1 mask
#define FUSE_FREQSEL1_bp 1                // Frequency Select bit 1 position
#define FUSE_OSCLOCK_bm 0x80              // Oscillator Lock bit mask
#define FUSE_OSCLOCK_bp 7                 // Oscillator Lock bit position

// FUSE_SYSCFG0 masks
#define FUSE_CRCSRC_gm 0xC0               // CRC Source group mask
#define FUSE_CRCSRC_gp 6                  // CRC Source group position
#define FUSE_CRCSRC0_bm (1<<6)            // CRC Source bit 0 mask
#define FUSE_CRCSRC0_bp 6                 // CRC Source bit 0 position
#define FUSE_CRCSRC1_bm (1<<7)            // CRC Source bit 1 mask
#define FUSE_CRCSRC1_bp 7                 // CRC Source bit 1 position
#define FUSE_EESAVE_bm 0x01               // EEPROM Save bit mask
#define FUSE_EESAVE_bp 0                  // EEPROM Save bit position
#define FUSE_RSTPINCFG_gm 0x0C            // Reset Pin Configuration group mask
#define FUSE_RSTPINCFG_gp 2               // Reset Pin Configuration group position
#define FUSE_RSTPINCFG0_bm (1<<2)         // Reset Pin Configuration bit 0 mask
#define FUSE_RSTPINCFG0_bp 2              // Reset Pin Configuration bit 0 position
#define FUSE_RSTPINCFG1_bm (1<<3)         // Reset Pin Configuration bit 1 mask
#define FUSE_RSTPINCFG1_bp 3              // Reset Pin Configuration bit 1 position

// FUSE_SYSCFG1 masks
#define FUSE_SUT_gm 0x07                  // Startup Time group mask
#define FUSE_SUT_gp 0                     // Startup Time group position
#define FUSE_SUT0_bm (1<<0)               // Startup Time bit 0 mask
#define FUSE_SUT0_bp 0                    // Startup Time bit 0 position
#define FUSE_SUT1_bm (1<<1)               // Startup Time bit 1 mask
#define FUSE_SUT1_bp 1                    // Startup Time bit 1 position
#define FUSE_SUT2_bm (1<<2)               // Startup Time bit 2 mask
#define FUSE_SUT2_bp 2                    // Startup Time bit 2 position

// FUSE_TCD0CFG masks
#define FUSE_CMPA_bm 0x01                 // Compare A Default Output Value bit mask
#define FUSE_CMPA_bp 0                    // Compare A Default Output Value bit position
#define FUSE_CMPAEN_bm 0x10               // Compare A Output Enable bit mask
#define FUSE_CMPAEN_bp 4                  // Compare A Output Enable bit position
#define FUSE_CMPB_bm 0x02                 // Compare B Default Output Value bit mask
#define FUSE_CMPB_bp 1                    // Compare B Default Output Value bit position
#define FUSE_CMPBEN_bm 0x20               // Compare B Output Enable bit mask
#define FUSE_CMPBEN_bp 5                  // Compare B Output Enable bit position
#define FUSE_CMPC_bm 0x04                 // Compare C Default Output Value bit mask
#define FUSE_CMPC_bp 2                    // Compare C Default Output Value bit position
#define FUSE_CMPCEN_bm 0x40               // Compare C Output Enable bit mask
#define FUSE_CMPCEN_bp 6                  // Compare C Output Enable bit position
#define FUSE_CMPD_bm 0x08                 // Compare D Default Output Value bit mask
#define FUSE_CMPD_bp 3                    // Compare D Default Output Value bit position
#define FUSE_CMPDEN_bm 0x80               // Compare D Output Enable bit mask
#define FUSE_CMPDEN_bp 7                  // Compare D Output Enable bit position

// FUSE_WDTCFG masks
#define FUSE_PERIOD_gm 0x0F               // Watchdog Timeout Period group mask
#define FUSE_PERIOD_gp 0                  // Watchdog Timeout Period group position
#define FUSE_PERIOD0_bm (1<<0)            // Watchdog Timeout Period bit 0 mask
#define FUSE_PERIOD0_bp 0                 // Watchdog Timeout Period bit 0 position
#define FUSE_PERIOD1_bm (1<<1)            // Watchdog Timeout Period bit 1 mask
#define FUSE_PERIOD1_bp 1                 // Watchdog Timeout Period bit 1 position
#define FUSE_PERIOD2_bm (1<<2)            // Watchdog Timeout Period bit 2 mask
#define FUSE_PERIOD2_bp 2                 // Watchdog Timeout Period bit 2 position
#define FUSE_PERIOD3_bm (1<<3)            // Watchdog Timeout Period bit 3 mask
#define FUSE_PERIOD3_bp 3                 // Watchdog Timeout Period bit 3 position
#define FUSE_WINDOW_gm 0xF0               // Watchdog Window Timeout Period group mask
#define FUSE_WINDOW_gp 4                  // Watchdog Window Timeout Period group position
#define FUSE_WINDOW0_bm (1<<4)            // Watchdog Window Timeout Period bit 0 mask
#define FUSE_WINDOW0_bp 4                 // Watchdog Window Timeout Period bit 0 position
#define FUSE_WINDOW1_bm (1<<5)            // Watchdog Window Timeout Period bit 1 mask
#define FUSE_WINDOW1_bp 5                 // Watchdog Window Timeout Period bit 1 position
#define FUSE_WINDOW2_bm (1<<6)            // Watchdog Window Timeout Period bit 2 mask
#define FUSE_WINDOW2_bp 6                 // Watchdog Window Timeout Period bit 2 position
#define FUSE_WINDOW3_bm (1<<7)            // Watchdog Window Timeout Period bit 3 mask
#define FUSE_WINDOW3_bp 7                 // Watchdog Window Timeout Period bit 3 position

// BOD Operation in Active Mode select
#define FUSE_ACTIVE_DIS_gc (0x00<<2)      // Disabled
#define FUSE_ACTIVE_ENABLED_gc (0x01<<2)  // Enabled
#define FUSE_ACTIVE_SAMPLED_gc (0x02<<2)  // Sampled
#define FUSE_ACTIVE_ENWAKE_gc (0x03<<2)   // Enabled with wake-up halted until BOD is ready

// BOD Level select
#define FUSE_LVL_BODLEVEL0_gc (0x00<<5)   // 1.8 V
#define FUSE_LVL_BODLEVEL1_gc (0x01<<5)   // 2.1 V
#define FUSE_LVL_BODLEVEL2_gc (0x02<<5)   // 2.6 V
#define FUSE_LVL_BODLEVEL3_gc (0x03<<5)   // 2.9 V
#define FUSE_LVL_BODLEVEL4_gc (0x04<<5)   // 3.3 V
#define FUSE_LVL_BODLEVEL5_gc (0x05<<5)   // 3.7 V
#define FUSE_LVL_BODLEVEL6_gc (0x06<<5)   // 4.0 V
#define FUSE_LVL_BODLEVEL7_gc (0x07<<5)   // 4.2 V

// BOD Sample Frequency select
#define FUSE_SAMPFREQ_1KHZ_gc (0x00<<4)   // 1kHz sampling frequency
#define FUSE_SAMPFREQ_125HZ_gc (0x01<<4)  // 125kHz sampling frequency

// BOD Operation in Sleep Mode select
#define FUSE_SLEEP_DIS_gc (0x00<<0)       // Disabled
#define FUSE_SLEEP_ENABLED_gc (0x01<<0)   // Enabled
#define FUSE_SLEEP_SAMPLED_gc (0x02<<0)   // Sampled

// Frequency Select select
#define FUSE_FREQSEL_16MHZ_gc (0x01<<0)   // 16 MHz
#define FUSE_FREQSEL_20MHZ_gc (0x02<<0)   // 20 MHz

// CRC Source select
#define FUSE_CRCSRC_FLASH_gc (0x00<<6)    // The CRC is performed on the entire Flash (boot, application code and application data section).
#define FUSE_CRCSRC_BOOT_gc (0x01<<6)     // The CRC is performed on the boot section of Flash
#define FUSE_CRCSRC_BOOTAPP_gc (0x02<<6)  // The CRC is performed on the boot and application code section of Flash
#define FUSE_CRCSRC_NOCRC_gc (0x03<<6)    // Disable CRC.

// Reset Pin Configuration select
#define FUSE_RSTPINCFG_GPIO_gc (0x00<<2)  // GPIO mode
#define FUSE_RSTPINCFG_UPDI_gc (0x01<<2)  // UPDI mode
#define FUSE_RSTPINCFG_RST_gc (0x02<<2)   // Reset mode

// Startup Time select
#define FUSE_SUT_0MS_gc (0x00<<0)         // 0 ms
#define FUSE_SUT_1MS_gc (0x01<<0)         // 1 ms
#define FUSE_SUT_2MS_gc (0x02<<0)         // 2 ms
#define FUSE_SUT_4MS_gc (0x03<<0)         // 4 ms
#define FUSE_SUT_8MS_gc (0x04<<0)         // 8 ms
#define FUSE_SUT_16MS_gc (0x05<<0)        // 16 ms
#define FUSE_SUT_32MS_gc (0x06<<0)        // 32 ms
#define FUSE_SUT_64MS_gc (0x07<<0)        // 64 ms

// Watchdog Timeout Period select
#define FUSE_PERIOD_OFF_gc (0x00<<0)      // Off
#define FUSE_PERIOD_8CLK_gc (0x01<<0)     // 8 cycles (8ms)
#define FUSE_PERIOD_16CLK_gc (0x02<<0)    // 16 cycles (16ms)
#define FUSE_PERIOD_32CLK_gc (0x03<<0)    // 32 cycles (32ms)
#define FUSE_PERIOD_64CLK_gc (0x04<<0)    // 64 cycles (64ms)
#define FUSE_PERIOD_128CLK_gc (0x05<<0)   // 128 cycles (0.128s)
#define FUSE_PERIOD_256CLK_gc (0x06<<0)   // 256 cycles (0.256s)
#define FUSE_PERIOD_512CLK_gc (0x07<<0)   // 512 cycles (0.512s)
#define FUSE_PERIOD_1KCLK_gc (0x08<<0)    // 1K cycles (1.0s)
#define FUSE_PERIOD_2KCLK_gc (0x09<<0)    // 2K cycles (2.0s)
#define FUSE_PERIOD_4KCLK_gc (0x0A<<0)    // 4K cycles (4.1s)
#define FUSE_PERIOD_8KCLK_gc (0x0B<<0)    // 8K cycles (8.2s)

// Watchdog Window Timeout Period select
#define FUSE_WINDOW_OFF_gc (0x00<<4)      // Off
#define FUSE_WINDOW_8CLK_gc (0x01<<4)     // 8 cycles (8ms)
#define FUSE_WINDOW_16CLK_gc (0x02<<4)    // 16 cycles (16ms)
#define FUSE_WINDOW_32CLK_gc (0x03<<4)    // 32 cycles (32ms)
#define FUSE_WINDOW_64CLK_gc (0x04<<4)    // 64 cycles (64ms)
#define FUSE_WINDOW_128CLK_gc (0x05<<4)   // 128 cycles (0.128s)
#define FUSE_WINDOW_256CLK_gc (0x06<<4)   // 256 cycles (0.256s)
#define FUSE_WINDOW_512CLK_gc (0x07<<4)   // 512 cycles (0.512s)
#define FUSE_WINDOW_1KCLK_gc (0x08<<4)    // 1K cycles (1.0s)
#define FUSE_WINDOW_2KCLK_gc (0x09<<4)    // 2K cycles (2.0s)
#define FUSE_WINDOW_4KCLK_gc (0x0A<<4)    // 4K cycles (4.1s)
#define FUSE_WINDOW_8KCLK_gc (0x0B<<4)    // 8K cycles (8.2s)


//*************************************************************************
//** GPIO - General Purpose IO
//*************************************************************************


//*************************************************************************
//** LOCKBIT - Lockbit
//*************************************************************************

// LOCKBIT_LOCKBIT masks
#define LOCKBIT_LB_gm 0xFF                // Lock Bits group mask
#define LOCKBIT_LB_gp 0                   // Lock Bits group position
#define LOCKBIT_LB0_bm (1<<0)             // Lock Bits bit 0 mask
#define LOCKBIT_LB0_bp 0                  // Lock Bits bit 0 position
#define LOCKBIT_LB1_bm (1<<1)             // Lock Bits bit 1 mask
#define LOCKBIT_LB1_bp 1                  // Lock Bits bit 1 position
#define LOCKBIT_LB2_bm (1<<2)             // Lock Bits bit 2 mask
#define LOCKBIT_LB2_bp 2                  // Lock Bits bit 2 position
#define LOCKBIT_LB3_bm (1<<3)             // Lock Bits bit 3 mask
#define LOCKBIT_LB3_bp 3                  // Lock Bits bit 3 position
#define LOCKBIT_LB4_bm (1<<4)             // Lock Bits bit 4 mask
#define LOCKBIT_LB4_bp 4                  // Lock Bits bit 4 position
#define LOCKBIT_LB5_bm (1<<5)             // Lock Bits bit 5 mask
#define LOCKBIT_LB5_bp 5                  // Lock Bits bit 5 position
#define LOCKBIT_LB6_bm (1<<6)             // Lock Bits bit 6 mask
#define LOCKBIT_LB6_bp 6                  // Lock Bits bit 6 position
#define LOCKBIT_LB7_bm (1<<7)             // Lock Bits bit 7 mask
#define LOCKBIT_LB7_bp 7                  // Lock Bits bit 7 position

// Lock Bits select
#define LOCKBIT_LB_RWLOCK_gc (0x3A<<0)    // Read and write lock
#define LOCKBIT_LB_NOLOCK_gc (0xC5<<0)    // No locks


//*************************************************************************
//** NVMCTRL - Non-volatile Memory Controller
//*************************************************************************

// NVMCTRL_CTRLA masks
#define NVMCTRL_CMD_gm 0x07               // Command group mask
#define NVMCTRL_CMD_gp 0                  // Command group position
#define NVMCTRL_CMD0_bm (1<<0)            // Command bit 0 mask
#define NVMCTRL_CMD0_bp 0                 // Command bit 0 position
#define NVMCTRL_CMD1_bm (1<<1)            // Command bit 1 mask
#define NVMCTRL_CMD1_bp 1                 // Command bit 1 position
#define NVMCTRL_CMD2_bm (1<<2)            // Command bit 2 mask
#define NVMCTRL_CMD2_bp 2                 // Command bit 2 position

// NVMCTRL_CTRLB masks
#define NVMCTRL_APCWP_bm 0x01             // Application code write protect bit mask
#define NVMCTRL_APCWP_bp 0                // Application code write protect bit position
#define NVMCTRL_BOOTLOCK_bm 0x02          // Boot Lock bit mask
#define NVMCTRL_BOOTLOCK_bp 1             // Boot Lock bit position

// NVMCTRL_INTCTRL masks
#define NVMCTRL_EEREADY_bm 0x01           // EEPROM Ready bit mask
#define NVMCTRL_EEREADY_bp 0              // EEPROM Ready bit position

// NVMCTRL_INTFLAGS masks
// Masks for NVMCTRL_EEREADY already defined

// NVMCTRL_STATUS masks
#define NVMCTRL_EEBUSY_bm 0x02            // EEPROM busy bit mask
#define NVMCTRL_EEBUSY_bp 1               // EEPROM busy bit position
#define NVMCTRL_FBUSY_bm 0x01             // Flash busy bit mask
#define NVMCTRL_FBUSY_bp 0                // Flash busy bit position
#define NVMCTRL_WRERROR_bm 0x04           // Write error bit mask
#define NVMCTRL_WRERROR_bp 2              // Write error bit position

// Command select
#define NVMCTRL_CMD_NONE_gc (0x00<<0)     // No Command
#define NVMCTRL_CMD_PAGEWRITE_gc (0x01<<0) // Write page
#define NVMCTRL_CMD_PAGEERASE_gc (0x02<<0) // Erase page
#define NVMCTRL_CMD_PAGEERASEWRITE_gc (0x03<<0) // Erase and write page
#define NVMCTRL_CMD_PAGEBUFCLR_gc (0x04<<0) // Page buffer clear
#define NVMCTRL_CMD_CHIPERASE_gc (0x05<<0) // Chip erase
#define NVMCTRL_CMD_EEERASE_gc (0x06<<0)  // EEPROM erase
#define NVMCTRL_CMD_FUSEWRITE_gc (0x07<<0) // Write fuse (PDI only)


//*************************************************************************
//** PORT - I/O Ports
//*************************************************************************

// PORT_INTFLAGS masks
#define PORT_INT_gm 0xFF                  // Pin Interrupt group mask
#define PORT_INT_gp 0                     // Pin Interrupt group position
#define PORT_INT0_bm (1<<0)               // Pin Interrupt bit 0 mask
#define PORT_INT0_bp 0                    // Pin Interrupt bit 0 position
#define PORT_INT1_bm (1<<1)               // Pin Interrupt bit 1 mask
#define PORT_INT1_bp 1                    // Pin Interrupt bit 1 position
#define PORT_INT2_bm (1<<2)               // Pin Interrupt bit 2 mask
#define PORT_INT2_bp 2                    // Pin Interrupt bit 2 position
#define PORT_INT3_bm (1<<3)               // Pin Interrupt bit 3 mask
#define PORT_INT3_bp 3                    // Pin Interrupt bit 3 position
#define PORT_INT4_bm (1<<4)               // Pin Interrupt bit 4 mask
#define PORT_INT4_bp 4                    // Pin Interrupt bit 4 position
#define PORT_INT5_bm (1<<5)               // Pin Interrupt bit 5 mask
#define PORT_INT5_bp 5                    // Pin Interrupt bit 5 position
#define PORT_INT6_bm (1<<6)               // Pin Interrupt bit 6 mask
#define PORT_INT6_bp 6                    // Pin Interrupt bit 6 position
#define PORT_INT7_bm (1<<7)               // Pin Interrupt bit 7 mask
#define PORT_INT7_bp 7                    // Pin Interrupt bit 7 position

// PORT_PIN0CTRL masks
#define PORT_INVEN_bm 0x80                // Inverted I/O Enable bit mask
#define PORT_INVEN_bp 7                   // Inverted I/O Enable bit position
#define PORT_ISC_gm 0x07                  // Input/Sense Configuration group mask
#define PORT_ISC_gp 0                     // Input/Sense Configuration group position
#define PORT_ISC0_bm (1<<0)               // Input/Sense Configuration bit 0 mask
#define PORT_ISC0_bp 0                    // Input/Sense Configuration bit 0 position
#define PORT_ISC1_bm (1<<1)               // Input/Sense Configuration bit 1 mask
#define PORT_ISC1_bp 1                    // Input/Sense Configuration bit 1 position
#define PORT_ISC2_bm (1<<2)               // Input/Sense Configuration bit 2 mask
#define PORT_ISC2_bp 2                    // Input/Sense Configuration bit 2 position
#define PORT_PULLUPEN_bm 0x08             // Pullup enable bit mask
#define PORT_PULLUPEN_bp 3                // Pullup enable bit position

// PORT_PIN1CTRL masks
// Masks for PORT_INVEN already defined
// Masks for PORT_ISC already defined
// Masks for PORT_PULLUPEN already defined

// PORT_PIN2CTRL masks
// Masks for PORT_INVEN already defined
// Masks for PORT_ISC already defined
// Masks for PORT_PULLUPEN already defined

// PORT_PIN3CTRL masks
// Masks for PORT_INVEN already defined
// Masks for PORT_ISC already defined
// Masks for PORT_PULLUPEN already defined

// PORT_PIN4CTRL masks
// Masks for PORT_INVEN already defined
// Masks for PORT_ISC already defined
// Masks for PORT_PULLUPEN already defined

// PORT_PIN5CTRL masks
// Masks for PORT_INVEN already defined
// Masks for PORT_ISC already defined
// Masks for PORT_PULLUPEN already defined

// PORT_PIN6CTRL masks
// Masks for PORT_INVEN already defined
// Masks for PORT_ISC already defined
// Masks for PORT_PULLUPEN already defined

// PORT_PIN7CTRL masks
// Masks for PORT_INVEN already defined
// Masks for PORT_ISC already defined
// Masks for PORT_PULLUPEN already defined

// Input/Sense Configuration select
#define PORT_ISC_INTDISABLE_gc (0x00<<0)  // Interrupt disabled but input buffer enabled
#define PORT_ISC_BOTHEDGES_gc (0x01<<0)   // Sense Both Edges
#define PORT_ISC_RISING_gc (0x02<<0)      // Sense Rising Edge
#define PORT_ISC_FALLING_gc (0x03<<0)     // Sense Falling Edge
#define PORT_ISC_INPUT_DISABLE_gc (0x04<<0) // Digital Input Buffer disabled
#define PORT_ISC_LEVEL_gc (0x05<<0)       // Sense low Level


//*************************************************************************
//** PORTMUX - Port Multiplexer
//*************************************************************************

// PORTMUX_CTRLA masks
#define PORTMUX_EVOUT0_bm 0x01            // Event Output 0 bit mask
#define PORTMUX_EVOUT0_bp 0               // Event Output 0 bit position
#define PORTMUX_EVOUT1_bm 0x02            // Event Output 1 bit mask
#define PORTMUX_EVOUT1_bp 1               // Event Output 1 bit position
#define PORTMUX_EVOUT2_bm 0x04            // Event Output 2 bit mask
#define PORTMUX_EVOUT2_bp 2               // Event Output 2 bit position
#define PORTMUX_LUT0_bm 0x10              // Configurable Custom Logic LUT0 bit mask
#define PORTMUX_LUT0_bp 4                 // Configurable Custom Logic LUT0 bit position
#define PORTMUX_LUT1_bm 0x20              // Configurable Custom Logic LUT1 bit mask
#define PORTMUX_LUT1_bp 5                 // Configurable Custom Logic LUT1 bit position

// PORTMUX_CTRLB masks
#define PORTMUX_SPI0_bm 0x04              // Port Multiplexer SPI0 bit mask
#define PORTMUX_SPI0_bp 2                 // Port Multiplexer SPI0 bit position
#define PORTMUX_TWI0_bm 0x10              // Port Multiplexer TWI0 bit mask
#define PORTMUX_TWI0_bp 4                 // Port Multiplexer TWI0 bit position
#define PORTMUX_USART0_bm 0x01            // Port Multiplexer USART0 bit mask
#define PORTMUX_USART0_bp 0               // Port Multiplexer USART0 bit position

// PORTMUX_CTRLC masks
#define PORTMUX_TCA00_bm 0x01             // Port Multiplexer TCA0 Output 0 bit mask
#define PORTMUX_TCA00_bp 0                // Port Multiplexer TCA0 Output 0 bit position
#define PORTMUX_TCA01_bm 0x02             // Port Multiplexer TCA0 output 1 bit mask
#define PORTMUX_TCA01_bp 1                // Port Multiplexer TCA0 output 1 bit position
#define PORTMUX_TCA02_bm 0x04             // Port Multiplexer TCA0 Output 2 bit mask
#define PORTMUX_TCA02_bp 2                // Port Multiplexer TCA0 Output 2 bit position
#define PORTMUX_TCA03_bm 0x08             // Port Multiplexer TCA0 Output 3 bit mask
#define PORTMUX_TCA03_bp 3                // Port Multiplexer TCA0 Output 3 bit position
#define PORTMUX_TCA04_bm 0x10             // Port Multiplexer TCA0 Output 4 bit mask
#define PORTMUX_TCA04_bp 4                // Port Multiplexer TCA0 Output 4 bit position
#define PORTMUX_TCA05_bm 0x20             // Port Multiplexer TCA0 Output 5 bit mask
#define PORTMUX_TCA05_bp 5                // Port Multiplexer TCA0 Output 5 bit position

// PORTMUX_CTRLD masks
#define PORTMUX_TCB0_bm 0x01              // Port Multiplexer TCB bit mask
#define PORTMUX_TCB0_bp 0                 // Port Multiplexer TCB bit position

// Configurable Custom Logic LUT0 select
#define PORTMUX_LUT0_DEFAULT_gc (0x00<<4) // Default pin
#define PORTMUX_LUT0_ALTERNATE_gc (0x01<<4) // Alternate pin

// Configurable Custom Logic LUT1 select
#define PORTMUX_LUT1_DEFAULT_gc (0x00<<5) // Default pin
#define PORTMUX_LUT1_ALTERNATE_gc (0x01<<5) // Alternate pin

// Port Multiplexer SPI0 select
#define PORTMUX_SPI0_DEFAULT_gc (0x00<<2) // Default pins
#define PORTMUX_SPI0_ALTERNATE_gc (0x01<<2) // Alternate pins

// Port Multiplexer TWI0 select
#define PORTMUX_TWI0_DEFAULT_gc (0x00<<4) // Default pins
#define PORTMUX_TWI0_ALTERNATE_gc (0x01<<4) // Alternate pins

// Port Multiplexer USART0 select
#define PORTMUX_USART0_DEFAULT_gc (0x00<<0) // Default pins
#define PORTMUX_USART0_ALTERNATE_gc (0x01<<0) // Alternate pins

// Port Multiplexer TCA0 Output 0 select
#define PORTMUX_TCA00_DEFAULT_gc (0x00<<0) // Default pin
#define PORTMUX_TCA00_ALTERNATE_gc (0x01<<0) // Alternate pin

// Port Multiplexer TCA0 output 1 select
#define PORTMUX_TCA01_DEFAULT_gc (0x00<<1) // Default pin
#define PORTMUX_TCA01_ALTERNATE_gc (0x01<<1) // Alternate pin

// Port Multiplexer TCA0 Output 2 select
#define PORTMUX_TCA02_DEFAULT_gc (0x00<<2) // Default pin
#define PORTMUX_TCA02_ALTERNATE_gc (0x01<<2) // Alternate pin

// Port Multiplexer TCA0 Output 3 select
#define PORTMUX_TCA03_DEFAULT_gc (0x00<<3) // Default pin
#define PORTMUX_TCA03_ALTERNATE_gc (0x01<<3) // Alternate pin

// Port Multiplexer TCA0 Output 4 select
#define PORTMUX_TCA04_DEFAULT_gc (0x00<<4) // Default pin
#define PORTMUX_TCA04_ALTERNATE_gc (0x01<<4) // Alternate pin

// Port Multiplexer TCA0 Output 5 select
#define PORTMUX_TCA05_DEFAULT_gc (0x00<<5) // Default pin
#define PORTMUX_TCA05_ALTERNATE_gc (0x01<<5) // Alternate pin

// Port Multiplexer TCB select
#define PORTMUX_TCB0_DEFAULT_gc (0x00<<0) // Default pin
#define PORTMUX_TCB0_ALTERNATE_gc (0x01<<0) // Alternate pin


//*************************************************************************
//** PTC - Peripherial Touch Controller
//*************************************************************************


//*************************************************************************
//** RSTCTRL - Reset controller
//*************************************************************************

// RSTCTRL_RSTFR masks
#define RSTCTRL_BORF_bm 0x02              // Brown out detector Reset flag bit mask
#define RSTCTRL_BORF_bp 1                 // Brown out detector Reset flag bit position
#define RSTCTRL_EXTRF_bm 0x04             // External Reset flag bit mask
#define RSTCTRL_EXTRF_bp 2                // External Reset flag bit position
#define RSTCTRL_PORF_bm 0x01              // Power on Reset flag bit mask
#define RSTCTRL_PORF_bp 0                 // Power on Reset flag bit position
#define RSTCTRL_SWRF_bm 0x10              // Software Reset flag bit mask
#define RSTCTRL_SWRF_bp 4                 // Software Reset flag bit position
#define RSTCTRL_UPDIRF_bm 0x20            // UPDI Reset flag bit mask
#define RSTCTRL_UPDIRF_bp 5               // UPDI Reset flag bit position
#define RSTCTRL_WDRF_bm 0x08              // Watch dog Reset flag bit mask
#define RSTCTRL_WDRF_bp 3                 // Watch dog Reset flag bit position

// RSTCTRL_SWRR masks
#define RSTCTRL_SWRE_bm 0x01              // Software reset enable bit mask
#define RSTCTRL_SWRE_bp 0                 // Software reset enable bit position


//*************************************************************************
//** RTC - Real-Time Counter
//*************************************************************************

// RTC_CLKSEL masks
#define RTC_CLKSEL_gm 0x03                // Clock Select group mask
#define RTC_CLKSEL_gp 0                   // Clock Select group position
#define RTC_CLKSEL0_bm (1<<0)             // Clock Select bit 0 mask
#define RTC_CLKSEL0_bp 0                  // Clock Select bit 0 position
#define RTC_CLKSEL1_bm (1<<1)             // Clock Select bit 1 mask
#define RTC_CLKSEL1_bp 1                  // Clock Select bit 1 position

// RTC_CTRLA masks
#define RTC_PRESCALER_gm 0x78             // Prescaling Factor group mask
#define RTC_PRESCALER_gp 3                // Prescaling Factor group position
#define RTC_PRESCALER0_bm (1<<3)          // Prescaling Factor bit 0 mask
#define RTC_PRESCALER0_bp 3               // Prescaling Factor bit 0 position
#define RTC_PRESCALER1_bm (1<<4)          // Prescaling Factor bit 1 mask
#define RTC_PRESCALER1_bp 4               // Prescaling Factor bit 1 position
#define RTC_PRESCALER2_bm (1<<5)          // Prescaling Factor bit 2 mask
#define RTC_PRESCALER2_bp 5               // Prescaling Factor bit 2 position
#define RTC_PRESCALER3_bm (1<<6)          // Prescaling Factor bit 3 mask
#define RTC_PRESCALER3_bp 6               // Prescaling Factor bit 3 position
#define RTC_RTCEN_bm 0x01                 // Enable bit mask
#define RTC_RTCEN_bp 0                    // Enable bit position
#define RTC_RUNSTDBY_bm 0x80              // Run In Standby bit mask
#define RTC_RUNSTDBY_bp 7                 // Run In Standby bit position

// RTC_DBGCTRL masks
#define RTC_DBGRUN_bm 0x01                // Run in debug bit mask
#define RTC_DBGRUN_bp 0                   // Run in debug bit position

// RTC_INTCTRL masks
#define RTC_CMP_bm 0x02                   // Compare Match Interrupt enable bit mask
#define RTC_CMP_bp 1                      // Compare Match Interrupt enable bit position
#define RTC_OVF_bm 0x01                   // Overflow Interrupt enable bit mask
#define RTC_OVF_bp 0                      // Overflow Interrupt enable bit position

// RTC_INTFLAGS masks
// Masks for RTC_CMP already defined
// Masks for RTC_OVF already defined

// RTC_PITCTRLA masks
#define RTC_PERIOD_gm 0x78                // Period group mask
#define RTC_PERIOD_gp 3                   // Period group position
#define RTC_PERIOD0_bm (1<<3)             // Period bit 0 mask
#define RTC_PERIOD0_bp 3                  // Period bit 0 position
#define RTC_PERIOD1_bm (1<<4)             // Period bit 1 mask
#define RTC_PERIOD1_bp 4                  // Period bit 1 position
#define RTC_PERIOD2_bm (1<<5)             // Period bit 2 mask
#define RTC_PERIOD2_bp 5                  // Period bit 2 position
#define RTC_PERIOD3_bm (1<<6)             // Period bit 3 mask
#define RTC_PERIOD3_bp 6                  // Period bit 3 position
#define RTC_PITEN_bm 0x01                 // Enable bit mask
#define RTC_PITEN_bp 0                    // Enable bit position

// RTC_PITDBGCTRL masks
// Masks for RTC_DBGRUN already defined

// RTC_PITINTCTRL masks
#define RTC_PI_bm 0x01                    // Periodic Interrupt bit mask
#define RTC_PI_bp 0                       // Periodic Interrupt bit position

// RTC_PITINTFLAGS masks
// Masks for RTC_PI already defined

// RTC_PITSTATUS masks
#define RTC_CTRLBUSY_bm 0x01              // CTRLA Synchronization Busy Flag bit mask
#define RTC_CTRLBUSY_bp 0                 // CTRLA Synchronization Busy Flag bit position

// RTC_STATUS masks
#define RTC_CMPBUSY_bm 0x08               // Comparator Synchronization Busy Flag bit mask
#define RTC_CMPBUSY_bp 3                  // Comparator Synchronization Busy Flag bit position
#define RTC_CNTBUSY_bm 0x02               // Count Synchronization Busy Flag bit mask
#define RTC_CNTBUSY_bp 1                  // Count Synchronization Busy Flag bit position
#define RTC_CTRLABUSY_bm 0x01             // CTRLA Synchronization Busy Flag bit mask
#define RTC_CTRLABUSY_bp 0                // CTRLA Synchronization Busy Flag bit position
#define RTC_PERBUSY_bm 0x04               // Period Synchronization Busy Flag bit mask
#define RTC_PERBUSY_bp 2                  // Period Synchronization Busy Flag bit position

// Clock Select select
#define RTC_CLKSEL_INT32K_gc (0x00<<0)    // Internal 32kHz OSC
#define RTC_CLKSEL_INT1K_gc (0x01<<0)     // Internal 1kHz OSC
#define RTC_CLKSEL_TOSC32K_gc (0x02<<0)   // 32KHz Crystal OSC
#define RTC_CLKSEL_EXTCLK_gc (0x03<<0)    // External Clock

// Prescaling Factor select
#define RTC_PRESCALER_DIV1_gc (0x00<<3)   // RTC Clock / 1
#define RTC_PRESCALER_DIV2_gc (0x01<<3)   // RTC Clock / 2
#define RTC_PRESCALER_DIV4_gc (0x02<<3)   // RTC Clock / 4
#define RTC_PRESCALER_DIV8_gc (0x03<<3)   // RTC Clock / 8
#define RTC_PRESCALER_DIV16_gc (0x04<<3)  // RTC Clock / 16
#define RTC_PRESCALER_DIV32_gc (0x05<<3)  // RTC Clock / 32
#define RTC_PRESCALER_DIV64_gc (0x06<<3)  // RTC Clock / 64
#define RTC_PRESCALER_DIV128_gc (0x07<<3) // RTC Clock / 128
#define RTC_PRESCALER_DIV256_gc (0x08<<3) // RTC Clock / 256
#define RTC_PRESCALER_DIV512_gc (0x09<<3) // RTC Clock / 512
#define RTC_PRESCALER_DIV1024_gc (0x0A<<3) // RTC Clock / 1024
#define RTC_PRESCALER_DIV2048_gc (0x0B<<3) // RTC Clock / 2048
#define RTC_PRESCALER_DIV4096_gc (0x0C<<3) // RTC Clock / 4096
#define RTC_PRESCALER_DIV8192_gc (0x0D<<3) // RTC Clock / 8192
#define RTC_PRESCALER_DIV16384_gc (0x0E<<3) // RTC Clock / 16384
#define RTC_PRESCALER_DIV32768_gc (0x0F<<3) // RTC Clock / 32768

// Period select
#define RTC_PERIOD_OFF_gc (0x00<<3)       // Off
#define RTC_PERIOD_CYC4_gc (0x01<<3)      // RTC Clock Cycles 4
#define RTC_PERIOD_CYC8_gc (0x02<<3)      // RTC Clock Cycles 8
#define RTC_PERIOD_CYC16_gc (0x03<<3)     // RTC Clock Cycles 16
#define RTC_PERIOD_CYC32_gc (0x04<<3)     // RTC Clock Cycles 32
#define RTC_PERIOD_CYC64_gc (0x05<<3)     // RTC Clock Cycles 64
#define RTC_PERIOD_CYC128_gc (0x06<<3)    // RTC Clock Cycles 128
#define RTC_PERIOD_CYC256_gc (0x07<<3)    // RTC Clock Cycles 256
#define RTC_PERIOD_CYC512_gc (0x08<<3)    // RTC Clock Cycles 512
#define RTC_PERIOD_CYC1024_gc (0x09<<3)   // RTC Clock Cycles 1024
#define RTC_PERIOD_CYC2048_gc (0x0A<<3)   // RTC Clock Cycles 2048
#define RTC_PERIOD_CYC4096_gc (0x0B<<3)   // RTC Clock Cycles 4096
#define RTC_PERIOD_CYC8192_gc (0x0C<<3)   // RTC Clock Cycles 8192
#define RTC_PERIOD_CYC16384_gc (0x0D<<3)  // RTC Clock Cycles 16384
#define RTC_PERIOD_CYC32768_gc (0x0E<<3)  // RTC Clock Cycles 32768


//*************************************************************************
//** SIGROW - Signature row
//*************************************************************************


//*************************************************************************
//** SLPCTRL - Sleep Controller
//*************************************************************************

// SLPCTRL_CTRLA masks
#define SLPCTRL_SEN_bm 0x01               // Sleep enable bit mask
#define SLPCTRL_SEN_bp 0                  // Sleep enable bit position
#define SLPCTRL_SMODE_gm 0x06             // Sleep mode group mask
#define SLPCTRL_SMODE_gp 1                // Sleep mode group position
#define SLPCTRL_SMODE0_bm (1<<1)          // Sleep mode bit 0 mask
#define SLPCTRL_SMODE0_bp 1               // Sleep mode bit 0 position
#define SLPCTRL_SMODE1_bm (1<<2)          // Sleep mode bit 1 mask
#define SLPCTRL_SMODE1_bp 2               // Sleep mode bit 1 position

// Sleep mode select
#define SLPCTRL_SMODE_IDLE_gc (0x00<<1)   // Idle mode
#define SLPCTRL_SMODE_STDBY_gc (0x01<<1)  // Standby Mode
#define SLPCTRL_SMODE_PDOWN_gc (0x02<<1)  // Power-down Mode


//*************************************************************************
//** SPI - Serial Peripheral Interface
//*************************************************************************

// SPI_CTRLA masks
#define SPI_CLK2X_bm 0x10                 // Enable Double Speed bit mask
#define SPI_CLK2X_bp 4                    // Enable Double Speed bit position
#define SPI_DORD_bm 0x40                  // Data Order Setting bit mask
#define SPI_DORD_bp 6                     // Data Order Setting bit position
#define SPI_ENABLE_bm 0x01                // Enable Module bit mask
#define SPI_ENABLE_bp 0                   // Enable Module bit position
#define SPI_MASTER_bm 0x20                // Master Operation Enable bit mask
#define SPI_MASTER_bp 5                   // Master Operation Enable bit position
#define SPI_PRESC_gm 0x06                 // Prescaler group mask
#define SPI_PRESC_gp 1                    // Prescaler group position
#define SPI_PRESC0_bm (1<<1)              // Prescaler bit 0 mask
#define SPI_PRESC0_bp 1                   // Prescaler bit 0 position
#define SPI_PRESC1_bm (1<<2)              // Prescaler bit 1 mask
#define SPI_PRESC1_bp 2                   // Prescaler bit 1 position

// SPI_CTRLB masks
#define SPI_BUFEN_bm 0x80                 // Buffer Mode Enable bit mask
#define SPI_BUFEN_bp 7                    // Buffer Mode Enable bit position
#define SPI_BUFWR_bm 0x40                 // Buffer Write Mode bit mask
#define SPI_BUFWR_bp 6                    // Buffer Write Mode bit position
#define SPI_MODE_gm 0x03                  // SPI Mode group mask
#define SPI_MODE_gp 0                     // SPI Mode group position
#define SPI_MODE0_bm (1<<0)               // SPI Mode bit 0 mask
#define SPI_MODE0_bp 0                    // SPI Mode bit 0 position
#define SPI_MODE1_bm (1<<1)               // SPI Mode bit 1 mask
#define SPI_MODE1_bp 1                    // SPI Mode bit 1 position
#define SPI_SSD_bm 0x04                   // Slave Select Disable bit mask
#define SPI_SSD_bp 2                      // Slave Select Disable bit position

// SPI_INTCTRL masks
#define SPI_DREIE_bm 0x20                 // Data Register Empty Interrupt Enable bit mask
#define SPI_DREIE_bp 5                    // Data Register Empty Interrupt Enable bit position
#define SPI_IE_bm 0x01                    // Interrupt Enable bit mask
#define SPI_IE_bp 0                       // Interrupt Enable bit position
#define SPI_RXCIE_bm 0x80                 // Receive Complete Interrupt Enable bit mask
#define SPI_RXCIE_bp 7                    // Receive Complete Interrupt Enable bit position
#define SPI_SSIE_bm 0x10                  // Slave Select Trigger Interrupt Enable bit mask
#define SPI_SSIE_bp 4                     // Slave Select Trigger Interrupt Enable bit position
#define SPI_TXCIE_bm 0x40                 // Transfer Complete Interrupt Enable bit mask
#define SPI_TXCIE_bp 6                    // Transfer Complete Interrupt Enable bit position

// SPI_INTFLAGS masks
#define SPI_BUFOVF_bm 0x01                // Buffer Overflow bit mask
#define SPI_BUFOVF_bp 0                   // Buffer Overflow bit position
#define SPI_DREIF_bm 0x20                 // Data Register Empty Interrupt Flag bit mask
#define SPI_DREIF_bp 5                    // Data Register Empty Interrupt Flag bit position
#define SPI_RXCIF_bm 0x80                 // Receive Complete Interrupt Flag bit mask
#define SPI_RXCIF_bp 7                    // Receive Complete Interrupt Flag bit position
#define SPI_SSIF_bm 0x10                  // Slave Select Trigger Interrupt Flag bit mask
#define SPI_SSIF_bp 4                     // Slave Select Trigger Interrupt Flag bit position
#define SPI_TXCIF_bm 0x40                 // Transfer Complete Interrupt Flag bit mask
#define SPI_TXCIF_bp 6                    // Transfer Complete Interrupt Flag bit position
#define SPI_IF_bm 0x80                    // Interrupt Flag bit mask
#define SPI_IF_bp 7                       // Interrupt Flag bit position
#define SPI_WRCOL_bm 0x40                 // Write Collision bit mask
#define SPI_WRCOL_bp 6                    // Write Collision bit position

// Prescaler select
#define SPI_PRESC_DIV4_gc (0x00<<1)       // System Clock / 4
#define SPI_PRESC_DIV16_gc (0x01<<1)      // System Clock / 16
#define SPI_PRESC_DIV64_gc (0x02<<1)      // System Clock / 64
#define SPI_PRESC_DIV128_gc (0x03<<1)     // System Clock / 128

// SPI Mode select
#define SPI_MODE_0_gc (0x00<<0)           // SPI Mode 0
#define SPI_MODE_1_gc (0x01<<0)           // SPI Mode 1
#define SPI_MODE_2_gc (0x02<<0)           // SPI Mode 2
#define SPI_MODE_3_gc (0x03<<0)           // SPI Mode 3


//*************************************************************************
//** SYSCFG - System Configuration Registers
//*************************************************************************

// SYSCFG_EXTBRK masks
#define SYSCFG_ENEXTBRK_bm 0x01           // External break enable bit mask
#define SYSCFG_ENEXTBRK_bp 0              // External break enable bit position


//*************************************************************************
//** TCA - 16-bit Timer/Counter Type A
//*************************************************************************

// TCA_SINGLE_CTRLA masks
#define TCA_SINGLE_CLKSEL_gm 0x0E         // Clock Selection group mask
#define TCA_SINGLE_CLKSEL_gp 1            // Clock Selection group position
#define TCA_SINGLE_CLKSEL0_bm (1<<1)      // Clock Selection bit 0 mask
#define TCA_SINGLE_CLKSEL0_bp 1           // Clock Selection bit 0 position
#define TCA_SINGLE_CLKSEL1_bm (1<<2)      // Clock Selection bit 1 mask
#define TCA_SINGLE_CLKSEL1_bp 2           // Clock Selection bit 1 position
#define TCA_SINGLE_CLKSEL2_bm (1<<3)      // Clock Selection bit 2 mask
#define TCA_SINGLE_CLKSEL2_bp 3           // Clock Selection bit 2 position
#define TCA_SINGLE_ENABLE_bm 0x01         // Module Enable bit mask
#define TCA_SINGLE_ENABLE_bp 0            // Module Enable bit position

// TCA_SINGLE_CTRLB masks
#define TCA_SINGLE_ALUPD_bm 0x08          // Auto Lock Update bit mask
#define TCA_SINGLE_ALUPD_bp 3             // Auto Lock Update bit position
#define TCA_SINGLE_CMP0EN_bm 0x10         // Compare 0 Enable bit mask
#define TCA_SINGLE_CMP0EN_bp 4            // Compare 0 Enable bit position
#define TCA_SINGLE_CMP1EN_bm 0x20         // Compare 1 Enable bit mask
#define TCA_SINGLE_CMP1EN_bp 5            // Compare 1 Enable bit position
#define TCA_SINGLE_CMP2EN_bm 0x40         // Compare 2 Enable bit mask
#define TCA_SINGLE_CMP2EN_bp 6            // Compare 2 Enable bit position
#define TCA_SINGLE_WGMODE_gm 0x07         // Waveform generation mode group mask
#define TCA_SINGLE_WGMODE_gp 0            // Waveform generation mode group position
#define TCA_SINGLE_WGMODE0_bm (1<<0)      // Waveform generation mode bit 0 mask
#define TCA_SINGLE_WGMODE0_bp 0           // Waveform generation mode bit 0 position
#define TCA_SINGLE_WGMODE1_bm (1<<1)      // Waveform generation mode bit 1 mask
#define TCA_SINGLE_WGMODE1_bp 1           // Waveform generation mode bit 1 position
#define TCA_SINGLE_WGMODE2_bm (1<<2)      // Waveform generation mode bit 2 mask
#define TCA_SINGLE_WGMODE2_bp 2           // Waveform generation mode bit 2 position

// TCA_SINGLE_CTRLC masks
#define TCA_SINGLE_CMP0OV_bm 0x01         // Compare 0 Waveform Output Value bit mask
#define TCA_SINGLE_CMP0OV_bp 0            // Compare 0 Waveform Output Value bit position
#define TCA_SINGLE_CMP1OV_bm 0x02         // Compare 1 Waveform Output Value bit mask
#define TCA_SINGLE_CMP1OV_bp 1            // Compare 1 Waveform Output Value bit position
#define TCA_SINGLE_CMP2OV_bm 0x04         // Compare 2 Waveform Output Value bit mask
#define TCA_SINGLE_CMP2OV_bp 2            // Compare 2 Waveform Output Value bit position

// TCA_SINGLE_CTRLD masks
#define TCA_SINGLE_SPLITM_bm 0x01         // Split Mode Enable bit mask
#define TCA_SINGLE_SPLITM_bp 0            // Split Mode Enable bit position

// TCA_SINGLE_CTRLECLR masks
#define TCA_SINGLE_CMD_gm 0x0C            // Command group mask
#define TCA_SINGLE_CMD_gp 2               // Command group position
#define TCA_SINGLE_CMD0_bm (1<<2)         // Command bit 0 mask
#define TCA_SINGLE_CMD0_bp 2              // Command bit 0 position
#define TCA_SINGLE_CMD1_bm (1<<3)         // Command bit 1 mask
#define TCA_SINGLE_CMD1_bp 3              // Command bit 1 position
#define TCA_SINGLE_DIR_bm 0x01            // Direction bit mask
#define TCA_SINGLE_DIR_bp 0               // Direction bit position
#define TCA_SINGLE_LUPD_bm 0x02           // Lock Update bit mask
#define TCA_SINGLE_LUPD_bp 1              // Lock Update bit position

// TCA_SINGLE_CTRLESET masks
// Masks for TCA_SINGLE_CMD already defined
// Masks for TCA_SINGLE_DIR already defined
// Masks for TCA_SINGLE_LUPD already defined

// TCA_SINGLE_CTRLFCLR masks
#define TCA_SINGLE_CMP0BV_bm 0x02         // Compare 0 Buffer Valid bit mask
#define TCA_SINGLE_CMP0BV_bp 1            // Compare 0 Buffer Valid bit position
#define TCA_SINGLE_CMP1BV_bm 0x04         // Compare 1 Buffer Valid bit mask
#define TCA_SINGLE_CMP1BV_bp 2            // Compare 1 Buffer Valid bit position
#define TCA_SINGLE_CMP2BV_bm 0x08         // Compare 2 Buffer Valid bit mask
#define TCA_SINGLE_CMP2BV_bp 3            // Compare 2 Buffer Valid bit position
#define TCA_SINGLE_PERBV_bm 0x01          // Period Buffer Valid bit mask
#define TCA_SINGLE_PERBV_bp 0             // Period Buffer Valid bit position

// TCA_SINGLE_CTRLFSET masks
// Masks for TCA_SINGLE_CMP0BV already defined
// Masks for TCA_SINGLE_CMP1BV already defined
// Masks for TCA_SINGLE_CMP2BV already defined
// Masks for TCA_SINGLE_PERBV already defined

// TCA_SINGLE_DBGCTRL masks
#define TCA_SINGLE_DBGRUN_bm 0x01         // Debug Run bit mask
#define TCA_SINGLE_DBGRUN_bp 0            // Debug Run bit position

// TCA_SINGLE_EVCTRL masks
#define TCA_SINGLE_CNTEI_bm 0x01          // Count on Event Input bit mask
#define TCA_SINGLE_CNTEI_bp 0             // Count on Event Input bit position
#define TCA_SINGLE_EVACT_gm 0x06          // Event Action group mask
#define TCA_SINGLE_EVACT_gp 1             // Event Action group position
#define TCA_SINGLE_EVACT0_bm (1<<1)       // Event Action bit 0 mask
#define TCA_SINGLE_EVACT0_bp 1            // Event Action bit 0 position
#define TCA_SINGLE_EVACT1_bm (1<<2)       // Event Action bit 1 mask
#define TCA_SINGLE_EVACT1_bp 2            // Event Action bit 1 position

// TCA_SINGLE_INTCTRL masks
#define TCA_SINGLE_CMP0_bm 0x10           // Compare 0 Interrupt bit mask
#define TCA_SINGLE_CMP0_bp 4              // Compare 0 Interrupt bit position
#define TCA_SINGLE_CMP1_bm 0x20           // Compare 1 Interrupt bit mask
#define TCA_SINGLE_CMP1_bp 5              // Compare 1 Interrupt bit position
#define TCA_SINGLE_CMP2_bm 0x40           // Compare 2 Interrupt bit mask
#define TCA_SINGLE_CMP2_bp 6              // Compare 2 Interrupt bit position
#define TCA_SINGLE_OVF_bm 0x01            // Overflow Interrupt bit mask
#define TCA_SINGLE_OVF_bp 0               // Overflow Interrupt bit position

// TCA_SINGLE_INTFLAGS masks
// Masks for TCA_SINGLE_CMP0 already defined
// Masks for TCA_SINGLE_CMP1 already defined
// Masks for TCA_SINGLE_CMP2 already defined
// Masks for TCA_SINGLE_OVF already defined

// TCA_SPLIT_CTRLA masks
#define TCA_SPLIT_CLKSEL_gm 0x0E          // Clock Selection group mask
#define TCA_SPLIT_CLKSEL_gp 1             // Clock Selection group position
#define TCA_SPLIT_CLKSEL0_bm (1<<1)       // Clock Selection bit 0 mask
#define TCA_SPLIT_CLKSEL0_bp 1            // Clock Selection bit 0 position
#define TCA_SPLIT_CLKSEL1_bm (1<<2)       // Clock Selection bit 1 mask
#define TCA_SPLIT_CLKSEL1_bp 2            // Clock Selection bit 1 position
#define TCA_SPLIT_CLKSEL2_bm (1<<3)       // Clock Selection bit 2 mask
#define TCA_SPLIT_CLKSEL2_bp 3            // Clock Selection bit 2 position
#define TCA_SPLIT_ENABLE_bm 0x01          // Module Enable bit mask
#define TCA_SPLIT_ENABLE_bp 0             // Module Enable bit position

// TCA_SPLIT_CTRLB masks
#define TCA_SPLIT_HCMP0EN_bm 0x10         // High Compare 0 Enable bit mask
#define TCA_SPLIT_HCMP0EN_bp 4            // High Compare 0 Enable bit position
#define TCA_SPLIT_HCMP1EN_bm 0x20         // High Compare 1 Enable bit mask
#define TCA_SPLIT_HCMP1EN_bp 5            // High Compare 1 Enable bit position
#define TCA_SPLIT_HCMP2EN_bm 0x40         // High Compare 2 Enable bit mask
#define TCA_SPLIT_HCMP2EN_bp 6            // High Compare 2 Enable bit position
#define TCA_SPLIT_LCMP0EN_bm 0x01         // Low Compare 0 Enable bit mask
#define TCA_SPLIT_LCMP0EN_bp 0            // Low Compare 0 Enable bit position
#define TCA_SPLIT_LCMP1EN_bm 0x02         // Low Compare 1 Enable bit mask
#define TCA_SPLIT_LCMP1EN_bp 1            // Low Compare 1 Enable bit position
#define TCA_SPLIT_LCMP2EN_bm 0x04         // Low Compare 2 Enable bit mask
#define TCA_SPLIT_LCMP2EN_bp 2            // Low Compare 2 Enable bit position

// TCA_SPLIT_CTRLC masks
#define TCA_SPLIT_HCMP0OV_bm 0x10         // High Compare 0 Output Value bit mask
#define TCA_SPLIT_HCMP0OV_bp 4            // High Compare 0 Output Value bit position
#define TCA_SPLIT_HCMP1OV_bm 0x20         // High Compare 1 Output Value bit mask
#define TCA_SPLIT_HCMP1OV_bp 5            // High Compare 1 Output Value bit position
#define TCA_SPLIT_HCMP2OV_bm 0x40         // High Compare 2 Output Value bit mask
#define TCA_SPLIT_HCMP2OV_bp 6            // High Compare 2 Output Value bit position
#define TCA_SPLIT_LCMP0OV_bm 0x01         // Low Compare 0 Output Value bit mask
#define TCA_SPLIT_LCMP0OV_bp 0            // Low Compare 0 Output Value bit position
#define TCA_SPLIT_LCMP1OV_bm 0x02         // Low Compare 1 Output Value bit mask
#define TCA_SPLIT_LCMP1OV_bp 1            // Low Compare 1 Output Value bit position
#define TCA_SPLIT_LCMP2OV_bm 0x04         // Low Compare 2 Output Value bit mask
#define TCA_SPLIT_LCMP2OV_bp 2            // Low Compare 2 Output Value bit position

// TCA_SPLIT_CTRLD masks
#define TCA_SPLIT_SPLITM_bm 0x01          // Split Mode Enable bit mask
#define TCA_SPLIT_SPLITM_bp 0             // Split Mode Enable bit position

// TCA_SPLIT_CTRLECLR masks
#define TCA_SPLIT_CMD_gm 0x0C             // Command group mask
#define TCA_SPLIT_CMD_gp 2                // Command group position
#define TCA_SPLIT_CMD0_bm (1<<2)          // Command bit 0 mask
#define TCA_SPLIT_CMD0_bp 2               // Command bit 0 position
#define TCA_SPLIT_CMD1_bm (1<<3)          // Command bit 1 mask
#define TCA_SPLIT_CMD1_bp 3               // Command bit 1 position

// TCA_SPLIT_CTRLESET masks
// Masks for TCA_SPLIT_CMD already defined

// TCA_SPLIT_DBGCTRL masks
#define TCA_SPLIT_DBGRUN_bm 0x01          // Debug Run bit mask
#define TCA_SPLIT_DBGRUN_bp 0             // Debug Run bit position

// TCA_SPLIT_INTCTRL masks
#define TCA_SPLIT_HUNF_bm 0x02            // High Underflow Interrupt Enable bit mask
#define TCA_SPLIT_HUNF_bp 1               // High Underflow Interrupt Enable bit position
#define TCA_SPLIT_LCMP0_bm 0x10           // Low Compare 0 Interrupt Enable bit mask
#define TCA_SPLIT_LCMP0_bp 4              // Low Compare 0 Interrupt Enable bit position
#define TCA_SPLIT_LCMP1_bm 0x20           // Low Compare 1 Interrupt Enable bit mask
#define TCA_SPLIT_LCMP1_bp 5              // Low Compare 1 Interrupt Enable bit position
#define TCA_SPLIT_LCMP2_bm 0x40           // Low Compare 2 Interrupt Enable bit mask
#define TCA_SPLIT_LCMP2_bp 6              // Low Compare 2 Interrupt Enable bit position
#define TCA_SPLIT_LUNF_bm 0x01            // Low Underflow Interrupt Enable bit mask
#define TCA_SPLIT_LUNF_bp 0               // Low Underflow Interrupt Enable bit position

// TCA_SPLIT_INTFLAGS masks
// Masks for TCA_SPLIT_HUNF already defined
// Masks for TCA_SPLIT_LCMP0 already defined
// Masks for TCA_SPLIT_LCMP1 already defined
// Masks for TCA_SPLIT_LCMP2 already defined
// Masks for TCA_SPLIT_LUNF already defined

// Clock Selection select
#define TCA_SINGLE_CLKSEL_DIV1_gc (0x00<<1) // System Clock
#define TCA_SINGLE_CLKSEL_DIV2_gc (0x01<<1) // System Clock / 2
#define TCA_SINGLE_CLKSEL_DIV4_gc (0x02<<1) // System Clock / 4
#define TCA_SINGLE_CLKSEL_DIV8_gc (0x03<<1) // System Clock / 8
#define TCA_SINGLE_CLKSEL_DIV16_gc (0x04<<1) // System Clock / 16
#define TCA_SINGLE_CLKSEL_DIV64_gc (0x05<<1) // System Clock / 64
#define TCA_SINGLE_CLKSEL_DIV256_gc (0x06<<1) // System Clock / 256
#define TCA_SINGLE_CLKSEL_DIV1024_gc (0x07<<1) // System Clock / 1024

// Waveform generation mode select
#define TCA_SINGLE_WGMODE_NORMAL_gc (0x00<<0) // Normal Mode
#define TCA_SINGLE_WGMODE_FRQ_gc (0x01<<0) // Frequency Generation Mode
#define TCA_SINGLE_WGMODE_SINGLESLOPE_gc (0x03<<0) // Single Slope PWM
#define TCA_SINGLE_WGMODE_DSTOP_gc (0x05<<0) // Dual Slope PWM, overflow on TOP
#define TCA_SINGLE_WGMODE_DSBOTH_gc (0x06<<0) // Dual Slope PWM, overflow on TOP and BOTTOM
#define TCA_SINGLE_WGMODE_DSBOTTOM_gc (0x07<<0) // Dual Slope PWM, overflow on BOTTOM

// Command select
#define TCA_SINGLE_CMD_NONE_gc (0x00<<2)  // No Command
#define TCA_SINGLE_CMD_UPDATE_gc (0x01<<2) // Force Update
#define TCA_SINGLE_CMD_RESTART_gc (0x02<<2) // Force Restart
#define TCA_SINGLE_CMD_RESET_gc (0x03<<2) // Force Hard Reset

// Direction select
#define TCA_SINGLE_DIR_UP_gc (0x00<<0)    // Count up
#define TCA_SINGLE_DIR_DOWN_gc (0x01<<0)  // Count down

// Event Action select
#define TCA_SINGLE_EVACT_POSEDGE_gc (0x00<<1) // Count on positive edge event
#define TCA_SINGLE_EVACT_ANYEDGE_gc (0x01<<1) // Count on any edge event
#define TCA_SINGLE_EVACT_HIGHLVL_gc (0x02<<1) // Count on prescaled clock while event line is 1.
#define TCA_SINGLE_EVACT_UPDOWN_gc (0x03<<1) // Count on prescaled clock. Event controls count direction. Up-count when event line is 0, down-count when event line is 1.

// Clock Selection select
#define TCA_SPLIT_CLKSEL_DIV1_gc (0x00<<1) // System Clock
#define TCA_SPLIT_CLKSEL_DIV2_gc (0x01<<1) // System Clock / 2
#define TCA_SPLIT_CLKSEL_DIV4_gc (0x02<<1) // System Clock / 4
#define TCA_SPLIT_CLKSEL_DIV8_gc (0x03<<1) // System Clock / 8
#define TCA_SPLIT_CLKSEL_DIV16_gc (0x04<<1) // System Clock / 16
#define TCA_SPLIT_CLKSEL_DIV64_gc (0x05<<1) // System Clock / 64
#define TCA_SPLIT_CLKSEL_DIV256_gc (0x06<<1) // System Clock / 256
#define TCA_SPLIT_CLKSEL_DIV1024_gc (0x07<<1) // System Clock / 1024

// Command select
#define TCA_SPLIT_CMD_NONE_gc (0x00<<2)   // No Command
#define TCA_SPLIT_CMD_UPDATE_gc (0x01<<2) // Force Update
#define TCA_SPLIT_CMD_RESTART_gc (0x02<<2) // Force Restart
#define TCA_SPLIT_CMD_RESET_gc (0x03<<2)  // Force Hard Reset


//*************************************************************************
//** TCB - 16-bit Timer Type B
//*************************************************************************

// TCB_CTRLA masks
#define TCB_CLKSEL_gm 0x06                // Clock Select group mask
#define TCB_CLKSEL_gp 1                   // Clock Select group position
#define TCB_CLKSEL0_bm (1<<1)             // Clock Select bit 0 mask
#define TCB_CLKSEL0_bp 1                  // Clock Select bit 0 position
#define TCB_CLKSEL1_bm (1<<2)             // Clock Select bit 1 mask
#define TCB_CLKSEL1_bp 2                  // Clock Select bit 1 position
#define TCB_ENABLE_bm 0x01                // Enable bit mask
#define TCB_ENABLE_bp 0                   // Enable bit position
#define TCB_RUNSTDBY_bm 0x40              // Run Standby bit mask
#define TCB_RUNSTDBY_bp 6                 // Run Standby bit position
#define TCB_SYNCUPD_bm 0x10               // Synchronize Update bit mask
#define TCB_SYNCUPD_bp 4                  // Synchronize Update bit position

// TCB_CTRLB masks
#define TCB_ASYNC_bm 0x40                 // Asynchronous Enable bit mask
#define TCB_ASYNC_bp 6                    // Asynchronous Enable bit position
#define TCB_CCMPEN_bm 0x10                // Pin Output Enable bit mask
#define TCB_CCMPEN_bp 4                   // Pin Output Enable bit position
#define TCB_CCMPINIT_bm 0x20              // Pin Initial State bit mask
#define TCB_CCMPINIT_bp 5                 // Pin Initial State bit position
#define TCB_CNTMODE_gm 0x07               // Timer Mode group mask
#define TCB_CNTMODE_gp 0                  // Timer Mode group position
#define TCB_CNTMODE0_bm (1<<0)            // Timer Mode bit 0 mask
#define TCB_CNTMODE0_bp 0                 // Timer Mode bit 0 position
#define TCB_CNTMODE1_bm (1<<1)            // Timer Mode bit 1 mask
#define TCB_CNTMODE1_bp 1                 // Timer Mode bit 1 position
#define TCB_CNTMODE2_bm (1<<2)            // Timer Mode bit 2 mask
#define TCB_CNTMODE2_bp 2                 // Timer Mode bit 2 position

// TCB_DBGCTRL masks
#define TCB_DBGRUN_bm 0x01                // Debug Run bit mask
#define TCB_DBGRUN_bp 0                   // Debug Run bit position

// TCB_EVCTRL masks
#define TCB_CAPTEI_bm 0x01                // Event Input Enable bit mask
#define TCB_CAPTEI_bp 0                   // Event Input Enable bit position
#define TCB_EDGE_bm 0x10                  // Event Edge bit mask
#define TCB_EDGE_bp 4                     // Event Edge bit position
#define TCB_FILTER_bm 0x40                // Input Capture Noise Cancellation Filter bit mask
#define TCB_FILTER_bp 6                   // Input Capture Noise Cancellation Filter bit position

// TCB_INTCTRL masks
#define TCB_CAPT_bm 0x01                  // Capture or Timeout bit mask
#define TCB_CAPT_bp 0                     // Capture or Timeout bit position

// TCB_INTFLAGS masks
// Masks for TCB_CAPT already defined

// TCB_STATUS masks
#define TCB_RUN_bm 0x01                   // Run bit mask
#define TCB_RUN_bp 0                      // Run bit position

// Clock Select select
#define TCB_CLKSEL_CLKDIV1_gc (0x00<<1)   // CLK_PER (No Prescaling)
#define TCB_CLKSEL_CLKDIV2_gc (0x01<<1)   // CLK_PER/2 (From Prescaler)
#define TCB_CLKSEL_CLKTCA_gc (0x02<<1)    // Use Clock from TCA

// Timer Mode select
#define TCB_CNTMODE_INT_gc (0x00<<0)      // Periodic Interrupt
#define TCB_CNTMODE_TIMEOUT_gc (0x01<<0)  // Periodic Timeout
#define TCB_CNTMODE_CAPT_gc (0x02<<0)     // Input Capture Event
#define TCB_CNTMODE_FRQ_gc (0x03<<0)      // Input Capture Frequency measurement
#define TCB_CNTMODE_PW_gc (0x04<<0)       // Input Capture Pulse-Width measurement
#define TCB_CNTMODE_FRQPW_gc (0x05<<0)    // Input Capture Frequency and Pulse-Width measurement
#define TCB_CNTMODE_SINGLE_gc (0x06<<0)   // Single Shot
#define TCB_CNTMODE_PWM8_gc (0x07<<0)     // 8-bit PWM


//*************************************************************************
//** TCD - Timer Counter D
//*************************************************************************

// TCD_CTRLA masks
#define TCD_CLKSEL_gm 0x60                // clock select group mask
#define TCD_CLKSEL_gp 5                   // clock select group position
#define TCD_CLKSEL0_bm (1<<5)             // clock select bit 0 mask
#define TCD_CLKSEL0_bp 5                  // clock select bit 0 position
#define TCD_CLKSEL1_bm (1<<6)             // clock select bit 1 mask
#define TCD_CLKSEL1_bp 6                  // clock select bit 1 position
#define TCD_CNTPRES_gm 0x18               // counter prescaler group mask
#define TCD_CNTPRES_gp 3                  // counter prescaler group position
#define TCD_CNTPRES0_bm (1<<3)            // counter prescaler bit 0 mask
#define TCD_CNTPRES0_bp 3                 // counter prescaler bit 0 position
#define TCD_CNTPRES1_bm (1<<4)            // counter prescaler bit 1 mask
#define TCD_CNTPRES1_bp 4                 // counter prescaler bit 1 position
#define TCD_ENABLE_bm 0x01                // Enable bit mask
#define TCD_ENABLE_bp 0                   // Enable bit position
#define TCD_SYNCPRES_gm 0x06              // Syncronization prescaler group mask
#define TCD_SYNCPRES_gp 1                 // Syncronization prescaler group position
#define TCD_SYNCPRES0_bm (1<<1)           // Syncronization prescaler bit 0 mask
#define TCD_SYNCPRES0_bp 1                // Syncronization prescaler bit 0 position
#define TCD_SYNCPRES1_bm (1<<2)           // Syncronization prescaler bit 1 mask
#define TCD_SYNCPRES1_bp 2                // Syncronization prescaler bit 1 position

// TCD_CTRLB masks
#define TCD_WGMODE_gm 0x03                // Waveform generation mode group mask
#define TCD_WGMODE_gp 0                   // Waveform generation mode group position
#define TCD_WGMODE0_bm (1<<0)             // Waveform generation mode bit 0 mask
#define TCD_WGMODE0_bp 0                  // Waveform generation mode bit 0 position
#define TCD_WGMODE1_bm (1<<1)             // Waveform generation mode bit 1 mask
#define TCD_WGMODE1_bp 1                  // Waveform generation mode bit 1 position

// TCD_CTRLC masks
#define TCD_AUPDATE_bm 0x02               // Auto update bit mask
#define TCD_AUPDATE_bp 1                  // Auto update bit position
#define TCD_CMPCSEL_bm 0x40               // Compare C output select bit mask
#define TCD_CMPCSEL_bp 6                  // Compare C output select bit position
#define TCD_CMPDSEL_bm 0x80               // Compare D output select bit mask
#define TCD_CMPDSEL_bp 7                  // Compare D output select bit position
#define TCD_CMPOVR_bm 0x01                // Compare output value override bit mask
#define TCD_CMPOVR_bp 0                   // Compare output value override bit position
#define TCD_FIFTY_bm 0x08                 // Fifty percent waveform bit mask
#define TCD_FIFTY_bp 3                    // Fifty percent waveform bit position

// TCD_CTRLD masks
#define TCD_CMPAVAL_gm 0x0F               // Compare A value group mask
#define TCD_CMPAVAL_gp 0                  // Compare A value group position
#define TCD_CMPAVAL0_bm (1<<0)            // Compare A value bit 0 mask
#define TCD_CMPAVAL0_bp 0                 // Compare A value bit 0 position
#define TCD_CMPAVAL1_bm (1<<1)            // Compare A value bit 1 mask
#define TCD_CMPAVAL1_bp 1                 // Compare A value bit 1 position
#define TCD_CMPAVAL2_bm (1<<2)            // Compare A value bit 2 mask
#define TCD_CMPAVAL2_bp 2                 // Compare A value bit 2 position
#define TCD_CMPAVAL3_bm (1<<3)            // Compare A value bit 3 mask
#define TCD_CMPAVAL3_bp 3                 // Compare A value bit 3 position
#define TCD_CMPBVAL_gm 0xF0               // Compare B value group mask
#define TCD_CMPBVAL_gp 4                  // Compare B value group position
#define TCD_CMPBVAL0_bm (1<<4)            // Compare B value bit 0 mask
#define TCD_CMPBVAL0_bp 4                 // Compare B value bit 0 position
#define TCD_CMPBVAL1_bm (1<<5)            // Compare B value bit 1 mask
#define TCD_CMPBVAL1_bp 5                 // Compare B value bit 1 position
#define TCD_CMPBVAL2_bm (1<<6)            // Compare B value bit 2 mask
#define TCD_CMPBVAL2_bp 6                 // Compare B value bit 2 position
#define TCD_CMPBVAL3_bm (1<<7)            // Compare B value bit 3 mask
#define TCD_CMPBVAL3_bp 7                 // Compare B value bit 3 position

// TCD_CTRLE masks
#define TCD_DISEOC_bm 0x80                // Disable at end of cycle bit mask
#define TCD_DISEOC_bp 7                   // Disable at end of cycle bit position
#define TCD_RESTART_bm 0x04               // Restart strobe bit mask
#define TCD_RESTART_bp 2                  // Restart strobe bit position
#define TCD_SCAPTUREA_bm 0x08             // Software Capture A Strobe bit mask
#define TCD_SCAPTUREA_bp 3                // Software Capture A Strobe bit position
#define TCD_SCAPTUREB_bm 0x10             // Software Capture B Strobe bit mask
#define TCD_SCAPTUREB_bp 4                // Software Capture B Strobe bit position
#define TCD_SYNC_bm 0x02                  // synchronize strobe bit mask
#define TCD_SYNC_bp 1                     // synchronize strobe bit position
#define TCD_SYNCEOC_bm 0x01               // synchronize end of cycle strobe bit mask
#define TCD_SYNCEOC_bp 0                  // synchronize end of cycle strobe bit position

// TCD_DBGCTRL masks
#define TCD_DBGRUN_bm 0x01                // Debug run bit mask
#define TCD_DBGRUN_bp 0                   // Debug run bit position
#define TCD_FAULTDET_bm 0x04              // Fault detection bit mask
#define TCD_FAULTDET_bp 2                 // Fault detection bit position

// TCD_DITCTRL masks
#define TCD_DITHERSEL_gm 0x03             // dither select group mask
#define TCD_DITHERSEL_gp 0                // dither select group position
#define TCD_DITHERSEL0_bm (1<<0)          // dither select bit 0 mask
#define TCD_DITHERSEL0_bp 0               // dither select bit 0 position
#define TCD_DITHERSEL1_bm (1<<1)          // dither select bit 1 mask
#define TCD_DITHERSEL1_bp 1               // dither select bit 1 position

// TCD_DITVAL masks
#define TCD_DITHER_gm 0x0F                // Dither value group mask
#define TCD_DITHER_gp 0                   // Dither value group position
#define TCD_DITHER0_bm (1<<0)             // Dither value bit 0 mask
#define TCD_DITHER0_bp 0                  // Dither value bit 0 position
#define TCD_DITHER1_bm (1<<1)             // Dither value bit 1 mask
#define TCD_DITHER1_bp 1                  // Dither value bit 1 position
#define TCD_DITHER2_bm (1<<2)             // Dither value bit 2 mask
#define TCD_DITHER2_bp 2                  // Dither value bit 2 position
#define TCD_DITHER3_bm (1<<3)             // Dither value bit 3 mask
#define TCD_DITHER3_bp 3                  // Dither value bit 3 position

// TCD_DLYCTRL masks
#define TCD_DLYPRESC_gm 0x30              // Delay prescaler group mask
#define TCD_DLYPRESC_gp 4                 // Delay prescaler group position
#define TCD_DLYPRESC0_bm (1<<4)           // Delay prescaler bit 0 mask
#define TCD_DLYPRESC0_bp 4                // Delay prescaler bit 0 position
#define TCD_DLYPRESC1_bm (1<<5)           // Delay prescaler bit 1 mask
#define TCD_DLYPRESC1_bp 5                // Delay prescaler bit 1 position
#define TCD_DLYSEL_gm 0x03                // Delay select group mask
#define TCD_DLYSEL_gp 0                   // Delay select group position
#define TCD_DLYSEL0_bm (1<<0)             // Delay select bit 0 mask
#define TCD_DLYSEL0_bp 0                  // Delay select bit 0 position
#define TCD_DLYSEL1_bm (1<<1)             // Delay select bit 1 mask
#define TCD_DLYSEL1_bp 1                  // Delay select bit 1 position
#define TCD_DLYTRIG_gm 0x0C               // Delay trigger group mask
#define TCD_DLYTRIG_gp 2                  // Delay trigger group position
#define TCD_DLYTRIG0_bm (1<<2)            // Delay trigger bit 0 mask
#define TCD_DLYTRIG0_bp 2                 // Delay trigger bit 0 position
#define TCD_DLYTRIG1_bm (1<<3)            // Delay trigger bit 1 mask
#define TCD_DLYTRIG1_bp 3                 // Delay trigger bit 1 position

// TCD_DLYVAL masks
#define TCD_DLYVAL_gm 0xFF                // Delay value group mask
#define TCD_DLYVAL_gp 0                   // Delay value group position
#define TCD_DLYVAL0_bm (1<<0)             // Delay value bit 0 mask
#define TCD_DLYVAL0_bp 0                  // Delay value bit 0 position
#define TCD_DLYVAL1_bm (1<<1)             // Delay value bit 1 mask
#define TCD_DLYVAL1_bp 1                  // Delay value bit 1 position
#define TCD_DLYVAL2_bm (1<<2)             // Delay value bit 2 mask
#define TCD_DLYVAL2_bp 2                  // Delay value bit 2 position
#define TCD_DLYVAL3_bm (1<<3)             // Delay value bit 3 mask
#define TCD_DLYVAL3_bp 3                  // Delay value bit 3 position
#define TCD_DLYVAL4_bm (1<<4)             // Delay value bit 4 mask
#define TCD_DLYVAL4_bp 4                  // Delay value bit 4 position
#define TCD_DLYVAL5_bm (1<<5)             // Delay value bit 5 mask
#define TCD_DLYVAL5_bp 5                  // Delay value bit 5 position
#define TCD_DLYVAL6_bm (1<<6)             // Delay value bit 6 mask
#define TCD_DLYVAL6_bp 6                  // Delay value bit 6 position
#define TCD_DLYVAL7_bm (1<<7)             // Delay value bit 7 mask
#define TCD_DLYVAL7_bp 7                  // Delay value bit 7 position

// TCD_EVCTRLA masks
#define TCD_ACTION_bm 0x04                // event action bit mask
#define TCD_ACTION_bp 2                   // event action bit position
#define TCD_CFG_gm 0xC0                   // event config group mask
#define TCD_CFG_gp 6                      // event config group position
#define TCD_CFG0_bm (1<<6)                // event config bit 0 mask
#define TCD_CFG0_bp 6                     // event config bit 0 position
#define TCD_CFG1_bm (1<<7)                // event config bit 1 mask
#define TCD_CFG1_bp 7                     // event config bit 1 position
#define TCD_EDGE_bm 0x10                  // edge select bit mask
#define TCD_EDGE_bp 4                     // edge select bit position
#define TCD_TRIGEI_bm 0x01                // Trigger event enable bit mask
#define TCD_TRIGEI_bp 0                   // Trigger event enable bit position

// TCD_EVCTRLB masks
// Masks for TCD_ACTION already defined
// Masks for TCD_CFG already defined
// Masks for TCD_EDGE already defined
// Masks for TCD_TRIGEI already defined

// TCD_FAULTCTRL masks
#define TCD_CMPA_bm 0x01                  // Compare A value bit mask
#define TCD_CMPA_bp 0                     // Compare A value bit position
#define TCD_CMPAEN_bm 0x10                // Compare A enable bit mask
#define TCD_CMPAEN_bp 4                   // Compare A enable bit position
#define TCD_CMPB_bm 0x02                  // Compare B value bit mask
#define TCD_CMPB_bp 1                     // Compare B value bit position
#define TCD_CMPBEN_bm 0x20                // Compare B enable bit mask
#define TCD_CMPBEN_bp 5                   // Compare B enable bit position
#define TCD_CMPC_bm 0x04                  // Compare C value bit mask
#define TCD_CMPC_bp 2                     // Compare C value bit position
#define TCD_CMPCEN_bm 0x40                // Compare C enable bit mask
#define TCD_CMPCEN_bp 6                   // Compare C enable bit position
#define TCD_CMPD_bm 0x08                  // Compare D vaule bit mask
#define TCD_CMPD_bp 3                     // Compare D vaule bit position
#define TCD_CMPDEN_bm 0x80                // Compare D enable bit mask
#define TCD_CMPDEN_bp 7                   // Compare D enable bit position

// TCD_INPUTCTRLA masks
#define TCD_INPUTMODE_gm 0x0F             // Input mode group mask
#define TCD_INPUTMODE_gp 0                // Input mode group position
#define TCD_INPUTMODE0_bm (1<<0)          // Input mode bit 0 mask
#define TCD_INPUTMODE0_bp 0               // Input mode bit 0 position
#define TCD_INPUTMODE1_bm (1<<1)          // Input mode bit 1 mask
#define TCD_INPUTMODE1_bp 1               // Input mode bit 1 position
#define TCD_INPUTMODE2_bm (1<<2)          // Input mode bit 2 mask
#define TCD_INPUTMODE2_bp 2               // Input mode bit 2 position
#define TCD_INPUTMODE3_bm (1<<3)          // Input mode bit 3 mask
#define TCD_INPUTMODE3_bp 3               // Input mode bit 3 position

// TCD_INPUTCTRLB masks
// Masks for TCD_INPUTMODE already defined

// TCD_INTCTRL masks
#define TCD_OVF_bm 0x01                   // Overflow interrupt enable bit mask
#define TCD_OVF_bp 0                      // Overflow interrupt enable bit position
#define TCD_TRIGA_bm 0x04                 // Trigger A interrupt enable bit mask
#define TCD_TRIGA_bp 2                    // Trigger A interrupt enable bit position
#define TCD_TRIGB_bm 0x08                 // Trigger B interrupt enable bit mask
#define TCD_TRIGB_bp 3                    // Trigger B interrupt enable bit position

// TCD_INTFLAGS masks
// Masks for TCD_OVF already defined
// Masks for TCD_TRIGA already defined
// Masks for TCD_TRIGB already defined

// TCD_STATUS masks
#define TCD_CMDRDY_bm 0x02                // Command ready bit mask
#define TCD_CMDRDY_bp 1                   // Command ready bit position
#define TCD_ENRDY_bm 0x01                 // Enable ready bit mask
#define TCD_ENRDY_bp 0                    // Enable ready bit position
#define TCD_PWMACTA_bm 0x40               // PWM activity on A bit mask
#define TCD_PWMACTA_bp 6                  // PWM activity on A bit position
#define TCD_PWMACTB_bm 0x80               // PWM activity on B bit mask
#define TCD_PWMACTB_bp 7                  // PWM activity on B bit position

// clock select select
#define TCD_CLKSEL_20MHZ_gc (0x00<<5)     // 20 MHz oscillator
#define TCD_CLKSEL_EXTCLK_gc (0x02<<5)    // External clock
#define TCD_CLKSEL_SYSCLK_gc (0x03<<5)    // System clock

// counter prescaler select
#define TCD_CNTPRES_DIV1_gc (0x00<<3)     // Sync clock divided by 1
#define TCD_CNTPRES_DIV4_gc (0x01<<3)     // Sync clock divided by 4
#define TCD_CNTPRES_DIV32_gc (0x02<<3)    // Sync clock divided by 32

// Syncronization prescaler select
#define TCD_SYNCPRES_DIV1_gc (0x00<<1)    // Selevted clock source divided by 1
#define TCD_SYNCPRES_DIV2_gc (0x01<<1)    // Selevted clock source divided by 2
#define TCD_SYNCPRES_DIV4_gc (0x02<<1)    // Selevted clock source divided by 4
#define TCD_SYNCPRES_DIV8_gc (0x03<<1)    // Selevted clock source divided by 8

// Waveform generation mode select
#define TCD_WGMODE_ONERAMP_gc (0x00<<0)   // One ramp mode
#define TCD_WGMODE_TWORAMP_gc (0x01<<0)   // Two ramp mode
#define TCD_WGMODE_FOURRAMP_gc (0x02<<0)  // Four ramp mode
#define TCD_WGMODE_DS_gc (0x03<<0)        // Dual slope mode

// Compare C output select select
#define TCD_CMPCSEL_PWMA_gc (0x00<<6)     // PWM A output
#define TCD_CMPCSEL_PWMB_gc (0x01<<6)     // PWM B output

// Compare D output select select
#define TCD_CMPDSEL_PWMA_gc (0x00<<7)     // PWM A output
#define TCD_CMPDSEL_PWMB_gc (0x01<<7)     // PWM B output

// dither select select
#define TCD_DITHERSEL_ONTIMEB_gc (0x00<<0) // On-time ramp B
#define TCD_DITHERSEL_ONTIMEAB_gc (0x01<<0) // On-time ramp A and B
#define TCD_DITHERSEL_DEADTIMEB_gc (0x02<<0) // Dead-time rampB
#define TCD_DITHERSEL_DEADTIMEAB_gc (0x03<<0) // Dead-time ramp A and B

// Delay prescaler select
#define TCD_DLYPRESC_DIV1_gc (0x00<<4)    // No prescaling
#define TCD_DLYPRESC_DIV2_gc (0x01<<4)    // Prescale with 2
#define TCD_DLYPRESC_DIV4_gc (0x02<<4)    // Prescale with 4
#define TCD_DLYPRESC_DIV8_gc (0x03<<4)    // Prescale with 8

// Delay select select
#define TCD_DLYSEL_OFF_gc (0x00<<0)       // No delay
#define TCD_DLYSEL_INBLANK_gc (0x01<<0)   // Input blanking enabled
#define TCD_DLYSEL_EVENT_gc (0x02<<0)     // Event delay enabled

// Delay trigger select
#define TCD_DLYTRIG_CMPASET_gc (0x00<<2)  // Compare A set
#define TCD_DLYTRIG_CMPACLR_gc (0x01<<2)  // Compare A clear
#define TCD_DLYTRIG_CMPBSET_gc (0x02<<2)  // Compare B set
#define TCD_DLYTRIG_CMPBCLR_gc (0x03<<2)  // Compare B clear

// event action select
#define TCD_ACTION_FAULT_gc (0x00<<2)     // Event trigger a fault
#define TCD_ACTION_CAPTURE_gc (0x01<<2)   // Event trigger a fault and capture

// event config select
#define TCD_CFG_NEITHER_gc (0x00<<6)      // Neither Filter nor Asynchronous Event is enabled
#define TCD_CFG_FILTER_gc (0x01<<6)       // Input Capture Noise Cancellation Filter enabled
#define TCD_CFG_ASYNC_gc (0x02<<6)        // Asynchronous Event output qualification enabled

// edge select select
#define TCD_EDGE_FALL_LOW_gc (0x00<<4)    // The falling edge or low level of event generates retrigger or fault action
#define TCD_EDGE_RISE_HIGH_gc (0x01<<4)   // The rising edge or high level of event generates retrigger or fault action

// Input mode select
#define TCD_INPUTMODE_NONE_gc (0x00<<0)   // Input has no actions
#define TCD_INPUTMODE_JMPWAIT_gc (0x01<<0) // Stop output, jump to opposite compare cycle and wait
#define TCD_INPUTMODE_EXECWAIT_gc (0x02<<0) // Stop output, execute opposite compare cycle and wait
#define TCD_INPUTMODE_EXECFAULT_gc (0x03<<0) // stop output, execute opposite compare cycle while fault active
#define TCD_INPUTMODE_FREQ_gc (0x04<<0)   // Stop all outputs, maintain frequency
#define TCD_INPUTMODE_EXECDT_gc (0x05<<0) // Stop all outputs, execute dead time while fault active
#define TCD_INPUTMODE_WAIT_gc (0x06<<0)   // Stop all outputs, jump to next compare cycle and wait
#define TCD_INPUTMODE_WAITSW_gc (0x07<<0) // Stop all outputs, wait for software action
#define TCD_INPUTMODE_EDGETRIG_gc (0x08<<0) // Stop output on edge, jump to next compare cycle
#define TCD_INPUTMODE_EDGETRIGFREQ_gc (0x09<<0) // Stop output on edge, maintain frequency
#define TCD_INPUTMODE_LVLTRIGFREQ_gc (0x0A<<0) // Stop output at level, maintain frequency


//*************************************************************************
//** TWI - Two-Wire Interface
//*************************************************************************

// TWI_CTRLA masks
#define TWI_FMPEN_bm 0x02                 // FM Plus Enable bit mask
#define TWI_FMPEN_bp 1                    // FM Plus Enable bit position
#define TWI_SDAHOLD_gm 0x0C               // SDA Hold Time group mask
#define TWI_SDAHOLD_gp 2                  // SDA Hold Time group position
#define TWI_SDAHOLD0_bm (1<<2)            // SDA Hold Time bit 0 mask
#define TWI_SDAHOLD0_bp 2                 // SDA Hold Time bit 0 position
#define TWI_SDAHOLD1_bm (1<<3)            // SDA Hold Time bit 1 mask
#define TWI_SDAHOLD1_bp 3                 // SDA Hold Time bit 1 position
#define TWI_SDASETUP_bm 0x10              // SDA Setup Time bit mask
#define TWI_SDASETUP_bp 4                 // SDA Setup Time bit position

// TWI_DBGCTRL masks
#define TWI_DBGRUN_bm 0x01                // Debug Run bit mask
#define TWI_DBGRUN_bp 0                   // Debug Run bit position

// TWI_MCTRLA masks
#define TWI_ENABLE_bm 0x01                // Enable TWI Master bit mask
#define TWI_ENABLE_bp 0                   // Enable TWI Master bit position
#define TWI_QCEN_bm 0x10                  // Quick Command Enable bit mask
#define TWI_QCEN_bp 4                     // Quick Command Enable bit position
#define TWI_RIEN_bm 0x80                  // Read Interrupt Enable bit mask
#define TWI_RIEN_bp 7                     // Read Interrupt Enable bit position
#define TWI_SMEN_bm 0x02                  // Smart Mode Enable bit mask
#define TWI_SMEN_bp 1                     // Smart Mode Enable bit position
#define TWI_TIMEOUT_gm 0x0C               // Inactive Bus Timeout group mask
#define TWI_TIMEOUT_gp 2                  // Inactive Bus Timeout group position
#define TWI_TIMEOUT0_bm (1<<2)            // Inactive Bus Timeout bit 0 mask
#define TWI_TIMEOUT0_bp 2                 // Inactive Bus Timeout bit 0 position
#define TWI_TIMEOUT1_bm (1<<3)            // Inactive Bus Timeout bit 1 mask
#define TWI_TIMEOUT1_bp 3                 // Inactive Bus Timeout bit 1 position
#define TWI_WIEN_bm 0x40                  // Write Interrupt Enable bit mask
#define TWI_WIEN_bp 6                     // Write Interrupt Enable bit position

// TWI_MCTRLB masks
#define TWI_ACKACT_bm 0x04                // Acknowledge Action bit mask
#define TWI_ACKACT_bp 2                   // Acknowledge Action bit position
#define TWI_FLUSH_bm 0x08                 // Flush bit mask
#define TWI_FLUSH_bp 3                    // Flush bit position
#define TWI_MCMD_gm 0x03                  // Command group mask
#define TWI_MCMD_gp 0                     // Command group position
#define TWI_MCMD0_bm (1<<0)               // Command bit 0 mask
#define TWI_MCMD0_bp 0                    // Command bit 0 position
#define TWI_MCMD1_bm (1<<1)               // Command bit 1 mask
#define TWI_MCMD1_bp 1                    // Command bit 1 position

// TWI_MSTATUS masks
#define TWI_ARBLOST_bm 0x08               // Arbitration Lost bit mask
#define TWI_ARBLOST_bp 3                  // Arbitration Lost bit position
#define TWI_BUSERR_bm 0x04                // Bus Error bit mask
#define TWI_BUSERR_bp 2                   // Bus Error bit position
#define TWI_BUSSTATE_gm 0x03              // Bus State group mask
#define TWI_BUSSTATE_gp 0                 // Bus State group position
#define TWI_BUSSTATE0_bm (1<<0)           // Bus State bit 0 mask
#define TWI_BUSSTATE0_bp 0                // Bus State bit 0 position
#define TWI_BUSSTATE1_bm (1<<1)           // Bus State bit 1 mask
#define TWI_BUSSTATE1_bp 1                // Bus State bit 1 position
#define TWI_CLKHOLD_bm 0x20               // Clock Hold bit mask
#define TWI_CLKHOLD_bp 5                  // Clock Hold bit position
#define TWI_RIF_bm 0x80                   // Read Interrupt Flag bit mask
#define TWI_RIF_bp 7                      // Read Interrupt Flag bit position
#define TWI_RXACK_bm 0x10                 // Received Acknowledge bit mask
#define TWI_RXACK_bp 4                    // Received Acknowledge bit position
#define TWI_WIF_bm 0x40                   // Write Interrupt Flag bit mask
#define TWI_WIF_bp 6                      // Write Interrupt Flag bit position

// TWI_SADDRMASK masks
#define TWI_ADDREN_bm 0x01                // Address Enable bit mask
#define TWI_ADDREN_bp 0                   // Address Enable bit position
#define TWI_ADDRMASK_gm 0xFE              // Address Mask group mask
#define TWI_ADDRMASK_gp 1                 // Address Mask group position
#define TWI_ADDRMASK0_bm (1<<1)           // Address Mask bit 0 mask
#define TWI_ADDRMASK0_bp 1                // Address Mask bit 0 position
#define TWI_ADDRMASK1_bm (1<<2)           // Address Mask bit 1 mask
#define TWI_ADDRMASK1_bp 2                // Address Mask bit 1 position
#define TWI_ADDRMASK2_bm (1<<3)           // Address Mask bit 2 mask
#define TWI_ADDRMASK2_bp 3                // Address Mask bit 2 position
#define TWI_ADDRMASK3_bm (1<<4)           // Address Mask bit 3 mask
#define TWI_ADDRMASK3_bp 4                // Address Mask bit 3 position
#define TWI_ADDRMASK4_bm (1<<5)           // Address Mask bit 4 mask
#define TWI_ADDRMASK4_bp 5                // Address Mask bit 4 position
#define TWI_ADDRMASK5_bm (1<<6)           // Address Mask bit 5 mask
#define TWI_ADDRMASK5_bp 6                // Address Mask bit 5 position
#define TWI_ADDRMASK6_bm (1<<7)           // Address Mask bit 6 mask
#define TWI_ADDRMASK6_bp 7                // Address Mask bit 6 position

// TWI_SCTRLA masks
#define TWI_APIEN_bm 0x40                 // Address/Stop Interrupt Enable bit mask
#define TWI_APIEN_bp 6                    // Address/Stop Interrupt Enable bit position
#define TWI_DIEN_bm 0x80                  // Data Interrupt Enable bit mask
#define TWI_DIEN_bp 7                     // Data Interrupt Enable bit position
// Masks for TWI_ENABLE already defined
#define TWI_PIEN_bm 0x20                  // Stop Interrupt Enable bit mask
#define TWI_PIEN_bp 5                     // Stop Interrupt Enable bit position
#define TWI_PMEN_bm 0x04                  // Promiscuous Mode Enable bit mask
#define TWI_PMEN_bp 2                     // Promiscuous Mode Enable bit position
// Masks for TWI_SMEN already defined

// TWI_SCTRLB masks
// Masks for TWI_ACKACT already defined
#define TWI_SCMD_gm 0x03                  // Command group mask
#define TWI_SCMD_gp 0                     // Command group position
#define TWI_SCMD0_bm (1<<0)               // Command bit 0 mask
#define TWI_SCMD0_bp 0                    // Command bit 0 position
#define TWI_SCMD1_bm (1<<1)               // Command bit 1 mask
#define TWI_SCMD1_bp 1                    // Command bit 1 position

// TWI_SSTATUS masks
#define TWI_AP_bm 0x01                    // Slave Address or Stop bit mask
#define TWI_AP_bp 0                       // Slave Address or Stop bit position
#define TWI_APIF_bm 0x40                  // Address/Stop Interrupt Flag bit mask
#define TWI_APIF_bp 6                     // Address/Stop Interrupt Flag bit position
// Masks for TWI_BUSERR already defined
// Masks for TWI_CLKHOLD already defined
#define TWI_COLL_bm 0x08                  // Collision bit mask
#define TWI_COLL_bp 3                     // Collision bit position
#define TWI_DIF_bm 0x80                   // Data Interrupt Flag bit mask
#define TWI_DIF_bp 7                      // Data Interrupt Flag bit position
#define TWI_DIR_bm 0x02                   // Read/Write Direction bit mask
#define TWI_DIR_bp 1                      // Read/Write Direction bit position
// Masks for TWI_RXACK already defined

// SDA Hold Time select
#define TWI_DEFAULT_SDAHOLD_OFF_gc (0x00<<2) // SDA hold time off
#define TWI_DEFAULT_SDAHOLD_50NS_gc (0x01<<2) // Typical 50ns hold time
#define TWI_DEFAULT_SDAHOLD_300NS_gc (0x02<<2) // Typical 300ns hold time
#define TWI_DEFAULT_SDAHOLD_500NS_gc (0x03<<2) // Typical 500ns hold time

// SDA Setup Time select
#define TWI_DEFAULT_SDASETUP_4CYC_gc (0x00<<4) // SDA setup time is 4 clock cycles
#define TWI_DEFAULT_SDASETUP_8CYC_gc (0x01<<4) // SDA setup time is 8 clock cycles

// Inactive Bus Timeout select
#define TWI_TIMEOUT_DISABLED_gc (0x00<<2) // Bus Timeout Disabled
#define TWI_TIMEOUT_50US_gc (0x01<<2)     // 50 Microseconds
#define TWI_TIMEOUT_100US_gc (0x02<<2)    // 100 Microseconds
#define TWI_TIMEOUT_200US_gc (0x03<<2)    // 200 Microseconds

// Acknowledge Action select
#define TWI_ACKACT_ACK_gc (0x00<<2)       // Send ACK
#define TWI_ACKACT_NACK_gc (0x01<<2)      // Send NACK

// Command select
#define TWI_MCMD_NOACT_gc (0x00<<0)       // No Action
#define TWI_MCMD_REPSTART_gc (0x01<<0)    // Issue Repeated Start Condition
#define TWI_MCMD_RECVTRANS_gc (0x02<<0)   // Receive or Transmit Data, depending on DIR
#define TWI_MCMD_STOP_gc (0x03<<0)        // Issue Stop Condition

// Bus State select
#define TWI_BUSSTATE_UNKNOWN_gc (0x00<<0) // Unknown Bus State
#define TWI_BUSSTATE_IDLE_gc (0x01<<0)    // Bus is Idle
#define TWI_BUSSTATE_OWNER_gc (0x02<<0)   // This Module Controls The Bus
#define TWI_BUSSTATE_BUSY_gc (0x03<<0)    // The Bus is Busy

// Command select
#define TWI_SCMD_NOACT_gc (0x00<<0)       // No Action
#define TWI_SCMD_COMPTRANS_gc (0x02<<0)   // Used To Complete a Transaction
#define TWI_SCMD_RESPONSE_gc (0x03<<0)    // Used in Response to Address/Data Interrupt

// Slave Address or Stop select
#define TWI_AP_STOP_gc (0x00<<0)          // Stop condition generated APIF
#define TWI_AP_ADR_gc (0x01<<0)           // Address detection generated APIF


//*************************************************************************
//** USART - Universal Synchronous and Asynchronous Receiver and Transmitter
//*************************************************************************

// USART_CTRLA masks
#define USART_ABEIE_bm 0x04               // Auto-baud Error Interrupt Enable bit mask
#define USART_ABEIE_bp 2                  // Auto-baud Error Interrupt Enable bit position
#define USART_DREIE_bm 0x20               // Data Register Empty Interrupt Enable bit mask
#define USART_DREIE_bp 5                  // Data Register Empty Interrupt Enable bit position
#define USART_LBME_bm 0x08                // Loop-back Mode Enable bit mask
#define USART_LBME_bp 3                   // Loop-back Mode Enable bit position
#define USART_RS485_gm 0x03               // RS485 Mode internal transmitter group mask
#define USART_RS485_gp 0                  // RS485 Mode internal transmitter group position
#define USART_RS4850_bm (1<<0)            // RS485 Mode internal transmitter bit 0 mask
#define USART_RS4850_bp 0                 // RS485 Mode internal transmitter bit 0 position
#define USART_RS4851_bm (1<<1)            // RS485 Mode internal transmitter bit 1 mask
#define USART_RS4851_bp 1                 // RS485 Mode internal transmitter bit 1 position
#define USART_RXCIE_bm 0x80               // Receive Complete Interrupt Enable bit mask
#define USART_RXCIE_bp 7                  // Receive Complete Interrupt Enable bit position
#define USART_RXSIE_bm 0x10               // Receiver Start Frame Interrupt Enable bit mask
#define USART_RXSIE_bp 4                  // Receiver Start Frame Interrupt Enable bit position
#define USART_TXCIE_bm 0x40               // Transmit Complete Interrupt Enable bit mask
#define USART_TXCIE_bp 6                  // Transmit Complete Interrupt Enable bit position

// USART_CTRLB masks
#define USART_MPCM_bm 0x01                // Multi-processor Communication Mode bit mask
#define USART_MPCM_bp 0                   // Multi-processor Communication Mode bit position
#define USART_ODME_bm 0x08                // Open Drain Mode Enable bit mask
#define USART_ODME_bp 3                   // Open Drain Mode Enable bit position
#define USART_RXEN_bm 0x80                // Reciever enable bit mask
#define USART_RXEN_bp 7                   // Reciever enable bit position
#define USART_RXMODE_gm 0x06              // Receiver Mode group mask
#define USART_RXMODE_gp 1                 // Receiver Mode group position
#define USART_RXMODE0_bm (1<<1)           // Receiver Mode bit 0 mask
#define USART_RXMODE0_bp 1                // Receiver Mode bit 0 position
#define USART_RXMODE1_bm (1<<2)           // Receiver Mode bit 1 mask
#define USART_RXMODE1_bp 2                // Receiver Mode bit 1 position
#define USART_SFDEN_bm 0x10               // Start Frame Detection Enable bit mask
#define USART_SFDEN_bp 4                  // Start Frame Detection Enable bit position
#define USART_TXEN_bm 0x40                // Transmitter Enable bit mask
#define USART_TXEN_bp 6                   // Transmitter Enable bit position

// USART_CTRLC masks
#define USART_CMODE_gm 0xC0               // Communication Mode group mask
#define USART_CMODE_gp 6                  // Communication Mode group position
#define USART_CMODE0_bm (1<<6)            // Communication Mode bit 0 mask
#define USART_CMODE0_bp 6                 // Communication Mode bit 0 position
#define USART_CMODE1_bm (1<<7)            // Communication Mode bit 1 mask
#define USART_CMODE1_bp 7                 // Communication Mode bit 1 position
#define USART_UCPHA_bm 0x02               // SPI Master Mode, Clock Phase bit mask
#define USART_UCPHA_bp 1                  // SPI Master Mode, Clock Phase bit position
#define USART_UDORD_bm 0x04               // SPI Master Mode, Data Order bit mask
#define USART_UDORD_bp 2                  // SPI Master Mode, Data Order bit position
#define USART_CHSIZE_gm 0x07              // Character Size group mask
#define USART_CHSIZE_gp 0                 // Character Size group position
#define USART_CHSIZE0_bm (1<<0)           // Character Size bit 0 mask
#define USART_CHSIZE0_bp 0                // Character Size bit 0 position
#define USART_CHSIZE1_bm (1<<1)           // Character Size bit 1 mask
#define USART_CHSIZE1_bp 1                // Character Size bit 1 position
#define USART_CHSIZE2_bm (1<<2)           // Character Size bit 2 mask
#define USART_CHSIZE2_bp 2                // Character Size bit 2 position
#define USART_PMODE_gm 0x30               // Parity Mode group mask
#define USART_PMODE_gp 4                  // Parity Mode group position
#define USART_PMODE0_bm (1<<4)            // Parity Mode bit 0 mask
#define USART_PMODE0_bp 4                 // Parity Mode bit 0 position
#define USART_PMODE1_bm (1<<5)            // Parity Mode bit 1 mask
#define USART_PMODE1_bp 5                 // Parity Mode bit 1 position
#define USART_SBMODE_bm 0x08              // Stop Bit Mode bit mask
#define USART_SBMODE_bp 3                 // Stop Bit Mode bit position

// USART_DBGCTRL masks
#define USART_ABMBP_bm 0x80               // Autobaud majority voter bypass bit mask
#define USART_ABMBP_bp 7                  // Autobaud majority voter bypass bit position
#define USART_DBGRUN_bm 0x01              // Debug Run bit mask
#define USART_DBGRUN_bp 0                 // Debug Run bit position

// USART_EVCTRL masks
#define USART_IREI_bm 0x01                // IrDA Event Input Enable bit mask
#define USART_IREI_bp 0                   // IrDA Event Input Enable bit position

// USART_RXDATAH masks
#define USART_BUFOVF_bm 0x40              // Buffer Overflow bit mask
#define USART_BUFOVF_bp 6                 // Buffer Overflow bit position
#define USART_DATA8_bm 0x01               // Receiver Data Register bit mask
#define USART_DATA8_bp 0                  // Receiver Data Register bit position
#define USART_FERR_bm 0x04                // Frame Error bit mask
#define USART_FERR_bp 2                   // Frame Error bit position
#define USART_PERR_bm 0x02                // Parity Error bit mask
#define USART_PERR_bp 1                   // Parity Error bit position
#define USART_RXCIF_bm 0x80               // Receive Complete Interrupt Flag bit mask
#define USART_RXCIF_bp 7                  // Receive Complete Interrupt Flag bit position

// USART_RXDATAL masks
#define USART_DATA_gm 0xFF                // RX Data group mask
#define USART_DATA_gp 0                   // RX Data group position
#define USART_DATA0_bm (1<<0)             // RX Data bit 0 mask
#define USART_DATA0_bp 0                  // RX Data bit 0 position
#define USART_DATA1_bm (1<<1)             // RX Data bit 1 mask
#define USART_DATA1_bp 1                  // RX Data bit 1 position
#define USART_DATA2_bm (1<<2)             // RX Data bit 2 mask
#define USART_DATA2_bp 2                  // RX Data bit 2 position
#define USART_DATA3_bm (1<<3)             // RX Data bit 3 mask
#define USART_DATA3_bp 3                  // RX Data bit 3 position
#define USART_DATA4_bm (1<<4)             // RX Data bit 4 mask
#define USART_DATA4_bp 4                  // RX Data bit 4 position
#define USART_DATA5_bm (1<<5)             // RX Data bit 5 mask
#define USART_DATA5_bp 5                  // RX Data bit 5 position
#define USART_DATA6_bm (1<<6)             // RX Data bit 6 mask
#define USART_DATA6_bp 6                  // RX Data bit 6 position
#define USART_DATA7_bm (1<<7)             // RX Data bit 7 mask
#define USART_DATA7_bp 7                  // RX Data bit 7 position

// USART_RXPLCTRL masks
#define USART_RXPL_gm 0x7F                // Receiver Pulse Lenght group mask
#define USART_RXPL_gp 0                   // Receiver Pulse Lenght group position
#define USART_RXPL0_bm (1<<0)             // Receiver Pulse Lenght bit 0 mask
#define USART_RXPL0_bp 0                  // Receiver Pulse Lenght bit 0 position
#define USART_RXPL1_bm (1<<1)             // Receiver Pulse Lenght bit 1 mask
#define USART_RXPL1_bp 1                  // Receiver Pulse Lenght bit 1 position
#define USART_RXPL2_bm (1<<2)             // Receiver Pulse Lenght bit 2 mask
#define USART_RXPL2_bp 2                  // Receiver Pulse Lenght bit 2 position
#define USART_RXPL3_bm (1<<3)             // Receiver Pulse Lenght bit 3 mask
#define USART_RXPL3_bp 3                  // Receiver Pulse Lenght bit 3 position
#define USART_RXPL4_bm (1<<4)             // Receiver Pulse Lenght bit 4 mask
#define USART_RXPL4_bp 4                  // Receiver Pulse Lenght bit 4 position
#define USART_RXPL5_bm (1<<5)             // Receiver Pulse Lenght bit 5 mask
#define USART_RXPL5_bp 5                  // Receiver Pulse Lenght bit 5 position
#define USART_RXPL6_bm (1<<6)             // Receiver Pulse Lenght bit 6 mask
#define USART_RXPL6_bp 6                  // Receiver Pulse Lenght bit 6 position

// USART_STATUS masks
#define USART_BDF_bm 0x02                 // Break Detected Flag bit mask
#define USART_BDF_bp 1                    // Break Detected Flag bit position
#define USART_DREIF_bm 0x20               // Data Register Empty Flag bit mask
#define USART_DREIF_bp 5                  // Data Register Empty Flag bit position
#define USART_ISFIF_bm 0x08               // Inconsistent Sync Field Interrupt Flag bit mask
#define USART_ISFIF_bp 3                  // Inconsistent Sync Field Interrupt Flag bit position
// Masks for USART_RXCIF already defined
#define USART_RXSIF_bm 0x10               // Receive Start Interrupt bit mask
#define USART_RXSIF_bp 4                  // Receive Start Interrupt bit position
#define USART_TXCIF_bm 0x40               // Transmit Interrupt Flag bit mask
#define USART_TXCIF_bp 6                  // Transmit Interrupt Flag bit position
#define USART_WFB_bm 0x01                 // Wait For Break bit mask
#define USART_WFB_bp 0                    // Wait For Break bit position

// USART_TXDATAH masks
// Masks for USART_DATA8 already defined

// USART_TXDATAL masks
// Masks for USART_DATA already defined

// USART_TXPLCTRL masks
#define USART_TXPL_gm 0xFF                // Transmit pulse length group mask
#define USART_TXPL_gp 0                   // Transmit pulse length group position
#define USART_TXPL0_bm (1<<0)             // Transmit pulse length bit 0 mask
#define USART_TXPL0_bp 0                  // Transmit pulse length bit 0 position
#define USART_TXPL1_bm (1<<1)             // Transmit pulse length bit 1 mask
#define USART_TXPL1_bp 1                  // Transmit pulse length bit 1 position
#define USART_TXPL2_bm (1<<2)             // Transmit pulse length bit 2 mask
#define USART_TXPL2_bp 2                  // Transmit pulse length bit 2 position
#define USART_TXPL3_bm (1<<3)             // Transmit pulse length bit 3 mask
#define USART_TXPL3_bp 3                  // Transmit pulse length bit 3 position
#define USART_TXPL4_bm (1<<4)             // Transmit pulse length bit 4 mask
#define USART_TXPL4_bp 4                  // Transmit pulse length bit 4 position
#define USART_TXPL5_bm (1<<5)             // Transmit pulse length bit 5 mask
#define USART_TXPL5_bp 5                  // Transmit pulse length bit 5 position
#define USART_TXPL6_bm (1<<6)             // Transmit pulse length bit 6 mask
#define USART_TXPL6_bp 6                  // Transmit pulse length bit 6 position
#define USART_TXPL7_bm (1<<7)             // Transmit pulse length bit 7 mask
#define USART_TXPL7_bp 7                  // Transmit pulse length bit 7 position

// RS485 Mode internal transmitter select
#define USART_RS485_OFF_gc (0x00<<0)      // RS485 Mode disabled
#define USART_RS485_EXT_gc (0x01<<0)      // RS485 Mode External drive
#define USART_RS485_INT_gc (0x02<<0)      // RS485 Mode Internal drive

// Receiver Mode select
#define USART_RXMODE_NORMAL_gc (0x00<<1)  // Normal mode
#define USART_RXMODE_CLK2X_gc (0x01<<1)   // CLK2x mode
#define USART_RXMODE_GENAUTO_gc (0x02<<1) // Generic autobaud mode
#define USART_RXMODE_LINAUTO_gc (0x03<<1) // LIN constrained autobaud mode

// Communication Mode select
#define USART_MSPI_CMODE_ASYNCHRONOUS_gc (0x00<<6) // Asynchronous Mode
#define USART_MSPI_CMODE_SYNCHRONOUS_gc (0x01<<6) // Synchronous Mode
#define USART_MSPI_CMODE_IRCOM_gc (0x02<<6) // Infrared Communication
#define USART_MSPI_CMODE_MSPI_gc (0x03<<6) // Master SPI Mode

// Character Size select
#define USART_NORMAL_CHSIZE_5BIT_gc (0x00<<0) // Character size: 5 bit
#define USART_NORMAL_CHSIZE_6BIT_gc (0x01<<0) // Character size: 6 bit
#define USART_NORMAL_CHSIZE_7BIT_gc (0x02<<0) // Character size: 7 bit
#define USART_NORMAL_CHSIZE_8BIT_gc (0x03<<0) // Character size: 8 bit
#define USART_NORMAL_CHSIZE_9BITL_gc (0x06<<0) // Character size: 9 bit read low byte first
#define USART_NORMAL_CHSIZE_9BITH_gc (0x07<<0) // Character size: 9 bit read high byte first

// Parity Mode select
#define USART_NORMAL_PMODE_DISABLED_gc (0x00<<4) // No Parity
#define USART_NORMAL_PMODE_EVEN_gc (0x02<<4) // Even Parity
#define USART_NORMAL_PMODE_ODD_gc (0x03<<4) // Odd Parity

// Stop Bit Mode select
#define USART_NORMAL_SBMODE_1BIT_gc (0x00<<3) // 1 stop bit
#define USART_NORMAL_SBMODE_2BIT_gc (0x01<<3) // 2 stop bits


//*************************************************************************
//** USERROW - User Row
//*************************************************************************


//*************************************************************************
//** VPORT - Virtual Ports
//*************************************************************************

// VPORT_INTFLAGS masks
#define VPORT_INT_gm 0xFF                 // Pin Interrupt group mask
#define VPORT_INT_gp 0                    // Pin Interrupt group position
#define VPORT_INT0_bm (1<<0)              // Pin Interrupt bit 0 mask
#define VPORT_INT0_bp 0                   // Pin Interrupt bit 0 position
#define VPORT_INT1_bm (1<<1)              // Pin Interrupt bit 1 mask
#define VPORT_INT1_bp 1                   // Pin Interrupt bit 1 position
#define VPORT_INT2_bm (1<<2)              // Pin Interrupt bit 2 mask
#define VPORT_INT2_bp 2                   // Pin Interrupt bit 2 position
#define VPORT_INT3_bm (1<<3)              // Pin Interrupt bit 3 mask
#define VPORT_INT3_bp 3                   // Pin Interrupt bit 3 position
#define VPORT_INT4_bm (1<<4)              // Pin Interrupt bit 4 mask
#define VPORT_INT4_bp 4                   // Pin Interrupt bit 4 position
#define VPORT_INT5_bm (1<<5)              // Pin Interrupt bit 5 mask
#define VPORT_INT5_bp 5                   // Pin Interrupt bit 5 position
#define VPORT_INT6_bm (1<<6)              // Pin Interrupt bit 6 mask
#define VPORT_INT6_bp 6                   // Pin Interrupt bit 6 position
#define VPORT_INT7_bm (1<<7)              // Pin Interrupt bit 7 mask
#define VPORT_INT7_bp 7                   // Pin Interrupt bit 7 position


//*************************************************************************
//** VREF - Voltage reference
//*************************************************************************

// VREF_CTRLA masks
#define VREF_ADC0REFSEL_gm 0x70           // ADC0 reference select group mask
#define VREF_ADC0REFSEL_gp 4              // ADC0 reference select group position
#define VREF_ADC0REFSEL0_bm (1<<4)        // ADC0 reference select bit 0 mask
#define VREF_ADC0REFSEL0_bp 4             // ADC0 reference select bit 0 position
#define VREF_ADC0REFSEL1_bm (1<<5)        // ADC0 reference select bit 1 mask
#define VREF_ADC0REFSEL1_bp 5             // ADC0 reference select bit 1 position
#define VREF_ADC0REFSEL2_bm (1<<6)        // ADC0 reference select bit 2 mask
#define VREF_ADC0REFSEL2_bp 6             // ADC0 reference select bit 2 position
#define VREF_DAC0REFSEL_gm 0x07           // DAC0/AC0 reference select group mask
#define VREF_DAC0REFSEL_gp 0              // DAC0/AC0 reference select group position
#define VREF_DAC0REFSEL0_bm (1<<0)        // DAC0/AC0 reference select bit 0 mask
#define VREF_DAC0REFSEL0_bp 0             // DAC0/AC0 reference select bit 0 position
#define VREF_DAC0REFSEL1_bm (1<<1)        // DAC0/AC0 reference select bit 1 mask
#define VREF_DAC0REFSEL1_bp 1             // DAC0/AC0 reference select bit 1 position
#define VREF_DAC0REFSEL2_bm (1<<2)        // DAC0/AC0 reference select bit 2 mask
#define VREF_DAC0REFSEL2_bp 2             // DAC0/AC0 reference select bit 2 position

// VREF_CTRLB masks
#define VREF_ADC0REFEN_bm 0x02            // ADC0 reference enable bit mask
#define VREF_ADC0REFEN_bp 1               // ADC0 reference enable bit position
#define VREF_ADC1REFEN_bm 0x10            // ADC1 reference enable bit mask
#define VREF_ADC1REFEN_bp 4               // ADC1 reference enable bit position
#define VREF_DAC0REFEN_bm 0x01            // DAC0/AC0 reference enable bit mask
#define VREF_DAC0REFEN_bp 0               // DAC0/AC0 reference enable bit position
#define VREF_DAC1REFEN_bm 0x08            // DAC1/AC1 reference enable bit mask
#define VREF_DAC1REFEN_bp 3               // DAC1/AC1 reference enable bit position
#define VREF_DAC2REFEN_bm 0x20            // DAC2/AC2 reference enable bit mask
#define VREF_DAC2REFEN_bp 5               // DAC2/AC2 reference enable bit position

// VREF_CTRLC masks
#define VREF_ADC1REFSEL_gm 0x70           // ADC1 reference select group mask
#define VREF_ADC1REFSEL_gp 4              // ADC1 reference select group position
#define VREF_ADC1REFSEL0_bm (1<<4)        // ADC1 reference select bit 0 mask
#define VREF_ADC1REFSEL0_bp 4             // ADC1 reference select bit 0 position
#define VREF_ADC1REFSEL1_bm (1<<5)        // ADC1 reference select bit 1 mask
#define VREF_ADC1REFSEL1_bp 5             // ADC1 reference select bit 1 position
#define VREF_ADC1REFSEL2_bm (1<<6)        // ADC1 reference select bit 2 mask
#define VREF_ADC1REFSEL2_bp 6             // ADC1 reference select bit 2 position
#define VREF_DAC1REFSEL_gm 0x07           // DAC1/AC1 reference select group mask
#define VREF_DAC1REFSEL_gp 0              // DAC1/AC1 reference select group position
#define VREF_DAC1REFSEL0_bm (1<<0)        // DAC1/AC1 reference select bit 0 mask
#define VREF_DAC1REFSEL0_bp 0             // DAC1/AC1 reference select bit 0 position
#define VREF_DAC1REFSEL1_bm (1<<1)        // DAC1/AC1 reference select bit 1 mask
#define VREF_DAC1REFSEL1_bp 1             // DAC1/AC1 reference select bit 1 position
#define VREF_DAC1REFSEL2_bm (1<<2)        // DAC1/AC1 reference select bit 2 mask
#define VREF_DAC1REFSEL2_bp 2             // DAC1/AC1 reference select bit 2 position

// VREF_CTRLD masks
#define VREF_DAC2REFSEL_gm 0x07           // DAC2/AC2 reference select group mask
#define VREF_DAC2REFSEL_gp 0              // DAC2/AC2 reference select group position
#define VREF_DAC2REFSEL0_bm (1<<0)        // DAC2/AC2 reference select bit 0 mask
#define VREF_DAC2REFSEL0_bp 0             // DAC2/AC2 reference select bit 0 position
#define VREF_DAC2REFSEL1_bm (1<<1)        // DAC2/AC2 reference select bit 1 mask
#define VREF_DAC2REFSEL1_bp 1             // DAC2/AC2 reference select bit 1 position
#define VREF_DAC2REFSEL2_bm (1<<2)        // DAC2/AC2 reference select bit 2 mask
#define VREF_DAC2REFSEL2_bp 2             // DAC2/AC2 reference select bit 2 position

// ADC0 reference select select
#define VREF_ADC0REFSEL_0V55_gc (0x00<<4) // Voltage reference at 0.55V
#define VREF_ADC0REFSEL_1V1_gc (0x01<<4)  // Voltage reference at 1.1V
#define VREF_ADC0REFSEL_2V5_gc (0x02<<4)  // Voltage reference at 2.5V
#define VREF_ADC0REFSEL_4V34_gc (0x03<<4) // Voltage reference at 4.34V
#define VREF_ADC0REFSEL_1V5_gc (0x04<<4)  // Voltage reference at 1.5V

// DAC0/AC0 reference select select
#define VREF_DAC0REFSEL_0V55_gc (0x00<<0) // Voltage reference at 0.55V
#define VREF_DAC0REFSEL_1V1_gc (0x01<<0)  // Voltage reference at 1.1V
#define VREF_DAC0REFSEL_2V5_gc (0x02<<0)  // Voltage reference at 2.5V
#define VREF_DAC0REFSEL_4V34_gc (0x03<<0) // Voltage reference at 4.34V
#define VREF_DAC0REFSEL_1V5_gc (0x04<<0)  // Voltage reference at 1.5V

// ADC1 reference select select
#define VREF_ADC1REFSEL_0V55_gc (0x00<<4) // Voltage reference at 0.55V
#define VREF_ADC1REFSEL_1V1_gc (0x01<<4)  // Voltage reference at 1.1V
#define VREF_ADC1REFSEL_2V5_gc (0x02<<4)  // Voltage reference at 2.5V
#define VREF_ADC1REFSEL_4V34_gc (0x03<<4) // Voltage reference at 4.34V
#define VREF_ADC1REFSEL_1V5_gc (0x04<<4)  // Voltage reference at 1.5V

// DAC1/AC1 reference select select
#define VREF_DAC1REFSEL_0V55_gc (0x00<<0) // Voltage reference at 0.55V
#define VREF_DAC1REFSEL_1V1_gc (0x01<<0)  // Voltage reference at 1.1V
#define VREF_DAC1REFSEL_2V5_gc (0x02<<0)  // Voltage reference at 2.5V
#define VREF_DAC1REFSEL_4V34_gc (0x03<<0) // Voltage reference at 4.34V
#define VREF_DAC1REFSEL_1V5_gc (0x04<<0)  // Voltage reference at 1.5V

// DAC2/AC2 reference select select
#define VREF_DAC2REFSEL_0V55_gc (0x00<<0) // Voltage reference at 0.55V
#define VREF_DAC2REFSEL_1V1_gc (0x01<<0)  // Voltage reference at 1.1V
#define VREF_DAC2REFSEL_2V5_gc (0x02<<0)  // Voltage reference at 2.5V
#define VREF_DAC2REFSEL_4V34_gc (0x03<<0) // Voltage reference at 4.34V
#define VREF_DAC2REFSEL_1V5_gc (0x04<<0)  // Voltage reference at 1.5V


//*************************************************************************
//** WDT - Watch-Dog Timer
//*************************************************************************

// WDT_CTRLA masks
#define WDT_PERIOD_gm 0x0F                // Period group mask
#define WDT_PERIOD_gp 0                   // Period group position
#define WDT_PERIOD0_bm (1<<0)             // Period bit 0 mask
#define WDT_PERIOD0_bp 0                  // Period bit 0 position
#define WDT_PERIOD1_bm (1<<1)             // Period bit 1 mask
#define WDT_PERIOD1_bp 1                  // Period bit 1 position
#define WDT_PERIOD2_bm (1<<2)             // Period bit 2 mask
#define WDT_PERIOD2_bp 2                  // Period bit 2 position
#define WDT_PERIOD3_bm (1<<3)             // Period bit 3 mask
#define WDT_PERIOD3_bp 3                  // Period bit 3 position
#define WDT_WINDOW_gm 0xF0                // Window group mask
#define WDT_WINDOW_gp 4                   // Window group position
#define WDT_WINDOW0_bm (1<<4)             // Window bit 0 mask
#define WDT_WINDOW0_bp 4                  // Window bit 0 position
#define WDT_WINDOW1_bm (1<<5)             // Window bit 1 mask
#define WDT_WINDOW1_bp 5                  // Window bit 1 position
#define WDT_WINDOW2_bm (1<<6)             // Window bit 2 mask
#define WDT_WINDOW2_bp 6                  // Window bit 2 position
#define WDT_WINDOW3_bm (1<<7)             // Window bit 3 mask
#define WDT_WINDOW3_bp 7                  // Window bit 3 position

// WDT_STATUS masks
#define WDT_LOCK_bm 0x80                  // Lock enable bit mask
#define WDT_LOCK_bp 7                     // Lock enable bit position
#define WDT_SYNCBUSY_bm 0x01              // Syncronization busy bit mask
#define WDT_SYNCBUSY_bp 0                 // Syncronization busy bit position

// Period select
#define WDT_PERIOD_OFF_gc (0x00<<0)       // Off
#define WDT_PERIOD_8CLK_gc (0x01<<0)      // 8 cycles (8ms)
#define WDT_PERIOD_16CLK_gc (0x02<<0)     // 16 cycles (16ms)
#define WDT_PERIOD_32CLK_gc (0x03<<0)     // 32 cycles (32ms)
#define WDT_PERIOD_64CLK_gc (0x04<<0)     // 64 cycles (64ms)
#define WDT_PERIOD_128CLK_gc (0x05<<0)    // 128 cycles (0.128s)
#define WDT_PERIOD_256CLK_gc (0x06<<0)    // 256 cycles (0.256s)
#define WDT_PERIOD_512CLK_gc (0x07<<0)    // 512 cycles (0.512s)
#define WDT_PERIOD_1KCLK_gc (0x08<<0)     // 1K cycles (1.0s)
#define WDT_PERIOD_2KCLK_gc (0x09<<0)     // 2K cycles (2.0s)
#define WDT_PERIOD_4KCLK_gc (0x0A<<0)     // 4K cycles (4.1s)
#define WDT_PERIOD_8KCLK_gc (0x0B<<0)     // 8K cycles (8.2s)

// Window select
#define WDT_WINDOW_OFF_gc (0x00<<4)       // Off
#define WDT_WINDOW_8CLK_gc (0x01<<4)      // 8 cycles (8ms)
#define WDT_WINDOW_16CLK_gc (0x02<<4)     // 16 cycles (16ms)
#define WDT_WINDOW_32CLK_gc (0x03<<4)     // 32 cycles (32ms)
#define WDT_WINDOW_64CLK_gc (0x04<<4)     // 64 cycles (64ms)
#define WDT_WINDOW_128CLK_gc (0x05<<4)    // 128 cycles (0.128s)
#define WDT_WINDOW_256CLK_gc (0x06<<4)    // 256 cycles (0.256s)
#define WDT_WINDOW_512CLK_gc (0x07<<4)    // 512 cycles (0.512s)
#define WDT_WINDOW_1KCLK_gc (0x08<<4)     // 1K cycles (1.0s)
#define WDT_WINDOW_2KCLK_gc (0x09<<4)     // 2K cycles (2.0s)
#define WDT_WINDOW_4KCLK_gc (0x0A<<4)     // 4K cycles (4.1s)
#define WDT_WINDOW_8KCLK_gc (0x0B<<4)     // 8K cycles (8.2s)




// ***** CPU REGISTER DEFINITIONS *****************************************
#define	XH	r27
#define	XL	r26
#define	YH	r29
#define	YL	r28
#define	ZH	r31
#define	ZL	r30


// ***** DATA MEMORY DECLARATIONS *****************************************


#define DATAMEM_START 0x0000
#define DATAMEM_SIZE 0xC000
#define DATAMEM_END (0x0000 + 0xC000 - 1)

#define EEPROM_START 0x1400
#define EEPROM_SIZE 0x0100
#define EEPROM_END (0x1400 + 0x0100 - 1)

#define FUSES_START 0x1280
#define FUSES_SIZE 0x000A
#define FUSES_END (0x1280 + 0x000A - 1)

#define INTERNAL_SRAM_START 0x3800
#define INTERNAL_SRAM_SIZE 0x0800
#define INTERNAL_SRAM_END (0x3800 + 0x0800 - 1)

#define IO_START 0x0000
#define IO_SIZE 0x1100
#define IO_END (0x0000 + 0x1100 - 1)

#define LOCKBITS_START 0x128A
#define LOCKBITS_SIZE 0x0001
#define LOCKBITS_END (0x128A + 0x0001 - 1)

#define MAPPED_PROGMEM_START 0x8000
#define MAPPED_PROGMEM_SIZE 0x4000
#define MAPPED_PROGMEM_END (0x8000 + 0x4000 - 1)

#define PROD_SIGNATURES_START 0x1103
#define PROD_SIGNATURES_SIZE 0x003D
#define PROD_SIGNATURES_END (0x1103 + 0x003D - 1)

#define SIGNATURES_START 0x1100
#define SIGNATURES_SIZE 0x0003
#define SIGNATURES_END (0x1100 + 0x0003 - 1)

#define USER_SIGNATURES_START 0x1300
#define USER_SIGNATURES_SIZE 0x0020
#define USER_SIGNATURES_END (0x1300 + 0x0020 - 1)

#define PROGMEM_START 0x0000
#define PROGMEM_SIZE 0x4000
#define PROGMEM_END (0x0000 + 0x4000 - 1)

//#define PROGMEM_START 0x0000
//#define PROGMEM_SIZE 0x4000
//#define PROGMEM_END (0x0000 + 0x4000 - 1)


// Legacy definitions
#define    FLASHSTART    (PROGMEM_START / 2) // Note: Word address
#define    FLASHEND      (PROGMEM_END / 2) // Note: Word address
#define    IOEND         IO_END
#define    SRAM_START    INTERNAL_SRAM_START
#define    SRAM_SIZE     INTERNAL_SRAM_SIZE
#define    RAMEND        INTERNAL_SRAM_END
#define    E2END         EEPROM_END
#define    EEPROMEND     EEPROM_END


// Definitions used by the assembler
//#pragma AVRPART MEMORY PROG_FLASH 0x4000
//#pragma AVRPART MEMORY EEPROM 0x0100
//#pragma AVRPART MEMORY INT_SRAM SIZE 0x0800
//#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x3800

// ***** INTERRUPT VECTORS, ABSOLUTE ADDRESSES ****************************

// CRCSCAN interrupt vectors
#define CRCSCAN_NMI_vect 2                // 

// BOD interrupt vectors
#define BOD_VLM_vect 4                    // 

// PORTA interrupt vectors
#define PORTA_PORT_vect 6                 // 

// PORTB interrupt vectors
#define PORTB_PORT_vect 8                 // 

// PORTC interrupt vectors
#define PORTC_PORT_vect 10                // 

// RTC interrupt vectors
#define RTC_CNT_vect 12                   // 
#define RTC_PIT_vect 14                   // 

// TCA0 interrupt vectors
#define TCA0_LUNF_vect 16                 // 
#define TCA0_OVF_vect 16                  // 
#define TCA0_HUNF_vect 18                 // 
#define TCA0_LCMP0_vect 20                // 
#define TCA0_CMP0_vect 20                 // 
#define TCA0_CMP1_vect 22                 // 
#define TCA0_LCMP1_vect 22                // 
#define TCA0_CMP2_vect 24                 // 
#define TCA0_LCMP2_vect 24                // 

// TCB0 interrupt vectors
#define TCB0_INT_vect 26                  // 

// TCB1 interrupt vectors
#define TCB1_INT_vect 28                  // 

// TCD0 interrupt vectors
#define TCD0_OVF_vect 30                  // 
#define TCD0_TRIG_vect 32                 // 

// AC0 interrupt vectors
#define AC0_AC_vect 34                    // 

// AC1 interrupt vectors
#define AC1_AC_vect 36                    // 

// AC2 interrupt vectors
#define AC2_AC_vect 38                    // 

// ADC0 interrupt vectors
#define ADC0_RESRDY_vect 40               // 
#define ADC0_WCOMP_vect 42                // 

// ADC1 interrupt vectors
#define ADC1_RESRDY_vect 44               // 
#define ADC1_WCOMP_vect 46                // 

// TWI0 interrupt vectors
#define TWI0_TWIS_vect 48                 // 
#define TWI0_TWIM_vect 50                 // 

// SPI0 interrupt vectors
#define SPI0_INT_vect 52                  // 

// USART0 interrupt vectors
#define USART0_RXC_vect 54                // 
#define USART0_DRE_vect 56                // 
#define USART0_TXC_vect 58                // 

// NVMCTRL interrupt vectors
#define NVMCTRL_EE_vect 60                // 



// ***** INTERRUPT VECTORS, MODULE BASES **********************************

#define CRCSCAN_vbase 2
#define BOD_vbase 4
#define PORTA_vbase 6
#define PORTB_vbase 8
#define PORTC_vbase 10
#define RTC_vbase 12
#define TCA0_vbase 16
#define TCB0_vbase 26
#define TCB1_vbase 28
#define TCD0_vbase 30
#define AC0_vbase 34
#define AC1_vbase 36
#define AC2_vbase 38
#define ADC0_vbase 40
#define ADC1_vbase 44
#define TWI0_vbase 48
#define SPI0_vbase 52
#define USART0_vbase 54
#define NVMCTRL_vbase 60


// ***** INTERRUPT VECTORS, VECTOR OFFSETS ********************************

// CRCSCAN interrupt vector offsets

#define CRCSCAN_NMI_voffset 0

// BOD interrupt vector offsets

#define BOD_VLM_voffset 0

// PORTA interrupt vector offsets

#define PORTA_PORT_voffset 0

// PORTB interrupt vector offsets

#define PORTB_PORT_voffset 0

// PORTC interrupt vector offsets

#define PORTC_PORT_voffset 0

// RTC interrupt vector offsets

#define RTC_CNT_voffset 0
#define RTC_PIT_voffset 0

// TCA0 interrupt vector offsets

#define TCA0_LUNF_voffset 0
#define TCA0_OVF_voffset 0
#define TCA0_HUNF_voffset 0
#define TCA0_LCMP0_voffset 0
#define TCA0_CMP0_voffset 0
#define TCA0_CMP1_voffset 0
#define TCA0_LCMP1_voffset 0
#define TCA0_CMP2_voffset 0
#define TCA0_LCMP2_voffset 0

// TCB0 interrupt vector offsets

#define TCB0_INT_voffset 0

// TCB1 interrupt vector offsets

#define TCB1_INT_voffset 0

// TCD0 interrupt vector offsets

#define TCD0_OVF_voffset 0
#define TCD0_TRIG_voffset 0

// AC0 interrupt vector offsets

#define AC0_AC_voffset 0

// AC1 interrupt vector offsets

#define AC1_AC_voffset 0

// AC2 interrupt vector offsets

#define AC2_AC_voffset 0

// ADC0 interrupt vector offsets

#define ADC0_RESRDY_voffset 0
#define ADC0_WCOMP_voffset 0

// ADC1 interrupt vector offsets

#define ADC1_RESRDY_voffset 0
#define ADC1_WCOMP_voffset 0

// TWI0 interrupt vector offsets

#define TWI0_TWIS_voffset 0
#define TWI0_TWIM_voffset 0

// SPI0 interrupt vector offsets

#define SPI0_INT_voffset 0

// USART0 interrupt vector offsets

#define USART0_RXC_voffset 0
#define USART0_DRE_voffset 0
#define USART0_TXC_voffset 0

// NVMCTRL interrupt vector offsets

#define NVMCTRL_EE_voffset 0



#define INT_VECTORS_SIZE 62 // size in words


#endif /* _TN1614DEF_INC_ */

// ***** END OF FILE ******************************************************



