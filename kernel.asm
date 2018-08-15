
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
  100013:	e8 58 04 00 00       	call   100470 <vga_init>
  100018:	e8 83 06 00 00       	call   1006a0 <init_gdt>
  10001d:	e8 0e 07 00 00       	call   100730 <init_idt>
  100022:	cd 50                	int    $0x50
  100024:	83 ec 0c             	sub    $0xc,%esp
  100027:	68 39 09 10 00       	push   $0x100939
  10002c:	e8 7f 04 00 00       	call   1004b0 <cprintf>
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

00100280 <panic>:
  100280:	83 ec 18             	sub    $0x18,%esp
  100283:	fa                   	cli    
  100284:	ff 74 24 1c          	pushl  0x1c(%esp)
  100288:	e8 73 01 00 00       	call   100400 <cputs>
  10028d:	83 c4 10             	add    $0x10,%esp
  100290:	eb fe                	jmp    100290 <panic+0x10>
  100292:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001002a0 <cputc>:
  1002a0:	55                   	push   %ebp
  1002a1:	57                   	push   %edi
  1002a2:	bf d4 03 00 00       	mov    $0x3d4,%edi
  1002a7:	56                   	push   %esi
  1002a8:	89 fa                	mov    %edi,%edx
  1002aa:	53                   	push   %ebx
  1002ab:	89 c3                	mov    %eax,%ebx
  1002ad:	b8 0e 00 00 00       	mov    $0xe,%eax
  1002b2:	83 ec 0c             	sub    $0xc,%esp
  1002b5:	ee                   	out    %al,(%dx)
  1002b6:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
  1002bb:	89 ca                	mov    %ecx,%edx
  1002bd:	ec                   	in     (%dx),%al
  1002be:	0f b6 c0             	movzbl %al,%eax
  1002c1:	89 fa                	mov    %edi,%edx
  1002c3:	c1 e0 08             	shl    $0x8,%eax
  1002c6:	89 c6                	mov    %eax,%esi
  1002c8:	b8 0f 00 00 00       	mov    $0xf,%eax
  1002cd:	ee                   	out    %al,(%dx)
  1002ce:	89 ca                	mov    %ecx,%edx
  1002d0:	ec                   	in     (%dx),%al
  1002d1:	0f b6 c0             	movzbl %al,%eax
  1002d4:	09 f0                	or     %esi,%eax
  1002d6:	80 fb 0a             	cmp    $0xa,%bl
  1002d9:	0f 84 a1 00 00 00    	je     100380 <cputc+0xe0>
  1002df:	80 fb 08             	cmp    $0x8,%bl
  1002e2:	74 7c                	je     100360 <cputc+0xc0>
  1002e4:	0f b6 db             	movzbl %bl,%ebx
  1002e7:	8b 15 40 28 10 00    	mov    0x102840,%edx
  1002ed:	8d 70 01             	lea    0x1(%eax),%esi
  1002f0:	80 cf 07             	or     $0x7,%bh
  1002f3:	66 89 1c 42          	mov    %bx,(%edx,%eax,2)
  1002f7:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
  1002fd:	0f 8f e9 00 00 00    	jg     1003ec <cputc+0x14c>
  100303:	a1 40 28 10 00       	mov    0x102840,%eax
  100308:	81 fe 7f 07 00 00    	cmp    $0x77f,%esi
  10030e:	0f 8f 8c 00 00 00    	jg     1003a0 <cputc+0x100>
  100314:	89 f1                	mov    %esi,%ecx
  100316:	89 f7                	mov    %esi,%edi
  100318:	8d 34 70             	lea    (%eax,%esi,2),%esi
  10031b:	0f b6 ed             	movzbl %ch,%ebp
  10031e:	bb d4 03 00 00       	mov    $0x3d4,%ebx
  100323:	b8 0e 00 00 00       	mov    $0xe,%eax
  100328:	89 da                	mov    %ebx,%edx
  10032a:	ee                   	out    %al,(%dx)
  10032b:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
  100330:	89 e8                	mov    %ebp,%eax
  100332:	89 ca                	mov    %ecx,%edx
  100334:	ee                   	out    %al,(%dx)
  100335:	b8 0f 00 00 00       	mov    $0xf,%eax
  10033a:	89 da                	mov    %ebx,%edx
  10033c:	ee                   	out    %al,(%dx)
  10033d:	89 f8                	mov    %edi,%eax
  10033f:	89 ca                	mov    %ecx,%edx
  100341:	ee                   	out    %al,(%dx)
  100342:	b8 20 07 00 00       	mov    $0x720,%eax
  100347:	66 89 06             	mov    %ax,(%esi)
  10034a:	83 c4 0c             	add    $0xc,%esp
  10034d:	5b                   	pop    %ebx
  10034e:	5e                   	pop    %esi
  10034f:	5f                   	pop    %edi
  100350:	5d                   	pop    %ebp
  100351:	c3                   	ret    
  100352:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100360:	8d 70 ff             	lea    -0x1(%eax),%esi
  100363:	85 c0                	test   %eax,%eax
  100365:	75 90                	jne    1002f7 <cputc+0x57>
  100367:	8b 35 40 28 10 00    	mov    0x102840,%esi
  10036d:	31 ff                	xor    %edi,%edi
  10036f:	31 ed                	xor    %ebp,%ebp
  100371:	eb ab                	jmp    10031e <cputc+0x7e>
  100373:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100380:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  100385:	f7 e2                	mul    %edx
  100387:	c1 ea 06             	shr    $0x6,%edx
  10038a:	8d 04 92             	lea    (%edx,%edx,4),%eax
  10038d:	c1 e0 04             	shl    $0x4,%eax
  100390:	8d 70 50             	lea    0x50(%eax),%esi
  100393:	e9 5f ff ff ff       	jmp    1002f7 <cputc+0x57>
  100398:	90                   	nop
  100399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1003a0:	83 ec 04             	sub    $0x4,%esp
  1003a3:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1003a9:	8d 7e b0             	lea    -0x50(%esi),%edi
  1003ac:	bd 07 00 00 00       	mov    $0x7,%ebp
  1003b1:	68 60 0e 00 00       	push   $0xe60
  1003b6:	8d 1c 3f             	lea    (%edi,%edi,1),%ebx
  1003b9:	52                   	push   %edx
  1003ba:	50                   	push   %eax
  1003bb:	e8 b0 fc ff ff       	call   100070 <memmove>
  1003c0:	b8 80 07 00 00       	mov    $0x780,%eax
  1003c5:	83 c4 0c             	add    $0xc,%esp
  1003c8:	29 f8                	sub    %edi,%eax
  1003ca:	01 c0                	add    %eax,%eax
  1003cc:	50                   	push   %eax
  1003cd:	a1 40 28 10 00       	mov    0x102840,%eax
  1003d2:	6a 00                	push   $0x0
  1003d4:	01 d8                	add    %ebx,%eax
  1003d6:	50                   	push   %eax
  1003d7:	e8 64 fc ff ff       	call   100040 <memset>
  1003dc:	03 1d 40 28 10 00    	add    0x102840,%ebx
  1003e2:	83 c4 10             	add    $0x10,%esp
  1003e5:	89 de                	mov    %ebx,%esi
  1003e7:	e9 32 ff ff ff       	jmp    10031e <cputc+0x7e>
  1003ec:	83 ec 0c             	sub    $0xc,%esp
  1003ef:	68 47 09 10 00       	push   $0x100947
  1003f4:	e8 87 fe ff ff       	call   100280 <panic>
  1003f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100400 <cputs>:
  100400:	53                   	push   %ebx
  100401:	83 ec 08             	sub    $0x8,%esp
  100404:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  100408:	0f be 03             	movsbl (%ebx),%eax
  10040b:	84 c0                	test   %al,%al
  10040d:	74 21                	je     100430 <cputs+0x30>
  10040f:	83 c3 01             	add    $0x1,%ebx
  100412:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100420:	e8 7b fe ff ff       	call   1002a0 <cputc>
  100425:	83 c3 01             	add    $0x1,%ebx
  100428:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
  10042c:	84 c0                	test   %al,%al
  10042e:	75 f0                	jne    100420 <cputs+0x20>
  100430:	83 c4 08             	add    $0x8,%esp
  100433:	5b                   	pop    %ebx
  100434:	c3                   	ret    
  100435:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100440 <clear>:
  100440:	53                   	push   %ebx
  100441:	bb d0 07 00 00       	mov    $0x7d0,%ebx
  100446:	83 ec 08             	sub    $0x8,%esp
  100449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100450:	b8 20 00 00 00       	mov    $0x20,%eax
  100455:	e8 46 fe ff ff       	call   1002a0 <cputc>
  10045a:	83 eb 01             	sub    $0x1,%ebx
  10045d:	75 f1                	jne    100450 <clear+0x10>
  10045f:	83 c4 08             	add    $0x8,%esp
  100462:	5b                   	pop    %ebx
  100463:	c3                   	ret    
  100464:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10046a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00100470 <vga_init>:
  100470:	53                   	push   %ebx
  100471:	bb d0 07 00 00       	mov    $0x7d0,%ebx
  100476:	83 ec 08             	sub    $0x8,%esp
  100479:	c7 05 40 28 10 00 00 	movl   $0xb8000,0x102840
  100480:	80 0b 00 
  100483:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100490:	b8 20 00 00 00       	mov    $0x20,%eax
  100495:	e8 06 fe ff ff       	call   1002a0 <cputc>
  10049a:	83 eb 01             	sub    $0x1,%ebx
  10049d:	75 f1                	jne    100490 <vga_init+0x20>
  10049f:	83 c4 08             	add    $0x8,%esp
  1004a2:	5b                   	pop    %ebx
  1004a3:	c3                   	ret    
  1004a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1004aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

