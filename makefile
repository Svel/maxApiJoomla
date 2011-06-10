#DIRBASE = $(shell pwd);
DIRBASE = $(PWD)

all: module component

# http://docs.joomla.org/Creating_a_simple_module
module:
	cd $(DIRBASE)/modules/mod_maxposter && find . -print0 | xargs -0 zip $(DIRBASE)/mod_maxposter.zip

# http://docs.joomla.org/Developing_a_Model-View-Controller_Component_-_Part_1
component:
	cd $(DIRBASE)/component && find . ! -name "*.git" ! -path "*.git*" ! -path "*/api/test*" -print0 | xargs -0 zip $(DIRBASE)/com_maxposter.zip

# ложные цели
.PHONY: all module component

