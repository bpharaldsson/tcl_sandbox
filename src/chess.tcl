#!/bin/sh
# chess.tcl \
exec tclsh "$0" ${1+"$@"}




proc setup_board { fr sc } {
  for {set i 0} {$i<8} {incr i} {
    for {set j 0} {$j<8} {incr j} {
      if {[expr ($i + $j)%2] == 0} {
	label $fr.square$i$j -width $sc -height [expr $sc/2] \
	      -bg #040404 -fg white -relief raised \
	      -font [font create -size 13]
        grid $fr.square$i$j -row $i -column $j 
      } else {
	label $fr.square$i$j -width $sc -height [expr $sc/2] \
	      -bg #f6f6f6 -fg black -relief raised \
	      -font [font create -size 13]
        grid $fr.square$i$j -row $i -column $j 	  
      }
    $fr.square$i$j configure -text hej
    }
  }
  grid columnconfigure $fr all -pad 0
  grid rowconfigure $fr all -pad 0
}
frame .fr -bg grey -pady 10 -padx 10
pack .fr -fill both -expand 1

setup_board .fr 8