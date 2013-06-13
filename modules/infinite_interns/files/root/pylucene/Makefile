
# Makefile for building PyLucene
#
# Supported operating systems: Mac OS X, Linux and Windows.
# See INSTALL file for requirements.
# See jcc/INSTALL for information about --shared.
# 
# Steps to build
#   1. Edit the sections below as documented
#   2. Edit the JARS variable to add optional contrib modules not defaulted
#   3. make
#   4. make install
#
# The install target installs the lucene python extension in python's
# site-packages directory.
#

VERSION=4.3.0-1
LUCENE_SVN_VER=HEAD
LUCENE_VER=4.3.0
LUCENE_SVN=http://svn.apache.org/repos/asf/lucene/dev/tags/lucene_solr_4_3_0
PYLUCENE:=$(shell pwd)
LUCENE_SRC=lucene-java-$(LUCENE_VER)
LUCENE=$(LUCENE_SRC)/lucene

# 
# You need to uncomment and edit the variables below in the section
# corresponding to your operating system.
#
# Windows drive-absolute paths need to be expressed cygwin style.
#
# PREFIX: where programs are normally installed on your system (Unix).
# PREFIX_PYTHON: where your version of python is installed.
# JCC: how jcc is invoked, depending on the python version:
#  - python 2.7:
#      $(PYTHON) -m jcc
#  - python 2.6:
#      $(PYTHON) -m jcc.__main__
#  - python 2.5:
#      $(PYTHON) -m jcc
#  - python 2.4:
#      $(PYTHON) $(PREFIX_PYTHON)/lib/python2.4/site-packages/jcc/__main__.py
# NUM_FILES is the number of wrapper files to generate. By default, jcc
# generates all C++ classes into one single file. This may exceed a compiler
# limit.
#

# Mac OS X 10.6 (64-bit Python 2.6, Java 1.6)
#PREFIX_PYTHON=/usr
#ANT=ant
#PYTHON=$(PREFIX_PYTHON)/bin/python
#JCC=$(PYTHON) -m jcc.__main__ --shared --arch x86_64
#NUM_FILES=8

# Mac OS X 10.6 (MacPorts 1.8.0 64-bit Python 2.7, Java 1.6)
#PREFIX_PYTHON=/opt/local
#ANT=ant
#PYTHON=$(PREFIX_PYTHON)/bin/python
#JCC=$(PYTHON) -m jcc --shared --arch x86_64
#NUM_FILES=8

# Mac OS X 10.6 (64-bit and 32-bit Python 2.6 together, Java 1.6)
#PREFIX_PYTHON=/usr
#ANT=ant
#PYTHON=$(PREFIX_PYTHON)/bin/python
#JCC=$(PYTHON) -m jcc.__main__ --shared --arch x86_64 --arch i386
#NUM_FILES=8

# Mac OS X 10.5 (32-bit Python 2.5, Java 1.5)
#PREFIX_PYTHON=/usr
#ANT=ant
#PYTHON=$(PREFIX_PYTHON)/bin/python
#JCC=$(PYTHON) -m jcc --shared
#NUM_FILES=8

# Mac OS X  (Python 2.3.5, Java 1.5, setuptools 0.6c7, Intel Mac OS X 10.4)
#PREFIX_PYTHON=/usr
#ANT=ant
#PYTHON=$(PREFIX_PYTHON)/bin/python
#JCC=$(PYTHON) /System/Library/Frameworks/Python.framework/Versions/2.3/lib/python2.3/site-packages/JCC-2.3-py2.3-macosx-10.4-i386.egg/jcc/__init__.py
#NUM_FILES=8

# Mac OS X  (Python 2.3.5, Java 1.5, setuptools 0.6c7, PPC Mac OS X 10.4)
#PREFIX_PYTHON=/usr
#ANT=ant
#PYTHON=$(PREFIX_PYTHON)/bin/python
#JCC=$(PYTHON) /System/Library/Frameworks/Python.framework/Versions/2.3/lib/python2.3/site-packages/JCC-2.3-py2.3-macosx-10.4-ppc.egg/jcc/__init__.py
#NUM_FILES=8

# Linux     (Ubuntu 11.10 64-bit, Python 2.7.2, OpenJDK 1.7, setuptools 0.6.16)
# Be sure to also set JDK['linux2'] in jcc's setup.py to the JAVA_HOME value
# used below for ANT (and rebuild jcc after changing it).
PREFIX_PYTHON=/usr
ANT=JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64 /usr/bin/ant
PYTHON=$(PREFIX_PYTHON)/bin/python
JCC=$(PYTHON) -m jcc --shared
NUM_FILES=8

