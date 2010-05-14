SRCDIR = build/hbase
GENDIR = build/tmp
SCRIPTDIR = build/scripts
INTERFACE = https://svn.apache.org/repos/asf/hadoop/hbase/branches/0.20/src/java/org/apache/hadoop/hbase/thrift/Hbase.thrift

all: $(SRCDIR) $(SCRIPTDIR)/Hbase-remote

egg: all
	python setup.py bdist_egg

sdist: all
	python setup.py sdist

$(SRCDIR)/Hbase-remote: $(SRCDIR)
$(SRCDIR): $(GENDIR)/gen-py
	mkdir -p $@
	cp -R $^/hbase/* $@

$(SCRIPTDIR)/Hbase-remote: $(SRCDIR)/Hbase-remote
	mkdir -p $(SCRIPTDIR)
	sed -e s/'import Hbase'/'from hbase import Hbase'/ \
		-e s/'from ttypes import '/'from hbase.ttypes import '/ \
		< $^ > $@
	chmod --reference $^ $@

$(GENDIR)/gen-py: hbase.thrift
	-mkdir -p $(GENDIR)
	thrift -o $(GENDIR) -gen py:new_style=True $^

update:
	@echo "Updating to: $(shell svn info $(INTERFACE) | grep ^Last\ Changed\ Rev | cut -d: -f2)"
	svn cat $(INTERFACE) > $(shell basename $(INTERFACE))

clean:
	rm -rf $(GENDIR) $(SRCDIR) $(SCRIPTDIR) gen-* build dist *.egg-info
