
_cps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(void){
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 e4 f0             	and    $0xfffffff0,%esp
cps();
   a:	e8 14 03 00 00       	call   323 <cps>
exit();
   f:	e8 6f 02 00 00       	call   283 <exit>
  14:	66 90                	xchg   %ax,%ax
  16:	66 90                	xchg   %ax,%ax
  18:	66 90                	xchg   %ax,%ax
  1a:	66 90                	xchg   %ax,%ax
  1c:	66 90                	xchg   %ax,%ax
  1e:	66 90                	xchg   %ax,%ax

00000020 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  20:	f3 0f 1e fb          	endbr32 
  24:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  25:	31 c0                	xor    %eax,%eax
{
  27:	89 e5                	mov    %esp,%ebp
  29:	53                   	push   %ebx
  2a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  30:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  34:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  37:	83 c0 01             	add    $0x1,%eax
  3a:	84 d2                	test   %dl,%dl
  3c:	75 f2                	jne    30 <strcpy+0x10>
    ;
  return os;
}
  3e:	89 c8                	mov    %ecx,%eax
  40:	5b                   	pop    %ebx
  41:	5d                   	pop    %ebp
  42:	c3                   	ret    
  43:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000050 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  50:	f3 0f 1e fb          	endbr32 
  54:	55                   	push   %ebp
  55:	89 e5                	mov    %esp,%ebp
  57:	53                   	push   %ebx
  58:	8b 4d 08             	mov    0x8(%ebp),%ecx
  5b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  5e:	0f b6 01             	movzbl (%ecx),%eax
  61:	0f b6 1a             	movzbl (%edx),%ebx
  64:	84 c0                	test   %al,%al
  66:	75 19                	jne    81 <strcmp+0x31>
  68:	eb 26                	jmp    90 <strcmp+0x40>
  6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  70:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  74:	83 c1 01             	add    $0x1,%ecx
  77:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  7a:	0f b6 1a             	movzbl (%edx),%ebx
  7d:	84 c0                	test   %al,%al
  7f:	74 0f                	je     90 <strcmp+0x40>
  81:	38 d8                	cmp    %bl,%al
  83:	74 eb                	je     70 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  85:	29 d8                	sub    %ebx,%eax
}
  87:	5b                   	pop    %ebx
  88:	5d                   	pop    %ebp
  89:	c3                   	ret    
  8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  90:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  92:	29 d8                	sub    %ebx,%eax
}
  94:	5b                   	pop    %ebx
  95:	5d                   	pop    %ebp
  96:	c3                   	ret    
  97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9e:	66 90                	xchg   %ax,%ax

000000a0 <strlen>:

uint
strlen(const char *s)
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  aa:	80 3a 00             	cmpb   $0x0,(%edx)
  ad:	74 21                	je     d0 <strlen+0x30>
  af:	31 c0                	xor    %eax,%eax
  b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  b8:	83 c0 01             	add    $0x1,%eax
  bb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  bf:	89 c1                	mov    %eax,%ecx
  c1:	75 f5                	jne    b8 <strlen+0x18>
    ;
  return n;
}
  c3:	89 c8                	mov    %ecx,%eax
  c5:	5d                   	pop    %ebp
  c6:	c3                   	ret    
  c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ce:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
  d0:	31 c9                	xor    %ecx,%ecx
}
  d2:	5d                   	pop    %ebp
  d3:	89 c8                	mov    %ecx,%eax
  d5:	c3                   	ret    
  d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dd:	8d 76 00             	lea    0x0(%esi),%esi

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	57                   	push   %edi
  e8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  eb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  f1:	89 d7                	mov    %edx,%edi
  f3:	fc                   	cld    
  f4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  f6:	89 d0                	mov    %edx,%eax
  f8:	5f                   	pop    %edi
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    
  fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop

00000100 <strchr>:

