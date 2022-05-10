//
//  eninc2.h
//  Compiled FDTD Method
//
//  Created by (s) Liam Street on 10/05/2022.
//

#ifndef eninc2_h
#define eninc2_h


#endif /* eninc2_h */
#ifndef _EZINC2_H
#define _EZINC2_H
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "fdtd2.h"
void ezIncInit(Grid *g)
double ezInc(double time, double location);

#endif /* matches #ifndef _EZINC2_H */

// Alot of this is C, since its a C header file I assume this is ok.
//Swift has no alernative for these types of files so if it doesnt work will have to sort out an alternative arrangement.
//It may be that we have to scrap the header system all together and figure something else out, a header file in swift is essentialy like a CV for code and initialises alot of the functions/variables.
