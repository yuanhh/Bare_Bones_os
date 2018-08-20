
kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <main>:
  100000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  100004:	83 e4 f0             	and    $0xfffffff0,%esp
  100007:	ff 71 fc             	pushl  -0x4(%ecx)
  10000a:	55                   	push   %ebp
  10000b:	89 e5                	mov    %esp,%ebp
  10000d:	53                   	push   %ebx
  10000e:	51                   	push   %ecx
  10000f:	e8 67 0b 00 00       	call   100b7b <__x86.get_pc_thunk.bx>
  100014:	81 c3 38 16 00 00    	add    $0x1638,%ebx
  10001a:	e8 b1 05 00 00       	call   1005d0 <vga_init>
  10001f:	e8 b6 08 00 00       	call   1008da <init_idt>
  100024:	83 ec 08             	sub    $0x8,%esp
  100027:	6a 03                	push   $0x3
  100029:	8d 83 b4 f9 ff ff    	lea    -0x64c(%ebx),%eax
  10002f:	50                   	push   %eax
  100030:	e8 e2 05 00 00       	call   100617 <cprintf>
  100035:	83 c4 10             	add    $0x10,%esp
  100038:	cc                   	int3   
  100039:	cd 04                	int    $0x4
  10003b:	b8 ba ba ad de       	mov    $0xdeadbaba,%eax
  100040:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100043:	59                   	pop    %ecx
  100044:	5b                   	pop    %ebx
  100045:	5d                   	pop    %ebp
  100046:	8d 61 fc             	lea    -0x4(%ecx),%esp
  100049:	c3                   	ret    

0010004a <memset>:
  10004a:	55                   	push   %ebp
  10004b:	89 e5                	mov    %esp,%ebp
  10004d:	83 ec 10             	sub    $0x10,%esp
  100050:	e8 2a 0b 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  100055:	05 f7 15 00 00       	add    $0x15f7,%eax
  10005a:	8b 45 08             	mov    0x8(%ebp),%eax
  10005d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100060:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
  100067:	eb 0e                	jmp    100077 <memset+0x2d>
  100069:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10006c:	8d 50 01             	lea    0x1(%eax),%edx
  10006f:	89 55 fc             	mov    %edx,-0x4(%ebp)
  100072:	8b 55 0c             	mov    0xc(%ebp),%edx
  100075:	88 10                	mov    %dl,(%eax)
  100077:	8b 45 10             	mov    0x10(%ebp),%eax
  10007a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10007d:	89 55 10             	mov    %edx,0x10(%ebp)
  100080:	85 c0                	test   %eax,%eax
  100082:	75 e5                	jne    100069 <memset+0x1f>
  100084:	8b 45 08             	mov    0x8(%ebp),%eax
  100087:	c9                   	leave  
  100088:	c3                   	ret    

00100089 <memmove>:
  100089:	55                   	push   %ebp
  10008a:	89 e5                	mov    %esp,%ebp
  10008c:	83 ec 10             	sub    $0x10,%esp
  10008f:	e8 eb 0a 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  100094:	05 b8 15 00 00       	add    $0x15b8,%eax
  100099:	8b 45 0c             	mov    0xc(%ebp),%eax
  10009c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10009f:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1000a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1000a8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1000ab:	73 54                	jae    100101 <memmove+0x78>
  1000ad:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1000b0:	8b 45 10             	mov    0x10(%ebp),%eax
  1000b3:	01 d0                	add    %edx,%eax
  1000b5:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  1000b8:	73 47                	jae    100101 <memmove+0x78>
  1000ba:	8b 45 10             	mov    0x10(%ebp),%eax
  1000bd:	01 45 fc             	add    %eax,-0x4(%ebp)
  1000c0:	8b 45 10             	mov    0x10(%ebp),%eax
  1000c3:	01 45 f8             	add    %eax,-0x8(%ebp)
  1000c6:	eb 13                	jmp    1000db <memmove+0x52>
  1000c8:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1000cc:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
  1000d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1000d3:	0f b6 10             	movzbl (%eax),%edx
  1000d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1000d9:	88 10                	mov    %dl,(%eax)
  1000db:	8b 45 10             	mov    0x10(%ebp),%eax
  1000de:	8d 50 ff             	lea    -0x1(%eax),%edx
  1000e1:	89 55 10             	mov    %edx,0x10(%ebp)
  1000e4:	85 c0                	test   %eax,%eax
  1000e6:	75 e0                	jne    1000c8 <memmove+0x3f>
  1000e8:	eb 24                	jmp    10010e <memmove+0x85>
  1000ea:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1000ed:	8d 42 01             	lea    0x1(%edx),%eax
  1000f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1000f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1000f6:	8d 48 01             	lea    0x1(%eax),%ecx
  1000f9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  1000fc:	0f b6 12             	movzbl (%edx),%edx
  1000ff:	88 10                	mov    %dl,(%eax)
  100101:	8b 45 10             	mov    0x10(%ebp),%eax
  100104:	8d 50 ff             	lea    -0x1(%eax),%edx
  100107:	89 55 10             	mov    %edx,0x10(%ebp)
  10010a:	85 c0                	test   %eax,%eax
  10010c:	75 dc                	jne    1000ea <memmove+0x61>
  10010e:	8b 45 08             	mov    0x8(%ebp),%eax
  100111:	c9                   	leave  
  100112:	c3                   	ret    

00100113 <memcpy>:
  100113:	55                   	push   %ebp
  100114:	89 e5                	mov    %esp,%ebp
  100116:	e8 64 0a 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  10011b:	05 31 15 00 00       	add    $0x1531,%eax
  100120:	ff 75 10             	pushl  0x10(%ebp)
  100123:	ff 75 0c             	pushl  0xc(%ebp)
  100126:	ff 75 08             	pushl  0x8(%ebp)
  100129:	e8 5b ff ff ff       	call   100089 <memmove>
  10012e:	83 c4 0c             	add    $0xc,%esp
  100131:	c9                   	leave  
  100132:	c3                   	ret    

