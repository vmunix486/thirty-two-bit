```
Thirty.
Two.
Bit.
```

The Intel 80386 first got released in June 1986 to the mass public, and it was a godsend for personal computing. For the longest time, the fastest CPU a consumer could buy was an 80286, which was 16-bit, and described by Bill Gates,"Brain dead". Not to say that the 80286 is a bad processor, mind you. In some 16-bit DOS programs it can actually be just as fast, if not faster than a 386SX at the same clockspeed. But there's a few things the 386 has over the 286. One of them is
```
Thirty.
Two.
Bit.
```

I always loved the Intel 386, and wondered why everyone abandoned it. The only reason that everybody gave to ditch the 386 and hop over to the 486 bandwagon was that the 386 didn't have the `cmpxchg` instruction. This always confuzzled me because Linux works perfectly fine on RISC-V, which has a minimum of 47 instructions, while the 386 has 81 instructions. My mantra with most old things is that just because it's slow doesn't mean we should get rid of it.

I found gray386linux a long time ago, but I couldn't mess with it because it kept on erroring out and I didn't have the expertise that I have now. Something that I have now is a much deeper understanding of what makes things tick, and I realized that Nix isn't actually needed to build, and I don't feel like installing something that I just need for 1 thing, when there's Makefiles, which have been tested time and time and time again without fail. This is basically my own version of gray386linux, but with personal improvements and ease of use.

# Compiling

Just `cd` into the `src` directory and type `make`. It will compile all the cross-compile dependancies into `cross`, while the actual i386 binaries will be in `root`.

# TODO

 - Add custom neofetch, pfetch, and screenfetch version
 - Add native C compiler (maybe something like chibicc or TCC)
  - Add binutils
 - Add Nano-X (I AM <ins>**NOT**</ins> DOING X11😭)
 - Add support for making floppinux target
 - Add ncurses
 - Add ALSA
 - Add lighttpd
 - Add links
   - Add directfb as well for graphics and gpm for mouse
 - Add Rogue (I don't like nethack)
 - Add tiny386 and 8086tiny because why the heck not
 - Add package manager for all this

# Notes

Do not expect this to be a full-out daily drivenment linux distro for your 386. This is basically a toy that you can play around with. Once I get this working, you should actually go work on Fiwix, because it is a Microkernel, and needs a lot more help working on it, along with it being a lot better to use than old linux.