char*
strchr(const char *s, char c)
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	8b 45 08             	mov    0x8(%ebp),%eax
 10a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 10e:	0f b6 10             	movzbl (%eax),%edx
 111:	84 d2                	test   %dl,%dl
 113:	75 16                	jne    12b <strchr+0x2b>
 115:	eb 21                	jmp    138 <strchr+0x38>
 117:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11e:	66 90                	xchg   %ax,%ax
 120:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 124:	83 c0 01             	add    $0x1,%eax
 127:	84 d2                	test   %dl,%dl
 129:	74 0d                	je     138 <strchr+0x38>
    if(*s == c)
 12b:	38 d1                	cmp    %dl,%cl
 12d:	75 f1                	jne    120 <strchr+0x20>
      return (char*)s;
  return 0;
}
 12f:	5d                   	pop    %ebp
 130:	c3                   	ret    
 131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 138:	31 c0                	xor    %eax,%eax
}
 13a:	5d                   	pop    %ebp
 13b:	c3                   	ret    
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000140 <gets>:

char*
gets(char *buf, int max)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	57                   	push   %edi
 148:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 149:	31 f6                	xor    %esi,%esi
{
 14b:	53                   	push   %ebx
 14c:	89 f3                	mov    %esi,%ebx
 14e:	83 ec 1c             	sub    $0x1c,%esp
 151:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 154:	eb 33                	jmp    189 <gets+0x49>
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 160:	83 ec 04             	sub    $0x4,%esp
 163:	8d 45 e7             	lea    -0x19(%ebp),%eax
 166:	6a 01                	push   $0x1
 168:	50                   	push   %eax
 169:	6a 00                	push   $0x0
 16b:	e8 2b 01 00 00       	call   29b <read>
    if(cc < 1)
 170:	83 c4 10             	add    $0x10,%esp
 173:	85 c0                	test   %eax,%eax
 175:	7e 1c                	jle    193 <gets+0x53>
      break;
    buf[i++] = c;
 177:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 17b:	83 c7 01             	add    $0x1,%edi
 17e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 181:	3c 0a                	cmp    $0xa,%al
 183:	74 23                	je     1a8 <gets+0x68>
 185:	3c 0d                	cmp    $0xd,%al
 187:	74 1f                	je     1a8 <gets+0x68>
  for(i=0; i+1 < max; ){
 189:	83 c3 01             	add    $0x1,%ebx
 18c:	89 fe                	mov    %edi,%esi
 18e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 191:	7c cd                	jl     160 <gets+0x20>
 193:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 195:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 198:	c6 03 00             	movb   $0x0,(%ebx)
}
 19b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19e:	5b                   	pop    %ebx
 19f:	5e                   	pop    %esi
 1a0:	5f                   	pop    %edi
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    
 1a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a7:	90                   	nop
 1a8:	8b 75 08             	mov    0x8(%ebp),%esi
 1ab:	8b 45 08             	mov    0x8(%ebp),%eax
 1ae:	01 de                	add    %ebx,%esi
 1b0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1b2:	c6 03 00             	movb   $0x0,(%ebx)
}
 1b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b8:	5b                   	pop    %ebx
 1b9:	5e                   	pop    %esi
 1ba:	5f                   	pop    %edi
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi

000001c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	56                   	push   %esi
 1c8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c9:	83 ec 08             	sub    $0x8,%esp
 1cc:	6a 00                	push   $0x0
 1ce:	ff 75 08             	pushl  0x8(%ebp)
 1d1:	e8 ed 00 00 00       	call   2c3 <open>
  if(fd < 0)
 1d6:	83 c4 10             	add    $0x10,%esp
 1d9:	85 c0                	test   %eax,%eax
 1db:	78 2b                	js     208 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 1dd:	83 ec 08             	sub    $0x8,%esp
 1e0:	ff 75 0c             	pushl  0xc(%ebp)
 1e3:	89 c3                	mov    %eax,%ebx
 1e5:	50                   	push   %eax
 1e6:	e8 f0 00 00 00       	call   2db <fstat>
  close(fd);
 1eb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ee:	89 c6                	mov    %eax,%esi
  close(fd);
 1f0:	e8 b6 00 00 00       	call   2ab <close>
  return r;
 1f5:	83 c4 10             	add    $0x10,%esp
}
 1f8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1fb:	89 f0                	mov    %esi,%eax
 1fd:	5b                   	pop    %ebx
 1fe:	5e                   	pop    %esi
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 208:	be ff ff ff ff       	mov    $0xffffffff,%esi
 20d:	eb e9                	jmp    1f8 <stat+0x38>
 20f:	90                   	nop