# Linux     (Ubuntu 8.10 64-bit, Python 2.5.2, OpenJDK 1.6, setuptools 0.6c9)
#PREFIX_PYTHON=/usr
#ANT=ant
#PYTHON=$(PREFIX_PYTHON)/bin/python
#JCC=$(PYTHON) -m jcc --shared
#NUM_FILES=8

# Linux     (Ubuntu 6.06, Python 2.4, Java 1.5, no setuptools)
#PREFIX_PYTHON=/usr
#ANT=ant
#PYTHON=$(PREFIX_PYTHON)/bin/python
#JCC=$(PYTHON) $(PREFIX_PYTHON)/lib/python2.4/site-packages/jcc/__init__.py
#NUM_FILES=8

# FreeBSD
#PREFIX_PYTHON=/usr
#ANT=ant
#PYTHON=$(PREFIX_PYTHON)/bin/python
#JCC=$(PYTHON) -m jcc
#NUM_FILES=8

# Solaris   (Solaris 11, Python 2.4 32-bit, Sun Studio 12, Java 1.6)
#PREFIX_PYTHON=/usr
#ANT=/usr/local/apache-ant-1.7.0/bin/ant
#PYTHON=$(PREFIX_PYTHON)/bin/python
#JCC=$(PYTHON) $(PREFIX_PYTHON)/lib/python2.4/site-packages/jcc/__init__.py
#NUM_FILES=8

# Windows   (Win32, Python 2.5.1, Java 1.6, ant 1.7.0)
#PREFIX_PYTHON=/cygdrive/o/Python-2.5.2/PCbuild
#ANT=JAVA_HOME=o:\\Java\\jdk1.6.0_02 /cygdrive/o/java/apache-ant-1.7.0/bin/ant
#PYTHON=$(PREFIX_PYTHON)/python.exe
#JCC=$(PYTHON) -m jcc --shared
#NUM_FILES=8

# Windows   (Win32, msys/MinGW, Python 2.6.4, Java 1.6, ant 1.7.1 (WinAnt))
#PREFIX_PYTHON=/c/Python26
#ANT=JAVA_HOME="c:\\Program Files\\Java\\jdk1.6.0_18" "/c/Program Files/WinAnt/bin/ant"
#PYTHON=$(PREFIX_PYTHON)/python.exe
#JCC=$(PYTHON) -m jcc.__main__ --shared --compiler mingw32
#NUM_FILES=8

# Windows   (Win32, Python 2.7, Java 1.6, ant 1.8.1, Java not on PATH)
#PREFIX_PYTHON=/cygdrive/c/Python27
#ANT=JAVA_HOME=c:\\jdk1.6.0_22 /cygdrive/c/java/apache-ant-1.8.1/bin/ant
#PYTHON=$(PREFIX_PYTHON)/python.exe
#JCC=$(PYTHON) -m jcc --shared --find-jvm-dll
#NUM_FILES=8

JARS=$(LUCENE_JAR)

# comment/uncomment the desired/undesired optional contrib modules below
JARS+=$(ANALYZERS_JAR)          # many language analyzers
JARS+=$(MEMORY_JAR)             # single-document memory index
JARS+=$(HIGHLIGHTER_JAR)        # needs memory contrib
JARS+=$(EXTENSIONS_JAR)         # needs highlighter contrib
JARS+=$(QUERIES_JAR)            # regex and other contrib queries
JARS+=$(QUERYPARSER_JAR)        # query parser
JARS+=$(SANDBOX_JAR)            # needed by query parser
#JARS+=$(SMARTCN_JAR)            # smart chinese analyzer
#JARS+=$(SPATIAL_JAR)            # spatial lucene
JARS+=$(GROUPING_JAR)           # grouping module
JARS+=$(JOIN_JAR)               # join module
JARS+=$(FACET_JAR)              # facet module
JARS+=$(SUGGEST_JAR)            # suggest/spell module


#
# No edits required below
#

SVNOP?=export

ifeq ($(DEBUG),1)
  DEBUG_OPT=--debug
endif

DEFINES=-DPYLUCENE_VER="\"$(VERSION)\"" -DLUCENE_VER="\"$(LUCENE_VER)\""

