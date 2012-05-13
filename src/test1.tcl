#!/bin/wish
# test1.tcl

package require Img

proc main_proc {} {

	
  frame .fr -background "#333"
  pack .fr -fill both -expand 1  
  
  checkbutton .fr.c -text "Title?" -command fkn \
  	-variable c_sel -onvalue true -offvalue false
  .fr.c select
  pack .fr.c
  
  image create photo img -file "image1.jpg"
  label .fr.mark -image img
  pack .fr.mark -expand 0
	
  scale .fr.scaler -command { change_bg } -orient horizontal \
	-from 0 -to 255  -showvalue 0 -variable r
  pack .fr.scaler -fill x
	
  scale .fr.scaleg -command { change_bg } -orient horizontal \
	-from 0 -to 255  -showvalue 0 -variable g
  pack .fr.scaleg -fill x
  
  scale .fr.scaleb -command { change_bg } -orient horizontal \
	-from 0 -to 255  -showvalue 0 -variable b
  pack .fr.scaleb -fill x
  
  button .fr.quit -text "Quit" -command { exit }
  pack .fr.quit -padx 1 -pady 2  -expand 1 -fill x 

button .fr.white -text "White" -command { set r 255; set g 255; set b 255; change_bg 0 }  
button .fr.red -text "Red" -command { set r 255; set g 0; set b 0; change_bg 0 }
button .fr.green -text "Green" -command { set r 0; set g 255; set b 0; change_bg 0 }
button .fr.blue -text "Blue" -command { set r 0; set g 0; set b 255; change_bg 0 }

pack .fr.white -padx 1 -pady 2
pack .fr.red -padx 1 -pady 2
pack .fr.green -padx 1 -pady 2
pack .fr.blue -padx 1 -pady 2  
  update idletasks
  fkn
}


proc change_bg { dummy } {
  global r g b  
  .fr configure -background #[format "%02x%02x%02x" $r $g $b]
}


proc fkn {} {
  
  global c_sel
  if {$c_sel == true} {
    wm title . CHECKBUTTON
  } else {
    wm title . ""
  }
}

main_proc