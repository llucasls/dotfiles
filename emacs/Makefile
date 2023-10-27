FILES := init.el $(wildcard conf.d/*.el)

ELC_FILES := $(FILES:%.el=%.elc)
ELN_FILES := $(FILES:%.el=%.eln)

CLIENT = emacsclient --alternate-editor=false

all: byte-code

byte-code: $(ELC_FILES)

$(ELC_FILES): %.elc: %.el
	@task.d/compile.el $<

native: $(ELN_FILES)

$(ELN_FILES): %.eln: %.el native-is-available
	$(CLIENT) $(FLAGS) --eval '(native-compile "$<")'

native-is-available:
	@task.d/native-is-available.el

clean:
	rm -f $(ELC_FILES)

.PHONY: all byte-code native clean native-is-available

.SILENT: all
