#!/bin/sh
## *****************************************************************************
## *
## *   Copyright (C) 1999-2019, International Business Machines
## *   Corporation and others.  All Rights Reserved.
## *
## *****************************************************************************

## this script extracts strings of the form:
##    FSWF("myTag", "Fallback text for myTag");
##
## into the root resource for the project.
##
## NOTE:  
##   - only ONE fswf per line, please.
##
##   - make sure the whole FSWF expression (in the source) is on one line
##
##   - if you do NOT want a string emitted (for example, if you use
##      emitResourceFromFile.sh for a large string) then use this in the
##      source:
##
##	     FSWF ( /* NOEXTRACT */ "htmlHEAD",
##		    "</HEAD>\r\n<BODY BGCOLOR=\"#FFFFFF\" >\r\n");
##
##      The /*NOEXTRACT*/ between the leftparenthesis and the 
##      doublequote is sufficient to break the matching string below.
##
## BUGS
##      Does not escape characters properly!
##      Does not respect commented-out FSWF's, much less #ifdefed out ones!
##      Script NEEDS to be generalized. What about multiple input files? What if you want something other than root_head and root_tail?
##
## Note: FSWF means Fetch String with Fallback.   see locexp.c
export INVOKE_UCONV
echo "// root file. Generated from $*"
echo "// Copyright (C) 2000-2010, International Business Machines"
echo "// It's probably not a good idea to change this file."
echo "// Better to change locexp.c or the ROOT.* source files and rebuild."
echo "// Now with XLIFF tags"
echo
echo "root {"
echo
fgrep -h 'FSWF("' $* | sort | uniq | sed -f ${srcdir}/extractStrings.sed 
echo 
if [ -f ${srcdir}/root.txt.inc ]; then
    echo "// Special Cases"
    echo
    echo
    echo " // Imported from: root.txt.inc "
    cat ${srcdir}/root.txt.inc
fi
echo
echo "}"
echo