LUCENE_JAR=$(LUCENE)/build/core/lucene-core-$(LUCENE_VER).jar
ANALYZERS_JAR=$(LUCENE)/build/analysis/common/lucene-analyzers-common-$(LUCENE_VER).jar
HIGHLIGHTER_JAR=$(LUCENE)/build/highlighter/lucene-highlighter-$(LUCENE_VER).jar
MEMORY_JAR=$(LUCENE)/build/memory/lucene-memory-$(LUCENE_VER).jar
EXTENSIONS_JAR=build/jar/extensions.jar
QUERIES_JAR=$(LUCENE)/build/queries/lucene-queries-$(LUCENE_VER).jar
QUERYPARSER_JAR=$(LUCENE)/build/queryparser/lucene-queryparser-$(LUCENE_VER).jar
SANDBOX_JAR=$(LUCENE)/build/sandbox/lucene-sandbox-$(LUCENE_VER).jar
SMARTCN_JAR=$(LUCENE)/build/analysis/smartcn/lucene-analyzers-smartcn-$(LUCENE_VER).jar
SPATIAL_JAR=$(LUCENE)/build/spatial/lucene-spatial-$(LUCENE_VER).jar
GROUPING_JAR=$(LUCENE)/build/grouping/lucene-grouping-$(LUCENE_VER).jar
JOIN_JAR=$(LUCENE)/build/join/lucene-join-$(LUCENE_VER).jar
FACET_JAR=$(LUCENE)/build/facet/lucene-facet-$(LUCENE_VER).jar
SUGGEST_JAR=$(LUCENE)/build/suggest/lucene-suggest-$(LUCENE_VER).jar

ICUPKG:=$(shell which icupkg)

.PHONY: generate compile install default all clean realclean \
	sources ivy test jars distrib

default: all

$(LUCENE_SRC):
	svn $(SVNOP) --depth files -r $(LUCENE_SVN_VER) $(LUCENE_SVN) $(LUCENE_SRC)
	svn $(SVNOP) -r $(LUCENE_SVN_VER) $(LUCENE_SVN)/lucene $(LUCENE_SRC)/lucene

sources: $(LUCENE_SRC)

ivy:
ifeq ($(ANT),)
	$(error ANT is not defined, please edit Makefile as required at top)
else ifeq ($(PYTHON),)
	$(error PYTHON is not defined, please edit Makefile as required at top)
else ifeq ($(JCC),)
	$(error JCC is not defined, please edit Makefile as required at top)
else ifeq ($(NUM_FILES),)
	$(error NUM_FILES is not defined, please edit Makefile as required at top)
endif
	cd $(LUCENE); ($(ANT) ivy-fail || $(ANT) ivy-bootstrap)

to-orig: sources
	mkdir -p $(LUCENE)-orig
	tar -C $(LUCENE) -cf - . | tar -C $(LUCENE)-orig -xvf -

from-orig: $(LUCENE)-orig
	mkdir -p $(LUCENE)
	tar -C $(LUCENE)-orig -cf - . | tar -C $(LUCENE) -xvf -

lucene:
	rm -f $(LUCENE_JAR)
	$(MAKE) $(LUCENE_JAR)

$(LUCENE_JAR): $(LUCENE)
	cd $(LUCENE); $(ANT) -Dversion=$(LUCENE_VER)

