# colors
eR = \e[0m
ecB = \e[0;30m
ecR = \e[0;31m
ecG = \e[0;32m
ecO = \e[0;33m
ecP = \e[0;35m
ecC = \e[0;36m
# constants
BUILD = .build
# variables
d = .

default:
	@echo -e "$(ecG)Decide $(eR)on a target"
ifdef f
	$(MAKE) file
else
	@echo -e "$(ecG)Run $(ecC)all $(eR)on $(ecP)$(d) $(eR)by default"
	$(MAKE) all
endif

file:
	@echo -e "$(ecG)Run $(eR)target $(ecC)file $(eR)on $(ecP)$(d)/$(f)$(eR)"
	@echo -e "$(ecG)Build $(ecP)$(f) $(eR)into $(ecP)$(BUILD)/$(d)$(eR)"
	@mkdir -p .build/$(d)/
	# First run for simple compilation
	@pdflatex -shell-escape -file-line-error -interaction=batchmode -output-directory=$(BUILD)/$(d) $(d)/$(f) || echo -e "$(ecR)Error on first run$(eR)"
	@grep ".*:[0-9]*:.*" $(BUILD)/$(d)/$(f).log -A1 || echo -e "$(ecG)First run ok$(eR)"
	# Make glossaries
ifeq ($($(BUILD)/$(d)/*.glo),)
	# Skip makeglossaries due to missing glossary file
else
	@makeglossaries -d $(BUILD)/$(d) -p $(d)/$(f) || echo -e "$(ecR)Error on makeglossaries$(eR)";
endif
	# Second run for progressive compilation
	@pdflatex -shell-escape -file-line-error -interaction=batchmode -output-directory=$(BUILD)/$(d) $(d)/$(f) || echo -e "$(ecR)Error on second run$(eR)"
	@grep ".*:[0-9]*:.*" $(d)/$(f).log -A1 || echo -e "$(ecG)Second run ok$(eR)"
	@cp $(BUILD)/$(d)/$(f).pdf $(d)/$(f).pdf || echo -e "$(ecR)Missing $(ecP)$(f).pdf$(eR)"
	@$(MAKE) clean

FILES = $(wildcard $(d)/*.tex)
all:
	@echo -e "$(ecG)Run $(eR)target $(ecC)dir $(eR)on $(ecP)$(d)$(eR)"
	@echo -e "$(ecG)Found $(ecP)$(FILES)$(eR)" && $(foreach x, $(FILES), $(MAKE) file f="$(notdir $(basename $(x)))";)

clean:
	@echo -e "$(ecG)Clean$(eR) up directory"
	rm -rf $(BUILD)
	rm -f *.acn *.acr *.aux *.bbl *.blg *-blx.bib *.bcf *.dvi *.glg *.glo *.gls *.glsdefs *.ist *.log *.out *.run.xml *.synctex.gz *.toc *.xdy
	rm -rf _minted*