00100133 <memcmp>:
  100133:	55                   	push   %ebp
  100134:	89 e5                	mov    %esp,%ebp
  100136:	83 ec 10             	sub    $0x10,%esp
  100139:	e8 41 0a 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  10013e:	05 0e 15 00 00       	add    $0x150e,%eax
  100143:	8b 45 08             	mov    0x8(%ebp),%eax
  100146:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100149:	8b 45 0c             	mov    0xc(%ebp),%eax
  10014c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10014f:	eb 30                	jmp    100181 <memcmp+0x4e>
  100151:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100154:	0f b6 10             	movzbl (%eax),%edx
  100157:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10015a:	0f b6 00             	movzbl (%eax),%eax
  10015d:	38 c2                	cmp    %al,%dl
  10015f:	74 18                	je     100179 <memcmp+0x46>
  100161:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100164:	0f b6 00             	movzbl (%eax),%eax
  100167:	0f be d0             	movsbl %al,%edx
  10016a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10016d:	0f b6 00             	movzbl (%eax),%eax
  100170:	0f be c0             	movsbl %al,%eax
  100173:	29 c2                	sub    %eax,%edx
  100175:	89 d0                	mov    %edx,%eax
  100177:	eb 1a                	jmp    100193 <memcmp+0x60>
  100179:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10017d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  100181:	8b 45 10             	mov    0x10(%ebp),%eax
  100184:	8d 50 ff             	lea    -0x1(%eax),%edx
  100187:	89 55 10             	mov    %edx,0x10(%ebp)
  10018a:	85 c0                	test   %eax,%eax
  10018c:	75 c3                	jne    100151 <memcmp+0x1e>
  10018e:	b8 00 00 00 00       	mov    $0x0,%eax
  100193:	c9                   	leave  
  100194:	c3                   	ret    

00100195 <strlen>:
  100195:	55                   	push   %ebp
  100196:	89 e5                	mov    %esp,%ebp
  100198:	83 ec 10             	sub    $0x10,%esp
  10019b:	e8 df 09 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  1001a0:	05 ac 14 00 00       	add    $0x14ac,%eax
  1001a5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1001ac:	eb 04                	jmp    1001b2 <strlen+0x1d>
  1001ae:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1001b2:	8b 55 08             	mov    0x8(%ebp),%edx
  1001b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1001b8:	01 d0                	add    %edx,%eax
  1001ba:	0f b6 00             	movzbl (%eax),%eax
  1001bd:	84 c0                	test   %al,%al
  1001bf:	75 ed                	jne    1001ae <strlen+0x19>
  1001c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1001c4:	c9                   	leave  
  1001c5:	c3                   	ret    

001001c6 <strrev>:
  1001c6:	55                   	push   %ebp
  1001c7:	89 e5                	mov    %esp,%ebp
  1001c9:	83 ec 10             	sub    $0x10,%esp
  1001cc:	e8 ae 09 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  1001d1:	05 7b 14 00 00       	add    $0x147b,%eax
  1001d6:	ff 75 08             	pushl  0x8(%ebp)
  1001d9:	e8 b7 ff ff ff       	call   100195 <strlen>
  1001de:	83 c4 04             	add    $0x4,%esp
  1001e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1001e4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1001eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1001ee:	83 e8 01             	sub    $0x1,%eax
  1001f1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1001f4:	eb 39                	jmp    10022f <strrev+0x69>
  1001f6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1001f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1001fc:	01 d0                	add    %edx,%eax
  1001fe:	0f b6 00             	movzbl (%eax),%eax
  100201:	88 45 f3             	mov    %al,-0xd(%ebp)
  100204:	8b 55 f8             	mov    -0x8(%ebp),%edx
  100207:	8b 45 08             	mov    0x8(%ebp),%eax
  10020a:	01 d0                	add    %edx,%eax
  10020c:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  10020f:	8b 55 08             	mov    0x8(%ebp),%edx
  100212:	01 ca                	add    %ecx,%edx
  100214:	0f b6 00             	movzbl (%eax),%eax
  100217:	88 02                	mov    %al,(%edx)
  100219:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10021c:	8b 45 08             	mov    0x8(%ebp),%eax
  10021f:	01 c2                	add    %eax,%edx
  100221:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100225:	88 02                	mov    %al,(%edx)
  100227:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10022b:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
  10022f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100232:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100235:	7c bf                	jl     1001f6 <strrev+0x30>
  100237:	90                   	nop
  100238:	c9                   	leave  
  100239:	c3                   	ret    

0010023a <itoa>:
  10023a:	55                   	push   %ebp
  10023b:	89 e5                	mov    %esp,%ebp
  10023d:	83 ec 10             	sub    $0x10,%esp
  100240:	e8 3a 09 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  100245:	05 07 14 00 00       	add    $0x1407,%eax
  10024a:	8b 45 08             	mov    0x8(%ebp),%eax
  10024d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100250:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  100257:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10025b:	75 0a                	jne    100267 <itoa+0x2d>
  10025d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100262:	e9 94 00 00 00       	jmp    1002fb <itoa+0xc1>
  100267:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10026a:	99                   	cltd   
  10026b:	f7 7d 14             	idivl  0x14(%ebp)
  10026e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100271:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  100275:	7f 1c                	jg     100293 <itoa+0x59>
  100277:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10027a:	8d 48 30             	lea    0x30(%eax),%ecx
  10027d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100280:	8d 50 01             	lea    0x1(%eax),%edx
  100283:	89 55 f8             	mov    %edx,-0x8(%ebp)
  100286:	89 c2                	mov    %eax,%edx
  100288:	8b 45 0c             	mov    0xc(%ebp),%eax
  10028b:	01 d0                	add    %edx,%eax
  10028d:	89 ca                	mov    %ecx,%edx
  10028f:	88 10                	mov    %dl,(%eax)
  100291:	eb 1a                	jmp    1002ad <itoa+0x73>
  100293:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100296:	8d 48 37             	lea    0x37(%eax),%ecx
  100299:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10029c:	8d 50 01             	lea    0x1(%eax),%edx
  10029f:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1002a2:	89 c2                	mov    %eax,%edx
  1002a4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002a7:	01 d0                	add    %edx,%eax
  1002a9:	89 ca                	mov    %ecx,%edx
  1002ab:	88 10                	mov    %dl,(%eax)
  1002ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1002b0:	99                   	cltd   
  1002b1:	f7 7d 14             	idivl  0x14(%ebp)
  1002b4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1002b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1002bb:	74 0b                	je     1002c8 <itoa+0x8e>
  1002bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1002c0:	83 e8 01             	sub    $0x1,%eax
  1002c3:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  1002c6:	7c 9f                	jl     100267 <itoa+0x2d>
  1002c8:	8b 45 10             	mov    0x10(%ebp),%eax
  1002cb:	83 e8 01             	sub    $0x1,%eax
  1002ce:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  1002d1:	75 0d                	jne    1002e0 <itoa+0xa6>
  1002d3:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1002d7:	74 07                	je     1002e0 <itoa+0xa6>
  1002d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1002de:	eb 1b                	jmp    1002fb <itoa+0xc1>
  1002e0:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1002e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002e6:	01 d0                	add    %edx,%eax
  1002e8:	c6 00 00             	movb   $0x0,(%eax)
  1002eb:	ff 75 0c             	pushl  0xc(%ebp)
  1002ee:	e8 d3 fe ff ff       	call   1001c6 <strrev>
  1002f3:	83 c4 04             	add    $0x4,%esp
  1002f6:	b8 00 00 00 00       	mov    $0x0,%eax
  1002fb:	c9                   	leave  
  1002fc:	c3                   	ret    

