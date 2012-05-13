#!/bin/sh
# test2.tcl \
exec tclsh "$0" ${1+"$@"}
proc make_the_window {} {

     # Create the toplevel window

     toplevel .t
     grid [label .t.l -text "This window\nshould be centered."]
     grid [button .t.d -text Dismiss -command {destroy .t}]

     # Set things up to position the window when it is
     # configured.

     bind .t <Configure> {center_the_toplevel %W}

     return

 }

 proc center_the_toplevel { w } {

     # Callback on the <Configure> event for a toplevel
     # that should be centered on the screen

     # Make sure that we aren't configuring a child window

     if { [string equal $w [winfo toplevel $w]] } {

	 # Calculate the desired geometry

	 set width [winfo reqwidth $w]
	 set height [winfo reqheight $w]
	 set x [expr { ( [winfo vrootwidth  $w] - $width  ) / 2 }]
	 set y [expr { ( [winfo vrootheight $w] - $height ) / 2 }]

	 # Hand the geometry off to the window manager

	 wm geometry $w ${width}x${height}+${x}+${y}

	 # Unbind <Configure> so that this procedure is
	 # not called again when the window manager finishes
	 # centering the window

	 bind $w <Configure> {}

     }

     return
 }

 grid [button .b -text "Test" -command make_the_window] \
     [button .q -text "Quit" -command exit]