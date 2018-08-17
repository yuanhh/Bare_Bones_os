
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00100000 <kernel_main-0x10>:
  100000:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fb                   	sti    
  100009:	4f                   	dec    %edi
  10000a:	52                   	push   %edx
  10000b:	e4 66                	in     $0x66,%al
  10000d:	90                   	nop
  10000e:	66 90                	xchg   %ax,%ax

00100010 <kernel_main>:
  100010:	83 ec 0c             	sub    $0xc,%esp
  100013:	e8 18 04 00 00       	call   100430 <vga_init>
  100018:	e8 23 06 00 00       	call   100640 <init_gdt>
  10001d:	e8 5e 07 00 00       	call   100780 <init_idt>
  100022:	83 ec 0c             	sub    $0xc,%esp
  100025:	68 95 0c 10 00       	push   $0x100c95
  10002a:	e8 61 04 00 00       	call   100490 <cprintf>
  10002f:	cd 08                	int    $0x8
  100031:	31 c0                	xor    %eax,%eax
  100033:	83 c4 1c             	add    $0x1c,%esp
  100036:	c3                   	ret    
  100037:	66 90                	xchg   %ax,%ax
  100039:	66 90                	xchg   %ax,%ax
  10003b:	66 90                	xchg   %ax,%ax
  10003d:	66 90                	xchg   %ax,%ax
  10003f:	90                   	nop

00100040 <memset>:
  100040:	56                   	push   %esi
  100041:	53                   	push   %ebx
  100042:	8b 44 24 0c          	mov    0xc(%esp),%eax
  100046:	8b 74 24 14          	mov    0x14(%esp),%esi
  10004a:	0f b6 5c 24 10       	movzbl 0x10(%esp),%ebx
  10004f:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
  100052:	85 f6                	test   %esi,%esi
  100054:	74 14                	je     10006a <memset+0x2a>
  100056:	89 c2                	mov    %eax,%edx
  100058:	90                   	nop
  100059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100060:	83 c2 01             	add    $0x1,%edx
  100063:	88 5a ff             	mov    %bl,-0x1(%edx)
  100066:	39 ca                	cmp    %ecx,%edx
  100068:	75 f6                	jne    100060 <memset+0x20>
  10006a:	5b                   	pop    %ebx
  10006b:	5e                   	pop    %esi
  10006c:	c3                   	ret    
  10006d:	8d 76 00             	lea    0x0(%esi),%esi

00100070 <memmove>:
  100070:	57                   	push   %edi
  100071:	56                   	push   %esi
  100072:	8b 44 24 0c          	mov    0xc(%esp),%eax
  100076:	8b 74 24 10          	mov    0x10(%esp),%esi
  10007a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  10007e:	39 c6                	cmp    %eax,%esi
  100080:	73 2e                	jae    1000b0 <memmove+0x40>
  100082:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
  100085:	39 f8                	cmp    %edi,%eax
  100087:	73 27                	jae    1000b0 <memmove+0x40>
  100089:	8d 51 ff             	lea    -0x1(%ecx),%edx
  10008c:	85 c9                	test   %ecx,%ecx
  10008e:	74 0f                	je     10009f <memmove+0x2f>
  100090:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
  100094:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  100097:	83 ea 01             	sub    $0x1,%edx
  10009a:	83 fa ff             	cmp    $0xffffffff,%edx
  10009d:	75 f1                	jne    100090 <memmove+0x20>
  10009f:	5e                   	pop    %esi
  1000a0:	5f                   	pop    %edi
  1000a1:	c3                   	ret    
  1000a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1000a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  1000b0:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  1000b3:	89 c7                	mov    %eax,%edi
  1000b5:	85 c9                	test   %ecx,%ecx
  1000b7:	74 e6                	je     10009f <memmove+0x2f>
  1000b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1000c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  1000c1:	39 d6                	cmp    %edx,%esi
  1000c3:	75 fb                	jne    1000c0 <memmove+0x50>
  1000c5:	5e                   	pop    %esi
  1000c6:	5f                   	pop    %edi
  1000c7:	c3                   	ret    
  1000c8:	90                   	nop
  1000c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001000d0 <memcpy>:
  1000d0:	eb 9e                	jmp    100070 <memmove>
  1000d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1000d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001000e0 <memcmp>:
  1000e0:	56                   	push   %esi
  1000e1:	53                   	push   %ebx
  1000e2:	8b 74 24 14          	mov    0x14(%esp),%esi
  1000e6:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1000ea:	8b 54 24 10          	mov    0x10(%esp),%edx
  1000ee:	85 f6                	test   %esi,%esi
  1000f0:	74 22                	je     100114 <memcmp+0x34>
  1000f2:	0f b6 08             	movzbl (%eax),%ecx
  1000f5:	0f be 1a             	movsbl (%edx),%ebx
  1000f8:	01 c6                	add    %eax,%esi
  1000fa:	38 cb                	cmp    %cl,%bl
  1000fc:	74 0c                	je     10010a <memcmp+0x2a>
  1000fe:	eb 20                	jmp    100120 <memcmp+0x40>
  100100:	0f b6 08             	movzbl (%eax),%ecx
  100103:	0f be 1a             	movsbl (%edx),%ebx
  100106:	38 d9                	cmp    %bl,%cl
  100108:	75 16                	jne    100120 <memcmp+0x40>
  10010a:	83 c0 01             	add    $0x1,%eax
  10010d:	83 c2 01             	add    $0x1,%edx
  100110:	39 c6                	cmp    %eax,%esi
  100112:	75 ec                	jne    100100 <memcmp+0x20>
  100114:	31 c0                	xor    %eax,%eax
  100116:	5b                   	pop    %ebx
  100117:	5e                   	pop    %esi
  100118:	c3                   	ret    
  100119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100120:	0f be c1             	movsbl %cl,%eax
  100123:	29 d8                	sub    %ebx,%eax
  100125:	5b                   	pop    %ebx
  100126:	5e                   	pop    %esi
  100127:	c3                   	ret    
  100128:	90                   	nop
  100129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100130 <strlen>:
  100130:	8b 54 24 04          	mov    0x4(%esp),%edx
  100134:	31 c0                	xor    %eax,%eax
  100136:	80 3a 00             	cmpb   $0x0,(%edx)
  100139:	74 15                	je     100150 <strlen+0x20>
  10013b:	90                   	nop
  10013c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100140:	83 c0 01             	add    $0x1,%eax
  100143:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  100147:	75 f7                	jne    100140 <strlen+0x10>
  100149:	c3                   	ret    
  10014a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100150:	c3                   	ret    
  100151:	eb 0d                	jmp    100160 <strrev>
  100153:	90                   	nop
  100154:	90                   	nop
  100155:	90                   	nop
  100156:	90                   	nop
  100157:	90                   	nop
  100158:	90                   	nop
  100159:	90                   	nop
  10015a:	90                   	nop
  10015b:	90                   	nop
  10015c:	90                   	nop
  10015d:	90                   	nop
  10015e:	90                   	nop
  10015f:	90                   	nop

