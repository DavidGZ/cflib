/* GEM Resource C Source */

#include "inline.h"


#if !defined(WHITEBAK)
#define WHITEBAK    0x0040
#endif
#if !defined(DRAW3D)
#define DRAW3D      0x0080
#endif

#define FLAGS9  0x0200
#define FLAGS10 0x0400
#define FLAGS11 0x0800
#define FLAGS12 0x1000
#define FLAGS13 0x2000
#define FLAGS14 0x4000
#define FLAGS15 0x8000
#define STATE8  0x0100
#define STATE9  0x0200
#define STATE10 0x0400
#define STATE11 0x0800
#define STATE12 0x1000
#define STATE13 0x2000
#define STATE14 0x4000
#define STATE15 0x8000

static TEDINFO rs_tedinfo[] =
{ "012",
  "\0",
  "\0",
  IBM  , 0, TE_LEFT , 0x1180, 0, 0, 4, 1,
  "0xXX",
  "\0",
  "\0",
  IBM  , 0, TE_LEFT , 0x1180, 0, 0, 5, 1
};

static short RSBB0DATA[] =
{ 0x0000, 0x0000, 0x3FFF, 0xFFFC, 
  0x7FFF, 0xFFFE, 0x7FFC, 0x3FFE, 
  0x7FF8, 0x1FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF8, 0x1FFE, 0x7FFC, 0x3FFE, 
  0x7FFF, 0xFFFE, 0x7FFF, 0xFFFE, 
  0x7F80, 0x0FFE, 0x7F80, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7F80, 0x01FE, 0x7F80, 0x01FE, 
  0x7FFF, 0xFFFE, 0x3FFF, 0xFFFC
};

static short RSBB1DATA[] =
{ 0x0000, 0x0000, 0x3FFF, 0xFFFC, 
  0x7FFF, 0xFFFE, 0x7FF8, 0x1FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF8, 0x1FFE, 
  0x7FFC, 0x3FFE, 0x7FFF, 0xFFFE, 
  0x7FFF, 0xFFFE, 0x7FFC, 0x3FFE, 
  0x7FF8, 0x1FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF8, 0x1FFE, 0x7FFC, 0x3FFE, 
  0x7FFF, 0xFFFE, 0x3FFF, 0xFFFC
};

static short RSBB2DATA[] =
{ 0x0000, 0x0000, 0x3FFF, 0xFFFC, 
  0x7FFF, 0xFFFE, 0x7FF8, 0x1FFE, 
  0x7FE0, 0x07FE, 0x7F80, 0x01FE, 
  0x7F00, 0x00FE, 0x7E00, 0x007E, 
  0x7E01, 0xC07E, 0x7E03, 0xC07E, 
  0x7F07, 0x80FE, 0x7FFF, 0x01FE, 
  0x7FFE, 0x01FE, 0x7FFC, 0x03FE, 
  0x7FF8, 0x07FE, 0x7FF8, 0x07FE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF8, 0x1FFE, 
  0x7FFC, 0x3FFE, 0x7FFF, 0xFFFE, 
  0x7FFF, 0xFFFE, 0x7FFC, 0x3FFE, 
  0x7FF8, 0x1FFE, 0x7FF0, 0x0FFE, 
  0x7FF0, 0x0FFE, 0x7FF0, 0x0FFE, 
  0x7FF8, 0x1FFE, 0x7FFC, 0x3FFE, 
  0x7FFF, 0xFFFE, 0x3FFF, 0xFFFC
};

static short RSBB3DATA[] =
{ 0x007F, 0xFE00, 0x00C0, 0x0300, 
  0x01BF, 0xFD80, 0x037F, 0xFEC0, 
  0x06FF, 0xFF60, 0x0DFF, 0xFFB0, 
  0x1BFF, 0xFFD8, 0x37FF, 0xFFEC, 
  0x6FFF, 0xFFF6, 0xDFFF, 0xFFFB, 
  0xB181, 0x860D, 0xA081, 0x0205, 
  0xA4E7, 0x3265, 0xA7E7, 0x3265, 
  0xA3E7, 0x3265, 0xB1E7, 0x3205, 
  0xB8E7, 0x320D, 0xBCE7, 0x327D, 
  0xA4E7, 0x327D, 0xA0E7, 0x027D, 
  0xB1E7, 0x867D, 0xBFFF, 0xFFFD, 
  0xDFFF, 0xFFFB, 0x6FFF, 0xFFF6, 
  0x37FF, 0xFFEC, 0x1BFF, 0xFFD8, 
  0x0DFF, 0xFFB0, 0x06FF, 0xFF60, 
  0x037F, 0xFEC0, 0x01BF, 0xFD80, 
  0x00C0, 0x0300, 0x007F, 0xFE00
};

