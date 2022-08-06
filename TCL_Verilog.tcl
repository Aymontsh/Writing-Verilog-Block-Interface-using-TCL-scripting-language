
#Owner : Mohamed Ayman Elsayed
#Description : Verilog Block Interface 
#Date : 5 August 2022

puts ""
puts "****Writing Verilog Block Interface****"
puts ""

set modname "Up_Dn_Counter"
set in_ports "IN Load Up Down CLK"
set in_ports_width "4 1 1 1 1"
set out_ports "High Counter Low"
set out_ports_width "1 4 1"

puts "	module $modname ( "

#input ports

foreach input $in_ports {

	foreach input_width $in_ports_width {

		if { $input_width == 1 } {
			puts "	  input		 $input,"
		} else {
			puts "	  input	  \[[expr $input_width -1 ]:0\]	 $input,"
		}

	set in_ports_length "[llength $in_ports_width ]"
	set in_ports_width "[lrange $in_ports_width 1 "[expr $in_ports_length-1]"]"

	break;
	}

}

#output ports

foreach output $out_ports {

	foreach output_width $out_ports_width {

		set out_ports_length "[llength $out_ports_width ]"

		if { $output_width == 1 } {

			if {$out_ports_length != 1} {
				puts "	  output	 $output,"
			} else {
				puts "	  output	 $output"
			}

	} else {
	
			if {$out_ports_length != 1} {
				puts "	  output  \[[expr $output_width -1 ]:0\]  $output,"
			} else {
				puts "	  output  \[[expr $output_width -1 ]:0\]  $output"
			}

	}	 

		set out_ports_width "[lrange $out_ports_width 1 "[expr $out_ports_length-1]"]"
		break;

	}

}

puts "	  );"