00100160 <strrev>:
  100160:	56                   	push   %esi
  100161:	53                   	push   %ebx
  100162:	8b 54 24 0c          	mov    0xc(%esp),%edx
  100166:	0f b6 32             	movzbl (%edx),%esi
  100169:	89 f0                	mov    %esi,%eax
  10016b:	84 c0                	test   %al,%al
  10016d:	74 4b                	je     1001ba <strrev+0x5a>
  10016f:	31 c0                	xor    %eax,%eax
  100171:	eb 0f                	jmp    100182 <strrev+0x22>
  100173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100180:	89 c8                	mov    %ecx,%eax
  100182:	80 7c 02 01 00       	cmpb   $0x0,0x1(%edx,%eax,1)
  100187:	8d 48 01             	lea    0x1(%eax),%ecx
  10018a:	75 f4                	jne    100180 <strrev+0x20>
  10018c:	85 c0                	test   %eax,%eax
  10018e:	7e 2a                	jle    1001ba <strrev+0x5a>
  100190:	31 c9                	xor    %ecx,%ecx
  100192:	eb 10                	jmp    1001a4 <strrev+0x44>
  100194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10019a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
  1001a0:	0f b6 34 0a          	movzbl (%edx,%ecx,1),%esi
  1001a4:	0f b6 1c 02          	movzbl (%edx,%eax,1),%ebx
  1001a8:	88 1c 0a             	mov    %bl,(%edx,%ecx,1)
  1001ab:	89 f3                	mov    %esi,%ebx
  1001ad:	83 c1 01             	add    $0x1,%ecx
  1001b0:	88 1c 02             	mov    %bl,(%edx,%eax,1)
  1001b3:	83 e8 01             	sub    $0x1,%eax
  1001b6:	39 c1                	cmp    %eax,%ecx
  1001b8:	7c e6                	jl     1001a0 <strrev+0x40>
  1001ba:	5b                   	pop    %ebx
  1001bb:	5e                   	pop    %esi
  1001bc:	c3                   	ret    
  1001bd:	8d 76 00             	lea    0x0(%esi),%esi

001001c0 <itoa>:
  1001c0:	57                   	push   %edi
  1001c1:	56                   	push   %esi
  1001c2:	53                   	push   %ebx
  1001c3:	8b 7c 24 18          	mov    0x18(%esp),%edi
  1001c7:	8b 44 24 10          	mov    0x10(%esp),%eax
  1001cb:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  1001cf:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  1001d3:	85 ff                	test   %edi,%edi
  1001d5:	0f 84 97 00 00 00    	je     100272 <itoa+0xb2>
  1001db:	31 db                	xor    %ebx,%ebx
  1001dd:	83 ef 01             	sub    $0x1,%edi
  1001e0:	eb 1d                	jmp    1001ff <itoa+0x3f>
  1001e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1001e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  1001f0:	83 c2 30             	add    $0x30,%edx
  1001f3:	88 54 19 ff          	mov    %dl,-0x1(%ecx,%ebx,1)
  1001f7:	85 c0                	test   %eax,%eax
  1001f9:	74 1a                	je     100215 <itoa+0x55>
  1001fb:	39 df                	cmp    %ebx,%edi
  1001fd:	7e 71                	jle    100270 <itoa+0xb0>
  1001ff:	99                   	cltd   
  100200:	83 c3 01             	add    $0x1,%ebx
  100203:	f7 fe                	idiv   %esi
  100205:	83 fa 09             	cmp    $0x9,%edx
  100208:	7e e6                	jle    1001f0 <itoa+0x30>
  10020a:	83 c2 37             	add    $0x37,%edx
  10020d:	88 54 19 ff          	mov    %dl,-0x1(%ecx,%ebx,1)
  100211:	85 c0                	test   %eax,%eax
  100213:	75 e6                	jne    1001fb <itoa+0x3b>
  100215:	c6 04 19 00          	movb   $0x0,(%ecx,%ebx,1)
  100219:	0f b6 31             	movzbl (%ecx),%esi
  10021c:	31 c0                	xor    %eax,%eax
  10021e:	89 f3                	mov    %esi,%ebx
  100220:	84 db                	test   %bl,%bl
  100222:	75 0e                	jne    100232 <itoa+0x72>
  100224:	eb 44                	jmp    10026a <itoa+0xaa>
  100226:	8d 76 00             	lea    0x0(%esi),%esi
  100229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100230:	89 d0                	mov    %edx,%eax
  100232:	80 7c 01 01 00       	cmpb   $0x0,0x1(%ecx,%eax,1)
  100237:	8d 50 01             	lea    0x1(%eax),%edx
  10023a:	75 f4                	jne    100230 <itoa+0x70>
  10023c:	85 c0                	test   %eax,%eax
  10023e:	7e 2a                	jle    10026a <itoa+0xaa>
  100240:	31 d2                	xor    %edx,%edx
  100242:	eb 10                	jmp    100254 <itoa+0x94>
  100244:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10024a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
  100250:	0f b6 34 11          	movzbl (%ecx,%edx,1),%esi
  100254:	0f b6 1c 01          	movzbl (%ecx,%eax,1),%ebx
  100258:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
  10025b:	89 f3                	mov    %esi,%ebx
  10025d:	83 c2 01             	add    $0x1,%edx
  100260:	88 1c 01             	mov    %bl,(%ecx,%eax,1)
  100263:	83 e8 01             	sub    $0x1,%eax
  100266:	39 c2                	cmp    %eax,%edx
  100268:	7c e6                	jl     100250 <itoa+0x90>
  10026a:	31 c0                	xor    %eax,%eax
  10026c:	5b                   	pop    %ebx
  10026d:	5e                   	pop    %esi
  10026e:	5f                   	pop    %edi
  10026f:	c3                   	ret    
  100270:	75 a3                	jne    100215 <itoa+0x55>
  100272:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100277:	eb f3                	jmp    10026c <itoa+0xac>
  100279:	66 90                	xchg   %ax,%ax
  10027b:	66 90                	xchg   %ax,%ax
  10027d:	66 90                	xchg   %ax,%ax
  10027f:	90                   	nop