static BITBLK rs_bitblk[] =
{ RSBB0DATA,   4,  32,   0,   0, 0x0004,
  RSBB1DATA,   4,  32,   0,   0, 0x0004,
  RSBB2DATA,   4,  32,   0,   0, 0x0004,
  RSBB3DATA,   4,  32,   0,   0, 0x0002
};

static short RS0_MMASK[] =
{ 0x0000, 0x03C0, 0x0FF0, 0x1FF8, 
  0x3FFC, 0x3FFC, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x3FFC, 0x3FFC, 
  0x1FF8, 0x0FF0, 0x03C0, 0x0000
};

static short RS0_MDATA[] =
{ 0x0000, 0x03C0, 0x0C30, 0x1008, 
  0x2004, 0x2004, 0x4002, 0x4002, 
  0x4002, 0x4002, 0x2004, 0x2004, 
  0x1008, 0x0C30, 0x03C0, 0x0000
};

static short RS0_4CMASK[] =
{ 0x0000, 0x03C0, 0x0FF0, 0x1FF8, 
  0x3FFC, 0x3FFC, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x3FFC, 0x3FFC, 
  0x1FF8, 0x0FF0, 0x03C0, 0x0000
};

static short RS0_4CDATA[] =
{ 0x0000, 0x0000, 0x0000, 0x01E8, 
  0x07F4, 0x0FFC, 0x0FFA, 0x1FFA, 
  0x1FFA, 0x1FF2, 0x1FF4, 0x0FE4, 
  0x1788, 0x0C30, 0x03C0, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x01E8, 
  0x07F4, 0x0FFC, 0x0FFA, 0x1FFA, 
  0x1FFA, 0x1FF2, 0x1FF4, 0x0FE4, 
  0x1788, 0x0C30, 0x03C0, 0x0000, 
  0x0000, 0x0000, 0x0000, 0x01E8, 
  0x07F4, 0x0FFC, 0x0FFA, 0x1FFA, 
  0x1FFA, 0x1FF2, 0x1FF4, 0x0FE4, 
  0x1788, 0x0C30, 0x03C0, 0x0000, 
  0x0000, 0x03C0, 0x0C30, 0x1008, 
  0x200C, 0x2004, 0x4006, 0x4006, 
  0x4006, 0x400E, 0x200C, 0x201C, 
  0x1878, 0x0FF0, 0x03C0, 0x0000
};

static short RS0_4SMASK[] =
{ 0x0000, 0x03C0, 0x0FF0, 0x1FF8, 
  0x3FFC, 0x3FFC, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x3FFC, 0x3FFC, 
  0x1FF8, 0x0FF0, 0x03C0, 0x0000
};

static short RS0_4SDATA[] =
{ 0x0000, 0x03C0, 0x0C30, 0x11E8, 
  0x27F0, 0x2DB8, 0x4BD8, 0x5FF8, 
  0x5FF8, 0x5BD0, 0x3DB0, 0x2FE0, 
  0x1780, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x03C0, 0x0C30, 0x11E8, 
  0x27F0, 0x2DB8, 0x4BD8, 0x5FF8, 
  0x5FF8, 0x5BD0, 0x3DB0, 0x2FE0, 
  0x1780, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x03C0, 0x0C30, 0x11E8, 
  0x27F0, 0x2DB8, 0x4BD8, 0x5FF8, 
  0x5FF8, 0x5BD0, 0x3DB0, 0x2FE0, 
  0x1780, 0x0000, 0x0000, 0x0000, 
  0x0000, 0x03C0, 0x0FF0, 0x1E18, 
  0x3804, 0x33C4, 0x77E2, 0x67E2, 
  0x67E2, 0x67E2, 0x23C4, 0x3004, 
  0x1008, 0x0C30, 0x03C0, 0x0000
};

static short RS0_1CMASK[] =
{ 0x0000, 0x03C0, 0x0FF0, 0x1FF8, 
  0x3FFC, 0x3FFC, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x3FFC, 0x3FFC, 
  0x1FF8, 0x0FF0, 0x03C0, 0x0000
};

static short RS0_1CDATA[] =
{ 0x0000, 0x03C0, 0x0C30, 0x1008, 
  0x2004, 0x2004, 0x4002, 0x4002, 
  0x4002, 0x4002, 0x2004, 0x2004, 
  0x1008, 0x0C30, 0x03C0, 0x0000
};