001004b0 <cprintf>:
  1004b0:	55                   	push   %ebp
  1004b1:	57                   	push   %edi
  1004b2:	56                   	push   %esi
  1004b3:	53                   	push   %ebx
  1004b4:	83 ec 2c             	sub    $0x2c,%esp
  1004b7:	8b 7c 24 40          	mov    0x40(%esp),%edi
  1004bb:	85 ff                	test   %edi,%edi
  1004bd:	0f 84 cc 01 00 00    	je     10068f <cprintf+0x1df>
  1004c3:	0f be 07             	movsbl (%edi),%eax
  1004c6:	8d 4c 24 44          	lea    0x44(%esp),%ecx
  1004ca:	31 db                	xor    %ebx,%ebx
  1004cc:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1004d0:	89 c2                	mov    %eax,%edx
  1004d2:	81 e2 ff 00 00 00    	and    $0xff,%edx
  1004d8:	0f 84 93 00 00 00    	je     100571 <cprintf+0xc1>
  1004de:	66 90                	xchg   %ax,%ax
  1004e0:	8d 6b 01             	lea    0x1(%ebx),%ebp
  1004e3:	8d 34 2f             	lea    (%edi,%ebp,1),%esi
  1004e6:	83 fa 25             	cmp    $0x25,%edx
  1004e9:	0f 85 21 01 00 00    	jne    100610 <cprintf+0x160>
  1004ef:	0f be 2e             	movsbl (%esi),%ebp
  1004f2:	89 e8                	mov    %ebp,%eax
  1004f4:	25 ff 00 00 00       	and    $0xff,%eax
  1004f9:	74 76                	je     100571 <cprintf+0xc1>
  1004fb:	83 c3 02             	add    $0x2,%ebx
  1004fe:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
  100501:	83 f8 70             	cmp    $0x70,%eax
  100504:	0f 84 16 01 00 00    	je     100620 <cprintf+0x170>
  10050a:	0f 8e 90 00 00 00    	jle    1005a0 <cprintf+0xf0>
  100510:	83 f8 73             	cmp    $0x73,%eax
  100513:	75 6b                	jne    100580 <cprintf+0xd0>
  100515:	8b 44 24 08          	mov    0x8(%esp),%eax
  100519:	8b 10                	mov    (%eax),%edx
  10051b:	8d 48 04             	lea    0x4(%eax),%ecx
  10051e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100522:	85 d2                	test   %edx,%edx
  100524:	0f 84 56 01 00 00    	je     100680 <cprintf+0x1d0>
  10052a:	0f be 02             	movsbl (%edx),%eax
  10052d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100531:	84 c0                	test   %al,%al
  100533:	74 2b                	je     100560 <cprintf+0xb0>
  100535:	8d 6a 01             	lea    0x1(%edx),%ebp
  100538:	90                   	nop
  100539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100540:	e8 5b fd ff ff       	call   1002a0 <cputc>
  100545:	83 c5 01             	add    $0x1,%ebp
  100548:	0f be 45 ff          	movsbl -0x1(%ebp),%eax
  10054c:	84 c0                	test   %al,%al
  10054e:	75 f0                	jne    100540 <cprintf+0x90>
  100550:	8b 44 24 0c          	mov    0xc(%esp),%eax
  100554:	89 44 24 08          	mov    %eax,0x8(%esp)
  100558:	90                   	nop
  100559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100560:	0f be 06             	movsbl (%esi),%eax
  100563:	89 c2                	mov    %eax,%edx
  100565:	81 e2 ff 00 00 00    	and    $0xff,%edx
  10056b:	0f 85 6f ff ff ff    	jne    1004e0 <cprintf+0x30>
  100571:	83 c4 2c             	add    $0x2c,%esp
  100574:	5b                   	pop    %ebx
  100575:	5e                   	pop    %esi
  100576:	5f                   	pop    %edi
  100577:	5d                   	pop    %ebp
  100578:	c3                   	ret    
  100579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100580:	83 f8 78             	cmp    $0x78,%eax
  100583:	0f 84 97 00 00 00    	je     100620 <cprintf+0x170>
  100589:	b8 25 00 00 00       	mov    $0x25,%eax
  10058e:	e8 0d fd ff ff       	call   1002a0 <cputc>
  100593:	89 e8                	mov    %ebp,%eax
  100595:	e8 06 fd ff ff       	call   1002a0 <cputc>
  10059a:	eb c4                	jmp    100560 <cprintf+0xb0>
  10059c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1005a0:	83 f8 64             	cmp    $0x64,%eax
  1005a3:	75 e4                	jne    100589 <cprintf+0xd9>
  1005a5:	83 ec 04             	sub    $0x4,%esp
  1005a8:	6a 0c                	push   $0xc
  1005aa:	6a 00                	push   $0x0
  1005ac:	8d 44 24 20          	lea    0x20(%esp),%eax
  1005b0:	50                   	push   %eax
  1005b1:	e8 8a fa ff ff       	call   100040 <memset>
  1005b6:	8b 44 24 18          	mov    0x18(%esp),%eax
  1005ba:	8d 48 04             	lea    0x4(%eax),%ecx
  1005bd:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  1005c1:	6a 0a                	push   $0xa
  1005c3:	6a 0c                	push   $0xc
  1005c5:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  1005c9:	51                   	push   %ecx
  1005ca:	ff 30                	pushl  (%eax)
  1005cc:	e8 ef fb ff ff       	call   1001c0 <itoa>
  1005d1:	0f be 44 24 34       	movsbl 0x34(%esp),%eax
  1005d6:	83 c4 20             	add    $0x20,%esp
  1005d9:	84 c0                	test   %al,%al
  1005db:	74 83                	je     100560 <cprintf+0xb0>
  1005dd:	8d 6c 24 15          	lea    0x15(%esp),%ebp
  1005e1:	eb 0d                	jmp    1005f0 <cprintf+0x140>
  1005e3:	90                   	nop
  1005e4:	90                   	nop
  1005e5:	90                   	nop
  1005e6:	90                   	nop
  1005e7:	90                   	nop
  1005e8:	90                   	nop
  1005e9:	90                   	nop
  1005ea:	90                   	nop
  1005eb:	90                   	nop
  1005ec:	90                   	nop
  1005ed:	90                   	nop
  1005ee:	90                   	nop
  1005ef:	90                   	nop
  1005f0:	e8 ab fc ff ff       	call   1002a0 <cputc>
  1005f5:	83 c5 01             	add    $0x1,%ebp
  1005f8:	0f be 45 ff          	movsbl -0x1(%ebp),%eax
  1005fc:	84 c0                	test   %al,%al
  1005fe:	75 f0                	jne    1005f0 <cprintf+0x140>
  100600:	e9 5b ff ff ff       	jmp    100560 <cprintf+0xb0>
  100605:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100610:	e8 8b fc ff ff       	call   1002a0 <cputc>
  100615:	89 eb                	mov    %ebp,%ebx
  100617:	e9 44 ff ff ff       	jmp    100560 <cprintf+0xb0>
  10061c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100620:	83 ec 04             	sub    $0x4,%esp
  100623:	6a 0c                	push   $0xc
  100625:	6a 00                	push   $0x0
  100627:	8d 44 24 20          	lea    0x20(%esp),%eax
  10062b:	50                   	push   %eax
  10062c:	e8 0f fa ff ff       	call   100040 <memset>
  100631:	8b 44 24 18          	mov    0x18(%esp),%eax
  100635:	8d 48 04             	lea    0x4(%eax),%ecx
  100638:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  10063c:	6a 10                	push   $0x10
  10063e:	6a 0c                	push   $0xc
  100640:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  100644:	51                   	push   %ecx
  100645:	ff 30                	pushl  (%eax)
  100647:	e8 74 fb ff ff       	call   1001c0 <itoa>
  10064c:	0f be 44 24 34       	movsbl 0x34(%esp),%eax
  100651:	83 c4 20             	add    $0x20,%esp
  100654:	84 c0                	test   %al,%al
  100656:	0f 84 04 ff ff ff    	je     100560 <cprintf+0xb0>
  10065c:	8d 6c 24 15          	lea    0x15(%esp),%ebp
  100660:	e8 3b fc ff ff       	call   1002a0 <cputc>
  100665:	83 c5 01             	add    $0x1,%ebp
  100668:	0f be 45 ff          	movsbl -0x1(%ebp),%eax
  10066c:	84 c0                	test   %al,%al
  10066e:	75 f0                	jne    100660 <cprintf+0x1b0>
  100670:	e9 eb fe ff ff       	jmp    100560 <cprintf+0xb0>
  100675:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  100680:	ba 54 09 10 00       	mov    $0x100954,%edx
  100685:	b8 28 00 00 00       	mov    $0x28,%eax
  10068a:	e9 a6 fe ff ff       	jmp    100535 <cprintf+0x85>
  10068f:	83 ec 0c             	sub    $0xc,%esp
  100692:	68 5b 09 10 00       	push   $0x10095b
  100697:	e8 e4 fb ff ff       	call   100280 <panic>
  10069c:	66 90                	xchg   %ax,%ax
  10069e:	66 90                	xchg   %ax,%ax

