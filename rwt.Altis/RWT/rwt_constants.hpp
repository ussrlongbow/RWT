// RWT contstants
// we define our own contants for colors and control/style types
// to not interfere with other modules

// Control types
#define RWT_CT_STATIC           0
#define RWT_CT_BUTTON           1
#define RWT_CT_EDIT             2
#define RWT_CT_SLIDER           3
#define RWT_CT_COMBO            4
#define RWT_CT_LISTBOX          5
#define RWT_CT_TOOLBOX          6
#define RWT_CT_CHECKBOXES       7
#define RWT_CT_PROGRESS         8
#define RWT_CT_HTML             9
#define RWT_CT_STATIC_SKEW      10
#define RWT_CT_ACTIVETEXT       11
#define RWT_CT_TREE             12
#define RWT_CT_STRUCTURED_TEXT  13
#define RWT_CT_CONTEXT_MENU     14
#define RWT_CT_CONTROLS_GROUP   15
#define RWT_CT_SHORTCUTBUTTON   16
#define RWT_CT_XKEYDESC         40
#define RWT_CT_XBUTTON          41
#define RWT_CT_XLISTBOX         42
#define RWT_CT_XSLIDER          43
#define RWT_CT_XCOMBO           44
#define RWT_CT_ANIMATED_TEXTURE 45
#define RWT_CT_OBJECT           80
#define RWT_CT_OBJECT_ZOOM      81
#define RWT_CT_OBJECT_CONTAINER 82
#define RWT_CT_OBJECT_CONT_ANIM 83
#define RWT_CT_LINEBREAK        98
#define RWT_CT_USER             99
#define RWT_CT_MAP              100
#define RWT_CT_MAP_MAIN         101
#define RWT_CT_LISTNBOX         102

// Styles static
#define RWT_ST_POS            0x0F
#define RWT_ST_HPOS           0x03
#define RWT_ST_VPOS           0x0C
#define RWT_ST_LEFT           0x00
#define RWT_ST_RIGHT          0x01
#define RWT_ST_CENTER         0x02
#define RWT_ST_DOWN           0x04
#define RWT_ST_UP             0x08
#define RWT_ST_VCENTER        0x0C
#define RWT_ST_GROUP_BOX       96
#define RWT_ST_GROUP_BOX2      112
#define RWT_ST_ROUNDED_CORNER  RWT_ST_GROUP_BOX + RWT_ST_CENTER
#define RWT_ST_ROUNDED_CORNER2 RWT_ST_GROUP_BOX2 + RWT_ST_CENTER
#define RWT_ST_TYPE           0xF0
#define RWT_ST_SINGLE         0x00
#define RWT_ST_MULTI          0x10
#define RWT_ST_TITLE_BAR      0x20
#define RWT_ST_PICTURE        0x30
#define RWT_ST_FRAME          0x40
#define RWT_ST_BACKGROUND     0x50
#define RWT_ST_GROUP_BOX      0x60
#define RWT_ST_GROUP_BOX2     0x70
#define RWT_ST_HUD_BACKGROUND 0x80
#define RWT_ST_TILE_PICTURE   0x90
#define RWT_ST_WITH_RECT      0xA0
#define RWT_ST_LINE           0xB0
#define RWT_ST_SHADOW         0x100
#define RWT_ST_NO_RECT        0x200
#define RWT_ST_KEEP_ASPECT_RATIO  0x800
#define RWT_ST_TITLE          RWT_ST_TITLE_BAR + RWT_ST_CENTER

// Styles sliders
#define RWT_SL_DIR            0x400
#define RWT_SL_VERT           0
#define RWT_SL_HORZ           0x400
#define RWT_SL_TEXTURES       0x10

// Styles progress bar 
#define RWT_ST_VERTICAL       0x01
#define RWT_ST_HORIZONTAL     0

// Styles listbox
#define RWT_LB_TEXTURES       0x10
#define RWT_LB_MULTI          0x20

// Styles tree
#define RWT_TR_SHOWROOT       1
#define RWT_TR_AUTOCOLLAPSE   2

// Styles messagebox
#define RWT_MB_BUTTON_OK      1
#define RWT_MB_BUTTON_CANCEL  2
#define RWT_MB_BUTTON_USER    4

// GUI grid
#define RWT_GUI_GRID_X	0
#define RWT_GUI_GRID_Y	0
#define RWT_GUI_GRID_W	0.04
#define RWT_GUI_GRID_H	0.064
#define RWT_GUI_GRID_WAbs	1
#define RWT_GUI_GRID_HAbs	1

// RWT colors
#define RWT_C_BLACK {0,0,0,1}
#define RWT_C_WHITE {1,1,1,1}
#define RWT_C_RED {1,0,0,1}
#define RWT_C_GREEN {0,1,0,1}
#define RWT_C_BLUE {0,0,1,1}
#define RWT_C_YELLOW {1,1,0,1}
#define RWT_C_TRANSPARENT {0,0,0,0}
#define RWT_C_GUNMETAL {0.16,0.2,0.22,1}
#define RWT_C_SILVER {0.75,0.75,0.75}
