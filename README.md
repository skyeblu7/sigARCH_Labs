###################################################################################  
###################################################################################  
####################################### SETUP #######################################  
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
  
6.) Click "finish" and you should have your new project open and ready to use.  
  
# Running your first program on an FPGA  
  
  
  
  
  