001006a0 <init_gdt>:
  1006a0:	83 ec 20             	sub    $0x20,%esp
  1006a3:	6a 30                	push   $0x30
  1006a5:	6a 00                	push   $0x0
  1006a7:	68 00 20 10 00       	push   $0x102000
  1006ac:	e8 8f f9 ff ff       	call   100040 <memset>
  1006b1:	b8 2f 00 00 00       	mov    $0x2f,%eax
  1006b6:	c7 44 24 1c 00 20 10 	movl   $0x102000,0x1c(%esp)
  1006bd:	00 
  1006be:	66 89 44 24 1a       	mov    %ax,0x1a(%esp)
  1006c3:	5a                   	pop    %edx
  1006c4:	c7 05 08 20 10 00 ff 	movl   $0xffff,0x102008
  1006cb:	ff 00 00 
  1006ce:	8d 44 24 16          	lea    0x16(%esp),%eax
  1006d2:	50                   	push   %eax
  1006d3:	c7 05 0c 20 10 00 00 	movl   $0xcf9a00,0x10200c
  1006da:	9a cf 00 
  1006dd:	c7 05 10 20 10 00 ff 	movl   $0xffff,0x102010
  1006e4:	ff 00 00 
  1006e7:	c7 05 14 20 10 00 00 	movl   $0xcf9200,0x102014
  1006ee:	92 cf 00 
  1006f1:	c7 05 18 20 10 00 ff 	movl   $0xffff,0x102018
  1006f8:	ff 00 00 
  1006fb:	c7 05 1c 20 10 00 00 	movl   $0xcffa00,0x10201c
  100702:	fa cf 00 
  100705:	c7 05 20 20 10 00 ff 	movl   $0xffff,0x102020
  10070c:	ff 00 00 
  10070f:	c7 05 24 20 10 00 00 	movl   $0xcff200,0x102024
  100716:	f2 cf 00 
  100719:	e8 ca 00 00 00       	call   1007e8 <lgdt>
  10071e:	83 c4 2c             	add    $0x2c,%esp
  100721:	c3                   	ret    
  100722:	66 90                	xchg   %ax,%ax
  100724:	66 90                	xchg   %ax,%ax
  100726:	66 90                	xchg   %ax,%ax
  100728:	66 90                	xchg   %ax,%ax
  10072a:	66 90                	xchg   %ax,%ax
  10072c:	66 90                	xchg   %ax,%ax
  10072e:	66 90                	xchg   %ax,%ax