$(ANALYZERS_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/analysis; $(ANT) -Dversion=$(LUCENE_VER) compile

$(MEMORY_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/memory; $(ANT) -Dversion=$(LUCENE_VER)

$(HIGHLIGHTER_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/highlighter; $(ANT) -Dversion=$(LUCENE_VER)

$(QUERIES_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/queries; $(ANT) -Dversion=$(LUCENE_VER)

$(QUERYPARSER_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/queryparser; $(ANT) -Dversion=$(LUCENE_VER)	

$(SANDBOX_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/sandbox; $(ANT) -Dversion=$(LUCENE_VER)

$(EXTENSIONS_JAR): $(LUCENE_JAR)
	$(ANT) -f extensions.xml -Dlucene.dir=$(LUCENE_SRC)

$(SMARTCN_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/analysis/smartcn; $(ANT) -Dversion=$(LUCENE_VER)

$(SPATIAL_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/spatial; $(ANT) -Dversion=$(LUCENE_VER)

$(GROUPING_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/grouping; $(ANT) -Dversion=$(LUCENE_VER)

$(JOIN_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/join; $(ANT) -Dversion=$(LUCENE_VER)

$(FACET_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/facet; $(ANT) -Dversion=$(LUCENE_VER)

$(SUGGEST_JAR): $(LUCENE_JAR)
	cd $(LUCENE)/suggest; $(ANT) -Dversion=$(LUCENE_VER)

JCCFLAGS?=

jars: $(JARS)


ifneq ($(ICUPKG),)

ICURES= $(LUCENE)/analysis/icu/src/resources
RESOURCES=--resources $(ICURES)

ifneq ($(PYTHON),)
ENDIANNESS:=$(shell $(PYTHON) -c "import struct; print struct.pack('h', 1) == '\000\001' and 'b' or 'l'")
endif

resources: $(ICURES)/org/apache/lucene/analysis/icu/utr30.dat

$(ICURES)/org/apache/lucene/analysis/icu/utr30.dat: $(ICURES)/org/apache/lucene/analysis/icu/utr30.nrm
	rm -f $@
	cd $(dir $<); $(ICUPKG) --type $(ENDIANNESS) --add $(notdir $<) new $(notdir $@)

else

RESOURCES=

resources:
	@echo ICU not installed

endif

GENERATE=$(JCC) $(foreach jar,$(JARS),--jar $(jar)) \
           $(JCCFLAGS) --use_full_names \
           --package java.lang java.lang.System \
                               java.lang.Runtime \
           --package java.util java.util.Arrays \
                               java.util.Collections \
                               java.util.HashMap \
                               java.util.HashSet \
                               java.util.TreeSet \
                               java.lang.IllegalStateException \
                               java.lang.IndexOutOfBoundsException \
                               java.util.NoSuchElementException \
                     java.text.SimpleDateFormat \
                     java.text.DecimalFormat \
                     java.text.Collator \
           --package java.util.concurrent java.util.concurrent.Executors \
           --package java.util.regex \
           --package java.io java.io.StringReader \
                             java.io.InputStreamReader \
                             java.io.FileInputStream \
           --exclude org.apache.lucene.sandbox.queries.regex.JakartaRegexpCapabilities \
           --exclude org.apache.regexp.RegexpTunnel \
           --python lucene \
           --mapping org.apache.lucene.document.Document 'get:(Ljava/lang/String;)Ljava/lang/String;' \
           --mapping java.util.Properties 'getProperty:(Ljava/lang/String;)Ljava/lang/String;' \
           --sequence java.util.AbstractList 'size:()I' 'get:(I)Ljava/lang/Object;' \
           org.apache.lucene.index.IndexWriter:getReader \
           --version $(LUCENE_VER) \
           --module python/collections.py \
           --module python/ICUNormalizer2Filter.py \
           --module python/ICUFoldingFilter.py \
           --module python/ICUTransformFilter.py \
           $(RESOURCES) \
           --files $(NUM_FILES)

generate: jars
	$(GENERATE)

compile: jars
	$(GENERATE) --build $(DEBUG_OPT)

install: jars
	$(GENERATE) --install $(DEBUG_OPT) $(INSTALL_OPT)

bdist: jars
	$(GENERATE) --bdist

wininst: jars
	$(GENERATE) --wininst

all: sources ivy jars resources compile
	@echo build of $(PYLUCENE_LIB) complete

clean:
	if test -f $(LUCENE)/build.xml; then cd $(LUCENE); $(ANT) clean; fi
	rm -rf $(LUCENE)/build build

realclean:
	if test ! -d $(LUCENE_SRC)/.svn; then rm -rf $(LUCENE_SRC) lucene.egg-info; else rm -rf $(LUCENE)/build; fi
	rm -rf build

OS=$(shell uname)
BUILD_TEST:=$(PYLUCENE)/build/test

ifeq ($(findstring CYGWIN,$(OS)),CYGWIN)
  BUILD_TEST:=`cygpath -aw $(BUILD_TEST)`
else
  ifeq ($(findstring MINGW,$(OS)),MINGW)
    BUILD_TEST:=`$(PYTHON) -c "import os, sys; print os.path.normpath(sys.argv[1]).replace(chr(92), chr(92)*2)" $(BUILD_TEST)`
  endif
endif

install-test:
	mkdir -p $(BUILD_TEST)
	PYTHONPATH=$(BUILD_TEST) $(GENERATE) --install $(DEBUG_OPT) --install-dir $(BUILD_TEST)

test: install-test
	find test -name 'test_*.py' | PYTHONPATH=$(BUILD_TEST) xargs -t -n 1 $(PYTHON)

ARCHIVE=pylucene-$(VERSION)-src.tar.gz

distrib:
	mkdir -p distrib
	svn export --force . distrib/pylucene-$(VERSION)
	tar -cf - --exclude build $(LUCENE_SRC) | tar -C distrib/pylucene-$(VERSION) -xvf -
	cd distrib; tar -cvzf $(ARCHIVE) pylucene-$(VERSION)
	cd distrib; gpg2 --armor --output $(ARCHIVE).asc --detach-sig $(ARCHIVE)
	cd distrib; md5sum $(ARCHIVE) > $(ARCHIVE).md5

stage:
	cd distrib; scp -p $(ARCHIVE) $(ARCHIVE).asc $(ARCHIVE).md5 \
                           people.apache.org:public_html/staging_area

release:
	cd distrib; scp -p $(ARCHIVE) $(ARCHIVE).asc $(ARCHIVE).md5 \
                           people.apache.org:/www/www.apache.org/dist/lucene/pylucene

print-%:
	@echo $* = $($*)