001002fd <outb>:
  1002fd:	55                   	push   %ebp
  1002fe:	89 e5                	mov    %esp,%ebp
  100300:	83 ec 08             	sub    $0x8,%esp
  100303:	e8 77 08 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  100308:	05 44 13 00 00       	add    $0x1344,%eax
  10030d:	8b 55 08             	mov    0x8(%ebp),%edx
  100310:	8b 45 0c             	mov    0xc(%ebp),%eax
  100313:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100317:	88 45 f8             	mov    %al,-0x8(%ebp)
  10031a:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  10031e:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100322:	ee                   	out    %al,(%dx)
  100323:	90                   	nop
  100324:	c9                   	leave  
  100325:	c3                   	ret    

00100326 <inb>:
  100326:	55                   	push   %ebp
  100327:	89 e5                	mov    %esp,%ebp
  100329:	83 ec 14             	sub    $0x14,%esp
  10032c:	e8 4e 08 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  100331:	05 1b 13 00 00       	add    $0x131b,%eax
  100336:	8b 45 08             	mov    0x8(%ebp),%eax
  100339:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  10033d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  100341:	89 c2                	mov    %eax,%edx
  100343:	ec                   	in     (%dx),%al
  100344:	88 45 ff             	mov    %al,-0x1(%ebp)
  100347:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  10034b:	c9                   	leave  
  10034c:	c3                   	ret    

0010034d <cli>:
  10034d:	55                   	push   %ebp
  10034e:	89 e5                	mov    %esp,%ebp
  100350:	e8 2a 08 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  100355:	05 f7 12 00 00       	add    $0x12f7,%eax
  10035a:	fa                   	cli    
  10035b:	90                   	nop
  10035c:	5d                   	pop    %ebp
  10035d:	c3                   	ret    

0010035e <get_cursor>:
  10035e:	55                   	push   %ebp
  10035f:	89 e5                	mov    %esp,%ebp
  100361:	83 ec 10             	sub    $0x10,%esp
  100364:	e8 16 08 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  100369:	05 e3 12 00 00       	add    $0x12e3,%eax
  10036e:	6a 0e                	push   $0xe
  100370:	68 d4 03 00 00       	push   $0x3d4
  100375:	e8 83 ff ff ff       	call   1002fd <outb>
  10037a:	83 c4 08             	add    $0x8,%esp
  10037d:	68 d5 03 00 00       	push   $0x3d5
  100382:	e8 9f ff ff ff       	call   100326 <inb>
  100387:	83 c4 04             	add    $0x4,%esp
  10038a:	0f b6 c0             	movzbl %al,%eax
  10038d:	c1 e0 08             	shl    $0x8,%eax
  100390:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100393:	6a 0f                	push   $0xf
  100395:	68 d4 03 00 00       	push   $0x3d4
  10039a:	e8 5e ff ff ff       	call   1002fd <outb>
  10039f:	83 c4 08             	add    $0x8,%esp
  1003a2:	68 d5 03 00 00       	push   $0x3d5
  1003a7:	e8 7a ff ff ff       	call   100326 <inb>
  1003ac:	83 c4 04             	add    $0x4,%esp
  1003af:	0f b6 c0             	movzbl %al,%eax
  1003b2:	09 45 fc             	or     %eax,-0x4(%ebp)
  1003b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1003b8:	c9                   	leave  
  1003b9:	c3                   	ret    

001003ba <set_cursor>:
  1003ba:	55                   	push   %ebp
  1003bb:	89 e5                	mov    %esp,%ebp
  1003bd:	e8 bd 07 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  1003c2:	05 8a 12 00 00       	add    $0x128a,%eax
  1003c7:	6a 0e                	push   $0xe
  1003c9:	68 d4 03 00 00       	push   $0x3d4
  1003ce:	e8 2a ff ff ff       	call   1002fd <outb>
  1003d3:	83 c4 08             	add    $0x8,%esp
  1003d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1003d9:	c1 f8 08             	sar    $0x8,%eax
  1003dc:	0f b6 c0             	movzbl %al,%eax
  1003df:	50                   	push   %eax
  1003e0:	68 d5 03 00 00       	push   $0x3d5
  1003e5:	e8 13 ff ff ff       	call   1002fd <outb>
  1003ea:	83 c4 08             	add    $0x8,%esp
  1003ed:	6a 0f                	push   $0xf
  1003ef:	68 d4 03 00 00       	push   $0x3d4
  1003f4:	e8 04 ff ff ff       	call   1002fd <outb>
  1003f9:	83 c4 08             	add    $0x8,%esp
  1003fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1003ff:	0f b6 c0             	movzbl %al,%eax
  100402:	50                   	push   %eax
  100403:	68 d5 03 00 00       	push   $0x3d5
  100408:	e8 f0 fe ff ff       	call   1002fd <outb>
  10040d:	83 c4 08             	add    $0x8,%esp
  100410:	90                   	nop
  100411:	c9                   	leave  
  100412:	c3                   	ret    

