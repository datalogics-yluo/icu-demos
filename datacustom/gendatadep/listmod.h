/*
*******************************************************************************
*
*   Copyright (C) 2006-2007, International Business Machines
*   Corporation and others.  All Rights Reserved.
*
*******************************************************************************
*   created on: 2006Oct28
*   created by: George Rhoten
*/

#ifndef LISTMOD_H
#define LISTMOD_H

#include "uvector.h"
#include "package.h"

class ListModifier {
public:
    static void parseModificationList(const char *filename, UVector *hiddenItems, UVector *items);
    static void generateSupplementalItems(const Package &primary, const Package &supplemental, UVector *items);
};

#endif