00100730 <init_idt>:
  100730:	83 ec 20             	sub    $0x20,%esp
  100733:	68 00 08 00 00       	push   $0x800
  100738:	6a 00                	push   $0x0
  10073a:	68 40 20 10 00       	push   $0x102040
  10073f:	e8 fc f8 ff ff       	call   100040 <memset>
  100744:	83 c4 10             	add    $0x10,%esp
  100747:	31 c0                	xor    %eax,%eax
  100749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100750:	8b 14 85 00 10 10 00 	mov    0x101000(,%eax,4),%edx
  100757:	c6 04 c5 44 20 10 00 	movb   $0x0,0x102044(,%eax,8)
  10075e:	00 
  10075f:	66 89 14 c5 40 20 10 	mov    %dx,0x102040(,%eax,8)
  100766:	00 
  100767:	c1 ea 10             	shr    $0x10,%edx
  10076a:	66 89 14 c5 46 20 10 	mov    %dx,0x102046(,%eax,8)
  100771:	00 
  100772:	ba 08 00 00 00       	mov    $0x8,%edx
  100777:	66 89 14 c5 42 20 10 	mov    %dx,0x102042(,%eax,8)
  10077e:	00 
  10077f:	83 c0 01             	add    $0x1,%eax
  100782:	83 f8 14             	cmp    $0x14,%eax
  100785:	75 c9                	jne    100750 <init_idt+0x20>
  100787:	b8 ff 07 00 00       	mov    $0x7ff,%eax
  10078c:	c7 44 24 0c 40 20 10 	movl   $0x102040,0xc(%esp)
  100793:	00 
  100794:	83 ec 0c             	sub    $0xc,%esp
  100797:	66 89 44 24 16       	mov    %ax,0x16(%esp)
  10079c:	8d 44 24 16          	lea    0x16(%esp),%eax
  1007a0:	50                   	push   %eax
  1007a1:	c6 05 85 20 10 00 8e 	movb   $0x8e,0x102085
  1007a8:	e8 5b 00 00 00       	call   100808 <lidt>
  1007ad:	83 c4 2c             	add    $0x2c,%esp
  1007b0:	c3                   	ret    
  1007b1:	66 90                	xchg   %ax,%ax
  1007b3:	66 90                	xchg   %ax,%ax
  1007b5:	66 90                	xchg   %ax,%ax
  1007b7:	66 90                	xchg   %ax,%ax
  1007b9:	66 90                	xchg   %ax,%ax
  1007bb:	66 90                	xchg   %ax,%ax
  1007bd:	66 90                	xchg   %ax,%ax
  1007bf:	90                   	nop

