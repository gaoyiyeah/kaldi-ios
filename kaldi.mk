# This file was generated using the following command:
# ./configure 

CONFIGURE_VERSION := 6

# Toolchain configuration

CXX = g++
AR = ar
AS = as
RANLIB = ranlib

# Base configuration

DOUBLE_PRECISION = 0
OPENFSTINC = /Users/eusoft/SourceTree/kaldi-build/kaldi-trunk/tools/openfst/include
OPENFSTLIBS = /Users/eusoft/SourceTree/kaldi-build/kaldi-trunk/tools/openfst/lib/libfst.dylib
OPENFSTLDFLAGS = -Wl,-rpath -Wl,/Users/eusoft/SourceTree/kaldi-build/kaldi-trunk/tools/openfst/lib

# Darwin (macOS) configuration

ifndef DOUBLE_PRECISION
$(error DOUBLE_PRECISION not defined.)
endif
ifndef OPENFSTINC
$(error OPENFSTINC not defined.)
endif
ifndef OPENFSTLIBS
$(error OPENFSTLIBS not defined.)
endif

CXXFLAGS = -std=c++11 -I.. -I$(OPENFSTINC) $(EXTRA_CXXFLAGS) \
           -Wall -Wno-sign-compare -Wno-unused-local-typedefs \
           -Wno-deprecated-declarations -Winit-self \
           -DKALDI_DOUBLEPRECISION=$(DOUBLE_PRECISION) \
           -DHAVE_EXECINFO_H=1 -DHAVE_CXXABI_H -DHAVE_CLAPACK \
           -msse -msse2 -pthread \
           -g # -O0 -DKALDI_PARANOID

ifeq ($(KALDI_FLAVOR), dynamic)
CXXFLAGS += -fPIC
endif

# Compiler specific flags
COMPILER = $(shell $(CXX) -v 2>&1)
ifeq ($(findstring clang,$(COMPILER)),clang)
# Suppress annoying clang warnings that are perfectly valid per spec.
CXXFLAGS += -Wno-mismatched-tags
else ifeq ($(findstring GCC,$(COMPILER)),GCC)
# Allow implicit conversions between vectors.
CXXFLAGS += -flax-vector-conversions
endif

LDFLAGS = $(EXTRA_LDFLAGS) $(OPENFSTLDFLAGS) -g
LDLIBS = $(EXTRA_LDLIBS) $(OPENFSTLIBS) -framework Accelerate -lm -lpthread -ldl

# Environment configuration

