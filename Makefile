TARGETS := ar7 wp7 ar86 wp85 localhost

.PHONY: all $(TARGETS)
all: $(TARGETS)

$(TARGETS):
	export TARGET=$@ ; \
	mkapp -v -t $@ \
		  -i $(LEGATO_ROOT)/interfaces/dataConnectionService \
		  -i $(LEGATO_ROOT)/interfaces/modemServices \
		  -i mqttComponent/inc \
		  -i mqttComponent/inc/mqtt \
		  mqttService.adef

clean:
	rm -rf _build_* *.ar7 *.wp7 *.ar86 *.wp85 *.wp85.update *.localhost