00100280 <cputs>:
  100280:	53                   	push   %ebx
  100281:	83 ec 08             	sub    $0x8,%esp
  100284:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  100288:	0f be 03             	movsbl (%ebx),%eax
  10028b:	84 c0                	test   %al,%al
  10028d:	74 21                	je     1002b0 <cputs+0x30>
  10028f:	83 c3 01             	add    $0x1,%ebx
  100292:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  1002a0:	e8 1b 00 00 00       	call   1002c0 <cputc>
  1002a5:	83 c3 01             	add    $0x1,%ebx
  1002a8:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
  1002ac:	84 c0                	test   %al,%al
  1002ae:	75 f0                	jne    1002a0 <cputs+0x20>
  1002b0:	83 c4 08             	add    $0x8,%esp
  1002b3:	5b                   	pop    %ebx
  1002b4:	c3                   	ret    
  1002b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1002b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001002c0 <cputc>:
  1002c0:	55                   	push   %ebp
  1002c1:	57                   	push   %edi
  1002c2:	56                   	push   %esi
  1002c3:	be d4 03 00 00       	mov    $0x3d4,%esi
  1002c8:	53                   	push   %ebx
  1002c9:	89 f2                	mov    %esi,%edx
  1002cb:	89 c3                	mov    %eax,%ebx
  1002cd:	b8 0e 00 00 00       	mov    $0xe,%eax
  1002d2:	83 ec 0c             	sub    $0xc,%esp
  1002d5:	ee                   	out    %al,(%dx)
  1002d6:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
  1002db:	89 ca                	mov    %ecx,%edx
  1002dd:	ec                   	in     (%dx),%al
  1002de:	0f b6 c0             	movzbl %al,%eax
  1002e1:	89 f2                	mov    %esi,%edx
  1002e3:	c1 e0 08             	shl    $0x8,%eax
  1002e6:	89 c7                	mov    %eax,%edi
  1002e8:	b8 0f 00 00 00       	mov    $0xf,%eax
  1002ed:	ee                   	out    %al,(%dx)
  1002ee:	89 ca                	mov    %ecx,%edx
  1002f0:	ec                   	in     (%dx),%al
  1002f1:	0f b6 c0             	movzbl %al,%eax
  1002f4:	09 f8                	or     %edi,%eax
  1002f6:	80 fb 0a             	cmp    $0xa,%bl
  1002f9:	0f 84 82 00 00 00    	je     100381 <cputc+0xc1>
  1002ff:	80 fb 08             	cmp    $0x8,%bl
  100302:	74 6a                	je     10036e <cputc+0xae>
  100304:	0f b6 cb             	movzbl %bl,%ecx
  100307:	8b 1d e8 31 10 00    	mov    0x1031e8,%ebx
  10030d:	8d 78 01             	lea    0x1(%eax),%edi
  100310:	80 cd 07             	or     $0x7,%ch
  100313:	66 89 0c 43          	mov    %cx,(%ebx,%eax,2)
  100317:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
  10031d:	7f 7f                	jg     10039e <cputc+0xde>
  10031f:	a1 e8 31 10 00       	mov    0x1031e8,%eax
  100324:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
  10032a:	0f 8f 80 00 00 00    	jg     1003b0 <cputc+0xf0>
  100330:	89 f9                	mov    %edi,%ecx
  100332:	89 fb                	mov    %edi,%ebx
  100334:	0f b6 f5             	movzbl %ch,%esi
  100337:	8d 0c 78             	lea    (%eax,%edi,2),%ecx
  10033a:	bd d4 03 00 00       	mov    $0x3d4,%ebp
  10033f:	b8 0e 00 00 00       	mov    $0xe,%eax
  100344:	89 ea                	mov    %ebp,%edx
  100346:	ee                   	out    %al,(%dx)
  100347:	bf d5 03 00 00       	mov    $0x3d5,%edi
  10034c:	89 f0                	mov    %esi,%eax
  10034e:	89 fa                	mov    %edi,%edx
  100350:	ee                   	out    %al,(%dx)
  100351:	b8 0f 00 00 00       	mov    $0xf,%eax
  100356:	89 ea                	mov    %ebp,%edx
  100358:	ee                   	out    %al,(%dx)
  100359:	89 d8                	mov    %ebx,%eax
  10035b:	89 fa                	mov    %edi,%edx
  10035d:	ee                   	out    %al,(%dx)
  10035e:	b8 20 07 00 00       	mov    $0x720,%eax
  100363:	66 89 01             	mov    %ax,(%ecx)
  100366:	83 c4 0c             	add    $0xc,%esp
  100369:	5b                   	pop    %ebx
  10036a:	5e                   	pop    %esi
  10036b:	5f                   	pop    %edi
  10036c:	5d                   	pop    %ebp
  10036d:	c3                   	ret    
  10036e:	8d 78 ff             	lea    -0x1(%eax),%edi
  100371:	85 c0                	test   %eax,%eax
  100373:	75 a2                	jne    100317 <cputc+0x57>
  100375:	8b 0d e8 31 10 00    	mov    0x1031e8,%ecx
  10037b:	31 db                	xor    %ebx,%ebx
  10037d:	31 f6                	xor    %esi,%esi
  10037f:	eb b9                	jmp    10033a <cputc+0x7a>
  100381:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  100386:	f7 e2                	mul    %edx
  100388:	89 d0                	mov    %edx,%eax
  10038a:	c1 e8 06             	shr    $0x6,%eax
  10038d:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100390:	c1 e0 04             	shl    $0x4,%eax
  100393:	8d 78 50             	lea    0x50(%eax),%edi
  100396:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
  10039c:	7e 81                	jle    10031f <cputc+0x5f>
  10039e:	83 ec 0c             	sub    $0xc,%esp
  1003a1:	68 a3 0c 10 00       	push   $0x100ca3
  1003a6:	e8 d5 fe ff ff       	call   100280 <cputs>
  1003ab:	83 c4 10             	add    $0x10,%esp
  1003ae:	eb fe                	jmp    1003ae <cputc+0xee>
  1003b0:	83 ec 04             	sub    $0x4,%esp
  1003b3:	8d 88 a0 00 00 00    	lea    0xa0(%eax),%ecx
  1003b9:	8d 5f b0             	lea    -0x50(%edi),%ebx
  1003bc:	68 60 0e 00 00       	push   $0xe60
  1003c1:	8d 34 1b             	lea    (%ebx,%ebx,1),%esi
  1003c4:	51                   	push   %ecx
  1003c5:	50                   	push   %eax
  1003c6:	e8 a5 fc ff ff       	call   100070 <memmove>
  1003cb:	b8 80 07 00 00       	mov    $0x780,%eax
  1003d0:	83 c4 0c             	add    $0xc,%esp
  1003d3:	29 d8                	sub    %ebx,%eax
  1003d5:	01 c0                	add    %eax,%eax
  1003d7:	50                   	push   %eax
  1003d8:	a1 e8 31 10 00       	mov    0x1031e8,%eax
  1003dd:	6a 00                	push   $0x0
  1003df:	01 f0                	add    %esi,%eax
  1003e1:	50                   	push   %eax
  1003e2:	e8 59 fc ff ff       	call   100040 <memset>
  1003e7:	03 35 e8 31 10 00    	add    0x1031e8,%esi
  1003ed:	83 c4 10             	add    $0x10,%esp
  1003f0:	89 f1                	mov    %esi,%ecx
  1003f2:	be 07 00 00 00       	mov    $0x7,%esi
  1003f7:	e9 3e ff ff ff       	jmp    10033a <cputc+0x7a>
  1003fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100400 <clear>:
  100400:	53                   	push   %ebx
  100401:	bb d0 07 00 00       	mov    $0x7d0,%ebx
  100406:	83 ec 08             	sub    $0x8,%esp
  100409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100410:	b8 20 00 00 00       	mov    $0x20,%eax
  100415:	e8 a6 fe ff ff       	call   1002c0 <cputc>
  10041a:	83 eb 01             	sub    $0x1,%ebx
  10041d:	75 f1                	jne    100410 <clear+0x10>
  10041f:	83 c4 08             	add    $0x8,%esp
  100422:	5b                   	pop    %ebx
  100423:	c3                   	ret    
  100424:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10042a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00100430 <vga_init>:
  100430:	53                   	push   %ebx
  100431:	bb d0 07 00 00       	mov    $0x7d0,%ebx
  100436:	83 ec 08             	sub    $0x8,%esp
  100439:	c7 05 e8 31 10 00 00 	movl   $0xb8000,0x1031e8
  100440:	80 0b 00 
  100443:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100450:	b8 20 00 00 00       	mov    $0x20,%eax
  100455:	e8 66 fe ff ff       	call   1002c0 <cputc>
  10045a:	83 eb 01             	sub    $0x1,%ebx
  10045d:	75 f1                	jne    100450 <vga_init+0x20>
  10045f:	83 c4 08             	add    $0x8,%esp
  100462:	5b                   	pop    %ebx
  100463:	c3                   	ret    
  100464:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10046a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00100470 <panic>:
  100470:	83 ec 18             	sub    $0x18,%esp
  100473:	ff 74 24 1c          	pushl  0x1c(%esp)
  100477:	e8 04 fe ff ff       	call   100280 <cputs>
  10047c:	83 c4 10             	add    $0x10,%esp
  10047f:	eb fe                	jmp    10047f <panic+0xf>
  100481:	eb 0d                	jmp    100490 <cprintf>
  100483:	90                   	nop
  100484:	90                   	nop
  100485:	90                   	nop
  100486:	90                   	nop
  100487:	90                   	nop
  100488:	90                   	nop
  100489:	90                   	nop
  10048a:	90                   	nop
  10048b:	90                   	nop
  10048c:	90                   	nop
  10048d:	90                   	nop
  10048e:	90                   	nop
  10048f:	90                   	nop