00100413 <cputc>:
  100413:	55                   	push   %ebp
  100414:	89 e5                	mov    %esp,%ebp
  100416:	56                   	push   %esi
  100417:	53                   	push   %ebx
  100418:	83 ec 20             	sub    $0x20,%esp
  10041b:	e8 5b 07 00 00       	call   100b7b <__x86.get_pc_thunk.bx>
  100420:	81 c3 2c 12 00 00    	add    $0x122c,%ebx
  100426:	8b 45 08             	mov    0x8(%ebp),%eax
  100429:	88 45 e4             	mov    %al,-0x1c(%ebp)
  10042c:	e8 2d ff ff ff       	call   10035e <get_cursor>
  100431:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100434:	80 7d e4 0a          	cmpb   $0xa,-0x1c(%ebp)
  100438:	75 1b                	jne    100455 <cputc+0x42>
  10043a:	b9 50 00 00 00       	mov    $0x50,%ecx
  10043f:	be 50 00 00 00       	mov    $0x50,%esi
  100444:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100447:	99                   	cltd   
  100448:	f7 fe                	idiv   %esi
  10044a:	89 d0                	mov    %edx,%eax
  10044c:	29 c1                	sub    %eax,%ecx
  10044e:	89 c8                	mov    %ecx,%eax
  100450:	01 45 f4             	add    %eax,-0xc(%ebp)
  100453:	eb 37                	jmp    10048c <cputc+0x79>
  100455:	80 7d e4 08          	cmpb   $0x8,-0x1c(%ebp)
  100459:	75 0c                	jne    100467 <cputc+0x54>
  10045b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10045f:	7e 2b                	jle    10048c <cputc+0x79>
  100461:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100465:	eb 25                	jmp    10048c <cputc+0x79>
  100467:	66 0f be 45 e4       	movsbw -0x1c(%ebp),%ax
  10046c:	0f b6 c0             	movzbl %al,%eax
  10046f:	80 cc 07             	or     $0x7,%ah
  100472:	89 c6                	mov    %eax,%esi
  100474:	8b 8b c4 21 00 00    	mov    0x21c4(%ebx),%ecx
  10047a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10047d:	8d 50 01             	lea    0x1(%eax),%edx
  100480:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100483:	01 c0                	add    %eax,%eax
  100485:	01 c8                	add    %ecx,%eax
  100487:	89 f2                	mov    %esi,%edx
  100489:	66 89 10             	mov    %dx,(%eax)
  10048c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100490:	78 12                	js     1004a4 <cputc+0x91>
  100492:	ba 50 00 00 00       	mov    $0x50,%edx
  100497:	b8 19 00 00 00       	mov    $0x19,%eax
  10049c:	0f af c2             	imul   %edx,%eax
  10049f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1004a2:	7e 12                	jle    1004b6 <cputc+0xa3>
  1004a4:	83 ec 0c             	sub    $0xc,%esp
  1004a7:	8d 83 c8 f9 ff ff    	lea    -0x638(%ebx),%eax
  1004ad:	50                   	push   %eax
  1004ae:	e8 3f 01 00 00       	call   1005f2 <panic>
  1004b3:	83 c4 10             	add    $0x10,%esp
  1004b6:	be 50 00 00 00       	mov    $0x50,%esi
  1004bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004be:	99                   	cltd   
  1004bf:	f7 fe                	idiv   %esi
  1004c1:	83 f8 17             	cmp    $0x17,%eax
  1004c4:	7e 56                	jle    10051c <cputc+0x109>
  1004c6:	8b 83 c4 21 00 00    	mov    0x21c4(%ebx),%eax
  1004cc:	ba 50 00 00 00       	mov    $0x50,%edx
  1004d1:	01 d2                	add    %edx,%edx
  1004d3:	01 c2                	add    %eax,%edx
  1004d5:	8b 83 c4 21 00 00    	mov    0x21c4(%ebx),%eax
  1004db:	83 ec 04             	sub    $0x4,%esp
  1004de:	68 60 0e 00 00       	push   $0xe60
  1004e3:	52                   	push   %edx
  1004e4:	50                   	push   %eax
  1004e5:	e8 9f fb ff ff       	call   100089 <memmove>
  1004ea:	83 c4 10             	add    $0x10,%esp
  1004ed:	b8 50 00 00 00       	mov    $0x50,%eax
  1004f2:	29 45 f4             	sub    %eax,-0xc(%ebp)
  1004f5:	b8 80 07 00 00       	mov    $0x780,%eax
  1004fa:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1004fd:	8d 14 00             	lea    (%eax,%eax,1),%edx
  100500:	8b 83 c4 21 00 00    	mov    0x21c4(%ebx),%eax
  100506:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100509:	01 c9                	add    %ecx,%ecx
  10050b:	01 c8                	add    %ecx,%eax
  10050d:	83 ec 04             	sub    $0x4,%esp
  100510:	52                   	push   %edx
  100511:	6a 00                	push   $0x0
  100513:	50                   	push   %eax
  100514:	e8 31 fb ff ff       	call   10004a <memset>
  100519:	83 c4 10             	add    $0x10,%esp
  10051c:	83 ec 0c             	sub    $0xc,%esp
  10051f:	ff 75 f4             	pushl  -0xc(%ebp)
  100522:	e8 93 fe ff ff       	call   1003ba <set_cursor>
  100527:	83 c4 10             	add    $0x10,%esp
  10052a:	8b 83 c4 21 00 00    	mov    0x21c4(%ebx),%eax
  100530:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100533:	01 d2                	add    %edx,%edx
  100535:	01 d0                	add    %edx,%eax
  100537:	66 c7 00 20 07       	movw   $0x720,(%eax)
  10053c:	90                   	nop
  10053d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100540:	5b                   	pop    %ebx
  100541:	5e                   	pop    %esi
  100542:	5d                   	pop    %ebp
  100543:	c3                   	ret    

00100544 <cputs>:
  100544:	55                   	push   %ebp
  100545:	89 e5                	mov    %esp,%ebp
  100547:	83 ec 18             	sub    $0x18,%esp
  10054a:	e8 30 06 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  10054f:	05 fd 10 00 00       	add    $0x10fd,%eax
  100554:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10055b:	eb 22                	jmp    10057f <cputs+0x3b>
  10055d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100560:	8d 50 01             	lea    0x1(%eax),%edx
  100563:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100566:	89 c2                	mov    %eax,%edx
  100568:	8b 45 08             	mov    0x8(%ebp),%eax
  10056b:	01 d0                	add    %edx,%eax
  10056d:	0f b6 00             	movzbl (%eax),%eax
  100570:	0f be c0             	movsbl %al,%eax
  100573:	83 ec 0c             	sub    $0xc,%esp
  100576:	50                   	push   %eax
  100577:	e8 97 fe ff ff       	call   100413 <cputc>
  10057c:	83 c4 10             	add    $0x10,%esp
  10057f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100582:	8b 45 08             	mov    0x8(%ebp),%eax
  100585:	01 d0                	add    %edx,%eax
  100587:	0f b6 00             	movzbl (%eax),%eax
  10058a:	84 c0                	test   %al,%al
  10058c:	75 cf                	jne    10055d <cputs+0x19>
  10058e:	90                   	nop
  10058f:	c9                   	leave  
  100590:	c3                   	ret    

00100591 <clear>:
  100591:	55                   	push   %ebp
  100592:	89 e5                	mov    %esp,%ebp
  100594:	83 ec 18             	sub    $0x18,%esp
  100597:	e8 e3 05 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  10059c:	05 b0 10 00 00       	add    $0x10b0,%eax
  1005a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1005a8:	eb 11                	jmp    1005bb <clear+0x2a>
  1005aa:	83 ec 0c             	sub    $0xc,%esp
  1005ad:	6a 20                	push   $0x20
  1005af:	e8 5f fe ff ff       	call   100413 <cputc>
  1005b4:	83 c4 10             	add    $0x10,%esp
  1005b7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1005bb:	ba 50 00 00 00       	mov    $0x50,%edx
  1005c0:	b8 19 00 00 00       	mov    $0x19,%eax
  1005c5:	0f af c2             	imul   %edx,%eax
  1005c8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1005cb:	7c dd                	jl     1005aa <clear+0x19>
  1005cd:	90                   	nop
  1005ce:	c9                   	leave  
  1005cf:	c3                   	ret    

