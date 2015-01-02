.PHONY: rd
rd :
	../annotSrcDoc/exec/annotatedR2doc -m man -f R/*.R

.PHONY: install

install:
	R CMD INSTALL .
