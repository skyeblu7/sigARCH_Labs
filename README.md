#######################################################################################  
#######################################################################################  
######################################### SETUP ########################################  
#######################################################################################  
#######################################################################################  

# Install Vivado:  
https://www.xilinx.com/support/download.html  

You will need about 40 Gb of storage for this download.  
You will likely need to run your computer for over an hour, as the download and installation take forever.  
  
Download the "Vivado HLx 2019.1: WebPACK and Editions" for your operating system.   
- If you are using linux, the installation might fail. I never got vivado working on my linux computers, but maybe it'll work for you.  
  
You will be asked to make an account with xilinx. Do so.   

Company name: ACM SIGArch  
Address: 201 N. Goodwin Avenue, Urbana IL, 61801 (it's the address of the ECEB)  
Job function: Student  
Primary Market: High Performance Computing  
  
Or type in whatever you want, idc.  
  
1.) when the installer pop's up click "next"  
2.) login with the account you just made and click "next"  
3.) Check "I Agree" to all options, it won't let you continue until you do, then click "next"  
4.) Select the "Vivado HL WebPACK" then click "next"  
5.)   
  
- Under "Design Tool" UNCHECK "DocNav" unless you want it.   
  
- Under "Devices" UNCHECK "7 Series", "UltraScale", and "UltraScale+" unless you want them (they just allow you to use different types of boards. We don't have any of these types so we don't need them.)  
      
- Under "Installation Options" UNCHECK "Enable WebTalk for SDK to send usage statistics to Xilinx" unless you want it.  
      
- then click "next"  
  
6.) specify where you'd like to download Vivado, I'd just leave it in the default area so it's easy to find. Click "next"  
7.) I think the download and installation starts now, it'll take about an hour  
  
  
# Starting a new Project on Vivado:  
Launch Vivado, it might take some time on the first startup  
  
1.) Select "Create Project"  
2.) A pop-up will appear. Select "next"  
3.) Name your Project and Specify it's location, then select "next"  
4.) Make sure it has selected "RTL Project" and checked "Do not specify sources at this time"  
5.) Now it will ask you what board you are using, here are your choices depending on which FPGA you are using:  
  
PYNQ device:   
xc7z020clg400-1  
  
ARTY Z7 device:  
xc7z020clg400-1  
  
(they are the same)
  
Search and select the device you are using and then click "next"  
  
6.) Click "finish" and you should have your new project open but it's not quite ready to be used.  
7.) Download the constraints file for the FPGA you are using:  

Arty zynq-z2: https://github.com/skyeblu7/sigARCH_Labs/blob/master/setup_tools/arty_zynq_constraints.xdc  
Pynq-z2: https://github.com/skyeblu7/sigARCH_Labs/blob/master/setup_tools/pynq-z2_constraints.xdc  

and put it somewhere safe. This file allows you to interact with components on the board. 
8.) In Vivado, in the main window, make sure you are under "Project Manager". If you are not, then on the left side under "Flow Navigator", select "Project Manager".  
9.) In the window labeled "Sources", click the "+" symbol. A pop-up should appear.  
10.) select "Add or create constraints" and click "next"  
11.) click "Add Files" and location where you saved your constraints file then click "finish". Now you are ready to start coding.  
  
  
# Running your first program on an FPGA  
  
1.) download this file: https://github.com/skyeblu7/sigARCH_Labs/blob/master/setup_tools/LightTest.v and put it somewhere safe  
2.) in Vivado, in "Project Manager", in the "Sources" window, click the "+"  
3.) Select "Add or create design sources" then click "next"  
4.) Select "Add Files" then locate the file you just downloaded and add it then click "finish"  
5.) In the "Project Manager" in the "Sources" window, expand the "Constrants" folder until you see a ".xdc" file, double click it.  
6.) uncomment out lines 8, 9 and 27  
  
    - if you are using Arty Zynq-z2, it will look like this:   
  
    "set_property -dict { PACKAGE_PIN H16    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L13P_T2_MRCC_35 Sch=SYSCLK" (8)  
    "create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { clk }];#set"                         (9)   
    "set_property -dict { PACKAGE_PIN R14    IOSTANDARD LVCMOS33 } [get_ports { led0 }]; #IO_L6N_T0_VREF_34 Sch=LED0"   (27)  
  
    - if you are using pynq-z2, it will look like this:  
  
    "set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L13P_T2_MRCC_35 Sch=sysclk"    (8)  
    "create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { clk }];"                               (9)  
    "set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { led0 }]; #IO_L6N_T0_VREF_34 Sch=led[0]"    (27)  

7.) In Vivado, in the "Project Manager", in the "Sources" window, expand the "Design Sources" folder until you see "main", double click "main"    
8.) plug in the FPGA into your computer using the USB cable. If you are using the pynq, make sure the power switch is on.   
9.) In Vivado, on the left side, go all the way to the bottom of the "Flow Navigator" and click on "Open Hardware Manager"  
10.) At the top of the Hardware Manager window click on "Open target" then "Auto Connect"    
11.) After it finishes, on the left side, under "Flow Navigator", under "Synthesis", click on the green triangle  
12.) Under "Synthesis", under "Implementaion" click the green arrow  
13.) Once those finish click "Generate Bitstream"  
14.) On the left side under "Flow Navigator" all the way at the bottom under "Open Hardware Manager", click "Program Device", and select the option it gives you  
15.) A pop-up shows up, if there isn't a file in the box labeled "Bitstream file" click on the box with 3 dots then locate and double click the ".bit" file in the directory. 
16.) Click "Program". If LD0 is flashing, it means the program is working    
17.) Praise your overlord for making this guide, I accept bitcoin: 1AUPBqqqQj282BQsCxr8jUAaUovDP1R9xu  
    
  # Using Visual Studio Code as your text editor  
  
1.) Open Vivado  
2.) On the toolbar at the top, click on "Tools" and then "Settings"  
3.) On the pop-up menu, click on "Text Editor" then the box with the three dots in it  
4.) In the textbox that shows up, you will need to paste in the path to visual studio's launcher and some extra stuff    
  
something like this:  
- C:/Users/[username]/AppData/Local/Programs/Microsoft VS Code/code.exe -g [file name]:[line number]  
  
5.) then click "OK", "Apply", "OK"  
   