001007c0 <trap>:
  1007c0:	83 ec 14             	sub    $0x14,%esp
  1007c3:	8b 44 24 18          	mov    0x18(%esp),%eax
  1007c7:	ff 70 30             	pushl  0x30(%eax)
  1007ca:	68 64 09 10 00       	push   $0x100964
  1007cf:	e8 dc fc ff ff       	call   1004b0 <cprintf>
  1007d4:	83 c4 1c             	add    $0x1c,%esp
  1007d7:	c3                   	ret    

001007d8 <_start>:
  1007d8:	bc 50 68 10 00       	mov    $0x106850,%esp
  1007dd:	e8 2e f8 ff ff       	call   100010 <kernel_main>
  1007e2:	fa                   	cli    
  1007e3:	f4                   	hlt    
  1007e4:	eb fd                	jmp    1007e3 <_start+0xb>
  1007e6:	66 90                	xchg   %ax,%ax

001007e8 <lgdt>:
  1007e8:	8b 44 24 04          	mov    0x4(%esp),%eax
  1007ec:	0f 01 10             	lgdtl  (%eax)
  1007ef:	66 b8 10 00          	mov    $0x10,%ax
  1007f3:	8e d8                	mov    %eax,%ds
  1007f5:	8e c0                	mov    %eax,%es
  1007f7:	8e e0                	mov    %eax,%fs
  1007f9:	8e e8                	mov    %eax,%gs
  1007fb:	8e d0                	mov    %eax,%ss
  1007fd:	ea 04 08 10 00 08 00 	ljmp   $0x8,$0x100804