00100490 <cprintf>:
  100490:	55                   	push   %ebp
  100491:	57                   	push   %edi
  100492:	56                   	push   %esi
  100493:	53                   	push   %ebx
  100494:	83 ec 2c             	sub    $0x2c,%esp
  100497:	8b 7c 24 40          	mov    0x40(%esp),%edi
  10049b:	85 ff                	test   %edi,%edi
  10049d:	0f 84 86 01 00 00    	je     100629 <cprintf+0x199>
  1004a3:	0f be 07             	movsbl (%edi),%eax
  1004a6:	31 db                	xor    %ebx,%ebx
  1004a8:	8d 54 24 44          	lea    0x44(%esp),%edx
  1004ac:	89 c1                	mov    %eax,%ecx
  1004ae:	81 e1 ff 00 00 00    	and    $0xff,%ecx
  1004b4:	74 71                	je     100527 <cprintf+0x97>
  1004b6:	8d 6b 01             	lea    0x1(%ebx),%ebp
  1004b9:	8d 34 2f             	lea    (%edi,%ebp,1),%esi
  1004bc:	83 f9 25             	cmp    $0x25,%ecx
  1004bf:	0f 85 e8 00 00 00    	jne    1005ad <cprintf+0x11d>
  1004c5:	0f be 2e             	movsbl (%esi),%ebp
  1004c8:	89 e8                	mov    %ebp,%eax
  1004ca:	25 ff 00 00 00       	and    $0xff,%eax
  1004cf:	74 56                	je     100527 <cprintf+0x97>
  1004d1:	83 c3 02             	add    $0x2,%ebx
  1004d4:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
  1004d7:	83 f8 70             	cmp    $0x70,%eax
  1004da:	0f 84 e1 00 00 00    	je     1005c1 <cprintf+0x131>
  1004e0:	7e 71                	jle    100553 <cprintf+0xc3>
  1004e2:	83 f8 73             	cmp    $0x73,%eax
  1004e5:	75 48                	jne    10052f <cprintf+0x9f>
  1004e7:	8d 6a 04             	lea    0x4(%edx),%ebp
  1004ea:	8b 12                	mov    (%edx),%edx
  1004ec:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
  1004f0:	85 d2                	test   %edx,%edx
  1004f2:	0f 84 22 01 00 00    	je     10061a <cprintf+0x18a>
  1004f8:	0f be 02             	movsbl (%edx),%eax
  1004fb:	89 d1                	mov    %edx,%ecx
  1004fd:	89 ea                	mov    %ebp,%edx
  1004ff:	84 c0                	test   %al,%al
  100501:	74 17                	je     10051a <cprintf+0x8a>
  100503:	8d 69 01             	lea    0x1(%ecx),%ebp
  100506:	e8 b5 fd ff ff       	call   1002c0 <cputc>
  10050b:	83 c5 01             	add    $0x1,%ebp
  10050e:	0f be 45 ff          	movsbl -0x1(%ebp),%eax
  100512:	84 c0                	test   %al,%al
  100514:	75 f0                	jne    100506 <cprintf+0x76>
  100516:	8b 54 24 0c          	mov    0xc(%esp),%edx
  10051a:	0f be 06             	movsbl (%esi),%eax
  10051d:	89 c1                	mov    %eax,%ecx
  10051f:	81 e1 ff 00 00 00    	and    $0xff,%ecx
  100525:	75 8f                	jne    1004b6 <cprintf+0x26>
  100527:	83 c4 2c             	add    $0x2c,%esp
  10052a:	5b                   	pop    %ebx
  10052b:	5e                   	pop    %esi
  10052c:	5f                   	pop    %edi
  10052d:	5d                   	pop    %ebp
  10052e:	c3                   	ret    
  10052f:	83 f8 78             	cmp    $0x78,%eax
  100532:	0f 84 89 00 00 00    	je     1005c1 <cprintf+0x131>
  100538:	b8 25 00 00 00       	mov    $0x25,%eax
  10053d:	89 54 24 0c          	mov    %edx,0xc(%esp)
  100541:	e8 7a fd ff ff       	call   1002c0 <cputc>
  100546:	89 e8                	mov    %ebp,%eax
  100548:	e8 73 fd ff ff       	call   1002c0 <cputc>
  10054d:	8b 54 24 0c          	mov    0xc(%esp),%edx
  100551:	eb c7                	jmp    10051a <cprintf+0x8a>
  100553:	83 f8 64             	cmp    $0x64,%eax
  100556:	75 e0                	jne    100538 <cprintf+0xa8>
  100558:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10055c:	83 ec 04             	sub    $0x4,%esp
  10055f:	6a 0c                	push   $0xc
  100561:	6a 00                	push   $0x0
  100563:	8d 44 24 20          	lea    0x20(%esp),%eax
  100567:	50                   	push   %eax
  100568:	e8 d3 fa ff ff       	call   100040 <memset>
  10056d:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  100571:	8d 42 04             	lea    0x4(%edx),%eax
  100574:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  100578:	6a 0a                	push   $0xa
  10057a:	6a 0c                	push   $0xc
  10057c:	8d 44 24 2c          	lea    0x2c(%esp),%eax
  100580:	50                   	push   %eax
  100581:	ff 32                	pushl  (%edx)
  100583:	e8 38 fc ff ff       	call   1001c0 <itoa>
  100588:	0f be 44 24 34       	movsbl 0x34(%esp),%eax
  10058d:	83 c4 20             	add    $0x20,%esp
  100590:	84 c0                	test   %al,%al
  100592:	74 82                	je     100516 <cprintf+0x86>
  100594:	8d 6c 24 15          	lea    0x15(%esp),%ebp
  100598:	e8 23 fd ff ff       	call   1002c0 <cputc>
  10059d:	83 c5 01             	add    $0x1,%ebp
  1005a0:	0f be 45 ff          	movsbl -0x1(%ebp),%eax
  1005a4:	84 c0                	test   %al,%al
  1005a6:	75 f0                	jne    100598 <cprintf+0x108>
  1005a8:	e9 69 ff ff ff       	jmp    100516 <cprintf+0x86>
  1005ad:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1005b1:	89 eb                	mov    %ebp,%ebx
  1005b3:	e8 08 fd ff ff       	call   1002c0 <cputc>
  1005b8:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1005bc:	e9 59 ff ff ff       	jmp    10051a <cprintf+0x8a>
  1005c1:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1005c5:	83 ec 04             	sub    $0x4,%esp
  1005c8:	6a 0c                	push   $0xc
  1005ca:	6a 00                	push   $0x0
  1005cc:	8d 44 24 20          	lea    0x20(%esp),%eax
  1005d0:	50                   	push   %eax
  1005d1:	e8 6a fa ff ff       	call   100040 <memset>
  1005d6:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  1005da:	8d 42 04             	lea    0x4(%edx),%eax
  1005dd:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  1005e1:	6a 10                	push   $0x10
  1005e3:	6a 0c                	push   $0xc
  1005e5:	8d 44 24 2c          	lea    0x2c(%esp),%eax
  1005e9:	50                   	push   %eax
  1005ea:	ff 32                	pushl  (%edx)
  1005ec:	e8 cf fb ff ff       	call   1001c0 <itoa>
  1005f1:	0f be 44 24 34       	movsbl 0x34(%esp),%eax
  1005f6:	83 c4 20             	add    $0x20,%esp
  1005f9:	84 c0                	test   %al,%al
  1005fb:	0f 84 15 ff ff ff    	je     100516 <cprintf+0x86>
  100601:	8d 6c 24 15          	lea    0x15(%esp),%ebp
  100605:	e8 b6 fc ff ff       	call   1002c0 <cputc>
  10060a:	83 c5 01             	add    $0x1,%ebp
  10060d:	0f be 45 ff          	movsbl -0x1(%ebp),%eax
  100611:	84 c0                	test   %al,%al
  100613:	75 f0                	jne    100605 <cprintf+0x175>
  100615:	e9 fc fe ff ff       	jmp    100516 <cprintf+0x86>
  10061a:	b9 b0 0c 10 00       	mov    $0x100cb0,%ecx
  10061f:	b8 28 00 00 00       	mov    $0x28,%eax
  100624:	e9 da fe ff ff       	jmp    100503 <cprintf+0x73>
  100629:	83 ec 0c             	sub    $0xc,%esp
  10062c:	68 b7 0c 10 00       	push   $0x100cb7
  100631:	e8 4a fc ff ff       	call   100280 <cputs>
  100636:	83 c4 10             	add    $0x10,%esp
  100639:	eb fe                	jmp    100639 <cprintf+0x1a9>
  10063b:	66 90                	xchg   %ax,%ax
  10063d:	66 90                	xchg   %ax,%ax
  10063f:	90                   	nop