static short RS0_1SMASK[] =
{ 0x0000, 0x03C0, 0x0FF0, 0x1FF8, 
  0x3FFC, 0x3FFC, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x3FFC, 0x3FFC, 
  0x1FF8, 0x0FF0, 0x03C0, 0x0000
};

static short RS0_1SDATA[] =
{ 0x0000, 0x03C0, 0x0C30, 0x1008, 
  0x23C4, 0x27E4, 0x4FF2, 0x4FF2, 
  0x4FF2, 0x4FF2, 0x27E4, 0x23C4, 
  0x1008, 0x0C30, 0x03C0, 0x0000
};

static short RS1_MMASK[] =
{ 0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0x0000
};

static short RS1_MDATA[] =
{ 0xFFFE, 0x8002, 0x8002, 0x8002, 
  0x8002, 0x8002, 0x8002, 0x8002, 
  0x8002, 0x8002, 0x8002, 0x8002, 
  0x8002, 0x8002, 0xFFFE, 0x0000
};

static short RS1_4CMASK[] =
{ 0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0x0000
};

static short RS1_4CDATA[] =
{ 0x0002, 0x7FFC, 0x7FFC, 0x7FFC, 
  0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 
  0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 
  0x7FFC, 0x7FFC, 0x8000, 0x0000, 
  0x0002, 0x7FFC, 0x7FFC, 0x7FFC, 
  0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 
  0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 
  0x7FFC, 0x7FFC, 0x8000, 0x0000, 
  0x0002, 0x7FFC, 0x7FFC, 0x7FFC, 
  0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 
  0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 
  0x7FFC, 0x7FFC, 0x8000, 0x0000, 
  0x0000, 0x0002, 0x0002, 0x0002, 
  0x0002, 0x0002, 0x0002, 0x0002, 
  0x0002, 0x0002, 0x0002, 0x0002, 
  0x0002, 0x0002, 0x7FFE, 0x0000
};

static short RS1_4SMASK[] =
{ 0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0x0000
};

static short RS1_4SDATA[] =
{ 0x0002, 0x7FFC, 0x3FF8, 0x5FF4, 
  0x6FEC, 0x77DC, 0x7BBC, 0x7D7C, 
  0x7EFC, 0x7D7C, 0x7BBC, 0x77DC, 
  0x6FEC, 0x5FF4, 0x8000, 0x0000, 
  0x0002, 0x7FFC, 0x3FF8, 0x5FF4, 
  0x6FEC, 0x77DC, 0x7BBC, 0x7D7C, 
  0x7EFC, 0x7D7C, 0x7BBC, 0x77DC, 
  0x6FEC, 0x5FF4, 0x8000, 0x0000, 
  0x0002, 0x7FFC, 0x3FF8, 0x5FF4, 
  0x6FEC, 0x77DC, 0x7BBC, 0x7D7C, 
  0x7EFC, 0x7D7C, 0x7BBC, 0x77DC, 
  0x6FEC, 0x5FF4, 0x8000, 0x0000, 
  0xFFFC, 0xC004, 0xE00C, 0xB018, 
  0x9830, 0x8C60, 0x86C0, 0x8380, 
  0x8380, 0x86C0, 0x8C60, 0x9830, 
  0xB018, 0xE00C, 0x0000, 0x0000
};

static short RS1_1CMASK[] =
{ 0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0x0000
};

static short RS1_1CDATA[] =
{ 0xFFFE, 0x8002, 0x8002, 0x8002, 
  0x8002, 0x8002, 0x8002, 0x8002, 
  0x8002, 0x8002, 0x8002, 0x8002, 
  0x8002, 0x8002, 0xFFFE, 0x0000
};

static short RS1_1SMASK[] =
{ 0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0xFFFE, 
  0xFFFE, 0xFFFE, 0xFFFE, 0x0000
};

static short RS1_1SDATA[] =
{ 0xFFFE, 0xC006, 0xA00A, 0x9012, 
  0x8822, 0x8442, 0x8282, 0x8102, 
  0x8282, 0x8442, 0x8822, 0x9012, 
  0xA00A, 0xC006, 0xFFFE, 0x0000
};

static short RS2_MMASK[] =
{ 0x0FF0, 0x3FFC, 0x7FFE, 0xFFFF, 
  0xFFFF, 0x7FFE, 0x3FFC, 0x0FF0
};

