###################################################################################  
###################################################################################  
####################################### SETUP ######################################  
###################################################################################  
###################################################################################  

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
xc7z020clg400-2  
xc7z020clg400-3  
  
ARTY Z7 device:  
  
xc7z020clg400-1  
xc7z020clg400-2  
xc7z020clg400-3  
  
I always use the device labed with '1' at the end. The others may or may not work.  
  
Search and select the device you are using and then click "next"  
  
6.) Click "finish" and you should have your new project open but it's not quite ready to be used.  
7.) Download the constraints file for the FPGA you are using:  

Arty zynq-z2: https://github.com/skyeblu7/sigARCH_Labs/blob/master/setup_tools/arty_zynq_constraints.xdc  
Pynq-z2: https://github.com/skyeblu7/sigARCH_Labs/blob/master/setup_tools/pynq-z2_constraints.xdc  

and put them somewhere safe.
8.) In Vivado, in the main window, make sure you are under "Project Manager". If you are not, then on the left side under "Flow Navigator", select "Project Manager".  
9.) In the window labeled "Sources", click the "+" symbol. A pop-up should appear.  
10.) select "Add or create constraints" and click "next"  
11.) click "Add Files" and location where you saved your constraints file then click "finish". Now you are ready to start coding.  
  
  
# Running your first program on an FPGA  
  
1.) download this file: https://github.com/skyeblu7/sigARCH_Labs/blob/master/setup_tools/LightTest.v and put it somewhere safe  
2.) in Vivado, in "Project Manager", under "Sources", click the "+"  
3.) Select "Add or create design sources" then click "next"  
4.) Select "Add Files" then locate the file you just downloaded and add it then click "finish"  
5.) -------Edit constraints for your particular board----------------  
6.) -------change names in LightTest.v accordingly-------------------  
7.) -------connect FPGA to Vivado------------------------------------  
8.) -------synthesize, implement, bitstream, program device----------  
9.) -------Look at the amazing blinking light------------------------  
10.) ------Praise your overlord for making this guide----------------  
11.) ------You didn't praise hard enough-----------------------------  
12.) ------That's right, you thought I wouldn't notice, well I did---  
13.) ------And now you will face the consequeces---------------------
    
  