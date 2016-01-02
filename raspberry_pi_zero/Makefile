
src_dir = overlays
src = $(foreach d, $(src_dir), $(wildcard $(d)/*.dts)) 

obj_dir = overlays
obj = $(src:.dts=.dtb)

dtc_bin = ../../rpi_linux_build/src/linux/scripts/dtc/dtc
dtc_opt = -I dts -O dtb -b 0 -@

all: $(obj)

$(obj_dir)/%.dtb: $(src_dir)/%.dts
	$(dtc_bin) $(dtc_opt) -o $@ $<

clean:
	rm -f $(obj_dir)/*.dtb