00000210 <atoi>:

int
atoi(const char *s)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	53                   	push   %ebx
 218:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 21b:	0f be 02             	movsbl (%edx),%eax
 21e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 221:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 224:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 229:	77 1a                	ja     245 <atoi+0x35>
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop
    n = n*10 + *s++ - '0';
 230:	83 c2 01             	add    $0x1,%edx
 233:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 236:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 23a:	0f be 02             	movsbl (%edx),%eax
 23d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 240:	80 fb 09             	cmp    $0x9,%bl
 243:	76 eb                	jbe    230 <atoi+0x20>
  return n;
}
 245:	89 c8                	mov    %ecx,%eax
 247:	5b                   	pop    %ebx
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    
 24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	57                   	push   %edi
 258:	8b 45 10             	mov    0x10(%ebp),%eax
 25b:	8b 55 08             	mov    0x8(%ebp),%edx
 25e:	56                   	push   %esi
 25f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 262:	85 c0                	test   %eax,%eax
 264:	7e 0f                	jle    275 <memmove+0x25>
 266:	01 d0                	add    %edx,%eax
  dst = vdst;
 268:	89 d7                	mov    %edx,%edi
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 270:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 271:	39 f8                	cmp    %edi,%eax
 273:	75 fb                	jne    270 <memmove+0x20>
  return vdst;
}
 275:	5e                   	pop    %esi
 276:	89 d0                	mov    %edx,%eax
 278:	5f                   	pop    %edi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    

0000027b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27b:	b8 01 00 00 00       	mov    $0x1,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <exit>:
SYSCALL(exit)
 283:	b8 02 00 00 00       	mov    $0x2,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <wait>:
SYSCALL(wait)
 28b:	b8 03 00 00 00       	mov    $0x3,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <pipe>:
SYSCALL(pipe)
 293:	b8 04 00 00 00       	mov    $0x4,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <read>:
SYSCALL(read)
 29b:	b8 05 00 00 00       	mov    $0x5,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <write>:
SYSCALL(write)
 2a3:	b8 10 00 00 00       	mov    $0x10,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <close>:
SYSCALL(close)
 2ab:	b8 15 00 00 00       	mov    $0x15,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <kill>:
SYSCALL(kill)
 2b3:	b8 06 00 00 00       	mov    $0x6,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <exec>:
SYSCALL(exec)
 2bb:	b8 07 00 00 00       	mov    $0x7,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <open>:
SYSCALL(open)
 2c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <mknod>:
SYSCALL(mknod)
 2cb:	b8 11 00 00 00       	mov    $0x11,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <unlink>:
SYSCALL(unlink)
 2d3:	b8 12 00 00 00       	mov    $0x12,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <fstat>:
SYSCALL(fstat)
 2db:	b8 08 00 00 00       	mov    $0x8,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <link>:
SYSCALL(link)
 2e3:	b8 13 00 00 00       	mov    $0x13,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mkdir>:
SYSCALL(mkdir)
 2eb:	b8 14 00 00 00       	mov    $0x14,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <chdir>:
SYSCALL(chdir)
 2f3:	b8 09 00 00 00       	mov    $0x9,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <dup>:
SYSCALL(dup)
 2fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <getpid>:
SYSCALL(getpid)
 303:	b8 0b 00 00 00       	mov    $0xb,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <sbrk>:
SYSCALL(sbrk)
 30b:	b8 0c 00 00 00       	mov    $0xc,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sleep>:
SYSCALL(sleep)
 313:	b8 0d 00 00 00       	mov    $0xd,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <uptime>:
SYSCALL(uptime)
 31b:	b8 0e 00 00 00       	mov    $0xe,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <cps>:
SYSCALL(cps)
 323:	b8 16 00 00 00       	mov    $0x16,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    
 32b:	66 90                	xchg   %ax,%ax
 32d:	66 90                	xchg   %ax,%ax
 32f:	90                   	nop

