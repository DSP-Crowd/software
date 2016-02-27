
dts_src_dir = dts
dts_src = $(foreach d, $(dts_src_dir), $(wildcard $(d)/*.dts)) 
dts_obj_dir = dts
dts_obj = $(dts_src:.dts=.dtb)

overlay_src_dir = dts/overlays
overlay_src = $(foreach d, $(overlay_src_dir), $(wildcard $(d)/*.dts)) 
overlay_obj_dir = dts/overlays
overlay_obj = $(overlay_src:.dts=.dtb)

dtc_bin = ../../rpi_linux_build/src/linux/scripts/dtc/dtc
dtc_dts_opt = -I dts -O dtb
dtc_overlay_opt = -I dts -O dtb -b 0 -@

all: $(dts_obj) $(overlay_obj)

$(dts_obj_dir)/%.dtb: $(dts_src_dir)/%.dts
	$(dtc_bin) $(dtc_dts_opt) -o $@ $<
	fdtdump $@

$(overlay_obj_dir)/%.dtb: $(overlay_src_dir)/%.dts
	$(dtc_bin) $(dtc_overlay_opt) -o $@ $<
	fdtdump $@

clean:
	rm -f $(dts_obj_dir)/*.dtb
	rm -f $(overlay_obj_dir)/*.dtb

help:
	@echo "dts_obj = "$(dts_obj)