static short RS2_MDATA[] =
{ 0x0FF0, 0x381C, 0x6006, 0xC003, 
  0xC003, 0x6006, 0x381C, 0x0FF0
};

static short RS2_1CMASK[] =
{ 0x0FF0, 0x3FFC, 0x7FFE, 0xFFFF, 
  0xFFFF, 0x7FFE, 0x3FFC, 0x0FF0
};

static short RS2_1CDATA[] =
{ 0x0FF0, 0x381C, 0x6006, 0xC003, 
  0xC003, 0x6006, 0x381C, 0x0FF0
};

static short RS2_1SMASK[] =
{ 0x0FF0, 0x3FFC, 0x7FFE, 0xFFFF, 
  0xFFFF, 0x7FFE, 0x3FFC, 0x0FF0
};

static short RS2_1SDATA[] =
{ 0x0FF0, 0x381C, 0x63C6, 0xCFF3, 
  0xCFF3, 0x63C6, 0x381C, 0x0FF0
};

static short RS2_4CMASK[] =
{ 0x0FF0, 0x3FFC, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x3FFC, 0x0FF0, 0x0000
};

static short RS2_4CDATA[] =
{ 0x0030, 0x00EC, 0x0FFA, 0x1FFA, 
  0x0FF2, 0x078C, 0x0FF0, 0x0000, 
  0x0030, 0x00EC, 0x0FFA, 0x1FFA, 
  0x0FF2, 0x078C, 0x0FF0, 0x0000, 
  0x0030, 0x00EC, 0x0FFA, 0x1FFA, 
  0x0FF2, 0x078C, 0x0FF0, 0x0000, 
  0x0FF0, 0x301C, 0x4006, 0x4006, 
  0x400E, 0x307C, 0x0FF0, 0x0000
};

static short RS2_4SMASK[] =
{ 0x0FF0, 0x3FFC, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x3FFC, 0x0FF0, 0x0000
};

static short RS2_4SDATA[] =
{ 0x0FF0, 0x33E0, 0x4DB0, 0x5BD8, 
  0x5DB0, 0x3700, 0x0C00, 0x0000, 
  0x0FF0, 0x33E0, 0x4DB0, 0x5BD8, 
  0x5DB0, 0x3700, 0x0C00, 0x0000, 
  0x0FF0, 0x33E0, 0x4DB0, 0x5BD8, 
  0x5DB0, 0x3700, 0x0C00, 0x0000, 
  0x0FF0, 0x3C0C, 0x73C2, 0x67E2, 
  0x63C2, 0x380C, 0x0FF0, 0x0000
};

static short RS3_MMASK[] =
{ 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
};

static short RS3_MDATA[] =
{ 0xFFFF, 0x8001, 0x8001, 0x8001, 
  0x8001, 0x8001, 0x8001, 0xFFFF
};

static short RS3_1CMASK[] =
{ 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
};

static short RS3_1CDATA[] =
{ 0xFFFF, 0x8001, 0x8001, 0x8001, 
  0x8001, 0x8001, 0x8001, 0xFFFF
};

static short RS3_1SMASK[] =
{ 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
};

static short RS3_1SDATA[] =
{ 0xFFFF, 0xB00D, 0x8C31, 0x83C1, 
  0x83C1, 0x8C31, 0xB00D, 0xFFFF
};

static short RS3_4CMASK[] =
{ 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
};

static short RS3_4CDATA[] =
{ 0x0001, 0x7FFE, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x7FFE, 0x8000, 
  0x0001, 0x7FFE, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x7FFE, 0x8000, 
  0x0001, 0x7FFE, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x7FFE, 0x8000, 
  0x0000, 0x0001, 0x0001, 0x0001, 
  0x0001, 0x0001, 0x0001, 0x7FFF
};

static short RS3_4SMASK[] =
{ 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 
  0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
};

static short RS3_4SDATA[] =
{ 0x0001, 0x7FFE, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x7FFE, 0x8000, 
  0x0001, 0x7FFE, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x7FFE, 0x8000, 
  0x0001, 0x7FFE, 0x7FFE, 0x7FFE, 
  0x7FFE, 0x7FFE, 0x7FFE, 0x8000, 
  0xFFFE, 0xF006, 0x8C18, 0x83E0, 
  0x83E0, 0x8C18, 0xF006, 0x0000
};