00000330 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
 336:	83 ec 3c             	sub    $0x3c,%esp
 339:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 33c:	89 d1                	mov    %edx,%ecx
{
 33e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 341:	85 d2                	test   %edx,%edx
 343:	0f 89 7f 00 00 00    	jns    3c8 <printint+0x98>
 349:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 34d:	74 79                	je     3c8 <printint+0x98>
    neg = 1;
 34f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 356:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 358:	31 db                	xor    %ebx,%ebx
 35a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 360:	89 c8                	mov    %ecx,%eax
 362:	31 d2                	xor    %edx,%edx
 364:	89 cf                	mov    %ecx,%edi
 366:	f7 75 c4             	divl   -0x3c(%ebp)
 369:	0f b6 92 50 07 00 00 	movzbl 0x750(%edx),%edx
 370:	89 45 c0             	mov    %eax,-0x40(%ebp)
 373:	89 d8                	mov    %ebx,%eax
 375:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 378:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 37b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 37e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 381:	76 dd                	jbe    360 <printint+0x30>
  if(neg)
 383:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 386:	85 c9                	test   %ecx,%ecx
 388:	74 0c                	je     396 <printint+0x66>
    buf[i++] = '-';
 38a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 38f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 391:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 396:	8b 7d b8             	mov    -0x48(%ebp),%edi
 399:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 39d:	eb 07                	jmp    3a6 <printint+0x76>
 39f:	90                   	nop
 3a0:	0f b6 13             	movzbl (%ebx),%edx
 3a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3a6:	83 ec 04             	sub    $0x4,%esp
 3a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ac:	6a 01                	push   $0x1
 3ae:	56                   	push   %esi
 3af:	57                   	push   %edi
 3b0:	e8 ee fe ff ff       	call   2a3 <write>
  while(--i >= 0)
 3b5:	83 c4 10             	add    $0x10,%esp
 3b8:	39 de                	cmp    %ebx,%esi
 3ba:	75 e4                	jne    3a0 <printint+0x70>
    putc(fd, buf[i]);
}
 3bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bf:	5b                   	pop    %ebx
 3c0:	5e                   	pop    %esi
 3c1:	5f                   	pop    %edi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 3cf:	eb 87                	jmp    358 <printint+0x28>
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	57                   	push   %edi
 3e8:	56                   	push   %esi
 3e9:	53                   	push   %ebx
 3ea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3ed:	8b 75 0c             	mov    0xc(%ebp),%esi
 3f0:	0f b6 1e             	movzbl (%esi),%ebx
 3f3:	84 db                	test   %bl,%bl
 3f5:	0f 84 b4 00 00 00    	je     4af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 3fb:	8d 45 10             	lea    0x10(%ebp),%eax
 3fe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 401:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 404:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 406:	89 45 d0             	mov    %eax,-0x30(%ebp)
 409:	eb 33                	jmp    43e <printf+0x5e>
 40b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop
 410:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 413:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 418:	83 f8 25             	cmp    $0x25,%eax
 41b:	74 17                	je     434 <printf+0x54>
  write(fd, &c, 1);
 41d:	83 ec 04             	sub    $0x4,%esp
 420:	88 5d e7             	mov    %bl,-0x19(%ebp)
 423:	6a 01                	push   $0x1
 425:	57                   	push   %edi
 426:	ff 75 08             	pushl  0x8(%ebp)
 429:	e8 75 fe ff ff       	call   2a3 <write>
 42e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 431:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 434:	0f b6 1e             	movzbl (%esi),%ebx
 437:	83 c6 01             	add    $0x1,%esi
 43a:	84 db                	test   %bl,%bl
 43c:	74 71                	je     4af <printf+0xcf>
    c = fmt[i] & 0xff;
 43e:	0f be cb             	movsbl %bl,%ecx
 441:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 444:	85 d2                	test   %edx,%edx
 446:	74 c8                	je     410 <printf+0x30>
      }
    } else if(state == '%'){
 448:	83 fa 25             	cmp    $0x25,%edx
 44b:	75 e7                	jne    434 <printf+0x54>
      if(c == 'd'){
 44d:	83 f8 64             	cmp    $0x64,%eax
 450:	0f 84 9a 00 00 00    	je     4f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 456:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 45c:	83 f9 70             	cmp    $0x70,%ecx
 45f:	74 5f                	je     4c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 461:	83 f8 73             	cmp    $0x73,%eax
 464:	0f 84 d6 00 00 00    	je     540 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 46a:	83 f8 63             	cmp    $0x63,%eax
 46d:	0f 84 8d 00 00 00    	je     500 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 473:	83 f8 25             	cmp    $0x25,%eax
 476:	0f 84 b4 00 00 00    	je     530 <printf+0x150>
  write(fd, &c, 1);
 47c:	83 ec 04             	sub    $0x4,%esp
 47f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 483:	6a 01                	push   $0x1
 485:	57                   	push   %edi
 486:	ff 75 08             	pushl  0x8(%ebp)
 489:	e8 15 fe ff ff       	call   2a3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 48e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 491:	83 c4 0c             	add    $0xc,%esp
 494:	6a 01                	push   $0x1
 496:	83 c6 01             	add    $0x1,%esi
 499:	57                   	push   %edi
 49a:	ff 75 08             	pushl  0x8(%ebp)
 49d:	e8 01 fe ff ff       	call   2a3 <write>
  for(i = 0; fmt[i]; i++){
 4a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 4a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 4a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 4ab:	84 db                	test   %bl,%bl
 4ad:	75 8f                	jne    43e <printf+0x5e>
    }
  }
}
 4af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b2:	5b                   	pop    %ebx
 4b3:	5e                   	pop    %esi
 4b4:	5f                   	pop    %edi
 4b5:	5d                   	pop    %ebp
 4b6:	c3                   	ret    
 4b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 4c0:	83 ec 0c             	sub    $0xc,%esp
 4c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4c8:	6a 00                	push   $0x0
 4ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
 4d0:	8b 13                	mov    (%ebx),%edx
 4d2:	e8 59 fe ff ff       	call   330 <printint>
        ap++;
 4d7:	89 d8                	mov    %ebx,%eax
 4d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4dc:	31 d2                	xor    %edx,%edx
        ap++;
 4de:	83 c0 04             	add    $0x4,%eax
 4e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4e4:	e9 4b ff ff ff       	jmp    434 <printf+0x54>
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 4f0:	83 ec 0c             	sub    $0xc,%esp
 4f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4f8:	6a 01                	push   $0x1
 4fa:	eb ce                	jmp    4ca <printf+0xea>
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 500:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 503:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 506:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 508:	6a 01                	push   $0x1
        ap++;
 50a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 50d:	57                   	push   %edi
 50e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 511:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 514:	e8 8a fd ff ff       	call   2a3 <write>
        ap++;
 519:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 51c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 51f:	31 d2                	xor    %edx,%edx
 521:	e9 0e ff ff ff       	jmp    434 <printf+0x54>
 526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 530:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 533:	83 ec 04             	sub    $0x4,%esp
 536:	e9 59 ff ff ff       	jmp    494 <printf+0xb4>
 53b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop
        s = (char*)*ap;
 540:	8b 45 d0             	mov    -0x30(%ebp),%eax
 543:	8b 18                	mov    (%eax),%ebx
        ap++;
 545:	83 c0 04             	add    $0x4,%eax
 548:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 54b:	85 db                	test   %ebx,%ebx
 54d:	74 17                	je     566 <printf+0x186>
        while(*s != 0){
 54f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 552:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 554:	84 c0                	test   %al,%al
 556:	0f 84 d8 fe ff ff    	je     434 <printf+0x54>
 55c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 55f:	89 de                	mov    %ebx,%esi
 561:	8b 5d 08             	mov    0x8(%ebp),%ebx
 564:	eb 1a                	jmp    580 <printf+0x1a0>
          s = "(null)";
 566:	bb 48 07 00 00       	mov    $0x748,%ebx
        while(*s != 0){
 56b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 56e:	b8 28 00 00 00       	mov    $0x28,%eax
 573:	89 de                	mov    %ebx,%esi
 575:	8b 5d 08             	mov    0x8(%ebp),%ebx
 578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57f:	90                   	nop
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
          s++;
 583:	83 c6 01             	add    $0x1,%esi
 586:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 589:	6a 01                	push   $0x1
 58b:	57                   	push   %edi
 58c:	53                   	push   %ebx
 58d:	e8 11 fd ff ff       	call   2a3 <write>
        while(*s != 0){
 592:	0f b6 06             	movzbl (%esi),%eax
 595:	83 c4 10             	add    $0x10,%esp
 598:	84 c0                	test   %al,%al
 59a:	75 e4                	jne    580 <printf+0x1a0>
 59c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 59f:	31 d2                	xor    %edx,%edx
 5a1:	e9 8e fe ff ff       	jmp    434 <printf+0x54>
 5a6:	66 90                	xchg   %ax,%ax
 5a8:	66 90                	xchg   %ax,%ax
 5aa:	66 90                	xchg   %ax,%ax
 5ac:	66 90                	xchg   %ax,%ax
 5ae:	66 90                	xchg   %ax,%ax

000005b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b0:	f3 0f 1e fb          	endbr32 
 5b4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b5:	a1 f0 09 00 00       	mov    0x9f0,%eax
{
 5ba:	89 e5                	mov    %esp,%ebp
 5bc:	57                   	push   %edi
 5bd:	56                   	push   %esi
 5be:	53                   	push   %ebx
 5bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5c2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 5c4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c7:	39 c8                	cmp    %ecx,%eax
 5c9:	73 15                	jae    5e0 <free+0x30>
 5cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop
 5d0:	39 d1                	cmp    %edx,%ecx
 5d2:	72 14                	jb     5e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d4:	39 d0                	cmp    %edx,%eax
 5d6:	73 10                	jae    5e8 <free+0x38>
{
 5d8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5da:	8b 10                	mov    (%eax),%edx
 5dc:	39 c8                	cmp    %ecx,%eax
 5de:	72 f0                	jb     5d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e0:	39 d0                	cmp    %edx,%eax
 5e2:	72 f4                	jb     5d8 <free+0x28>
 5e4:	39 d1                	cmp    %edx,%ecx
 5e6:	73 f0                	jae    5d8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ee:	39 fa                	cmp    %edi,%edx
 5f0:	74 1e                	je     610 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5f5:	8b 50 04             	mov    0x4(%eax),%edx
 5f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5fb:	39 f1                	cmp    %esi,%ecx
 5fd:	74 28                	je     627 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 601:	5b                   	pop    %ebx
  freep = p;
 602:	a3 f0 09 00 00       	mov    %eax,0x9f0
}
 607:	5e                   	pop    %esi
 608:	5f                   	pop    %edi
 609:	5d                   	pop    %ebp
 60a:	c3                   	ret    
 60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 610:	03 72 04             	add    0x4(%edx),%esi
 613:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 616:	8b 10                	mov    (%eax),%edx
 618:	8b 12                	mov    (%edx),%edx
 61a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 61d:	8b 50 04             	mov    0x4(%eax),%edx
 620:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 623:	39 f1                	cmp    %esi,%ecx
 625:	75 d8                	jne    5ff <free+0x4f>
    p->s.size += bp->s.size;
 627:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 62a:	a3 f0 09 00 00       	mov    %eax,0x9f0
    p->s.size += bp->s.size;
 62f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 632:	8b 53 f8             	mov    -0x8(%ebx),%edx
 635:	89 10                	mov    %edx,(%eax)
}
 637:	5b                   	pop    %ebx
 638:	5e                   	pop    %esi
 639:	5f                   	pop    %edi
 63a:	5d                   	pop    %ebp
 63b:	c3                   	ret    
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000640 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 640:	f3 0f 1e fb          	endbr32 
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	57                   	push   %edi
 648:	56                   	push   %esi
 649:	53                   	push   %ebx
 64a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 650:	8b 3d f0 09 00 00    	mov    0x9f0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 656:	8d 70 07             	lea    0x7(%eax),%esi
 659:	c1 ee 03             	shr    $0x3,%esi
 65c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 65f:	85 ff                	test   %edi,%edi
 661:	0f 84 a9 00 00 00    	je     710 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 667:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 669:	8b 48 04             	mov    0x4(%eax),%ecx
 66c:	39 f1                	cmp    %esi,%ecx
 66e:	73 6d                	jae    6dd <malloc+0x9d>
 670:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 676:	bb 00 10 00 00       	mov    $0x1000,%ebx
 67b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 67e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 685:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 688:	eb 17                	jmp    6a1 <malloc+0x61>
 68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 690:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 692:	8b 4a 04             	mov    0x4(%edx),%ecx
 695:	39 f1                	cmp    %esi,%ecx
 697:	73 4f                	jae    6e8 <malloc+0xa8>
 699:	8b 3d f0 09 00 00    	mov    0x9f0,%edi
 69f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6a1:	39 c7                	cmp    %eax,%edi
 6a3:	75 eb                	jne    690 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 6a5:	83 ec 0c             	sub    $0xc,%esp
 6a8:	ff 75 e4             	pushl  -0x1c(%ebp)
 6ab:	e8 5b fc ff ff       	call   30b <sbrk>
  if(p == (char*)-1)
 6b0:	83 c4 10             	add    $0x10,%esp
 6b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 6b6:	74 1b                	je     6d3 <malloc+0x93>
  hp->s.size = nu;
 6b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6bb:	83 ec 0c             	sub    $0xc,%esp
 6be:	83 c0 08             	add    $0x8,%eax
 6c1:	50                   	push   %eax
 6c2:	e8 e9 fe ff ff       	call   5b0 <free>
  return freep;
 6c7:	a1 f0 09 00 00       	mov    0x9f0,%eax
      if((p = morecore(nunits)) == 0)
 6cc:	83 c4 10             	add    $0x10,%esp
 6cf:	85 c0                	test   %eax,%eax
 6d1:	75 bd                	jne    690 <malloc+0x50>
        return 0;
  }
}
 6d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6d6:	31 c0                	xor    %eax,%eax
}
 6d8:	5b                   	pop    %ebx
 6d9:	5e                   	pop    %esi
 6da:	5f                   	pop    %edi
 6db:	5d                   	pop    %ebp
 6dc:	c3                   	ret    
    if(p->s.size >= nunits){
 6dd:	89 c2                	mov    %eax,%edx
 6df:	89 f8                	mov    %edi,%eax
 6e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 6e8:	39 ce                	cmp    %ecx,%esi
 6ea:	74 54                	je     740 <malloc+0x100>
        p->s.size -= nunits;
 6ec:	29 f1                	sub    %esi,%ecx
 6ee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 6f1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 6f4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 6f7:	a3 f0 09 00 00       	mov    %eax,0x9f0
}
 6fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6ff:	8d 42 08             	lea    0x8(%edx),%eax
}
 702:	5b                   	pop    %ebx
 703:	5e                   	pop    %esi
 704:	5f                   	pop    %edi
 705:	5d                   	pop    %ebp
 706:	c3                   	ret    
 707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 710:	c7 05 f0 09 00 00 f4 	movl   $0x9f4,0x9f0
 717:	09 00 00 
    base.s.size = 0;
 71a:	bf f4 09 00 00       	mov    $0x9f4,%edi
    base.s.ptr = freep = prevp = &base;
 71f:	c7 05 f4 09 00 00 f4 	movl   $0x9f4,0x9f4
 726:	09 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 729:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 72b:	c7 05 f8 09 00 00 00 	movl   $0x0,0x9f8
 732:	00 00 00 
    if(p->s.size >= nunits){
 735:	e9 36 ff ff ff       	jmp    670 <malloc+0x30>
 73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 740:	8b 0a                	mov    (%edx),%ecx
 742:	89 08                	mov    %ecx,(%eax)
 744:	eb b1                	jmp    6f7 <malloc+0xb7>
