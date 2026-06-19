### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=
do.devicecheck=1
do.cleanup=1
device.name1=moonstone
device.name2=sunstone
device.name3=stone
device.name4=gemstone
'; } # end properties

# boot shell variables
BLOCK=boot;
IS_SLOT_DEVICE=auto;
NO_BLOCK_DISPLAY=1;
RAMDISK_COMPRESSION=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;
. tools/ak3-custom.sh;

DEVICE=$(getprop ro.product.device)
MARKET_NAME=$(getprop ro.product.vendor.marketname)

[ -z "$DEVICE" ] && DEVICE="unknown"
[ -z "$MARKET_NAME" ] && MARKET_NAME="Unknown Device"


ui_print " "
ui_print "    CCCCCCCCCCC   111111   3333333333  7777777777777777"
ui_print "  CC:::::::::::C 1:::::1  3::::::::::337::::::::::::::7"
ui_print " C::::::::::::::1::::::1  3333333::::::7::::::::::::::7"
ui_print "C:::::CCCCC:::::111::::1         3:::::777777777::::::7"
ui_print "C:::::C    CCCCC   1:::1      3333:::::3       7:::::7 "
ui_print "C:::::C            1:::1      3:::::::3       7:::::7  "
ui_print "C:::::C            1:::1      3333::::3      7:::::7   "
ui_print "C:::::C            1:::l         3:::3      7:::::7    "
ui_print "C:::::C     CCCCC  1:::l         3::::3    7:::::7     "
ui_print "C:::::CCCCCC::::1111:::l1133333333:::::3  7:::::7      "
ui_print " C::::::::::::::1:::::::::3::::::::::::3 7:::::7       "
ui_print "  CCCCCCCCCCCCCC1111111111333333333333337777777        "
ui_print " "
ui_print "      C137 Kernel for $DEVICE By Nick C137"
ui_print "               be kind to yourself"
ui_print " "


# boot install
split_boot;
flash_boot;
## end boot install

# dtbo install
erase_dtbo
## end dtbo install

# vendor_boot shell variables
BLOCK=vendor_boot;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
split_boot;
check_patches;
flash_boot;
## end vendor_boot install