00100640 <init_gdt>:
  100640:	83 ec 10             	sub    $0x10,%esp
  100643:	6a 28                	push   $0x28
  100645:	6a 00                	push   $0x0
  100647:	68 20 30 10 00       	push   $0x103020
  10064c:	e8 ef f9 ff ff       	call   100040 <memset>
  100651:	a1 2c 30 10 00       	mov    0x10302c,%eax
  100656:	c7 04 24 00 30 10 00 	movl   $0x103000,(%esp)
  10065d:	c7 05 28 30 10 00 ff 	movl   $0xffff,0x103028
  100664:	ff 00 00 
  100667:	c7 05 30 30 10 00 ff 	movl   $0xffff,0x103030
  10066e:	ff 00 00 
  100671:	25 00 00 30 00       	and    $0x300000,%eax
  100676:	c7 05 38 30 10 00 ff 	movl   $0xffff,0x103038
  10067d:	ff 00 00 
  100680:	0d 00 9a cf 00       	or     $0xcf9a00,%eax
  100685:	a3 2c 30 10 00       	mov    %eax,0x10302c
  10068a:	a1 34 30 10 00       	mov    0x103034,%eax
  10068f:	c7 05 40 30 10 00 ff 	movl   $0xffff,0x103040
  100696:	ff 00 00 
  100699:	c7 05 02 30 10 00 20 	movl   $0x103020,0x103002
  1006a0:	30 10 00 
  1006a3:	25 00 00 30 00       	and    $0x300000,%eax
  1006a8:	0d 00 92 cf 00       	or     $0xcf9200,%eax
  1006ad:	a3 34 30 10 00       	mov    %eax,0x103034
  1006b2:	a1 3c 30 10 00       	mov    0x10303c,%eax
  1006b7:	25 00 00 30 00       	and    $0x300000,%eax
  1006bc:	0d 00 fa cf 00       	or     $0xcffa00,%eax
  1006c1:	a3 3c 30 10 00       	mov    %eax,0x10303c
  1006c6:	a1 44 30 10 00       	mov    0x103044,%eax
  1006cb:	25 00 00 30 00       	and    $0x300000,%eax
  1006d0:	0d 00 f2 cf 00       	or     $0xcff200,%eax
  1006d5:	a3 44 30 10 00       	mov    %eax,0x103044
  1006da:	b8 27 00 00 00       	mov    $0x27,%eax
  1006df:	66 a3 00 30 10 00    	mov    %ax,0x103000
  1006e5:	e8 e7 01 00 00       	call   1008d1 <lgdt>
  1006ea:	83 c4 1c             	add    $0x1c,%esp
  1006ed:	c3                   	ret    
  1006ee:	66 90                	xchg   %ax,%ax

