Author: Tobias Grundtvig
Date: October 1st, 2020

This folder contains all final accepted and locked-in parts. For each part, there should be exactly one OpenSCAD file named Part_xxxxxx.scad containing at leats one module named:

Part_xxxxxx_vvvv_Show(simplify=false)

Where xxxxxx is the unique agreed upon part id and vvvv is the version number for that part.
If the part can be 3D-printet, it should also have a module named:

2. -> Part_xxxxxx_vvvv_Print(fitting=0.2, fix_overhangs=true, overhang_factor=0.8)

That produces a printable version of the part.

Every part should have ALL of its dependencies copied into the file, so the file is completely self-contained.
This is important, since dependencies can change or update and the part must be locked-in at its exact agreed upon version. Any updates or improvements to a locked-in part should be reviewed and if accepted result in a new part file with a new part version number.
This effectively means that there can be NO include <> or use <> statements in the file.
All global modules and variables in the file must be prefixed with p_xxxxxx_vvvv_ to avoid name collisions with other parts.
All non-used code must be stripped from the part file.

Each part and version should have an entry in the AllParts.scad file. If the part is not 3D-printable, this should be put into the entry with a call to the NotPrintable() module instead of a call to the Part_xxxxxx_vvvv_Print() module.


 