00100804 <load>:
  100804:	c3                   	ret    
  100805:	8d 76 00             	lea    0x0(%esi),%esi

00100808 <lidt>:
  100808:	8b 44 24 04          	mov    0x4(%esp),%eax
  10080c:	0f 01 18             	lidtl  (%eax)
  10080f:	c3                   	ret    
  100810:	66 90                	xchg   %ax,%ax
  100812:	66 90                	xchg   %ax,%ax
  100814:	66 90                	xchg   %ax,%ax
  100816:	66 90                	xchg   %ax,%ax
  100818:	66 90                	xchg   %ax,%ax
  10081a:	66 90                	xchg   %ax,%ax
  10081c:	66 90                	xchg   %ax,%ax
  10081e:	66 90                	xchg   %ax,%ax

00100820 <vector0>:
  100820:	6a 00                	push   $0x0
  100822:	ff 35 00 00 00 00    	pushl  0x0
  100828:	e9 e9 00 00 00       	jmp    100916 <alltraps>

0010082d <vector1>:
  10082d:	6a 00                	push   $0x0
  10082f:	ff 35 01 00 00 00    	pushl  0x1
  100835:	e9 dc 00 00 00       	jmp    100916 <alltraps>

0010083a <vector2>:
  10083a:	6a 00                	push   $0x0
  10083c:	ff 35 02 00 00 00    	pushl  0x2
  100842:	e9 cf 00 00 00       	jmp    100916 <alltraps>