001006f0 <remap_pic>:
  1006f0:	57                   	push   %edi
  1006f1:	56                   	push   %esi
  1006f2:	53                   	push   %ebx
  1006f3:	bb 21 00 00 00       	mov    $0x21,%ebx
  1006f8:	89 da                	mov    %ebx,%edx
  1006fa:	ec                   	in     (%dx),%al
  1006fb:	b9 a1 00 00 00       	mov    $0xa1,%ecx
  100700:	89 c7                	mov    %eax,%edi
  100702:	89 ca                	mov    %ecx,%edx
  100704:	ec                   	in     (%dx),%al
  100705:	ba 20 00 00 00       	mov    $0x20,%edx
  10070a:	89 c6                	mov    %eax,%esi
  10070c:	b8 11 00 00 00       	mov    $0x11,%eax
  100711:	ee                   	out    %al,(%dx)
  100712:	ba a0 00 00 00       	mov    $0xa0,%edx
  100717:	ee                   	out    %al,(%dx)
  100718:	b8 20 00 00 00       	mov    $0x20,%eax
  10071d:	89 da                	mov    %ebx,%edx
  10071f:	ee                   	out    %al,(%dx)
  100720:	b8 28 00 00 00       	mov    $0x28,%eax
  100725:	89 ca                	mov    %ecx,%edx
  100727:	ee                   	out    %al,(%dx)
  100728:	b8 04 00 00 00       	mov    $0x4,%eax
  10072d:	89 da                	mov    %ebx,%edx
  10072f:	ee                   	out    %al,(%dx)
  100730:	b8 02 00 00 00       	mov    $0x2,%eax
  100735:	89 ca                	mov    %ecx,%edx
  100737:	ee                   	out    %al,(%dx)
  100738:	b8 01 00 00 00       	mov    $0x1,%eax
  10073d:	89 da                	mov    %ebx,%edx
  10073f:	ee                   	out    %al,(%dx)
  100740:	89 ca                	mov    %ecx,%edx
  100742:	ee                   	out    %al,(%dx)
  100743:	89 f8                	mov    %edi,%eax
  100745:	89 da                	mov    %ebx,%edx
  100747:	ee                   	out    %al,(%dx)
  100748:	89 f0                	mov    %esi,%eax
  10074a:	89 ca                	mov    %ecx,%edx
  10074c:	ee                   	out    %al,(%dx)
  10074d:	5b                   	pop    %ebx
  10074e:	5e                   	pop    %esi
  10074f:	5f                   	pop    %edi
  100750:	c3                   	ret    
  100751:	eb 0d                	jmp    100760 <picinit>
  100753:	90                   	nop
  100754:	90                   	nop
  100755:	90                   	nop
  100756:	90                   	nop
  100757:	90                   	nop
  100758:	90                   	nop
  100759:	90                   	nop
  10075a:	90                   	nop
  10075b:	90                   	nop
  10075c:	90                   	nop
  10075d:	90                   	nop
  10075e:	90                   	nop
  10075f:	90                   	nop

00100760 <picinit>:
  100760:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100765:	ba 21 00 00 00       	mov    $0x21,%edx
  10076a:	ee                   	out    %al,(%dx)
  10076b:	ba a1 00 00 00       	mov    $0xa1,%edx
  100770:	ee                   	out    %al,(%dx)
  100771:	c3                   	ret    
  100772:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100780 <init_idt>:
  100780:	57                   	push   %edi
  100781:	56                   	push   %esi
  100782:	53                   	push   %ebx
  100783:	83 ec 04             	sub    $0x4,%esp
  100786:	68 80 01 00 00       	push   $0x180
  10078b:	6a 00                	push   $0x0
  10078d:	68 60 30 10 00       	push   $0x103060
  100792:	e8 a9 f8 ff ff       	call   100040 <memset>
  100797:	83 c4 10             	add    $0x10,%esp
  10079a:	31 c0                	xor    %eax,%eax
  10079c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1007a0:	8b 14 85 00 20 10 00 	mov    0x102000(,%eax,4),%edx
  1007a7:	8d 0c c5 60 30 10 00 	lea    0x103060(,%eax,8),%ecx
  1007ae:	88 14 c5 60 30 10 00 	mov    %dl,0x103060(,%eax,8)
  1007b5:	88 34 c5 61 30 10 00 	mov    %dh,0x103061(,%eax,8)
  1007bc:	c1 ea 10             	shr    $0x10,%edx
  1007bf:	88 14 c5 66 30 10 00 	mov    %dl,0x103066(,%eax,8)
  1007c6:	88 34 c5 67 30 10 00 	mov    %dh,0x103067(,%eax,8)
  1007cd:	8b 51 02             	mov    0x2(%ecx),%edx
  1007d0:	83 c0 01             	add    $0x1,%eax
  1007d3:	81 e2 00 00 00 ff    	and    $0xff000000,%edx
  1007d9:	83 ca 08             	or     $0x8,%edx
  1007dc:	89 51 02             	mov    %edx,0x2(%ecx)
  1007df:	c6 05 a5 30 10 00 8e 	movb   $0x8e,0x1030a5
  1007e6:	83 f8 30             	cmp    $0x30,%eax
  1007e9:	75 b5                	jne    1007a0 <init_idt+0x20>
  1007eb:	bb 21 00 00 00       	mov    $0x21,%ebx
  1007f0:	89 da                	mov    %ebx,%edx
  1007f2:	ec                   	in     (%dx),%al
  1007f3:	b9 a1 00 00 00       	mov    $0xa1,%ecx
  1007f8:	89 c7                	mov    %eax,%edi
  1007fa:	89 ca                	mov    %ecx,%edx
  1007fc:	ec                   	in     (%dx),%al
  1007fd:	ba 20 00 00 00       	mov    $0x20,%edx
  100802:	89 c6                	mov    %eax,%esi
  100804:	b8 11 00 00 00       	mov    $0x11,%eax
  100809:	ee                   	out    %al,(%dx)
  10080a:	ba a0 00 00 00       	mov    $0xa0,%edx
  10080f:	ee                   	out    %al,(%dx)
  100810:	b8 20 00 00 00       	mov    $0x20,%eax
  100815:	89 da                	mov    %ebx,%edx
  100817:	ee                   	out    %al,(%dx)
  100818:	b8 28 00 00 00       	mov    $0x28,%eax
  10081d:	89 ca                	mov    %ecx,%edx
  10081f:	ee                   	out    %al,(%dx)
  100820:	b8 04 00 00 00       	mov    $0x4,%eax
  100825:	89 da                	mov    %ebx,%edx
  100827:	ee                   	out    %al,(%dx)
  100828:	b8 02 00 00 00       	mov    $0x2,%eax
  10082d:	89 ca                	mov    %ecx,%edx
  10082f:	ee                   	out    %al,(%dx)
  100830:	b8 01 00 00 00       	mov    $0x1,%eax
  100835:	89 da                	mov    %ebx,%edx
  100837:	ee                   	out    %al,(%dx)
  100838:	89 ca                	mov    %ecx,%edx
  10083a:	ee                   	out    %al,(%dx)
  10083b:	89 f8                	mov    %edi,%eax
  10083d:	89 da                	mov    %ebx,%edx
  10083f:	ee                   	out    %al,(%dx)
  100840:	89 f0                	mov    %esi,%eax
  100842:	89 ca                	mov    %ecx,%edx
  100844:	ee                   	out    %al,(%dx)
  100845:	83 ec 0c             	sub    $0xc,%esp
  100848:	b8 7f 01 00 00       	mov    $0x17f,%eax
  10084d:	c7 05 e2 31 10 00 60 	movl   $0x103060,0x1031e2
  100854:	30 10 00 
  100857:	68 e0 31 10 00       	push   $0x1031e0
  10085c:	66 a3 e0 31 10 00    	mov    %ax,0x1031e0
  100862:	e8 87 00 00 00       	call   1008ee <lidt>
  100867:	83 c4 10             	add    $0x10,%esp
  10086a:	5b                   	pop    %ebx
  10086b:	5e                   	pop    %esi
  10086c:	5f                   	pop    %edi
  10086d:	c3                   	ret    
  10086e:	66 90                	xchg   %ax,%ax

