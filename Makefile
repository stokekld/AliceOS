B=bash
DIR=./scripts

checksys:
	$(B) $(DIR)/check-system.sh

createtree:
	$(B) $(DIR)/create-tree.sh

download:
	$(B) $(DIR)/download-package.sh $(LFSTOOLS)/get-list

compilation:
	$(B) $(DIR)/compilation.sh

clean:
	rm -rf $(LFS)
	rm -rf $(BUILD)
