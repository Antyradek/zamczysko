RESULT = document.pdf
SOURCE = main.tex
SOURCES = $(SOURCE) macros.tex body.tex
BUILD_DIR = build

$(RESULT) : $(SOURCE) $(SOURCES) | $(BUILD_DIR)
	pdflatex -output-directory $(BUILD_DIR) -file-line-error -halt-on-error -jobname $(RESULT:.pdf=) $(SOURCE) 
	ln -f $(BUILD_DIR)/$(RESULT) $(RESULT)

$(BUILD_DIR) :
	mkdir -p $@
	
.PHONY:clean
clean:
	rm -rf $(BUILD_DIR) $(RESULT)
