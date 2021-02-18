#
# system_prop for klimtlte
#

# Dalvik Heap
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    rild.libpath=/system/lib/libsec-ril.so \
    rild.libargs=-d /dev/ttyS0 \
    ro.telephony.default_network=9
