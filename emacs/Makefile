ELISP_FILES := init.el $(wildcard conf.d/*.el)

ELC_FILES := $(ELISP_FILES:%.el=%.elc)

CLIENT = emacsclient --alternate-editor=false

all: $(ELC_FILES)

$(ELC_FILES): %.elc: %.el
	$(CLIENT) --eval '(byte-compile-file "$<")'

clean:
	rm -f $(ELC_FILES)

.PHONY: all clean
