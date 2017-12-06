d = .
eR = \e[0m
ecB = \e[0;30m
ecR = \e[0;31m
ecG = \e[0;32m
ecO = \e[0;33m
ecP = \e[0;35m
ecC = \e[0;36m

default:
	@echo -e "$(ecG)Decide $(eR)on a target"
ifdef f
	$(MAKE) file
else
	@echo -e "$(ecG)Run $(ecC)dir $(eR)on $(ecP). $(eR)by default"
	$(MAKE) dir
endif

install:
	@echo -e "$(ecG)Copy $(eR)template files to $(ecP)~/.re1/latex-templates$(eR)"
	@mkdir -p $(HOME)/.re1/latex-templates
	@cp ./data/makefile $(HOME)/.re1/latex-templates/makefile
	@cp ./data/school.cls $(HOME)/.re1/latex-templates/school.cls
	@cp ./data/school.tex $(HOME)/.re1/latex-templates/school.tex
	@echo -e "$(ecG)Copy $(eR)executable to $(ecP)/usr/local/bin/re1-latex$(eR)"
	@cp ./bin/re1-latex /usr/local/bin/re1-latex || \
		echo -e "$(ecR)Permission denied for current user."; \
		echo -e "$(ecG)Copy $(eR)executable to $(ecP)/usr/local/bin/re1-latex $(ecC)using sudo$(eR)"; \
		sudo cp ./bin/re1-latex /usr/local/bin/re1-latex || \
			echo -e "$(ecR)Permission denied$(eR)"

uninstall:
	@echo -e "$(ecG)Remove $(eR)template files from $(ecP)~/.re1/latex-templates$(eR)"
	@rm -r $(HOME)/.re1/latex-templates
	@echo -e "$(ecG)Remove $(eR)executable from $(ecP)/usr/local/bin/re1-latex$(eR)"
	@rm -r /usr/local/bin/re1-latex || \
		echo -e "$(ecR)Permission denied for current user."; \
		echo -e "$(ecG)Remove $(eR)executable from $(ecP)/usr/local/bin/re1-latex $(ecC)using sudo$(eR)"; \
		sudo rm /usr/local/bin/re1-latex || \
			echo -e "$(ecR)Permission denied$(eR)"

clean:
	@echo -e "$(ecP)Clean $(eR) holds no functionality at the moment. If you want to remove all files related to $(ecC)re1-latex$(eR) use $(ecP)uninstall $(eR)instead."
