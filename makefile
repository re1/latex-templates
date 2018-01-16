d = .
eR = \e[0m
ecB = \e[0;30m
ecR = \e[0;31m
ecG = \e[0;32m
ecO = \e[0;33m
ecP = \e[0;35m
ecC = \e[0;36m

default:
	$(MAKE) install

install:
	@echo -e "$(ecG)Copy $(eR)template files to $(ecP)~/.re1/templates$(eR)"
	@mkdir -p $(HOME)/.re1/templates
	@cp ./school/makefile $(HOME)/.re1/templates/makefile
	@cp ./school/school.cls $(HOME)/.re1/templates/school.cls
	@cp ./school/school.tex $(HOME)/.re1/templates/school.tex
	@echo -e "$(ecG)Copy $(eR)executable to $(ecP)/usr/local/bin/retex$(eR)"
	@cp ./bin/retex /usr/local/bin/retex || \
		echo -e "$(ecR)Permission denied for current user."; \
		echo -e "$(ecG)Copy $(eR)executable to $(ecP)/usr/local/bin/retex $(ecC)using sudo$(eR)"; \
		sudo cp ./bin/retex /usr/local/bin/retex || \
			echo -e "$(ecR)Permission denied$(eR)"

uninstall:
	@echo -e "$(ecG)Remove $(eR)template files from $(ecP)~/.re1/templates$(eR)"
	@rm -r $(HOME)/.re1/templates
	@echo -e "$(ecG)Remove $(eR)executable from $(ecP)/usr/local/bin/retex$(eR)"
	@rm -r /usr/local/bin/retex || \
		echo -e "$(ecR)Permission denied for current user."; \
		echo -e "$(ecG)Remove $(eR)executable from $(ecP)/usr/local/bin/retex $(ecC)using sudo$(eR)"; \
		sudo rm /usr/local/bin/retex || \
			echo -e "$(ecR)Permission denied$(eR)"

clean:
	@echo -e "$(ecP)Clean $(eR) holds no functionality at the moment. If you want to remove all files related to $(ecC)re1/templates$(eR) use $(ecP)uninstall $(eR)instead."
