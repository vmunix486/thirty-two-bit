#define CONFIG_EXTRA_CFLAGS "-m32 -march=i386 -mtune=i386 -fcf-protection=none -fno-stack-protector  -fomit-frame-pointer -fno-pic -mno-mmx -mno-sse -Wa,-mtune=generic32 -Os -I../cross/include/"