static CICON rs_cicon[] =
{ 4, RS0_4CDATA, RS0_4CMASK, RS0_4SDATA, RS0_4SMASK, &rs_cicon[1],
  1, RS0_1CDATA, RS0_1CMASK, RS0_1SDATA, RS0_1SMASK, NULL,
  4, RS1_4CDATA, RS1_4CMASK, RS1_4SDATA, RS1_4SMASK, &rs_cicon[3],
  1, RS1_1CDATA, RS1_1CMASK, RS1_1SDATA, RS1_1SMASK, NULL,
  1, RS2_1CDATA, RS2_1CMASK, RS2_1SDATA, RS2_1SMASK, &rs_cicon[5],
  4, RS2_4CDATA, RS2_4CMASK, RS2_4SDATA, RS2_4SMASK, NULL,
  1, RS3_1CDATA, RS3_1CMASK, RS3_1SDATA, RS3_1SMASK, &rs_cicon[7],
  4, RS3_4CDATA, RS3_4CMASK, RS3_4SDATA, RS3_4SMASK, NULL
};

static CICONBLK rs_ciconblk[] =
{ RS0_MMASK, RS0_MDATA, "\0\000", 0x1000|'\0',
    0,   0,   0,   0,  16,  16,   5,   5,   6,   8, &rs_cicon[0],
  RS1_MMASK, RS1_MDATA, "\0\000", 0x1000|'\0',
    0,   0,   0,   0,  16,  16,   5,   5,   6,   8, &rs_cicon[2],
  RS2_MMASK, RS2_MDATA, "\0\000", 0x1000|'\0',
    0,   0,   0,   0,  16,   8,   5,   1,   6,   8, &rs_cicon[4],
  RS3_MMASK, RS3_MDATA, "\0\000", 0x1000|'\0',
    0,   0,   0,   0,  16,   8,   5,   1,   6,   8, &rs_cicon[6]
};