00100870 <trap>:
  100870:	53                   	push   %ebx
  100871:	83 ec 14             	sub    $0x14,%esp
  100874:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  100878:	68 c0 0c 10 00       	push   $0x100cc0
  10087d:	e8 fe f9 ff ff       	call   100280 <cputs>
  100882:	c7 04 24 78 10 10 00 	movl   $0x101078,(%esp)
  100889:	e8 f2 f9 ff ff       	call   100280 <cputs>
  10088e:	83 c4 0c             	add    $0xc,%esp
  100891:	ff 73 38             	pushl  0x38(%ebx)
  100894:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
  100898:	50                   	push   %eax
  100899:	68 cd 0c 10 00       	push   $0x100ccd
  10089e:	e8 ed fb ff ff       	call   100490 <cprintf>
  1008a3:	58                   	pop    %eax
  1008a4:	5a                   	pop    %edx
  1008a5:	ff 73 30             	pushl  0x30(%ebx)
  1008a8:	68 dc 0c 10 00       	push   $0x100cdc
  1008ad:	e8 de fb ff ff       	call   100490 <cprintf>
  1008b2:	c7 44 24 20 e9 0c 10 	movl   $0x100ce9,0x20(%esp)
  1008b9:	00 
  1008ba:	83 c4 18             	add    $0x18,%esp
  1008bd:	5b                   	pop    %ebx
  1008be:	e9 ad fb ff ff       	jmp    100470 <panic>

001008c3 <_start>:
  1008c3:	bc f0 71 10 00       	mov    $0x1071f0,%esp
  1008c8:	e8 43 f7 ff ff       	call   100010 <kernel_main>
  1008cd:	fa                   	cli    
  1008ce:	f4                   	hlt    
  1008cf:	eb fd                	jmp    1008ce <_start+0xb>

001008d1 <lgdt>:
  1008d1:	8b 44 24 04          	mov    0x4(%esp),%eax
  1008d5:	0f 01 10             	lgdtl  (%eax)
  1008d8:	66 b8 10 00          	mov    $0x10,%ax
  1008dc:	8e d8                	mov    %eax,%ds
  1008de:	8e c0                	mov    %eax,%es
  1008e0:	8e e0                	mov    %eax,%fs
  1008e2:	8e e8                	mov    %eax,%gs
  1008e4:	8e d0                	mov    %eax,%ss
  1008e6:	ea ed 08 10 00 08 00 	ljmp   $0x8,$0x1008ed

001008ed <load>:
  1008ed:	c3                   	ret    

001008ee <lidt>:
  1008ee:	8b 44 24 04          	mov    0x4(%esp),%eax
  1008f2:	0f 01 18             	lidtl  (%eax)
  1008f5:	c3                   	ret    

001008f6 <vector0>:
  1008f6:	6a 00                	push   $0x0
  1008f8:	6a 00                	push   $0x0
  1008fa:	e9 99 01 00 00       	jmp    100a98 <alltraps>

001008ff <vector1>:
  1008ff:	6a 00                	push   $0x0
  100901:	6a 01                	push   $0x1
  100903:	e9 90 01 00 00       	jmp    100a98 <alltraps>

00100908 <vector2>:
  100908:	6a 00                	push   $0x0
  10090a:	6a 02                	push   $0x2
  10090c:	e9 87 01 00 00       	jmp    100a98 <alltraps>

00100911 <vector3>:
  100911:	6a 00                	push   $0x0
  100913:	6a 03                	push   $0x3
  100915:	e9 7e 01 00 00       	jmp    100a98 <alltraps>

0010091a <vector4>:
  10091a:	6a 00                	push   $0x0
  10091c:	6a 04                	push   $0x4
  10091e:	e9 75 01 00 00       	jmp    100a98 <alltraps>

00100923 <vector5>:
  100923:	6a 00                	push   $0x0
  100925:	6a 05                	push   $0x5
  100927:	e9 6c 01 00 00       	jmp    100a98 <alltraps>

0010092c <vector6>:
  10092c:	6a 00                	push   $0x0
  10092e:	6a 06                	push   $0x6
  100930:	e9 63 01 00 00       	jmp    100a98 <alltraps>

00100935 <vector7>:
  100935:	6a 00                	push   $0x0
  100937:	6a 07                	push   $0x7
  100939:	e9 5a 01 00 00       	jmp    100a98 <alltraps>

0010093e <vector8>:
  10093e:	6a 08                	push   $0x8
  100940:	e9 53 01 00 00       	jmp    100a98 <alltraps>

00100945 <vector9>:
  100945:	6a 00                	push   $0x0
  100947:	6a 09                	push   $0x9
  100949:	e9 4a 01 00 00       	jmp    100a98 <alltraps>

0010094e <vector10>:
  10094e:	6a 0a                	push   $0xa
  100950:	e9 43 01 00 00       	jmp    100a98 <alltraps>

00100955 <vector11>:
  100955:	6a 0b                	push   $0xb
  100957:	e9 3c 01 00 00       	jmp    100a98 <alltraps>

0010095c <vector12>:
  10095c:	6a 0c                	push   $0xc
  10095e:	e9 35 01 00 00       	jmp    100a98 <alltraps>

00100963 <vector13>:
  100963:	6a 0d                	push   $0xd
  100965:	e9 2e 01 00 00       	jmp    100a98 <alltraps>

0010096a <vector14>:
  10096a:	6a 0e                	push   $0xe
  10096c:	e9 27 01 00 00       	jmp    100a98 <alltraps>

00100971 <vector15>:
  100971:	6a 00                	push   $0x0
  100973:	6a 0f                	push   $0xf
  100975:	e9 1e 01 00 00       	jmp    100a98 <alltraps>

0010097a <vector16>:
  10097a:	6a 00                	push   $0x0
  10097c:	6a 10                	push   $0x10
  10097e:	e9 15 01 00 00       	jmp    100a98 <alltraps>

00100983 <vector17>:
  100983:	6a 11                	push   $0x11
  100985:	e9 0e 01 00 00       	jmp    100a98 <alltraps>

0010098a <vector18>:
  10098a:	6a 00                	push   $0x0
  10098c:	6a 12                	push   $0x12
  10098e:	e9 05 01 00 00       	jmp    100a98 <alltraps>

00100993 <vector19>:
  100993:	6a 00                	push   $0x0
  100995:	6a 13                	push   $0x13
  100997:	e9 fc 00 00 00       	jmp    100a98 <alltraps>

0010099c <vector20>:
  10099c:	6a 00                	push   $0x0
  10099e:	6a 14                	push   $0x14
  1009a0:	e9 f3 00 00 00       	jmp    100a98 <alltraps>

001009a5 <vector21>:
  1009a5:	6a 00                	push   $0x0
  1009a7:	6a 15                	push   $0x15
  1009a9:	e9 ea 00 00 00       	jmp    100a98 <alltraps>

001009ae <vector22>:
  1009ae:	6a 00                	push   $0x0
  1009b0:	6a 16                	push   $0x16
  1009b2:	e9 e1 00 00 00       	jmp    100a98 <alltraps>

001009b7 <vector23>:
  1009b7:	6a 00                	push   $0x0
  1009b9:	6a 17                	push   $0x17
  1009bb:	e9 d8 00 00 00       	jmp    100a98 <alltraps>

001009c0 <vector24>:
  1009c0:	6a 00                	push   $0x0
  1009c2:	6a 18                	push   $0x18
  1009c4:	e9 cf 00 00 00       	jmp    100a98 <alltraps>

