\newpageon{404}

# Appendix IV: Mariner Mars 1969 Flight Program {-}

\verbatimfont{\tiny\ttfamily}

~~~ {caption="Figure IV-1"}
LOC  OPC  A/TIME B/EVENT      SYMB   OPC  A/TIME B/EVENT

*COM      EXECUTIVE ROUTINE                             ( 7 WORDS)
*COM
  0  CLJ     35      102      EXC0   CLJ     36   REQM          ABORT+EXTRA FE+NAA TESTS, SLEWS
  1  DSJ    126      104      EXC1   DSJ     OV   ROJ1          OV,M/C,OPT FE TEST,TV PIC CTR
  2  DHJ    125       31      EXC2   DHJ   LCH1   CR01          CRUISE AND POST ENCOUNTER EVENTS
  3  DHJ     11        8      EXC3   DHJ   CY04   CY01          Y1 CYCLIC GENERATOR
  4  CLJ    256       12      EXC4   CLJ    256   RT01          READOUT TEXT,NF NON SLEW EVENTS
  5  CLJ      2       18      EXC5   CLJ      2   RDIN          TEST FOR EVENT ADDRESS READIN
  6  HLT    368      489      EXC6   HLT    368    489          END OF SCAN
*COM
*COM      END OF CRUISE CHAIN
*COM
  7  ROJ      2        3      ENDC   ROJ   EXC2   EXC3          END CRUISE SEQUENCE
*COM
*COM      CYCLIC SUBROUTINE FOR Y1 EVENTS
*COM
  8  TAB     10       11      CY01   TAB   CY03   CY04          ENTRY----RELOAD CYCLIC TIME
  9  UNJ      0        4      CY02   UNJ      0   FXC4          RETURN TO EXECUTIVE PROGRAM
 10  DATA  ****      288      CY03  DATA   FILL   0024          CYCLIC TIME STORAGE
 11  DATA  ****      288      CY04  DATA   FILL   0024          COUNTING LOCATION FOR Q1 ENENLK
*COM
*COM      ENABLE FAR ENCOUNTER*ENTRY PT. IS CYEO        ( 11 WORDS)
*COM
 20  ADD     48      112      OFE0  ADD    OFE4   CZ11          ADD 5HRS TO TIME OF N1(2)
 21  ADD     27      109      OFE1  ADD    OFE3   CZ14          ADD F3 EVENT TO CZ14 EVENT TIME
 22  TAB     29       79            TAB    OFE5   CGC6          MOD CYCLE GEN FOR OPT FE(CTR)
 23  TAB     30       84            TAB    OFE6   CGD4          MOD CYCLE GEN FOR OPT FE(EVENT)
 24  CLJ     16       20      CYE0  CLJ      16   OFE0          TEST FOR OPTIONAL FE(DC-32)
 25  DAJ     71       26      CYE2  DAJ    CTR4   CYE3          UPDATE CYCLE GENERATOR (EVENT)
 26  DAJ     69       68      CYE3  DAJ    CTR2   CTR1          UPDATE CYCLE GENERATOR (COUNTER)
 27  DATA     0        8      OFE3  DATA      0   0200          STORAGE FOR F3 EVENT (OPTION)
 28  DATA     5        0      OFE4  DATA   5      0000          TIME STORAGE FOR OPTIONAL FE SHFT
 29  CTJ   ****       43      OFE5  CTJ    FILL   ROJ0          COUNT FOR OPTIONAL FE PICTURES
 30  DATA  ****      451      OFE6  DATA   FILL   3007           DATA FOR OPTIONAL FE PICTURES
*COM
~~~

<!--
![**Figure IV-1**](images/p404.jpg)
-->

This segment of a Mariner programmable sequencer flight program is given
as an example of the sort of flexibility gained by adding a memory to
the system. The first segment, the Executive, is only seven lines, yet
it essentially controlled the software. The remaining code demonstrates
a typical subroutine. The entire length of this program was 128 lines.