001005d0 <vga_init>:
  1005d0:	55                   	push   %ebp
  1005d1:	89 e5                	mov    %esp,%ebp
  1005d3:	83 ec 08             	sub    $0x8,%esp
  1005d6:	e8 a4 05 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  1005db:	05 71 10 00 00       	add    $0x1071,%eax
  1005e0:	c7 80 c4 21 00 00 00 	movl   $0xb8000,0x21c4(%eax)
  1005e7:	80 0b 00 
  1005ea:	e8 a2 ff ff ff       	call   100591 <clear>
  1005ef:	90                   	nop
  1005f0:	c9                   	leave  
  1005f1:	c3                   	ret    

001005f2 <panic>:
  1005f2:	55                   	push   %ebp
  1005f3:	89 e5                	mov    %esp,%ebp
  1005f5:	83 ec 08             	sub    $0x8,%esp
  1005f8:	e8 82 05 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  1005fd:	05 4f 10 00 00       	add    $0x104f,%eax
  100602:	e8 46 fd ff ff       	call   10034d <cli>
  100607:	83 ec 0c             	sub    $0xc,%esp
  10060a:	ff 75 08             	pushl  0x8(%ebp)
  10060d:	e8 32 ff ff ff       	call   100544 <cputs>
  100612:	83 c4 10             	add    $0x10,%esp
  100615:	eb fe                	jmp    100615 <panic+0x23>

00100617 <cprintf>:
  100617:	55                   	push   %ebp
  100618:	89 e5                	mov    %esp,%ebp
  10061a:	53                   	push   %ebx
  10061b:	83 ec 24             	sub    $0x24,%esp
  10061e:	e8 58 05 00 00       	call   100b7b <__x86.get_pc_thunk.bx>
  100623:	81 c3 29 10 00 00    	add    $0x1029,%ebx
  100629:	8b 45 08             	mov    0x8(%ebp),%eax
  10062c:	85 c0                	test   %eax,%eax
  10062e:	75 12                	jne    100642 <cprintf+0x2b>
  100630:	83 ec 0c             	sub    $0xc,%esp
  100633:	8d 83 d5 f9 ff ff    	lea    -0x62b(%ebx),%eax
  100639:	50                   	push   %eax
  10063a:	e8 b3 ff ff ff       	call   1005f2 <panic>
  10063f:	83 c4 10             	add    $0x10,%esp
  100642:	8d 45 0c             	lea    0xc(%ebp),%eax
  100645:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100648:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  10064f:	e9 43 01 00 00       	jmp    100797 <cprintf+0x180>
  100654:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
  100658:	74 17                	je     100671 <cprintf+0x5a>
  10065a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10065d:	0f be c0             	movsbl %al,%eax
  100660:	83 ec 0c             	sub    $0xc,%esp
  100663:	50                   	push   %eax
  100664:	e8 aa fd ff ff       	call   100413 <cputc>
  100669:	83 c4 10             	add    $0x10,%esp
  10066c:	e9 22 01 00 00       	jmp    100793 <cprintf+0x17c>
  100671:	8b 55 08             	mov    0x8(%ebp),%edx
  100674:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  100678:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10067b:	01 d0                	add    %edx,%eax
  10067d:	0f b6 00             	movzbl (%eax),%eax
  100680:	0f be c0             	movsbl %al,%eax
  100683:	25 ff 00 00 00       	and    $0xff,%eax
  100688:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10068b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10068f:	0f 84 24 01 00 00    	je     1007b9 <cprintf+0x1a2>
  100695:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100698:	83 f8 70             	cmp    $0x70,%eax
  10069b:	74 67                	je     100704 <cprintf+0xed>
  10069d:	83 f8 70             	cmp    $0x70,%eax
  1006a0:	7f 0a                	jg     1006ac <cprintf+0x95>
  1006a2:	83 f8 64             	cmp    $0x64,%eax
  1006a5:	74 18                	je     1006bf <cprintf+0xa8>
  1006a7:	e9 c7 00 00 00       	jmp    100773 <cprintf+0x15c>
  1006ac:	83 f8 73             	cmp    $0x73,%eax
  1006af:	0f 84 91 00 00 00    	je     100746 <cprintf+0x12f>
  1006b5:	83 f8 78             	cmp    $0x78,%eax
  1006b8:	74 4a                	je     100704 <cprintf+0xed>
  1006ba:	e9 b4 00 00 00       	jmp    100773 <cprintf+0x15c>
  1006bf:	83 ec 04             	sub    $0x4,%esp
  1006c2:	6a 0c                	push   $0xc
  1006c4:	6a 00                	push   $0x0
  1006c6:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006c9:	50                   	push   %eax
  1006ca:	e8 7b f9 ff ff       	call   10004a <memset>
  1006cf:	83 c4 10             	add    $0x10,%esp
  1006d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d5:	8d 50 04             	lea    0x4(%eax),%edx
  1006d8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1006db:	8b 00                	mov    (%eax),%eax
  1006dd:	89 c2                	mov    %eax,%edx
  1006df:	6a 0a                	push   $0xa
  1006e1:	6a 0c                	push   $0xc
  1006e3:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006e6:	50                   	push   %eax
  1006e7:	52                   	push   %edx
  1006e8:	e8 4d fb ff ff       	call   10023a <itoa>
  1006ed:	83 c4 10             	add    $0x10,%esp
  1006f0:	83 ec 0c             	sub    $0xc,%esp
  1006f3:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006f6:	50                   	push   %eax
  1006f7:	e8 48 fe ff ff       	call   100544 <cputs>
  1006fc:	83 c4 10             	add    $0x10,%esp
  1006ff:	e9 8f 00 00 00       	jmp    100793 <cprintf+0x17c>
  100704:	83 ec 04             	sub    $0x4,%esp
  100707:	6a 0c                	push   $0xc
  100709:	6a 00                	push   $0x0
  10070b:	8d 45 dc             	lea    -0x24(%ebp),%eax
  10070e:	50                   	push   %eax
  10070f:	e8 36 f9 ff ff       	call   10004a <memset>
  100714:	83 c4 10             	add    $0x10,%esp
  100717:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10071a:	8d 50 04             	lea    0x4(%eax),%edx
  10071d:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100720:	8b 00                	mov    (%eax),%eax
  100722:	89 c2                	mov    %eax,%edx
  100724:	6a 10                	push   $0x10
  100726:	6a 0c                	push   $0xc
  100728:	8d 45 dc             	lea    -0x24(%ebp),%eax
  10072b:	50                   	push   %eax
  10072c:	52                   	push   %edx
  10072d:	e8 08 fb ff ff       	call   10023a <itoa>
  100732:	83 c4 10             	add    $0x10,%esp
  100735:	83 ec 0c             	sub    $0xc,%esp
  100738:	8d 45 dc             	lea    -0x24(%ebp),%eax
  10073b:	50                   	push   %eax
  10073c:	e8 03 fe ff ff       	call   100544 <cputs>
  100741:	83 c4 10             	add    $0x10,%esp
  100744:	eb 4d                	jmp    100793 <cprintf+0x17c>
  100746:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100749:	8d 50 04             	lea    0x4(%eax),%edx
  10074c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10074f:	8b 00                	mov    (%eax),%eax
  100751:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100754:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100758:	75 09                	jne    100763 <cprintf+0x14c>
  10075a:	8d 83 de f9 ff ff    	lea    -0x622(%ebx),%eax
  100760:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100763:	83 ec 0c             	sub    $0xc,%esp
  100766:	ff 75 ec             	pushl  -0x14(%ebp)
  100769:	e8 d6 fd ff ff       	call   100544 <cputs>
  10076e:	83 c4 10             	add    $0x10,%esp
  100771:	eb 20                	jmp    100793 <cprintf+0x17c>
  100773:	83 ec 0c             	sub    $0xc,%esp
  100776:	6a 25                	push   $0x25
  100778:	e8 96 fc ff ff       	call   100413 <cputc>
  10077d:	83 c4 10             	add    $0x10,%esp
  100780:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100783:	0f be c0             	movsbl %al,%eax
  100786:	83 ec 0c             	sub    $0xc,%esp
  100789:	50                   	push   %eax
  10078a:	e8 84 fc ff ff       	call   100413 <cputc>
  10078f:	83 c4 10             	add    $0x10,%esp
  100792:	90                   	nop
  100793:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  100797:	8b 55 08             	mov    0x8(%ebp),%edx
  10079a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10079d:	01 d0                	add    %edx,%eax
  10079f:	0f b6 00             	movzbl (%eax),%eax
  1007a2:	0f be c0             	movsbl %al,%eax
  1007a5:	25 ff 00 00 00       	and    $0xff,%eax
  1007aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1007ad:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1007b1:	0f 85 9d fe ff ff    	jne    100654 <cprintf+0x3d>
  1007b7:	eb 01                	jmp    1007ba <cprintf+0x1a3>
  1007b9:	90                   	nop
  1007ba:	90                   	nop
  1007bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007be:	c9                   	leave  
  1007bf:	c3                   	ret    

