    ____                               __  _______  ____ 
   / __ \_________ _____ _____  ____  /  |/  / __ )/ __ \
  / / / / ___/ __ `/ __ `/ __ \/ __ \/ /|_/ / __  / /_/ /
 / /_/ / /  / /_/ / /_/ / /_/ / / / / /  / / /_/ / _, _/ 
/_____/_/   \__,_/\__, /\____/_/ /_/_/  /_/_____/_/ |_|  
                 /____/                                  
--------------------------------------------------------------------------------

Master Boot Record that displays a dragon.

The image is encoded using a run-level encoding to fit in the 512B boot sector.

The scheme is a one byte format: 7 bits represent the run and the final bit
determines the color.

 7    1 0
----------
|      | |
----------

To test, be sure that you have QEMU, or some other virtualization software.

make qemu

will create a bootable ISO and boot qemu using that ISO. To create just a plain
MBR,

make mbr

will output dragon.mbr, which is a valid boot record.
