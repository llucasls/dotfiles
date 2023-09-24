ELISP_FILES := init.el $(wildcard conf.d/*.el)

ELC_FILES := $(ELISP_FILES:%.el=%.elc)
ELN_FILES := $(ELISP_FILES:%.el=%.eln)

CLIENT = emacsclient --alternate-editor=false

all: byte-code

byte-code: $(ELC_FILES)

$(ELC_FILES): %.elc: %.el
	$(CLIENT) --eval '(byte-compile-file "$<")'

native: $(ELN_FILES)

$(ELN_FILES): %.eln: %.el
	$(CLIENT) --eval '(native-compile "$<")'

clean:
	rm -f $(ELC_FILES)

.PHONY: all byte-code native clean

.SILENT: all