00100847 <vector3>:
  100847:	6a 00                	push   $0x0
  100849:	ff 35 03 00 00 00    	pushl  0x3
  10084f:	e9 c2 00 00 00       	jmp    100916 <alltraps>

00100854 <vector4>:
  100854:	6a 00                	push   $0x0
  100856:	ff 35 04 00 00 00    	pushl  0x4
  10085c:	e9 b5 00 00 00       	jmp    100916 <alltraps>

00100861 <vector5>:
  100861:	6a 00                	push   $0x0
  100863:	ff 35 05 00 00 00    	pushl  0x5
  100869:	e9 a8 00 00 00       	jmp    100916 <alltraps>

0010086e <vector6>:
  10086e:	6a 00                	push   $0x0
  100870:	ff 35 06 00 00 00    	pushl  0x6
  100876:	e9 9b 00 00 00       	jmp    100916 <alltraps>

0010087b <vector7>:
  10087b:	6a 00                	push   $0x0
  10087d:	ff 35 07 00 00 00    	pushl  0x7
  100883:	e9 8e 00 00 00       	jmp    100916 <alltraps>

00100888 <vector8>:
  100888:	ff 35 08 00 00 00    	pushl  0x8
  10088e:	e9 83 00 00 00       	jmp    100916 <alltraps>

