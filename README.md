DragonMBR
---

Master Boot Record that displays a dragon using VGA and standard BIOS routines.
The image is encoded using a run-length encoding to fit in the 512B boot sector. The scheme is a one byte format: 7 bits represent the run and the final bit
determines the color.

     7      1 0
    ------------
    |  RUN   |C|
    ------------

To test, be sure that you have QEMU, or some other virtualization software.

`make qemu`

will create a bootable ISO and boot qemu using that ISO. To create just a plain
MBR,

`make mbr`

will output `dragon.mbr`, which is a valid boot record.

###Preview###

![Rawr!!!](http://i.imgur.com/0zwyQ.png)