001007c0 <set_gatedesc>:
  1007c0:	55                   	push   %ebp
  1007c1:	89 e5                	mov    %esp,%ebp
  1007c3:	56                   	push   %esi
  1007c4:	53                   	push   %ebx
  1007c5:	83 ec 0c             	sub    $0xc,%esp
  1007c8:	e8 b2 03 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  1007cd:	05 7f 0e 00 00       	add    $0xe7f,%eax
  1007d2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007d5:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1007d8:	8b 55 14             	mov    0x14(%ebp),%edx
  1007db:	88 5d f4             	mov    %bl,-0xc(%ebp)
  1007de:	66 89 4d f0          	mov    %cx,-0x10(%ebp)
  1007e2:	88 55 ec             	mov    %dl,-0x14(%ebp)
  1007e5:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  1007e9:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007ec:	89 d3                	mov    %edx,%ebx
  1007ee:	8d 90 b4 09 00 00    	lea    0x9b4(%eax),%edx
  1007f4:	66 89 1c ca          	mov    %bx,(%edx,%ecx,8)
  1007f8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007fb:	c1 ea 10             	shr    $0x10,%edx
  1007fe:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100802:	89 d3                	mov    %edx,%ebx
  100804:	8d 90 b4 09 00 00    	lea    0x9b4(%eax),%edx
  10080a:	66 89 5c ca 06       	mov    %bx,0x6(%edx,%ecx,8)
  10080f:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100813:	8d 90 b4 09 00 00    	lea    0x9b4(%eax),%edx
  100819:	0f b7 5d f0          	movzwl -0x10(%ebp),%ebx
  10081d:	66 89 5c ca 02       	mov    %bx,0x2(%edx,%ecx,8)
  100822:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100826:	8d 90 b4 09 00 00    	lea    0x9b4(%eax),%edx
  10082c:	0f b6 5c ca 04       	movzbl 0x4(%edx,%ecx,8),%ebx
  100831:	83 e3 e0             	and    $0xffffffe0,%ebx
  100834:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  100838:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  10083c:	8d 90 b4 09 00 00    	lea    0x9b4(%eax),%edx
  100842:	0f b6 5c ca 04       	movzbl 0x4(%edx,%ecx,8),%ebx
  100847:	83 e3 1f             	and    $0x1f,%ebx
  10084a:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  10084e:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
  100852:	74 07                	je     10085b <set_gatedesc+0x9b>
  100854:	bb 0f 00 00 00       	mov    $0xf,%ebx
  100859:	eb 05                	jmp    100860 <set_gatedesc+0xa0>
  10085b:	bb 0e 00 00 00       	mov    $0xe,%ebx
  100860:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100864:	8d 90 b4 09 00 00    	lea    0x9b4(%eax),%edx
  10086a:	89 de                	mov    %ebx,%esi
  10086c:	83 e6 0f             	and    $0xf,%esi
  10086f:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  100874:	83 e3 f0             	and    $0xfffffff0,%ebx
  100877:	09 f3                	or     %esi,%ebx
  100879:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  10087d:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100881:	8d 90 b4 09 00 00    	lea    0x9b4(%eax),%edx
  100887:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  10088c:	83 e3 ef             	and    $0xffffffef,%ebx
  10088f:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  100893:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100897:	0f b6 55 ec          	movzbl -0x14(%ebp),%edx
  10089b:	83 e2 03             	and    $0x3,%edx
  10089e:	89 d3                	mov    %edx,%ebx
  1008a0:	8d 90 b4 09 00 00    	lea    0x9b4(%eax),%edx
  1008a6:	83 e3 03             	and    $0x3,%ebx
  1008a9:	89 de                	mov    %ebx,%esi
  1008ab:	c1 e6 05             	shl    $0x5,%esi
  1008ae:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  1008b3:	83 e3 9f             	and    $0xffffff9f,%ebx
  1008b6:	09 f3                	or     %esi,%ebx
  1008b8:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  1008bc:	0f b6 55 f4          	movzbl -0xc(%ebp),%edx
  1008c0:	8d 80 b4 09 00 00    	lea    0x9b4(%eax),%eax
  1008c6:	0f b6 4c d0 05       	movzbl 0x5(%eax,%edx,8),%ecx
  1008cb:	83 c9 80             	or     $0xffffff80,%ecx
  1008ce:	88 4c d0 05          	mov    %cl,0x5(%eax,%edx,8)
  1008d2:	90                   	nop
  1008d3:	83 c4 0c             	add    $0xc,%esp
  1008d6:	5b                   	pop    %ebx
  1008d7:	5e                   	pop    %esi
  1008d8:	5d                   	pop    %ebp
  1008d9:	c3                   	ret    