001009c9 <vector25>:
  1009c9:	6a 00                	push   $0x0
  1009cb:	6a 19                	push   $0x19
  1009cd:	e9 c6 00 00 00       	jmp    100a98 <alltraps>

001009d2 <vector26>:
  1009d2:	6a 00                	push   $0x0
  1009d4:	6a 1a                	push   $0x1a
  1009d6:	e9 bd 00 00 00       	jmp    100a98 <alltraps>

001009db <vector27>:
  1009db:	6a 00                	push   $0x0
  1009dd:	6a 1b                	push   $0x1b
  1009df:	e9 b4 00 00 00       	jmp    100a98 <alltraps>

001009e4 <vector28>:
  1009e4:	6a 00                	push   $0x0
  1009e6:	6a 1c                	push   $0x1c
  1009e8:	e9 ab 00 00 00       	jmp    100a98 <alltraps>

001009ed <vector29>:
  1009ed:	6a 00                	push   $0x0
  1009ef:	6a 1d                	push   $0x1d
  1009f1:	e9 a2 00 00 00       	jmp    100a98 <alltraps>

001009f6 <vector30>:
  1009f6:	6a 00                	push   $0x0
  1009f8:	6a 1e                	push   $0x1e
  1009fa:	e9 99 00 00 00       	jmp    100a98 <alltraps>

001009ff <vector31>:
  1009ff:	6a 00                	push   $0x0
  100a01:	6a 1f                	push   $0x1f
  100a03:	e9 90 00 00 00       	jmp    100a98 <alltraps>

00100a08 <vector32>:
  100a08:	6a 00                	push   $0x0
  100a0a:	6a 20                	push   $0x20
  100a0c:	e9 87 00 00 00       	jmp    100a98 <alltraps>

00100a11 <vector33>:
  100a11:	6a 00                	push   $0x0
  100a13:	6a 21                	push   $0x21
  100a15:	e9 7e 00 00 00       	jmp    100a98 <alltraps>

00100a1a <vector34>:
  100a1a:	6a 00                	push   $0x0
  100a1c:	6a 22                	push   $0x22
  100a1e:	e9 75 00 00 00       	jmp    100a98 <alltraps>

00100a23 <vector35>:
  100a23:	6a 00                	push   $0x0
  100a25:	6a 23                	push   $0x23
  100a27:	e9 6c 00 00 00       	jmp    100a98 <alltraps>

00100a2c <vector36>:
  100a2c:	6a 00                	push   $0x0
  100a2e:	6a 24                	push   $0x24
  100a30:	e9 63 00 00 00       	jmp    100a98 <alltraps>

00100a35 <vector37>:
  100a35:	6a 00                	push   $0x0
  100a37:	6a 25                	push   $0x25
  100a39:	e9 5a 00 00 00       	jmp    100a98 <alltraps>

00100a3e <vector38>:
  100a3e:	6a 00                	push   $0x0
  100a40:	6a 26                	push   $0x26
  100a42:	e9 51 00 00 00       	jmp    100a98 <alltraps>

00100a47 <vector39>:
  100a47:	6a 00                	push   $0x0
  100a49:	6a 27                	push   $0x27
  100a4b:	e9 48 00 00 00       	jmp    100a98 <alltraps>

00100a50 <vector40>:
  100a50:	6a 00                	push   $0x0
  100a52:	6a 28                	push   $0x28
  100a54:	e9 3f 00 00 00       	jmp    100a98 <alltraps>

00100a59 <vector41>:
  100a59:	6a 00                	push   $0x0
  100a5b:	6a 29                	push   $0x29
  100a5d:	e9 36 00 00 00       	jmp    100a98 <alltraps>

00100a62 <vector42>:
  100a62:	6a 00                	push   $0x0
  100a64:	6a 2a                	push   $0x2a
  100a66:	e9 2d 00 00 00       	jmp    100a98 <alltraps>

00100a6b <vector43>:
  100a6b:	6a 00                	push   $0x0
  100a6d:	6a 2b                	push   $0x2b
  100a6f:	e9 24 00 00 00       	jmp    100a98 <alltraps>

00100a74 <vector44>:
  100a74:	6a 00                	push   $0x0
  100a76:	6a 2c                	push   $0x2c
  100a78:	e9 1b 00 00 00       	jmp    100a98 <alltraps>

00100a7d <vector45>:
  100a7d:	6a 00                	push   $0x0
  100a7f:	6a 2d                	push   $0x2d
  100a81:	e9 12 00 00 00       	jmp    100a98 <alltraps>

00100a86 <vector46>:
  100a86:	6a 00                	push   $0x0
  100a88:	6a 2e                	push   $0x2e
  100a8a:	e9 09 00 00 00       	jmp    100a98 <alltraps>

00100a8f <vector47>:
  100a8f:	6a 00                	push   $0x0
  100a91:	6a 2f                	push   $0x2f
  100a93:	e9 00 00 00 00       	jmp    100a98 <alltraps>

00100a98 <alltraps>:
  100a98:	1e                   	push   %ds
  100a99:	06                   	push   %es
  100a9a:	0f a0                	push   %fs
  100a9c:	0f a8                	push   %gs
  100a9e:	60                   	pusha  
  100a9f:	66 b8 10 00          	mov    $0x10,%ax
  100aa3:	8e d8                	mov    %eax,%ds
  100aa5:	8e c0                	mov    %eax,%es
  100aa7:	54                   	push   %esp
  100aa8:	e8 c3 fd ff ff       	call   100870 <trap>
  100aad:	83 c4 04             	add    $0x4,%esp

00100ab0 <trapret>:
  100ab0:	61                   	popa   
  100ab1:	0f a9                	pop    %gs
  100ab3:	0f a1                	pop    %fs
  100ab5:	07                   	pop    %es
  100ab6:	1f                   	pop    %ds
  100ab7:	83 c4 08             	add    $0x8,%esp
  100aba:	cf                   	iret   
  100abb:	66 90                	xchg   %ax,%ax
  100abd:	66 90                	xchg   %ax,%ax
  100abf:	90                   	nop

00100ac0 <int_handler>:
  100ac0:	c7 05 00 00 00 00 bc 	movl   $0x123abc,0x0
  100ac7:	3a 12 00 
  100aca:	f4                   	hlt    
  100acb:	90                   	nop
  100acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100ad0 <idt>:
	...

00100c60 <idtr>:
  100c60:	8f 01                	popl   (%ecx)
  100c62:	d0 0a                	rorb   (%edx)
  100c64:	10 00                	adc    %al,(%eax)

00100c66 <do_test>:
  100c66:	0f 01 1d 60 0c 10 00 	lidtl  0x100c60
  100c6d:	b8 c0 0a 10 00       	mov    $0x100ac0,%eax
  100c72:	66 a3 58 0c 10 00    	mov    %ax,0x100c58
  100c78:	66 c7 05 5a 0c 10 00 	movw   $0x8,0x100c5a
  100c7f:	08 00 
  100c81:	66 c7 05 e4 0d 10 00 	movw   $0x8e00,0x100de4
  100c88:	00 8e 
  100c8a:	c1 e8 10             	shr    $0x10,%eax
  100c8d:	66 a3 5e 0c 10 00    	mov    %ax,0x100c5e
  100c93:	cd 49                	int    $0x49