00100893 <vector9>:
  100893:	6a 00                	push   $0x0
  100895:	ff 35 09 00 00 00    	pushl  0x9
  10089b:	e9 76 00 00 00       	jmp    100916 <alltraps>

001008a0 <vector10>:
  1008a0:	ff 35 0a 00 00 00    	pushl  0xa
  1008a6:	e9 6b 00 00 00       	jmp    100916 <alltraps>

001008ab <vector11>:
  1008ab:	ff 35 0b 00 00 00    	pushl  0xb
  1008b1:	e9 60 00 00 00       	jmp    100916 <alltraps>

001008b6 <vector12>:
  1008b6:	ff 35 0c 00 00 00    	pushl  0xc
  1008bc:	e9 55 00 00 00       	jmp    100916 <alltraps>

001008c1 <vector13>:
  1008c1:	ff 35 0d 00 00 00    	pushl  0xd
  1008c7:	e9 4a 00 00 00       	jmp    100916 <alltraps>

001008cc <vector14>:
  1008cc:	ff 35 0e 00 00 00    	pushl  0xe
  1008d2:	e9 3f 00 00 00       	jmp    100916 <alltraps>

001008d7 <vector15>:
  1008d7:	6a 00                	push   $0x0
  1008d9:	ff 35 0f 00 00 00    	pushl  0xf
  1008df:	e9 32 00 00 00       	jmp    100916 <alltraps>

001008e4 <vector16>:
  1008e4:	6a 00                	push   $0x0
  1008e6:	ff 35 10 00 00 00    	pushl  0x10
  1008ec:	e9 25 00 00 00       	jmp    100916 <alltraps>

001008f1 <vector17>:
  1008f1:	ff 35 11 00 00 00    	pushl  0x11
  1008f7:	e9 1a 00 00 00       	jmp    100916 <alltraps>

001008fc <vector18>:
  1008fc:	6a 00                	push   $0x0
  1008fe:	ff 35 12 00 00 00    	pushl  0x12
  100904:	e9 0d 00 00 00       	jmp    100916 <alltraps>

00100909 <vector19>:
  100909:	6a 00                	push   $0x0
  10090b:	ff 35 13 00 00 00    	pushl  0x13
  100911:	e9 00 00 00 00       	jmp    100916 <alltraps>

00100916 <alltraps>:
  100916:	1e                   	push   %ds
  100917:	06                   	push   %es
  100918:	0f a0                	push   %fs
  10091a:	0f a8                	push   %gs
  10091c:	60                   	pusha  
  10091d:	66 b8 10 00          	mov    $0x10,%ax
  100921:	8e d8                	mov    %eax,%ds
  100923:	8e c0                	mov    %eax,%es
  100925:	54                   	push   %esp
  100926:	e8 95 fe ff ff       	call   1007c0 <trap>
  10092b:	83 c4 04             	add    $0x4,%esp

0010092e <trapret>:
  10092e:	61                   	popa   
  10092f:	0f a9                	pop    %gs
  100931:	0f a1                	pop    %fs
  100933:	07                   	pop    %es
  100934:	1f                   	pop    %ds
  100935:	83 c4 08             	add    $0x8,%esp
  100938:	cf                   	iret   