001008da <init_idt>:
  1008da:	55                   	push   %ebp
  1008db:	89 e5                	mov    %esp,%ebp
  1008dd:	53                   	push   %ebx
  1008de:	83 ec 14             	sub    $0x14,%esp
  1008e1:	e8 95 02 00 00       	call   100b7b <__x86.get_pc_thunk.bx>
  1008e6:	81 c3 66 0d 00 00    	add    $0xd66,%ebx
  1008ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1008f3:	eb 26                	jmp    10091b <init_idt+0x41>
  1008f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008f8:	8b 84 83 14 00 00 00 	mov    0x14(%ebx,%eax,4),%eax
  1008ff:	89 c2                	mov    %eax,%edx
  100901:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100904:	0f b6 c0             	movzbl %al,%eax
  100907:	6a 00                	push   $0x0
  100909:	6a 00                	push   $0x0
  10090b:	6a 08                	push   $0x8
  10090d:	52                   	push   %edx
  10090e:	50                   	push   %eax
  10090f:	e8 ac fe ff ff       	call   1007c0 <set_gatedesc>
  100914:	83 c4 14             	add    $0x14,%esp
  100917:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10091b:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
  10091f:	76 d4                	jbe    1008f5 <init_idt+0x1b>
  100921:	8d 83 b4 11 00 00    	lea    0x11b4(%ebx),%eax
  100927:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
  10092c:	8d 83 b4 09 00 00    	lea    0x9b4(%ebx),%eax
  100932:	89 c2                	mov    %eax,%edx
  100934:	8d 83 b4 11 00 00    	lea    0x11b4(%ebx),%eax
  10093a:	89 50 02             	mov    %edx,0x2(%eax)
  10093d:	8d 83 b4 11 00 00    	lea    0x11b4(%ebx),%eax
  100943:	83 ec 0c             	sub    $0xc,%esp
  100946:	50                   	push   %eax
  100947:	e8 72 00 00 00       	call   1009be <lidtr>
  10094c:	83 c4 10             	add    $0x10,%esp
  10094f:	90                   	nop
  100950:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100953:	c9                   	leave  
  100954:	c3                   	ret    

00100955 <trap>:
  100955:	55                   	push   %ebp
  100956:	89 e5                	mov    %esp,%ebp
  100958:	53                   	push   %ebx
  100959:	83 ec 04             	sub    $0x4,%esp
  10095c:	e8 1e 02 00 00       	call   100b7f <__x86.get_pc_thunk.ax>
  100961:	05 eb 0c 00 00       	add    $0xceb,%eax
  100966:	8b 55 08             	mov    0x8(%ebp),%edx
  100969:	8b 52 30             	mov    0x30(%edx),%edx
  10096c:	83 ec 08             	sub    $0x8,%esp
  10096f:	52                   	push   %edx
  100970:	8d 90 e5 f9 ff ff    	lea    -0x61b(%eax),%edx
  100976:	52                   	push   %edx
  100977:	89 c3                	mov    %eax,%ebx
  100979:	e8 99 fc ff ff       	call   100617 <cprintf>
  10097e:	83 c4 10             	add    $0x10,%esp
  100981:	90                   	nop
  100982:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100985:	c9                   	leave  
  100986:	c3                   	ret    
  100987:	90                   	nop

00100988 <multiboot>:
  100988:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  10098e:	00 00                	add    %al,(%eax)
  100990:	fb                   	sti    
  100991:	4f                   	dec    %edi
  100992:	52                   	push   %edx
  100993:	e4                   	.byte 0xe4

00100994 <_start>:
  100994:	bc 10 38 10 00       	mov    $0x103810,%esp
  100999:	e8 62 f6 ff ff       	call   100000 <main>
  10099e:	fa                   	cli    

0010099f <spin>:
  10099f:	eb fe                	jmp    10099f <spin>

001009a1 <lgdtr>:
  1009a1:	8b 44 24 04          	mov    0x4(%esp),%eax
  1009a5:	0f 01 10             	lgdtl  (%eax)
  1009a8:	66 b8 10 00          	mov    $0x10,%ax
  1009ac:	8e d8                	mov    %eax,%ds
  1009ae:	8e c0                	mov    %eax,%es
  1009b0:	8e e0                	mov    %eax,%fs
  1009b2:	8e e8                	mov    %eax,%gs
  1009b4:	8e d0                	mov    %eax,%ss
  1009b6:	ea bd 09 10 00 08 00 	ljmp   $0x8,$0x1009bd

001009bd <load>:
  1009bd:	c3                   	ret    

001009be <lidtr>:
  1009be:	8b 44 24 04          	mov    0x4(%esp),%eax
  1009c2:	0f 01 18             	lidtl  (%eax)
  1009c5:	c3                   	ret    

001009c6 <vector0>:
  1009c6:	6a 00                	push   $0x0
  1009c8:	ff 35 00 00 00 00    	pushl  0x0
  1009ce:	e9 85 01 00 00       	jmp    100b58 <alltraps>

001009d3 <vector1>:
  1009d3:	6a 00                	push   $0x0
  1009d5:	ff 35 01 00 00 00    	pushl  0x1
  1009db:	e9 78 01 00 00       	jmp    100b58 <alltraps>

001009e0 <vector2>:
  1009e0:	6a 00                	push   $0x0
  1009e2:	ff 35 02 00 00 00    	pushl  0x2
  1009e8:	e9 6b 01 00 00       	jmp    100b58 <alltraps>

001009ed <vector3>:
  1009ed:	6a 00                	push   $0x0
  1009ef:	ff 35 03 00 00 00    	pushl  0x3
  1009f5:	e9 5e 01 00 00       	jmp    100b58 <alltraps>

001009fa <vector4>:
  1009fa:	6a 00                	push   $0x0
  1009fc:	ff 35 04 00 00 00    	pushl  0x4
  100a02:	e9 51 01 00 00       	jmp    100b58 <alltraps>

00100a07 <vector5>:
  100a07:	6a 00                	push   $0x0
  100a09:	ff 35 05 00 00 00    	pushl  0x5
  100a0f:	e9 44 01 00 00       	jmp    100b58 <alltraps>

00100a14 <vector6>:
  100a14:	6a 00                	push   $0x0
  100a16:	ff 35 06 00 00 00    	pushl  0x6
  100a1c:	e9 37 01 00 00       	jmp    100b58 <alltraps>

00100a21 <vector7>:
  100a21:	6a 00                	push   $0x0
  100a23:	ff 35 07 00 00 00    	pushl  0x7
  100a29:	e9 2a 01 00 00       	jmp    100b58 <alltraps>