static OBJECT rs_object[] =
{ 
  /******** Tree 0 ALERTBOX ****************************************************/
        -1, AL_TITLE        , AL_BUT3         , G_BOX             ,   /* Object 0  */
  FLAGS10, OUTLINED, (long)0x00021100L,
  0x0000, 0x0000, 0x0033, 0x0009,
  AL_INFO         ,       -1,       -1, G_STRING          ,   /* Object 1 AL_TITLE */
  NONE, WHITEBAK|STATE8|STATE9|STATE10|STATE11|STATE12|STATE13|STATE14|STATE15, (long)"xxxxxxxxxxxxxxxxxx20",
  0x0000, 0x0000, 0x0014, 0x0001,
  AL_ACHT         ,       -1,       -1, G_IMAGE           ,   /* Object 2 AL_INFO */
  NONE, NORMAL, (long)&rs_bitblk[0],
  0x0401, 0x0801, 0x0004, 0x0002,
  AL_QST          ,       -1,       -1, G_IMAGE           ,   /* Object 3 AL_ACHT */
  NONE, NORMAL, (long)&rs_bitblk[1],
  0x0401, 0x0801, 0x0004, 0x0002,
  AL_STOP         ,       -1,       -1, G_IMAGE           ,   /* Object 4 AL_QST */
  NONE, NORMAL, (long)&rs_bitblk[2],
  0x0401, 0x0801, 0x0004, 0x0002,
  AL_STR1         ,       -1,       -1, G_IMAGE           ,   /* Object 5 AL_STOP */
  NONE, NORMAL, (long)&rs_bitblk[3],
  0x0401, 0x0801, 0x0004, 0x0002,
  AL_STR2         ,       -1,       -1, G_STRING          ,   /* Object 6 AL_STR1 */
  NONE, NORMAL, (long)"1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx40",
  0x0407, 0x0801, 0x0028, 0x0001,
  AL_STR3         ,       -1,       -1, G_STRING          ,   /* Object 7 AL_STR2 */
  NONE, NORMAL, (long)"2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx40",
  0x0407, 0x0802, 0x0028, 0x0001,
  AL_STR4         ,       -1,       -1, G_STRING          ,   /* Object 8 AL_STR3 */
  NONE, NORMAL, (long)"3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx40",
  0x0407, 0x0803, 0x0028, 0x0001,
  AL_STR5         ,       -1,       -1, G_STRING          ,   /* Object 9 AL_STR4 */
  NONE, NORMAL, (long)"4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx40",
  0x0407, 0x0804, 0x0028, 0x0001,
  AL_BUT1         ,       -1,       -1, G_STRING          ,   /* Object 10 AL_STR5 */
  NONE, NORMAL, (long)"5xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx40",
  0x0407, 0x0805, 0x0028, 0x0001,
  AL_BUT2         ,       -1,       -1, G_BUTTON          ,   /* Object 11 AL_BUT1 */
  SELECTABLE|EXIT|FLAGS9|FLAGS10, WHITEBAK, (long)"1xxxxxxxxxxxx15",
  0x0006, 0x0007, 0x000F, 0x0101,
  AL_BUT3         ,       -1,       -1, G_BUTTON          ,   /* Object 12 AL_BUT2 */
  SELECTABLE|EXIT|FLAGS9|FLAGS10, WHITEBAK, (long)"2xxxxxxxxxxxx15",
  0x0014, 0x0007, 0x000F, 0x0101,
         0,       -1,       -1, G_BUTTON          ,   /* Object 13 AL_BUT3 */
  SELECTABLE|EXIT|LASTOB|FLAGS9|FLAGS10, WHITEBAK, (long)"3xxxxxxxxxxxx15",
  0x0022, 0x0007, 0x000F, 0x0101,
  
  /******** Tree 1 ASCIITAB ****************************************************/
        -1, AT_TITLE        , AT_ABBRUCH      , G_BOX             ,   /* Object 0  */
  FLAGS10, OUTLINED, (long)0x00021180L,
  0x0000, 0x0000, 0x002A, 0x0817,
  AT_BOX          ,       -1,       -1, G_STRING          ,   /* Object 1 AT_TITLE */
  NONE, WHITEBAK|STATE8|STATE9|STATE10|STATE11|STATE12|STATE13|STATE14|STATE15, (long)"Zeichenauswahl",
  0x0002, 0x0800, 0x000E, 0x0001,
         3,       -1,       -1, G_IBOX            ,   /* Object 2 AT_BOX */
  NONE, NORMAL, (long)0x00011100L,
  0x0002, 0x0002, 0x0026, 0x0013,
  AT_DEZ          ,       -1,       -1, G_STRING          ,   /* Object 3  */
  NONE, NORMAL, (long)"Dez:",
  0x0004, 0x0815, 0x0004, 0x0001,
         5,       -1,       -1, G_TEXT            ,   /* Object 4 AT_DEZ */
  FLAGS10, NORMAL, (long)&rs_tedinfo[0],
  0x0009, 0x0815, 0x0404, 0x0001,
  AT_HEX          ,       -1,       -1, G_STRING          ,   /* Object 5  */
  NONE, NORMAL, (long)"Hex:",
  0x000F, 0x0815, 0x0004, 0x0001,
  AT_ABBRUCH      ,       -1,       -1, G_TEXT            ,   /* Object 6 AT_HEX */
  FLAGS10, NORMAL, (long)&rs_tedinfo[1],
  0x0014, 0x0815, 0x0404, 0x0001,
         0,       -1,       -1, G_BUTTON          ,   /* Object 7 AT_ABBRUCH */
  SELECTABLE|EXIT|LASTOB|FLAGS9|FLAGS10|FLAGS11, NORMAL, (long)"Abbruch",
  0x041C, 0x0815, 0x0408, 0x0001,
  
  /******** Tree 2 BUTTONS ****************************************************/
        -1, BT_RADIO        , BT_CLOW         , G_BOX             ,   /* Object 0  */
  NONE, OUTLINED, (long)0x00021178L,
  0x0000, 0x0000, 0x000E, 0x0005,
  BT_CHECK        ,       -1,       -1, G_CICON           ,   /* Object 1 BT_RADIO */
  NONE, NORMAL, (long)&rs_ciconblk[0],
  0x0004, 0x0001, 0x0002, 0x0001,
  BT_RLOW         ,       -1,       -1, G_CICON           ,   /* Object 2 BT_CHECK */
  NONE, NORMAL, (long)&rs_ciconblk[1],
  0x0004, 0x0003, 0x0002, 0x0001,
  BT_CLOW         ,       -1,       -1, G_CICON           ,   /* Object 3 BT_RLOW */
  NONE, NORMAL, (long)&rs_ciconblk[2],
  0x0008, 0x0401, 0x0002, 0x0900,
         0,       -1,       -1, G_CICON           ,   /* Object 4 BT_CLOW */
  LASTOB, NORMAL, (long)&rs_ciconblk[3],
  0x0008, 0x0403, 0x0002, 0x0900
};

static OBJECT *rs_trindex[] =
{ &rs_object[0],   /* Tree  0 ALERTBOX         */
  &rs_object[14],   /* Tree  1 ASCIITAB         */
  &rs_object[22]    /* Tree  2 BUTTONS          */
};
