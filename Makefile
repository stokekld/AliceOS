B=bash
DIR=./scripts

all: checksys createtree download compilation

checksys:
	$(B) $(DIR)/check-system.sh

createtree:
	$(B) $(DIR)/create-tree.sh

download:
	$(B) $(DIR)/download-package.sh $(LFSTOOLS)/get-list

compilation:
	$(B) $(DIR)/compilation.sh

clean:
	rm -rf $(TOOLS)
	rm -rf $(BUILD)