00100a2e <vector8>:
  100a2e:	ff 35 08 00 00 00    	pushl  0x8
  100a34:	e9 1f 01 00 00       	jmp    100b58 <alltraps>

00100a39 <vector9>:
  100a39:	6a 00                	push   $0x0
  100a3b:	ff 35 09 00 00 00    	pushl  0x9
  100a41:	e9 12 01 00 00       	jmp    100b58 <alltraps>

00100a46 <vector10>:
  100a46:	ff 35 0a 00 00 00    	pushl  0xa
  100a4c:	e9 07 01 00 00       	jmp    100b58 <alltraps>

00100a51 <vector11>:
  100a51:	ff 35 0b 00 00 00    	pushl  0xb
  100a57:	e9 fc 00 00 00       	jmp    100b58 <alltraps>

00100a5c <vector12>:
  100a5c:	ff 35 0c 00 00 00    	pushl  0xc
  100a62:	e9 f1 00 00 00       	jmp    100b58 <alltraps>

00100a67 <vector13>:
  100a67:	ff 35 0d 00 00 00    	pushl  0xd
  100a6d:	e9 e6 00 00 00       	jmp    100b58 <alltraps>

00100a72 <vector14>:
  100a72:	ff 35 0e 00 00 00    	pushl  0xe
  100a78:	e9 db 00 00 00       	jmp    100b58 <alltraps>

00100a7d <vector15>:
  100a7d:	6a 00                	push   $0x0
  100a7f:	ff 35 0f 00 00 00    	pushl  0xf
  100a85:	e9 ce 00 00 00       	jmp    100b58 <alltraps>

00100a8a <vector16>:
  100a8a:	6a 00                	push   $0x0
  100a8c:	ff 35 10 00 00 00    	pushl  0x10
  100a92:	e9 c1 00 00 00       	jmp    100b58 <alltraps>

00100a97 <vector17>:
  100a97:	ff 35 11 00 00 00    	pushl  0x11
  100a9d:	e9 b6 00 00 00       	jmp    100b58 <alltraps>

00100aa2 <vector18>:
  100aa2:	6a 00                	push   $0x0
  100aa4:	ff 35 12 00 00 00    	pushl  0x12
  100aaa:	e9 a9 00 00 00       	jmp    100b58 <alltraps>

00100aaf <vector19>:
  100aaf:	6a 00                	push   $0x0
  100ab1:	ff 35 13 00 00 00    	pushl  0x13
  100ab7:	e9 9c 00 00 00       	jmp    100b58 <alltraps>

00100abc <vector20>:
  100abc:	6a 00                	push   $0x0
  100abe:	ff 35 14 00 00 00    	pushl  0x14
  100ac4:	e9 8f 00 00 00       	jmp    100b58 <alltraps>

00100ac9 <vector21>:
  100ac9:	6a 00                	push   $0x0
  100acb:	ff 35 15 00 00 00    	pushl  0x15
  100ad1:	e9 82 00 00 00       	jmp    100b58 <alltraps>

00100ad6 <vector22>:
  100ad6:	6a 00                	push   $0x0
  100ad8:	ff 35 16 00 00 00    	pushl  0x16
  100ade:	e9 75 00 00 00       	jmp    100b58 <alltraps>

00100ae3 <vector23>:
  100ae3:	6a 00                	push   $0x0
  100ae5:	ff 35 17 00 00 00    	pushl  0x17
  100aeb:	e9 68 00 00 00       	jmp    100b58 <alltraps>

00100af0 <vector24>:
  100af0:	6a 00                	push   $0x0
  100af2:	ff 35 18 00 00 00    	pushl  0x18
  100af8:	e9 5b 00 00 00       	jmp    100b58 <alltraps>

00100afd <vector25>:
  100afd:	6a 00                	push   $0x0
  100aff:	ff 35 19 00 00 00    	pushl  0x19
  100b05:	e9 4e 00 00 00       	jmp    100b58 <alltraps>

00100b0a <vector26>:
  100b0a:	6a 00                	push   $0x0
  100b0c:	ff 35 1a 00 00 00    	pushl  0x1a
  100b12:	e9 41 00 00 00       	jmp    100b58 <alltraps>

00100b17 <vector27>:
  100b17:	6a 00                	push   $0x0
  100b19:	ff 35 1b 00 00 00    	pushl  0x1b
  100b1f:	e9 34 00 00 00       	jmp    100b58 <alltraps>

00100b24 <vector28>:
  100b24:	6a 00                	push   $0x0
  100b26:	ff 35 1c 00 00 00    	pushl  0x1c
  100b2c:	e9 27 00 00 00       	jmp    100b58 <alltraps>

00100b31 <vector29>:
  100b31:	6a 00                	push   $0x0
  100b33:	ff 35 1d 00 00 00    	pushl  0x1d
  100b39:	e9 1a 00 00 00       	jmp    100b58 <alltraps>

00100b3e <vector30>:
  100b3e:	6a 00                	push   $0x0
  100b40:	ff 35 1e 00 00 00    	pushl  0x1e
  100b46:	e9 0d 00 00 00       	jmp    100b58 <alltraps>

00100b4b <vector31>:
  100b4b:	6a 00                	push   $0x0
  100b4d:	ff 35 1f 00 00 00    	pushl  0x1f
  100b53:	e9 00 00 00 00       	jmp    100b58 <alltraps>

00100b58 <alltraps>:
  100b58:	1e                   	push   %ds
  100b59:	06                   	push   %es
  100b5a:	0f a0                	push   %fs
  100b5c:	0f a8                	push   %gs
  100b5e:	60                   	pusha  
  100b5f:	66 b8 10 00          	mov    $0x10,%ax
  100b63:	8e d8                	mov    %eax,%ds
  100b65:	8e c0                	mov    %eax,%es
  100b67:	54                   	push   %esp
  100b68:	e8 e8 fd ff ff       	call   100955 <trap>
  100b6d:	83 c4 04             	add    $0x4,%esp

00100b70 <trapret>:
  100b70:	61                   	popa   
  100b71:	0f a9                	pop    %gs
  100b73:	0f a1                	pop    %fs
  100b75:	07                   	pop    %es
  100b76:	1f                   	pop    %ds
  100b77:	83 c4 08             	add    $0x8,%esp
  100b7a:	cf                   	iret   

Disassembly of section .text.__x86.get_pc_thunk.bx:

00100b7b <__x86.get_pc_thunk.bx>:
  100b7b:	8b 1c 24             	mov    (%esp),%ebx
  100b7e:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

00100b7f <__x86.get_pc_thunk.ax>:
  100b7f:	8b 04 24             	mov    (%esp),%eax
  100b82:	c3                   	ret    
