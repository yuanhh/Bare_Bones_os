
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
  10000f:	e8 0b 11 00 00       	call   10111f <__x86.get_pc_thunk.bx>
  100014:	81 c3 0c 29 00 00    	add    $0x290c,%ebx
  10001a:	e8 7c 05 00 00       	call   10059b <vga_init>
  10001f:	e8 41 09 00 00       	call   100965 <init_gdt>
  100024:	e8 02 0c 00 00       	call   100c2b <init_idt>
  100029:	e8 9e 0d 00 00       	call   100dcc <init_pit>
  10002e:	e8 b4 0e 00 00       	call   100ee7 <kinit>
  100033:	b8 00 00 00 00       	mov    $0x0,%eax
  100038:	59                   	pop    %ecx
  100039:	5b                   	pop    %ebx
  10003a:	5d                   	pop    %ebp
  10003b:	8d 61 fc             	lea    -0x4(%ecx),%esp
  10003e:	c3                   	ret    

0010003f <memset>:
  10003f:	55                   	push   %ebp
  100040:	89 e5                	mov    %esp,%ebp
  100042:	83 ec 10             	sub    $0x10,%esp
  100045:	e8 d9 10 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  10004a:	05 d6 28 00 00       	add    $0x28d6,%eax
  10004f:	8b 45 08             	mov    0x8(%ebp),%eax
  100052:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100055:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
  10005c:	eb 0e                	jmp    10006c <memset+0x2d>
  10005e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100061:	8d 50 01             	lea    0x1(%eax),%edx
  100064:	89 55 fc             	mov    %edx,-0x4(%ebp)
  100067:	8b 55 0c             	mov    0xc(%ebp),%edx
  10006a:	88 10                	mov    %dl,(%eax)
  10006c:	8b 45 10             	mov    0x10(%ebp),%eax
  10006f:	8d 50 ff             	lea    -0x1(%eax),%edx
  100072:	89 55 10             	mov    %edx,0x10(%ebp)
  100075:	85 c0                	test   %eax,%eax
  100077:	75 e5                	jne    10005e <memset+0x1f>
  100079:	8b 45 08             	mov    0x8(%ebp),%eax
  10007c:	c9                   	leave  
  10007d:	c3                   	ret    

0010007e <memmove>:
  10007e:	55                   	push   %ebp
  10007f:	89 e5                	mov    %esp,%ebp
  100081:	83 ec 10             	sub    $0x10,%esp
  100084:	e8 9a 10 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100089:	05 97 28 00 00       	add    $0x2897,%eax
  10008e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100091:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100094:	8b 45 08             	mov    0x8(%ebp),%eax
  100097:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10009a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10009d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1000a0:	73 54                	jae    1000f6 <memmove+0x78>
  1000a2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1000a5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000a8:	01 d0                	add    %edx,%eax
  1000aa:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  1000ad:	73 47                	jae    1000f6 <memmove+0x78>
  1000af:	8b 45 10             	mov    0x10(%ebp),%eax
  1000b2:	01 45 fc             	add    %eax,-0x4(%ebp)
  1000b5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000b8:	01 45 f8             	add    %eax,-0x8(%ebp)
  1000bb:	eb 13                	jmp    1000d0 <memmove+0x52>
  1000bd:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1000c1:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
  1000c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1000c8:	0f b6 10             	movzbl (%eax),%edx
  1000cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1000ce:	88 10                	mov    %dl,(%eax)
  1000d0:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1000d6:	89 55 10             	mov    %edx,0x10(%ebp)
  1000d9:	85 c0                	test   %eax,%eax
  1000db:	75 e0                	jne    1000bd <memmove+0x3f>
  1000dd:	eb 24                	jmp    100103 <memmove+0x85>
  1000df:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1000e2:	8d 42 01             	lea    0x1(%edx),%eax
  1000e5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1000e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1000eb:	8d 48 01             	lea    0x1(%eax),%ecx
  1000ee:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  1000f1:	0f b6 12             	movzbl (%edx),%edx
  1000f4:	88 10                	mov    %dl,(%eax)
  1000f6:	8b 45 10             	mov    0x10(%ebp),%eax
  1000f9:	8d 50 ff             	lea    -0x1(%eax),%edx
  1000fc:	89 55 10             	mov    %edx,0x10(%ebp)
  1000ff:	85 c0                	test   %eax,%eax
  100101:	75 dc                	jne    1000df <memmove+0x61>
  100103:	8b 45 08             	mov    0x8(%ebp),%eax
  100106:	c9                   	leave  
  100107:	c3                   	ret    

00100108 <memcpy>:
  100108:	55                   	push   %ebp
  100109:	89 e5                	mov    %esp,%ebp
  10010b:	e8 13 10 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100110:	05 10 28 00 00       	add    $0x2810,%eax
  100115:	ff 75 10             	pushl  0x10(%ebp)
  100118:	ff 75 0c             	pushl  0xc(%ebp)
  10011b:	ff 75 08             	pushl  0x8(%ebp)
  10011e:	e8 5b ff ff ff       	call   10007e <memmove>
  100123:	83 c4 0c             	add    $0xc,%esp
  100126:	c9                   	leave  
  100127:	c3                   	ret    

00100128 <memcmp>:
  100128:	55                   	push   %ebp
  100129:	89 e5                	mov    %esp,%ebp
  10012b:	83 ec 10             	sub    $0x10,%esp
  10012e:	e8 f0 0f 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100133:	05 ed 27 00 00       	add    $0x27ed,%eax
  100138:	8b 45 08             	mov    0x8(%ebp),%eax
  10013b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10013e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100141:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100144:	eb 30                	jmp    100176 <memcmp+0x4e>
  100146:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100149:	0f b6 10             	movzbl (%eax),%edx
  10014c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10014f:	0f b6 00             	movzbl (%eax),%eax
  100152:	38 c2                	cmp    %al,%dl
  100154:	74 18                	je     10016e <memcmp+0x46>
  100156:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100159:	0f b6 00             	movzbl (%eax),%eax
  10015c:	0f be d0             	movsbl %al,%edx
  10015f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100162:	0f b6 00             	movzbl (%eax),%eax
  100165:	0f be c0             	movsbl %al,%eax
  100168:	29 c2                	sub    %eax,%edx
  10016a:	89 d0                	mov    %edx,%eax
  10016c:	eb 1a                	jmp    100188 <memcmp+0x60>
  10016e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100172:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  100176:	8b 45 10             	mov    0x10(%ebp),%eax
  100179:	8d 50 ff             	lea    -0x1(%eax),%edx
  10017c:	89 55 10             	mov    %edx,0x10(%ebp)
  10017f:	85 c0                	test   %eax,%eax
  100181:	75 c3                	jne    100146 <memcmp+0x1e>
  100183:	b8 00 00 00 00       	mov    $0x0,%eax
  100188:	c9                   	leave  
  100189:	c3                   	ret    

0010018a <strlen>:
  10018a:	55                   	push   %ebp
  10018b:	89 e5                	mov    %esp,%ebp
  10018d:	83 ec 10             	sub    $0x10,%esp
  100190:	e8 8e 0f 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100195:	05 8b 27 00 00       	add    $0x278b,%eax
  10019a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1001a1:	eb 04                	jmp    1001a7 <strlen+0x1d>
  1001a3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1001a7:	8b 55 08             	mov    0x8(%ebp),%edx
  1001aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1001ad:	01 d0                	add    %edx,%eax
  1001af:	0f b6 00             	movzbl (%eax),%eax
  1001b2:	84 c0                	test   %al,%al
  1001b4:	75 ed                	jne    1001a3 <strlen+0x19>
  1001b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1001b9:	c9                   	leave  
  1001ba:	c3                   	ret    

001001bb <strrev>:
  1001bb:	55                   	push   %ebp
  1001bc:	89 e5                	mov    %esp,%ebp
  1001be:	83 ec 10             	sub    $0x10,%esp
  1001c1:	e8 5d 0f 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  1001c6:	05 5a 27 00 00       	add    $0x275a,%eax
  1001cb:	ff 75 08             	pushl  0x8(%ebp)
  1001ce:	e8 b7 ff ff ff       	call   10018a <strlen>
  1001d3:	83 c4 04             	add    $0x4,%esp
  1001d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1001d9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1001e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1001e3:	83 e8 01             	sub    $0x1,%eax
  1001e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1001e9:	eb 39                	jmp    100224 <strrev+0x69>
  1001eb:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1001ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1001f1:	01 d0                	add    %edx,%eax
  1001f3:	0f b6 00             	movzbl (%eax),%eax
  1001f6:	88 45 f3             	mov    %al,-0xd(%ebp)
  1001f9:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1001fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ff:	01 d0                	add    %edx,%eax
  100201:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  100204:	8b 55 08             	mov    0x8(%ebp),%edx
  100207:	01 ca                	add    %ecx,%edx
  100209:	0f b6 00             	movzbl (%eax),%eax
  10020c:	88 02                	mov    %al,(%edx)
  10020e:	8b 55 f8             	mov    -0x8(%ebp),%edx
  100211:	8b 45 08             	mov    0x8(%ebp),%eax
  100214:	01 c2                	add    %eax,%edx
  100216:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10021a:	88 02                	mov    %al,(%edx)
  10021c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100220:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
  100224:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100227:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  10022a:	7c bf                	jl     1001eb <strrev+0x30>
  10022c:	90                   	nop
  10022d:	c9                   	leave  
  10022e:	c3                   	ret    

0010022f <itoa>:
  10022f:	55                   	push   %ebp
  100230:	89 e5                	mov    %esp,%ebp
  100232:	83 ec 10             	sub    $0x10,%esp
  100235:	e8 e9 0e 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  10023a:	05 e6 26 00 00       	add    $0x26e6,%eax
  10023f:	8b 45 08             	mov    0x8(%ebp),%eax
  100242:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100245:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  10024c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  100250:	75 0a                	jne    10025c <itoa+0x2d>
  100252:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100257:	e9 94 00 00 00       	jmp    1002f0 <itoa+0xc1>
  10025c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10025f:	99                   	cltd   
  100260:	f7 7d 14             	idivl  0x14(%ebp)
  100263:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100266:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  10026a:	7f 1c                	jg     100288 <itoa+0x59>
  10026c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10026f:	8d 48 30             	lea    0x30(%eax),%ecx
  100272:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100275:	8d 50 01             	lea    0x1(%eax),%edx
  100278:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10027b:	89 c2                	mov    %eax,%edx
  10027d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100280:	01 d0                	add    %edx,%eax
  100282:	89 ca                	mov    %ecx,%edx
  100284:	88 10                	mov    %dl,(%eax)
  100286:	eb 1a                	jmp    1002a2 <itoa+0x73>
  100288:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10028b:	8d 48 37             	lea    0x37(%eax),%ecx
  10028e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100291:	8d 50 01             	lea    0x1(%eax),%edx
  100294:	89 55 f8             	mov    %edx,-0x8(%ebp)
  100297:	89 c2                	mov    %eax,%edx
  100299:	8b 45 0c             	mov    0xc(%ebp),%eax
  10029c:	01 d0                	add    %edx,%eax
  10029e:	89 ca                	mov    %ecx,%edx
  1002a0:	88 10                	mov    %dl,(%eax)
  1002a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1002a5:	99                   	cltd   
  1002a6:	f7 7d 14             	idivl  0x14(%ebp)
  1002a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1002ac:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1002b0:	74 0b                	je     1002bd <itoa+0x8e>
  1002b2:	8b 45 10             	mov    0x10(%ebp),%eax
  1002b5:	83 e8 01             	sub    $0x1,%eax
  1002b8:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  1002bb:	7c 9f                	jl     10025c <itoa+0x2d>
  1002bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1002c0:	83 e8 01             	sub    $0x1,%eax
  1002c3:	39 45 f8             	cmp    %eax,-0x8(%ebp)
  1002c6:	75 0d                	jne    1002d5 <itoa+0xa6>
  1002c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1002cc:	74 07                	je     1002d5 <itoa+0xa6>
  1002ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1002d3:	eb 1b                	jmp    1002f0 <itoa+0xc1>
  1002d5:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1002d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002db:	01 d0                	add    %edx,%eax
  1002dd:	c6 00 00             	movb   $0x0,(%eax)
  1002e0:	ff 75 0c             	pushl  0xc(%ebp)
  1002e3:	e8 d3 fe ff ff       	call   1001bb <strrev>
  1002e8:	83 c4 04             	add    $0x4,%esp
  1002eb:	b8 00 00 00 00       	mov    $0x0,%eax
  1002f0:	c9                   	leave  
  1002f1:	c3                   	ret    

001002f2 <outb>:
  1002f2:	55                   	push   %ebp
  1002f3:	89 e5                	mov    %esp,%ebp
  1002f5:	83 ec 08             	sub    $0x8,%esp
  1002f8:	e8 26 0e 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  1002fd:	05 23 26 00 00       	add    $0x2623,%eax
  100302:	8b 55 08             	mov    0x8(%ebp),%edx
  100305:	8b 45 0c             	mov    0xc(%ebp),%eax
  100308:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  10030c:	88 45 f8             	mov    %al,-0x8(%ebp)
  10030f:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100313:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100317:	ee                   	out    %al,(%dx)
  100318:	90                   	nop
  100319:	c9                   	leave  
  10031a:	c3                   	ret    

0010031b <inb>:
  10031b:	55                   	push   %ebp
  10031c:	89 e5                	mov    %esp,%ebp
  10031e:	83 ec 14             	sub    $0x14,%esp
  100321:	e8 fd 0d 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100326:	05 fa 25 00 00       	add    $0x25fa,%eax
  10032b:	8b 45 08             	mov    0x8(%ebp),%eax
  10032e:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  100332:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  100336:	89 c2                	mov    %eax,%edx
  100338:	ec                   	in     (%dx),%al
  100339:	88 45 ff             	mov    %al,-0x1(%ebp)
  10033c:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  100340:	c9                   	leave  
  100341:	c3                   	ret    

00100342 <cli>:
  100342:	55                   	push   %ebp
  100343:	89 e5                	mov    %esp,%ebp
  100345:	e8 d9 0d 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  10034a:	05 d6 25 00 00       	add    $0x25d6,%eax
  10034f:	fa                   	cli    
  100350:	90                   	nop
  100351:	5d                   	pop    %ebp
  100352:	c3                   	ret    

00100353 <get_cursor>:
  100353:	55                   	push   %ebp
  100354:	89 e5                	mov    %esp,%ebp
  100356:	83 ec 10             	sub    $0x10,%esp
  100359:	e8 c5 0d 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  10035e:	05 c2 25 00 00       	add    $0x25c2,%eax
  100363:	6a 0e                	push   $0xe
  100365:	68 d4 03 00 00       	push   $0x3d4
  10036a:	e8 83 ff ff ff       	call   1002f2 <outb>
  10036f:	83 c4 08             	add    $0x8,%esp
  100372:	68 d5 03 00 00       	push   $0x3d5
  100377:	e8 9f ff ff ff       	call   10031b <inb>
  10037c:	83 c4 04             	add    $0x4,%esp
  10037f:	0f b6 c0             	movzbl %al,%eax
  100382:	c1 e0 08             	shl    $0x8,%eax
  100385:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100388:	6a 0f                	push   $0xf
  10038a:	68 d4 03 00 00       	push   $0x3d4
  10038f:	e8 5e ff ff ff       	call   1002f2 <outb>
  100394:	83 c4 08             	add    $0x8,%esp
  100397:	68 d5 03 00 00       	push   $0x3d5
  10039c:	e8 7a ff ff ff       	call   10031b <inb>
  1003a1:	83 c4 04             	add    $0x4,%esp
  1003a4:	0f b6 c0             	movzbl %al,%eax
  1003a7:	09 45 fc             	or     %eax,-0x4(%ebp)
  1003aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1003ad:	c9                   	leave  
  1003ae:	c3                   	ret    

001003af <set_cursor>:
  1003af:	55                   	push   %ebp
  1003b0:	89 e5                	mov    %esp,%ebp
  1003b2:	e8 6c 0d 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  1003b7:	05 69 25 00 00       	add    $0x2569,%eax
  1003bc:	6a 0e                	push   $0xe
  1003be:	68 d4 03 00 00       	push   $0x3d4
  1003c3:	e8 2a ff ff ff       	call   1002f2 <outb>
  1003c8:	83 c4 08             	add    $0x8,%esp
  1003cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1003ce:	c1 f8 08             	sar    $0x8,%eax
  1003d1:	0f b6 c0             	movzbl %al,%eax
  1003d4:	50                   	push   %eax
  1003d5:	68 d5 03 00 00       	push   $0x3d5
  1003da:	e8 13 ff ff ff       	call   1002f2 <outb>
  1003df:	83 c4 08             	add    $0x8,%esp
  1003e2:	6a 0f                	push   $0xf
  1003e4:	68 d4 03 00 00       	push   $0x3d4
  1003e9:	e8 04 ff ff ff       	call   1002f2 <outb>
  1003ee:	83 c4 08             	add    $0x8,%esp
  1003f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1003f4:	0f b6 c0             	movzbl %al,%eax
  1003f7:	50                   	push   %eax
  1003f8:	68 d5 03 00 00       	push   $0x3d5
  1003fd:	e8 f0 fe ff ff       	call   1002f2 <outb>
  100402:	83 c4 08             	add    $0x8,%esp
  100405:	90                   	nop
  100406:	c9                   	leave  
  100407:	c3                   	ret    

00100408 <cputc>:
  100408:	55                   	push   %ebp
  100409:	89 e5                	mov    %esp,%ebp
  10040b:	56                   	push   %esi
  10040c:	53                   	push   %ebx
  10040d:	83 ec 20             	sub    $0x20,%esp
  100410:	e8 0a 0d 00 00       	call   10111f <__x86.get_pc_thunk.bx>
  100415:	81 c3 0b 25 00 00    	add    $0x250b,%ebx
  10041b:	8b 45 08             	mov    0x8(%ebp),%eax
  10041e:	88 45 e4             	mov    %al,-0x1c(%ebp)
  100421:	e8 2d ff ff ff       	call   100353 <get_cursor>
  100426:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100429:	80 7d e4 0a          	cmpb   $0xa,-0x1c(%ebp)
  10042d:	75 1b                	jne    10044a <cputc+0x42>
  10042f:	b9 50 00 00 00       	mov    $0x50,%ecx
  100434:	be 50 00 00 00       	mov    $0x50,%esi
  100439:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10043c:	99                   	cltd   
  10043d:	f7 fe                	idiv   %esi
  10043f:	89 d0                	mov    %edx,%eax
  100441:	29 c1                	sub    %eax,%ecx
  100443:	89 c8                	mov    %ecx,%eax
  100445:	01 45 f4             	add    %eax,-0xc(%ebp)
  100448:	eb 37                	jmp    100481 <cputc+0x79>
  10044a:	80 7d e4 08          	cmpb   $0x8,-0x1c(%ebp)
  10044e:	75 0c                	jne    10045c <cputc+0x54>
  100450:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100454:	7e 2b                	jle    100481 <cputc+0x79>
  100456:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10045a:	eb 25                	jmp    100481 <cputc+0x79>
  10045c:	66 0f be 45 e4       	movsbw -0x1c(%ebp),%ax
  100461:	0f b6 c0             	movzbl %al,%eax
  100464:	80 cc 07             	or     $0x7,%ah
  100467:	89 c6                	mov    %eax,%esi
  100469:	8b 8b 50 4f 00 00    	mov    0x4f50(%ebx),%ecx
  10046f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100472:	8d 50 01             	lea    0x1(%eax),%edx
  100475:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100478:	01 c0                	add    %eax,%eax
  10047a:	01 c8                	add    %ecx,%eax
  10047c:	89 f2                	mov    %esi,%edx
  10047e:	66 89 10             	mov    %dx,(%eax)
  100481:	be 50 00 00 00       	mov    $0x50,%esi
  100486:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100489:	99                   	cltd   
  10048a:	f7 fe                	idiv   %esi
  10048c:	83 f8 17             	cmp    $0x17,%eax
  10048f:	7e 56                	jle    1004e7 <cputc+0xdf>
  100491:	8b 83 50 4f 00 00    	mov    0x4f50(%ebx),%eax
  100497:	ba 50 00 00 00       	mov    $0x50,%edx
  10049c:	01 d2                	add    %edx,%edx
  10049e:	01 c2                	add    %eax,%edx
  1004a0:	8b 83 50 4f 00 00    	mov    0x4f50(%ebx),%eax
  1004a6:	83 ec 04             	sub    $0x4,%esp
  1004a9:	68 60 0e 00 00       	push   $0xe60
  1004ae:	52                   	push   %edx
  1004af:	50                   	push   %eax
  1004b0:	e8 c9 fb ff ff       	call   10007e <memmove>
  1004b5:	83 c4 10             	add    $0x10,%esp
  1004b8:	b8 50 00 00 00       	mov    $0x50,%eax
  1004bd:	29 45 f4             	sub    %eax,-0xc(%ebp)
  1004c0:	b8 80 07 00 00       	mov    $0x780,%eax
  1004c5:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1004c8:	8d 14 00             	lea    (%eax,%eax,1),%edx
  1004cb:	8b 83 50 4f 00 00    	mov    0x4f50(%ebx),%eax
  1004d1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  1004d4:	01 c9                	add    %ecx,%ecx
  1004d6:	01 c8                	add    %ecx,%eax
  1004d8:	83 ec 04             	sub    $0x4,%esp
  1004db:	52                   	push   %edx
  1004dc:	6a 00                	push   $0x0
  1004de:	50                   	push   %eax
  1004df:	e8 5b fb ff ff       	call   10003f <memset>
  1004e4:	83 c4 10             	add    $0x10,%esp
  1004e7:	83 ec 0c             	sub    $0xc,%esp
  1004ea:	ff 75 f4             	pushl  -0xc(%ebp)
  1004ed:	e8 bd fe ff ff       	call   1003af <set_cursor>
  1004f2:	83 c4 10             	add    $0x10,%esp
  1004f5:	8b 83 50 4f 00 00    	mov    0x4f50(%ebx),%eax
  1004fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1004fe:	01 d2                	add    %edx,%edx
  100500:	01 d0                	add    %edx,%eax
  100502:	66 c7 00 20 07       	movw   $0x720,(%eax)
  100507:	90                   	nop
  100508:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10050b:	5b                   	pop    %ebx
  10050c:	5e                   	pop    %esi
  10050d:	5d                   	pop    %ebp
  10050e:	c3                   	ret    

0010050f <cputs>:
  10050f:	55                   	push   %ebp
  100510:	89 e5                	mov    %esp,%ebp
  100512:	83 ec 18             	sub    $0x18,%esp
  100515:	e8 09 0c 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  10051a:	05 06 24 00 00       	add    $0x2406,%eax
  10051f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100526:	eb 22                	jmp    10054a <cputs+0x3b>
  100528:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10052b:	8d 50 01             	lea    0x1(%eax),%edx
  10052e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100531:	89 c2                	mov    %eax,%edx
  100533:	8b 45 08             	mov    0x8(%ebp),%eax
  100536:	01 d0                	add    %edx,%eax
  100538:	0f b6 00             	movzbl (%eax),%eax
  10053b:	0f be c0             	movsbl %al,%eax
  10053e:	83 ec 0c             	sub    $0xc,%esp
  100541:	50                   	push   %eax
  100542:	e8 c1 fe ff ff       	call   100408 <cputc>
  100547:	83 c4 10             	add    $0x10,%esp
  10054a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10054d:	8b 45 08             	mov    0x8(%ebp),%eax
  100550:	01 d0                	add    %edx,%eax
  100552:	0f b6 00             	movzbl (%eax),%eax
  100555:	84 c0                	test   %al,%al
  100557:	75 cf                	jne    100528 <cputs+0x19>
  100559:	90                   	nop
  10055a:	c9                   	leave  
  10055b:	c3                   	ret    

0010055c <clear>:
  10055c:	55                   	push   %ebp
  10055d:	89 e5                	mov    %esp,%ebp
  10055f:	83 ec 18             	sub    $0x18,%esp
  100562:	e8 bc 0b 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100567:	05 b9 23 00 00       	add    $0x23b9,%eax
  10056c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100573:	eb 11                	jmp    100586 <clear+0x2a>
  100575:	83 ec 0c             	sub    $0xc,%esp
  100578:	6a 20                	push   $0x20
  10057a:	e8 89 fe ff ff       	call   100408 <cputc>
  10057f:	83 c4 10             	add    $0x10,%esp
  100582:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100586:	ba 50 00 00 00       	mov    $0x50,%edx
  10058b:	b8 19 00 00 00       	mov    $0x19,%eax
  100590:	0f af c2             	imul   %edx,%eax
  100593:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100596:	7c dd                	jl     100575 <clear+0x19>
  100598:	90                   	nop
  100599:	c9                   	leave  
  10059a:	c3                   	ret    

0010059b <vga_init>:
  10059b:	55                   	push   %ebp
  10059c:	89 e5                	mov    %esp,%ebp
  10059e:	83 ec 08             	sub    $0x8,%esp
  1005a1:	e8 7d 0b 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  1005a6:	05 7a 23 00 00       	add    $0x237a,%eax
  1005ab:	c7 80 50 4f 00 00 00 	movl   $0xb8000,0x4f50(%eax)
  1005b2:	80 0b 00 
  1005b5:	e8 a2 ff ff ff       	call   10055c <clear>
  1005ba:	90                   	nop
  1005bb:	c9                   	leave  
  1005bc:	c3                   	ret    

001005bd <panic>:
  1005bd:	55                   	push   %ebp
  1005be:	89 e5                	mov    %esp,%ebp
  1005c0:	83 ec 08             	sub    $0x8,%esp
  1005c3:	e8 5b 0b 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  1005c8:	05 58 23 00 00       	add    $0x2358,%eax
  1005cd:	e8 70 fd ff ff       	call   100342 <cli>
  1005d2:	83 ec 0c             	sub    $0xc,%esp
  1005d5:	ff 75 08             	pushl  0x8(%ebp)
  1005d8:	e8 32 ff ff ff       	call   10050f <cputs>
  1005dd:	83 c4 10             	add    $0x10,%esp
  1005e0:	eb fe                	jmp    1005e0 <panic+0x23>

001005e2 <cprintf>:
  1005e2:	55                   	push   %ebp
  1005e3:	89 e5                	mov    %esp,%ebp
  1005e5:	53                   	push   %ebx
  1005e6:	83 ec 24             	sub    $0x24,%esp
  1005e9:	e8 31 0b 00 00       	call   10111f <__x86.get_pc_thunk.bx>
  1005ee:	81 c3 32 23 00 00    	add    $0x2332,%ebx
  1005f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005f7:	85 c0                	test   %eax,%eax
  1005f9:	75 12                	jne    10060d <cprintf+0x2b>
  1005fb:	83 ec 0c             	sub    $0xc,%esp
  1005fe:	8d 83 e8 f6 ff ff    	lea    -0x918(%ebx),%eax
  100604:	50                   	push   %eax
  100605:	e8 b3 ff ff ff       	call   1005bd <panic>
  10060a:	83 c4 10             	add    $0x10,%esp
  10060d:	8d 45 0c             	lea    0xc(%ebp),%eax
  100610:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100613:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  10061a:	e9 43 01 00 00       	jmp    100762 <cprintf+0x180>
  10061f:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
  100623:	74 17                	je     10063c <cprintf+0x5a>
  100625:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100628:	0f be c0             	movsbl %al,%eax
  10062b:	83 ec 0c             	sub    $0xc,%esp
  10062e:	50                   	push   %eax
  10062f:	e8 d4 fd ff ff       	call   100408 <cputc>
  100634:	83 c4 10             	add    $0x10,%esp
  100637:	e9 22 01 00 00       	jmp    10075e <cprintf+0x17c>
  10063c:	8b 55 08             	mov    0x8(%ebp),%edx
  10063f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  100643:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100646:	01 d0                	add    %edx,%eax
  100648:	0f b6 00             	movzbl (%eax),%eax
  10064b:	0f be c0             	movsbl %al,%eax
  10064e:	25 ff 00 00 00       	and    $0xff,%eax
  100653:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100656:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10065a:	0f 84 24 01 00 00    	je     100784 <cprintf+0x1a2>
  100660:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100663:	83 f8 70             	cmp    $0x70,%eax
  100666:	74 67                	je     1006cf <cprintf+0xed>
  100668:	83 f8 70             	cmp    $0x70,%eax
  10066b:	7f 0a                	jg     100677 <cprintf+0x95>
  10066d:	83 f8 64             	cmp    $0x64,%eax
  100670:	74 18                	je     10068a <cprintf+0xa8>
  100672:	e9 c7 00 00 00       	jmp    10073e <cprintf+0x15c>
  100677:	83 f8 73             	cmp    $0x73,%eax
  10067a:	0f 84 91 00 00 00    	je     100711 <cprintf+0x12f>
  100680:	83 f8 78             	cmp    $0x78,%eax
  100683:	74 4a                	je     1006cf <cprintf+0xed>
  100685:	e9 b4 00 00 00       	jmp    10073e <cprintf+0x15c>
  10068a:	83 ec 04             	sub    $0x4,%esp
  10068d:	6a 0c                	push   $0xc
  10068f:	6a 00                	push   $0x0
  100691:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100694:	50                   	push   %eax
  100695:	e8 a5 f9 ff ff       	call   10003f <memset>
  10069a:	83 c4 10             	add    $0x10,%esp
  10069d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006a0:	8d 50 04             	lea    0x4(%eax),%edx
  1006a3:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1006a6:	8b 00                	mov    (%eax),%eax
  1006a8:	89 c2                	mov    %eax,%edx
  1006aa:	6a 0a                	push   $0xa
  1006ac:	6a 0c                	push   $0xc
  1006ae:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006b1:	50                   	push   %eax
  1006b2:	52                   	push   %edx
  1006b3:	e8 77 fb ff ff       	call   10022f <itoa>
  1006b8:	83 c4 10             	add    $0x10,%esp
  1006bb:	83 ec 0c             	sub    $0xc,%esp
  1006be:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006c1:	50                   	push   %eax
  1006c2:	e8 48 fe ff ff       	call   10050f <cputs>
  1006c7:	83 c4 10             	add    $0x10,%esp
  1006ca:	e9 8f 00 00 00       	jmp    10075e <cprintf+0x17c>
  1006cf:	83 ec 04             	sub    $0x4,%esp
  1006d2:	6a 0c                	push   $0xc
  1006d4:	6a 00                	push   $0x0
  1006d6:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006d9:	50                   	push   %eax
  1006da:	e8 60 f9 ff ff       	call   10003f <memset>
  1006df:	83 c4 10             	add    $0x10,%esp
  1006e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006e5:	8d 50 04             	lea    0x4(%eax),%edx
  1006e8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1006eb:	8b 00                	mov    (%eax),%eax
  1006ed:	89 c2                	mov    %eax,%edx
  1006ef:	6a 10                	push   $0x10
  1006f1:	6a 0c                	push   $0xc
  1006f3:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006f6:	50                   	push   %eax
  1006f7:	52                   	push   %edx
  1006f8:	e8 32 fb ff ff       	call   10022f <itoa>
  1006fd:	83 c4 10             	add    $0x10,%esp
  100700:	83 ec 0c             	sub    $0xc,%esp
  100703:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100706:	50                   	push   %eax
  100707:	e8 03 fe ff ff       	call   10050f <cputs>
  10070c:	83 c4 10             	add    $0x10,%esp
  10070f:	eb 4d                	jmp    10075e <cprintf+0x17c>
  100711:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100714:	8d 50 04             	lea    0x4(%eax),%edx
  100717:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10071a:	8b 00                	mov    (%eax),%eax
  10071c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10071f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100723:	75 09                	jne    10072e <cprintf+0x14c>
  100725:	8d 83 f1 f6 ff ff    	lea    -0x90f(%ebx),%eax
  10072b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10072e:	83 ec 0c             	sub    $0xc,%esp
  100731:	ff 75 ec             	pushl  -0x14(%ebp)
  100734:	e8 d6 fd ff ff       	call   10050f <cputs>
  100739:	83 c4 10             	add    $0x10,%esp
  10073c:	eb 20                	jmp    10075e <cprintf+0x17c>
  10073e:	83 ec 0c             	sub    $0xc,%esp
  100741:	6a 25                	push   $0x25
  100743:	e8 c0 fc ff ff       	call   100408 <cputc>
  100748:	83 c4 10             	add    $0x10,%esp
  10074b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10074e:	0f be c0             	movsbl %al,%eax
  100751:	83 ec 0c             	sub    $0xc,%esp
  100754:	50                   	push   %eax
  100755:	e8 ae fc ff ff       	call   100408 <cputc>
  10075a:	83 c4 10             	add    $0x10,%esp
  10075d:	90                   	nop
  10075e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  100762:	8b 55 08             	mov    0x8(%ebp),%edx
  100765:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100768:	01 d0                	add    %edx,%eax
  10076a:	0f b6 00             	movzbl (%eax),%eax
  10076d:	0f be c0             	movsbl %al,%eax
  100770:	25 ff 00 00 00       	and    $0xff,%eax
  100775:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100778:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10077c:	0f 85 9d fe ff ff    	jne    10061f <cprintf+0x3d>
  100782:	eb 01                	jmp    100785 <cprintf+0x1a3>
  100784:	90                   	nop
  100785:	90                   	nop
  100786:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100789:	c9                   	leave  
  10078a:	c3                   	ret    

0010078b <set_segdesc>:
  10078b:	55                   	push   %ebp
  10078c:	89 e5                	mov    %esp,%ebp
  10078e:	57                   	push   %edi
  10078f:	56                   	push   %esi
  100790:	53                   	push   %ebx
  100791:	83 ec 0c             	sub    $0xc,%esp
  100794:	e8 8a 09 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100799:	05 87 21 00 00       	add    $0x2187,%eax
  10079e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1007a1:	8b 4d 14             	mov    0x14(%ebp),%ecx
  1007a4:	8b 55 18             	mov    0x18(%ebp),%edx
  1007a7:	66 89 5d f0          	mov    %bx,-0x10(%ebp)
  1007ab:	88 4d ec             	mov    %cl,-0x14(%ebp)
  1007ae:	88 55 e8             	mov    %dl,-0x18(%ebp)
  1007b1:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  1007b5:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007b8:	89 d3                	mov    %edx,%ebx
  1007ba:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  1007c0:	66 89 5d ea          	mov    %bx,-0x16(%ebp)
  1007c4:	0f b7 db             	movzwl %bx,%ebx
  1007c7:	0f b6 f3             	movzbl %bl,%esi
  1007ca:	0f b6 5c ca 02       	movzbl 0x2(%edx,%ecx,8),%ebx
  1007cf:	83 e3 00             	and    $0x0,%ebx
  1007d2:	89 df                	mov    %ebx,%edi
  1007d4:	09 f7                	or     %esi,%edi
  1007d6:	89 fb                	mov    %edi,%ebx
  1007d8:	88 5c ca 02          	mov    %bl,0x2(%edx,%ecx,8)
  1007dc:	0f b7 5d ea          	movzwl -0x16(%ebp),%ebx
  1007e0:	66 c1 eb 08          	shr    $0x8,%bx
  1007e4:	0f b7 f3             	movzwl %bx,%esi
  1007e7:	0f b6 5c ca 03       	movzbl 0x3(%edx,%ecx,8),%ebx
  1007ec:	83 e3 00             	and    $0x0,%ebx
  1007ef:	09 f3                	or     %esi,%ebx
  1007f1:	88 5c ca 03          	mov    %bl,0x3(%edx,%ecx,8)
  1007f5:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007f8:	c1 ea 10             	shr    $0x10,%edx
  1007fb:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  1007ff:	89 d3                	mov    %edx,%ebx
  100801:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  100807:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  10080b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10080e:	c1 ea 18             	shr    $0x18,%edx
  100811:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  100815:	89 d3                	mov    %edx,%ebx
  100817:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  10081d:	88 5c ca 07          	mov    %bl,0x7(%edx,%ecx,8)
  100821:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  100825:	8b 55 10             	mov    0x10(%ebp),%edx
  100828:	89 d3                	mov    %edx,%ebx
  10082a:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  100830:	66 89 5d ea          	mov    %bx,-0x16(%ebp)
  100834:	0f b7 db             	movzwl %bx,%ebx
  100837:	0f b6 f3             	movzbl %bl,%esi
  10083a:	0f b6 1c ca          	movzbl (%edx,%ecx,8),%ebx
  10083e:	83 e3 00             	and    $0x0,%ebx
  100841:	89 df                	mov    %ebx,%edi
  100843:	09 f7                	or     %esi,%edi
  100845:	89 fb                	mov    %edi,%ebx
  100847:	88 1c ca             	mov    %bl,(%edx,%ecx,8)
  10084a:	0f b7 5d ea          	movzwl -0x16(%ebp),%ebx
  10084e:	66 c1 eb 08          	shr    $0x8,%bx
  100852:	0f b7 f3             	movzwl %bx,%esi
  100855:	0f b6 5c ca 01       	movzbl 0x1(%edx,%ecx,8),%ebx
  10085a:	83 e3 00             	and    $0x0,%ebx
  10085d:	09 f3                	or     %esi,%ebx
  10085f:	88 5c ca 01          	mov    %bl,0x1(%edx,%ecx,8)
  100863:	8b 55 10             	mov    0x10(%ebp),%edx
  100866:	c1 ea 10             	shr    $0x10,%edx
  100869:	0f b7 5d f0          	movzwl -0x10(%ebp),%ebx
  10086d:	83 e2 0f             	and    $0xf,%edx
  100870:	8d 88 00 07 00 00    	lea    0x700(%eax),%ecx
  100876:	89 d6                	mov    %edx,%esi
  100878:	83 e6 0f             	and    $0xf,%esi
  10087b:	0f b6 54 d9 06       	movzbl 0x6(%ecx,%ebx,8),%edx
  100880:	83 e2 f0             	and    $0xfffffff0,%edx
  100883:	09 f2                	or     %esi,%edx
  100885:	88 54 d9 06          	mov    %dl,0x6(%ecx,%ebx,8)
  100889:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  10088d:	0f b6 55 ec          	movzbl -0x14(%ebp),%edx
  100891:	83 e2 0f             	and    $0xf,%edx
  100894:	89 d3                	mov    %edx,%ebx
  100896:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  10089c:	89 de                	mov    %ebx,%esi
  10089e:	83 e6 0f             	and    $0xf,%esi
  1008a1:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  1008a6:	83 e3 f0             	and    $0xfffffff0,%ebx
  1008a9:	09 f3                	or     %esi,%ebx
  1008ab:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  1008af:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  1008b3:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  1008b9:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  1008be:	83 cb 10             	or     $0x10,%ebx
  1008c1:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  1008c5:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  1008c9:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
  1008cd:	89 d3                	mov    %edx,%ebx
  1008cf:	83 e3 03             	and    $0x3,%ebx
  1008d2:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  1008d8:	83 e3 03             	and    $0x3,%ebx
  1008db:	89 de                	mov    %ebx,%esi
  1008dd:	c1 e6 05             	shl    $0x5,%esi
  1008e0:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  1008e5:	83 e3 9f             	and    $0xffffff9f,%ebx
  1008e8:	09 f3                	or     %esi,%ebx
  1008ea:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  1008ee:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  1008f2:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  1008f8:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  1008fd:	83 cb 80             	or     $0xffffff80,%ebx
  100900:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  100904:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  100908:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  10090e:	0f b6 5c ca 06       	movzbl 0x6(%edx,%ecx,8),%ebx
  100913:	83 e3 ef             	and    $0xffffffef,%ebx
  100916:	88 5c ca 06          	mov    %bl,0x6(%edx,%ecx,8)
  10091a:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  10091e:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  100924:	0f b6 5c ca 06       	movzbl 0x6(%edx,%ecx,8),%ebx
  100929:	83 e3 df             	and    $0xffffffdf,%ebx
  10092c:	88 5c ca 06          	mov    %bl,0x6(%edx,%ecx,8)
  100930:	0f b7 4d f0          	movzwl -0x10(%ebp),%ecx
  100934:	8d 90 00 07 00 00    	lea    0x700(%eax),%edx
  10093a:	0f b6 5c ca 06       	movzbl 0x6(%edx,%ecx,8),%ebx
  10093f:	83 cb 40             	or     $0x40,%ebx
  100942:	88 5c ca 06          	mov    %bl,0x6(%edx,%ecx,8)
  100946:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  10094a:	8d 80 00 07 00 00    	lea    0x700(%eax),%eax
  100950:	0f b6 4c d0 06       	movzbl 0x6(%eax,%edx,8),%ecx
  100955:	83 c9 80             	or     $0xffffff80,%ecx
  100958:	88 4c d0 06          	mov    %cl,0x6(%eax,%edx,8)
  10095c:	90                   	nop
  10095d:	83 c4 0c             	add    $0xc,%esp
  100960:	5b                   	pop    %ebx
  100961:	5e                   	pop    %esi
  100962:	5f                   	pop    %edi
  100963:	5d                   	pop    %ebp
  100964:	c3                   	ret    

00100965 <init_gdt>:
  100965:	55                   	push   %ebp
  100966:	89 e5                	mov    %esp,%ebp
  100968:	53                   	push   %ebx
  100969:	83 ec 04             	sub    $0x4,%esp
  10096c:	e8 ae 07 00 00       	call   10111f <__x86.get_pc_thunk.bx>
  100971:	81 c3 af 1f 00 00    	add    $0x1faf,%ebx
  100977:	6a 00                	push   $0x0
  100979:	6a 0a                	push   $0xa
  10097b:	6a ff                	push   $0xffffffff
  10097d:	6a 00                	push   $0x0
  10097f:	6a 01                	push   $0x1
  100981:	e8 05 fe ff ff       	call   10078b <set_segdesc>
  100986:	83 c4 14             	add    $0x14,%esp
  100989:	6a 00                	push   $0x0
  10098b:	6a 02                	push   $0x2
  10098d:	6a ff                	push   $0xffffffff
  10098f:	6a 00                	push   $0x0
  100991:	6a 02                	push   $0x2
  100993:	e8 f3 fd ff ff       	call   10078b <set_segdesc>
  100998:	83 c4 14             	add    $0x14,%esp
  10099b:	6a 03                	push   $0x3
  10099d:	6a 0a                	push   $0xa
  10099f:	6a ff                	push   $0xffffffff
  1009a1:	6a 00                	push   $0x0
  1009a3:	6a 03                	push   $0x3
  1009a5:	e8 e1 fd ff ff       	call   10078b <set_segdesc>
  1009aa:	83 c4 14             	add    $0x14,%esp
  1009ad:	6a 03                	push   $0x3
  1009af:	6a 02                	push   $0x2
  1009b1:	6a ff                	push   $0xffffffff
  1009b3:	6a 00                	push   $0x0
  1009b5:	6a 04                	push   $0x4
  1009b7:	e8 cf fd ff ff       	call   10078b <set_segdesc>
  1009bc:	83 c4 14             	add    $0x14,%esp
  1009bf:	8d 83 e0 06 00 00    	lea    0x6e0(%ebx),%eax
  1009c5:	66 c7 00 27 00       	movw   $0x27,(%eax)
  1009ca:	8d 83 00 07 00 00    	lea    0x700(%ebx),%eax
  1009d0:	89 c2                	mov    %eax,%edx
  1009d2:	8d 83 e0 06 00 00    	lea    0x6e0(%ebx),%eax
  1009d8:	89 50 02             	mov    %edx,0x2(%eax)
  1009db:	8d 83 e0 06 00 00    	lea    0x6e0(%ebx),%eax
  1009e1:	83 ec 0c             	sub    $0xc,%esp
  1009e4:	50                   	push   %eax
  1009e5:	e8 4b 05 00 00       	call   100f35 <lgdtr>
  1009ea:	83 c4 10             	add    $0x10,%esp
  1009ed:	90                   	nop
  1009ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009f1:	c9                   	leave  
  1009f2:	c3                   	ret    

001009f3 <outb>:
  1009f3:	55                   	push   %ebp
  1009f4:	89 e5                	mov    %esp,%ebp
  1009f6:	83 ec 08             	sub    $0x8,%esp
  1009f9:	e8 25 07 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  1009fe:	05 22 1f 00 00       	add    $0x1f22,%eax
  100a03:	8b 55 08             	mov    0x8(%ebp),%edx
  100a06:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a09:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100a0d:	88 45 f8             	mov    %al,-0x8(%ebp)
  100a10:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100a14:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100a18:	ee                   	out    %al,(%dx)
  100a19:	90                   	nop
  100a1a:	c9                   	leave  
  100a1b:	c3                   	ret    

00100a1c <inb>:
  100a1c:	55                   	push   %ebp
  100a1d:	89 e5                	mov    %esp,%ebp
  100a1f:	83 ec 14             	sub    $0x14,%esp
  100a22:	e8 fc 06 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100a27:	05 f9 1e 00 00       	add    $0x1ef9,%eax
  100a2c:	8b 45 08             	mov    0x8(%ebp),%eax
  100a2f:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  100a33:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  100a37:	89 c2                	mov    %eax,%edx
  100a39:	ec                   	in     (%dx),%al
  100a3a:	88 45 ff             	mov    %al,-0x1(%ebp)
  100a3d:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  100a41:	c9                   	leave  
  100a42:	c3                   	ret    

00100a43 <sti>:
  100a43:	55                   	push   %ebp
  100a44:	89 e5                	mov    %esp,%ebp
  100a46:	e8 d8 06 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100a4b:	05 d5 1e 00 00       	add    $0x1ed5,%eax
  100a50:	fb                   	sti    
  100a51:	90                   	nop
  100a52:	5d                   	pop    %ebp
  100a53:	c3                   	ret    

00100a54 <set_gatedesc>:
  100a54:	55                   	push   %ebp
  100a55:	89 e5                	mov    %esp,%ebp
  100a57:	56                   	push   %esi
  100a58:	53                   	push   %ebx
  100a59:	83 ec 0c             	sub    $0xc,%esp
  100a5c:	e8 c2 06 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100a61:	05 bf 1e 00 00       	add    $0x1ebf,%eax
  100a66:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100a69:	8b 4d 10             	mov    0x10(%ebp),%ecx
  100a6c:	8b 55 14             	mov    0x14(%ebp),%edx
  100a6f:	88 5d f4             	mov    %bl,-0xc(%ebp)
  100a72:	66 89 4d f0          	mov    %cx,-0x10(%ebp)
  100a76:	88 55 ec             	mov    %dl,-0x14(%ebp)
  100a79:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100a7d:	8b 55 0c             	mov    0xc(%ebp),%edx
  100a80:	89 d3                	mov    %edx,%ebx
  100a82:	8d 90 40 07 00 00    	lea    0x740(%eax),%edx
  100a88:	66 89 1c ca          	mov    %bx,(%edx,%ecx,8)
  100a8c:	8b 55 0c             	mov    0xc(%ebp),%edx
  100a8f:	c1 ea 10             	shr    $0x10,%edx
  100a92:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100a96:	89 d3                	mov    %edx,%ebx
  100a98:	8d 90 40 07 00 00    	lea    0x740(%eax),%edx
  100a9e:	66 89 5c ca 06       	mov    %bx,0x6(%edx,%ecx,8)
  100aa3:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100aa7:	8d 90 40 07 00 00    	lea    0x740(%eax),%edx
  100aad:	0f b7 5d f0          	movzwl -0x10(%ebp),%ebx
  100ab1:	66 89 5c ca 02       	mov    %bx,0x2(%edx,%ecx,8)
  100ab6:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100aba:	8d 90 40 07 00 00    	lea    0x740(%eax),%edx
  100ac0:	0f b6 5c ca 04       	movzbl 0x4(%edx,%ecx,8),%ebx
  100ac5:	83 e3 e0             	and    $0xffffffe0,%ebx
  100ac8:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  100acc:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100ad0:	8d 90 40 07 00 00    	lea    0x740(%eax),%edx
  100ad6:	0f b6 5c ca 04       	movzbl 0x4(%edx,%ecx,8),%ebx
  100adb:	83 e3 1f             	and    $0x1f,%ebx
  100ade:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  100ae2:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
  100ae6:	74 07                	je     100aef <set_gatedesc+0x9b>
  100ae8:	bb 0f 00 00 00       	mov    $0xf,%ebx
  100aed:	eb 05                	jmp    100af4 <set_gatedesc+0xa0>
  100aef:	bb 0e 00 00 00       	mov    $0xe,%ebx
  100af4:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100af8:	8d 90 40 07 00 00    	lea    0x740(%eax),%edx
  100afe:	89 de                	mov    %ebx,%esi
  100b00:	83 e6 0f             	and    $0xf,%esi
  100b03:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  100b08:	83 e3 f0             	and    $0xfffffff0,%ebx
  100b0b:	09 f3                	or     %esi,%ebx
  100b0d:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  100b11:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100b15:	8d 90 40 07 00 00    	lea    0x740(%eax),%edx
  100b1b:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  100b20:	83 e3 ef             	and    $0xffffffef,%ebx
  100b23:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  100b27:	0f b6 4d f4          	movzbl -0xc(%ebp),%ecx
  100b2b:	0f b6 55 ec          	movzbl -0x14(%ebp),%edx
  100b2f:	83 e2 03             	and    $0x3,%edx
  100b32:	89 d3                	mov    %edx,%ebx
  100b34:	8d 90 40 07 00 00    	lea    0x740(%eax),%edx
  100b3a:	83 e3 03             	and    $0x3,%ebx
  100b3d:	89 de                	mov    %ebx,%esi
  100b3f:	c1 e6 05             	shl    $0x5,%esi
  100b42:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  100b47:	83 e3 9f             	and    $0xffffff9f,%ebx
  100b4a:	09 f3                	or     %esi,%ebx
  100b4c:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  100b50:	0f b6 55 f4          	movzbl -0xc(%ebp),%edx
  100b54:	8d 80 40 07 00 00    	lea    0x740(%eax),%eax
  100b5a:	0f b6 4c d0 05       	movzbl 0x5(%eax,%edx,8),%ecx
  100b5f:	83 c9 80             	or     $0xffffff80,%ecx
  100b62:	88 4c d0 05          	mov    %cl,0x5(%eax,%edx,8)
  100b66:	90                   	nop
  100b67:	83 c4 0c             	add    $0xc,%esp
  100b6a:	5b                   	pop    %ebx
  100b6b:	5e                   	pop    %esi
  100b6c:	5d                   	pop    %ebp
  100b6d:	c3                   	ret    

00100b6e <init_pic>:
  100b6e:	55                   	push   %ebp
  100b6f:	89 e5                	mov    %esp,%ebp
  100b71:	83 ec 10             	sub    $0x10,%esp
  100b74:	e8 aa 05 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100b79:	05 a7 1d 00 00       	add    $0x1da7,%eax
  100b7e:	6a 21                	push   $0x21
  100b80:	e8 97 fe ff ff       	call   100a1c <inb>
  100b85:	83 c4 04             	add    $0x4,%esp
  100b88:	88 45 ff             	mov    %al,-0x1(%ebp)
  100b8b:	68 a1 00 00 00       	push   $0xa1
  100b90:	e8 87 fe ff ff       	call   100a1c <inb>
  100b95:	83 c4 04             	add    $0x4,%esp
  100b98:	88 45 fe             	mov    %al,-0x2(%ebp)
  100b9b:	6a 11                	push   $0x11
  100b9d:	6a 20                	push   $0x20
  100b9f:	e8 4f fe ff ff       	call   1009f3 <outb>
  100ba4:	83 c4 08             	add    $0x8,%esp
  100ba7:	6a 11                	push   $0x11
  100ba9:	68 a0 00 00 00       	push   $0xa0
  100bae:	e8 40 fe ff ff       	call   1009f3 <outb>
  100bb3:	83 c4 08             	add    $0x8,%esp
  100bb6:	6a 20                	push   $0x20
  100bb8:	6a 21                	push   $0x21
  100bba:	e8 34 fe ff ff       	call   1009f3 <outb>
  100bbf:	83 c4 08             	add    $0x8,%esp
  100bc2:	6a 28                	push   $0x28
  100bc4:	68 a1 00 00 00       	push   $0xa1
  100bc9:	e8 25 fe ff ff       	call   1009f3 <outb>
  100bce:	83 c4 08             	add    $0x8,%esp
  100bd1:	6a 04                	push   $0x4
  100bd3:	6a 21                	push   $0x21
  100bd5:	e8 19 fe ff ff       	call   1009f3 <outb>
  100bda:	83 c4 08             	add    $0x8,%esp
  100bdd:	6a 02                	push   $0x2
  100bdf:	68 a1 00 00 00       	push   $0xa1
  100be4:	e8 0a fe ff ff       	call   1009f3 <outb>
  100be9:	83 c4 08             	add    $0x8,%esp
  100bec:	6a 01                	push   $0x1
  100bee:	6a 21                	push   $0x21
  100bf0:	e8 fe fd ff ff       	call   1009f3 <outb>
  100bf5:	83 c4 08             	add    $0x8,%esp
  100bf8:	6a 01                	push   $0x1
  100bfa:	68 a1 00 00 00       	push   $0xa1
  100bff:	e8 ef fd ff ff       	call   1009f3 <outb>
  100c04:	83 c4 08             	add    $0x8,%esp
  100c07:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  100c0b:	50                   	push   %eax
  100c0c:	6a 21                	push   $0x21
  100c0e:	e8 e0 fd ff ff       	call   1009f3 <outb>
  100c13:	83 c4 08             	add    $0x8,%esp
  100c16:	0f b6 45 fe          	movzbl -0x2(%ebp),%eax
  100c1a:	50                   	push   %eax
  100c1b:	68 a1 00 00 00       	push   $0xa1
  100c20:	e8 ce fd ff ff       	call   1009f3 <outb>
  100c25:	83 c4 08             	add    $0x8,%esp
  100c28:	90                   	nop
  100c29:	c9                   	leave  
  100c2a:	c3                   	ret    

00100c2b <init_idt>:
  100c2b:	55                   	push   %ebp
  100c2c:	89 e5                	mov    %esp,%ebp
  100c2e:	53                   	push   %ebx
  100c2f:	83 ec 14             	sub    $0x14,%esp
  100c32:	e8 e8 04 00 00       	call   10111f <__x86.get_pc_thunk.bx>
  100c37:	81 c3 e9 1c 00 00    	add    $0x1ce9,%ebx
  100c3d:	e8 2c ff ff ff       	call   100b6e <init_pic>
  100c42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c49:	eb 26                	jmp    100c71 <init_idt+0x46>
  100c4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c4e:	8b 84 83 20 00 00 00 	mov    0x20(%ebx,%eax,4),%eax
  100c55:	89 c2                	mov    %eax,%edx
  100c57:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c5a:	0f b6 c0             	movzbl %al,%eax
  100c5d:	6a 00                	push   $0x0
  100c5f:	6a 00                	push   $0x0
  100c61:	6a 08                	push   $0x8
  100c63:	52                   	push   %edx
  100c64:	50                   	push   %eax
  100c65:	e8 ea fd ff ff       	call   100a54 <set_gatedesc>
  100c6a:	83 c4 14             	add    $0x14,%esp
  100c6d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c71:	83 7d f4 2f          	cmpl   $0x2f,-0xc(%ebp)
  100c75:	76 d4                	jbe    100c4b <init_idt+0x20>
  100c77:	8d 83 40 0f 00 00    	lea    0xf40(%ebx),%eax
  100c7d:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
  100c82:	8d 83 40 07 00 00    	lea    0x740(%ebx),%eax
  100c88:	89 c2                	mov    %eax,%edx
  100c8a:	8d 83 40 0f 00 00    	lea    0xf40(%ebx),%eax
  100c90:	89 50 02             	mov    %edx,0x2(%eax)
  100c93:	8d 83 40 0f 00 00    	lea    0xf40(%ebx),%eax
  100c99:	83 ec 0c             	sub    $0xc,%esp
  100c9c:	50                   	push   %eax
  100c9d:	e8 b0 02 00 00       	call   100f52 <lidtr>
  100ca2:	83 c4 10             	add    $0x10,%esp
  100ca5:	e8 99 fd ff ff       	call   100a43 <sti>
  100caa:	90                   	nop
  100cab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100cae:	c9                   	leave  
  100caf:	c3                   	ret    

00100cb0 <outb>:
  100cb0:	55                   	push   %ebp
  100cb1:	89 e5                	mov    %esp,%ebp
  100cb3:	83 ec 08             	sub    $0x8,%esp
  100cb6:	e8 68 04 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100cbb:	05 65 1c 00 00       	add    $0x1c65,%eax
  100cc0:	8b 55 08             	mov    0x8(%ebp),%edx
  100cc3:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cc6:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100cca:	88 45 f8             	mov    %al,-0x8(%ebp)
  100ccd:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100cd1:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100cd5:	ee                   	out    %al,(%dx)
  100cd6:	90                   	nop
  100cd7:	c9                   	leave  
  100cd8:	c3                   	ret    

00100cd9 <piceoi>:
  100cd9:	55                   	push   %ebp
  100cda:	89 e5                	mov    %esp,%ebp
  100cdc:	e8 42 04 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100ce1:	05 3f 1c 00 00       	add    $0x1c3f,%eax
  100ce6:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  100cea:	76 0f                	jbe    100cfb <piceoi+0x22>
  100cec:	6a 20                	push   $0x20
  100cee:	68 a0 00 00 00       	push   $0xa0
  100cf3:	e8 b8 ff ff ff       	call   100cb0 <outb>
  100cf8:	83 c4 08             	add    $0x8,%esp
  100cfb:	6a 20                	push   $0x20
  100cfd:	6a 20                	push   $0x20
  100cff:	e8 ac ff ff ff       	call   100cb0 <outb>
  100d04:	83 c4 08             	add    $0x8,%esp
  100d07:	90                   	nop
  100d08:	c9                   	leave  
  100d09:	c3                   	ret    

00100d0a <trap>:
  100d0a:	55                   	push   %ebp
  100d0b:	89 e5                	mov    %esp,%ebp
  100d0d:	53                   	push   %ebx
  100d0e:	83 ec 14             	sub    $0x14,%esp
  100d11:	e8 09 04 00 00       	call   10111f <__x86.get_pc_thunk.bx>
  100d16:	81 c3 0a 1c 00 00    	add    $0x1c0a,%ebx
  100d1c:	8b 45 08             	mov    0x8(%ebp),%eax
  100d1f:	8b 40 30             	mov    0x30(%eax),%eax
  100d22:	83 f8 1f             	cmp    $0x1f,%eax
  100d25:	76 4a                	jbe    100d71 <trap+0x67>
  100d27:	8b 45 08             	mov    0x8(%ebp),%eax
  100d2a:	8b 40 30             	mov    0x30(%eax),%eax
  100d2d:	83 e8 20             	sub    $0x20,%eax
  100d30:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d33:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d36:	85 c0                	test   %eax,%eax
  100d38:	75 11                	jne    100d4b <trap+0x41>
  100d3a:	8b 83 54 4f 00 00    	mov    0x4f54(%ebx),%eax
  100d40:	83 c0 01             	add    $0x1,%eax
  100d43:	89 83 54 4f 00 00    	mov    %eax,0x4f54(%ebx)
  100d49:	eb 16                	jmp    100d61 <trap+0x57>
  100d4b:	83 ec 08             	sub    $0x8,%esp
  100d4e:	ff 75 f4             	pushl  -0xc(%ebp)
  100d51:	8d 83 f8 f6 ff ff    	lea    -0x908(%ebx),%eax
  100d57:	50                   	push   %eax
  100d58:	e8 85 f8 ff ff       	call   1005e2 <cprintf>
  100d5d:	83 c4 10             	add    $0x10,%esp
  100d60:	90                   	nop
  100d61:	83 ec 0c             	sub    $0xc,%esp
  100d64:	ff 75 f4             	pushl  -0xc(%ebp)
  100d67:	e8 6d ff ff ff       	call   100cd9 <piceoi>
  100d6c:	83 c4 10             	add    $0x10,%esp
  100d6f:	eb 2c                	jmp    100d9d <trap+0x93>
  100d71:	8b 45 08             	mov    0x8(%ebp),%eax
  100d74:	8b 40 30             	mov    0x30(%eax),%eax
  100d77:	83 ec 08             	sub    $0x8,%esp
  100d7a:	50                   	push   %eax
  100d7b:	8d 83 f8 f6 ff ff    	lea    -0x908(%ebx),%eax
  100d81:	50                   	push   %eax
  100d82:	e8 5b f8 ff ff       	call   1005e2 <cprintf>
  100d87:	83 c4 10             	add    $0x10,%esp
  100d8a:	83 ec 0c             	sub    $0xc,%esp
  100d8d:	8d 83 11 f7 ff ff    	lea    -0x8ef(%ebx),%eax
  100d93:	50                   	push   %eax
  100d94:	e8 24 f8 ff ff       	call   1005bd <panic>
  100d99:	83 c4 10             	add    $0x10,%esp
  100d9c:	90                   	nop
  100d9d:	90                   	nop
  100d9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100da1:	c9                   	leave  
  100da2:	c3                   	ret    

00100da3 <outb>:
  100da3:	55                   	push   %ebp
  100da4:	89 e5                	mov    %esp,%ebp
  100da6:	83 ec 08             	sub    $0x8,%esp
  100da9:	e8 75 03 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100dae:	05 72 1b 00 00       	add    $0x1b72,%eax
  100db3:	8b 55 08             	mov    0x8(%ebp),%edx
  100db6:	8b 45 0c             	mov    0xc(%ebp),%eax
  100db9:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
  100dbd:	88 45 f8             	mov    %al,-0x8(%ebp)
  100dc0:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  100dc4:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  100dc8:	ee                   	out    %al,(%dx)
  100dc9:	90                   	nop
  100dca:	c9                   	leave  
  100dcb:	c3                   	ret    

00100dcc <init_pit>:
  100dcc:	55                   	push   %ebp
  100dcd:	89 e5                	mov    %esp,%ebp
  100dcf:	e8 4f 03 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100dd4:	05 4c 1b 00 00       	add    $0x1b4c,%eax
  100dd9:	6a 34                	push   $0x34
  100ddb:	6a 43                	push   $0x43
  100ddd:	e8 c1 ff ff ff       	call   100da3 <outb>
  100de2:	83 c4 08             	add    $0x8,%esp
  100de5:	68 9c 00 00 00       	push   $0x9c
  100dea:	6a 40                	push   $0x40
  100dec:	e8 b2 ff ff ff       	call   100da3 <outb>
  100df1:	83 c4 08             	add    $0x8,%esp
  100df4:	6a 2e                	push   $0x2e
  100df6:	6a 40                	push   $0x40
  100df8:	e8 a6 ff ff ff       	call   100da3 <outb>
  100dfd:	83 c4 08             	add    $0x8,%esp
  100e00:	90                   	nop
  100e01:	c9                   	leave  
  100e02:	c3                   	ret    

00100e03 <kfree>:
  100e03:	55                   	push   %ebp
  100e04:	89 e5                	mov    %esp,%ebp
  100e06:	53                   	push   %ebx
  100e07:	83 ec 14             	sub    $0x14,%esp
  100e0a:	e8 10 03 00 00       	call   10111f <__x86.get_pc_thunk.bx>
  100e0f:	81 c3 11 1b 00 00    	add    $0x1b11,%ebx
  100e15:	8b 45 08             	mov    0x8(%ebp),%eax
  100e18:	25 ff 0f 00 00       	and    $0xfff,%eax
  100e1d:	85 c0                	test   %eax,%eax
  100e1f:	74 12                	je     100e33 <kfree+0x30>
  100e21:	83 ec 0c             	sub    $0xc,%esp
  100e24:	8d 83 16 f7 ff ff    	lea    -0x8ea(%ebx),%eax
  100e2a:	50                   	push   %eax
  100e2b:	e8 8d f7 ff ff       	call   1005bd <panic>
  100e30:	83 c4 10             	add    $0x10,%esp
  100e33:	8b 45 08             	mov    0x8(%ebp),%eax
  100e36:	83 ec 04             	sub    $0x4,%esp
  100e39:	68 00 10 00 00       	push   $0x1000
  100e3e:	6a 00                	push   $0x0
  100e40:	50                   	push   %eax
  100e41:	e8 f9 f1 ff ff       	call   10003f <memset>
  100e46:	83 c4 10             	add    $0x10,%esp
  100e49:	8b 45 08             	mov    0x8(%ebp),%eax
  100e4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100e4f:	8d 83 48 0f 00 00    	lea    0xf48(%ebx),%eax
  100e55:	8b 10                	mov    (%eax),%edx
  100e57:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e5a:	89 10                	mov    %edx,(%eax)
  100e5c:	8d 83 48 0f 00 00    	lea    0xf48(%ebx),%eax
  100e62:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e65:	89 10                	mov    %edx,(%eax)
  100e67:	90                   	nop
  100e68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100e6b:	c9                   	leave  
  100e6c:	c3                   	ret    

00100e6d <kalloc>:
  100e6d:	55                   	push   %ebp
  100e6e:	89 e5                	mov    %esp,%ebp
  100e70:	83 ec 10             	sub    $0x10,%esp
  100e73:	e8 ab 02 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100e78:	05 a8 1a 00 00       	add    $0x1aa8,%eax
  100e7d:	8d 90 48 0f 00 00    	lea    0xf48(%eax),%edx
  100e83:	8b 12                	mov    (%edx),%edx
  100e85:	89 55 fc             	mov    %edx,-0x4(%ebp)
  100e88:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  100e8c:	74 0d                	je     100e9b <kalloc+0x2e>
  100e8e:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100e91:	8b 12                	mov    (%edx),%edx
  100e93:	8d 80 48 0f 00 00    	lea    0xf48(%eax),%eax
  100e99:	89 10                	mov    %edx,(%eax)
  100e9b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e9e:	c9                   	leave  
  100e9f:	c3                   	ret    

00100ea0 <freerange>:
  100ea0:	55                   	push   %ebp
  100ea1:	89 e5                	mov    %esp,%ebp
  100ea3:	83 ec 18             	sub    $0x18,%esp
  100ea6:	e8 78 02 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100eab:	05 75 1a 00 00       	add    $0x1a75,%eax
  100eb0:	8b 45 08             	mov    0x8(%ebp),%eax
  100eb3:	05 ff 0f 00 00       	add    $0xfff,%eax
  100eb8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100ebd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ec0:	eb 15                	jmp    100ed7 <freerange+0x37>
  100ec2:	83 ec 0c             	sub    $0xc,%esp
  100ec5:	ff 75 f4             	pushl  -0xc(%ebp)
  100ec8:	e8 36 ff ff ff       	call   100e03 <kfree>
  100ecd:	83 c4 10             	add    $0x10,%esp
  100ed0:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
  100ed7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100eda:	05 00 10 00 00       	add    $0x1000,%eax
  100edf:	39 45 0c             	cmp    %eax,0xc(%ebp)
  100ee2:	73 de                	jae    100ec2 <freerange+0x22>
  100ee4:	90                   	nop
  100ee5:	c9                   	leave  
  100ee6:	c3                   	ret    

00100ee7 <kinit>:
  100ee7:	55                   	push   %ebp
  100ee8:	89 e5                	mov    %esp,%ebp
  100eea:	53                   	push   %ebx
  100eeb:	83 ec 04             	sub    $0x4,%esp
  100eee:	e8 30 02 00 00       	call   101123 <__x86.get_pc_thunk.ax>
  100ef3:	05 2d 1a 00 00       	add    $0x1a2d,%eax
  100ef8:	8d 90 58 4f 00 00    	lea    0x4f58(%eax),%edx
  100efe:	8b 12                	mov    (%edx),%edx
  100f00:	83 ec 08             	sub    $0x8,%esp
  100f03:	52                   	push   %edx
  100f04:	8d 90 1c f7 ff ff    	lea    -0x8e4(%eax),%edx
  100f0a:	52                   	push   %edx
  100f0b:	89 c3                	mov    %eax,%ebx
  100f0d:	e8 d0 f6 ff ff       	call   1005e2 <cprintf>
  100f12:	83 c4 10             	add    $0x10,%esp
  100f15:	90                   	nop
  100f16:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f19:	c9                   	leave  
  100f1a:	c3                   	ret    
  100f1b:	90                   	nop

00100f1c <multiboot>:
  100f1c:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  100f22:	00 00                	add    %al,(%eax)
  100f24:	fb                   	sti    
  100f25:	4f                   	dec    %edi
  100f26:	52                   	push   %edx
  100f27:	e4                   	.byte 0xe4

00100f28 <_start>:
  100f28:	bc 70 78 10 00       	mov    $0x107870,%esp
  100f2d:	e8 ce f0 ff ff       	call   100000 <main>
  100f32:	fa                   	cli    

00100f33 <spin>:
  100f33:	eb fe                	jmp    100f33 <spin>

00100f35 <lgdtr>:
  100f35:	8b 44 24 04          	mov    0x4(%esp),%eax
  100f39:	0f 01 10             	lgdtl  (%eax)
  100f3c:	66 b8 10 00          	mov    $0x10,%ax
  100f40:	8e d8                	mov    %eax,%ds
  100f42:	8e c0                	mov    %eax,%es
  100f44:	8e e0                	mov    %eax,%fs
  100f46:	8e e8                	mov    %eax,%gs
  100f48:	8e d0                	mov    %eax,%ss
  100f4a:	ea 51 0f 10 00 08 00 	ljmp   $0x8,$0x100f51

00100f51 <load>:
  100f51:	c3                   	ret    

00100f52 <lidtr>:
  100f52:	8b 44 24 04          	mov    0x4(%esp),%eax
  100f56:	0f 01 18             	lidtl  (%eax)
  100f59:	c3                   	ret    

00100f5a <vector0>:
  100f5a:	6a 00                	push   $0x0
  100f5c:	6a 00                	push   $0x0
  100f5e:	e9 99 01 00 00       	jmp    1010fc <alltraps>

00100f63 <vector1>:
  100f63:	6a 00                	push   $0x0
  100f65:	6a 01                	push   $0x1
  100f67:	e9 90 01 00 00       	jmp    1010fc <alltraps>

00100f6c <vector2>:
  100f6c:	6a 00                	push   $0x0
  100f6e:	6a 02                	push   $0x2
  100f70:	e9 87 01 00 00       	jmp    1010fc <alltraps>

00100f75 <vector3>:
  100f75:	6a 00                	push   $0x0
  100f77:	6a 03                	push   $0x3
  100f79:	e9 7e 01 00 00       	jmp    1010fc <alltraps>

00100f7e <vector4>:
  100f7e:	6a 00                	push   $0x0
  100f80:	6a 04                	push   $0x4
  100f82:	e9 75 01 00 00       	jmp    1010fc <alltraps>

00100f87 <vector5>:
  100f87:	6a 00                	push   $0x0
  100f89:	6a 05                	push   $0x5
  100f8b:	e9 6c 01 00 00       	jmp    1010fc <alltraps>

00100f90 <vector6>:
  100f90:	6a 00                	push   $0x0
  100f92:	6a 06                	push   $0x6
  100f94:	e9 63 01 00 00       	jmp    1010fc <alltraps>

00100f99 <vector7>:
  100f99:	6a 00                	push   $0x0
  100f9b:	6a 07                	push   $0x7
  100f9d:	e9 5a 01 00 00       	jmp    1010fc <alltraps>

00100fa2 <vector8>:
  100fa2:	6a 08                	push   $0x8
  100fa4:	e9 53 01 00 00       	jmp    1010fc <alltraps>

00100fa9 <vector9>:
  100fa9:	6a 00                	push   $0x0
  100fab:	6a 09                	push   $0x9
  100fad:	e9 4a 01 00 00       	jmp    1010fc <alltraps>

00100fb2 <vector10>:
  100fb2:	6a 0a                	push   $0xa
  100fb4:	e9 43 01 00 00       	jmp    1010fc <alltraps>

00100fb9 <vector11>:
  100fb9:	6a 0b                	push   $0xb
  100fbb:	e9 3c 01 00 00       	jmp    1010fc <alltraps>

00100fc0 <vector12>:
  100fc0:	6a 0c                	push   $0xc
  100fc2:	e9 35 01 00 00       	jmp    1010fc <alltraps>

00100fc7 <vector13>:
  100fc7:	6a 0d                	push   $0xd
  100fc9:	e9 2e 01 00 00       	jmp    1010fc <alltraps>

00100fce <vector14>:
  100fce:	6a 0e                	push   $0xe
  100fd0:	e9 27 01 00 00       	jmp    1010fc <alltraps>

00100fd5 <vector15>:
  100fd5:	6a 00                	push   $0x0
  100fd7:	6a 0f                	push   $0xf
  100fd9:	e9 1e 01 00 00       	jmp    1010fc <alltraps>

00100fde <vector16>:
  100fde:	6a 00                	push   $0x0
  100fe0:	6a 10                	push   $0x10
  100fe2:	e9 15 01 00 00       	jmp    1010fc <alltraps>

00100fe7 <vector17>:
  100fe7:	6a 11                	push   $0x11
  100fe9:	e9 0e 01 00 00       	jmp    1010fc <alltraps>

00100fee <vector18>:
  100fee:	6a 00                	push   $0x0
  100ff0:	6a 12                	push   $0x12
  100ff2:	e9 05 01 00 00       	jmp    1010fc <alltraps>

00100ff7 <vector19>:
  100ff7:	6a 00                	push   $0x0
  100ff9:	6a 13                	push   $0x13
  100ffb:	e9 fc 00 00 00       	jmp    1010fc <alltraps>

00101000 <vector20>:
  101000:	6a 00                	push   $0x0
  101002:	6a 14                	push   $0x14
  101004:	e9 f3 00 00 00       	jmp    1010fc <alltraps>

00101009 <vector21>:
  101009:	6a 00                	push   $0x0
  10100b:	6a 15                	push   $0x15
  10100d:	e9 ea 00 00 00       	jmp    1010fc <alltraps>

00101012 <vector22>:
  101012:	6a 00                	push   $0x0
  101014:	6a 16                	push   $0x16
  101016:	e9 e1 00 00 00       	jmp    1010fc <alltraps>

0010101b <vector23>:
  10101b:	6a 00                	push   $0x0
  10101d:	6a 17                	push   $0x17
  10101f:	e9 d8 00 00 00       	jmp    1010fc <alltraps>

00101024 <vector24>:
  101024:	6a 00                	push   $0x0
  101026:	6a 18                	push   $0x18
  101028:	e9 cf 00 00 00       	jmp    1010fc <alltraps>

0010102d <vector25>:
  10102d:	6a 00                	push   $0x0
  10102f:	6a 19                	push   $0x19
  101031:	e9 c6 00 00 00       	jmp    1010fc <alltraps>

00101036 <vector26>:
  101036:	6a 00                	push   $0x0
  101038:	6a 1a                	push   $0x1a
  10103a:	e9 bd 00 00 00       	jmp    1010fc <alltraps>

0010103f <vector27>:
  10103f:	6a 00                	push   $0x0
  101041:	6a 1b                	push   $0x1b
  101043:	e9 b4 00 00 00       	jmp    1010fc <alltraps>

00101048 <vector28>:
  101048:	6a 00                	push   $0x0
  10104a:	6a 1c                	push   $0x1c
  10104c:	e9 ab 00 00 00       	jmp    1010fc <alltraps>

00101051 <vector29>:
  101051:	6a 00                	push   $0x0
  101053:	6a 1d                	push   $0x1d
  101055:	e9 a2 00 00 00       	jmp    1010fc <alltraps>

0010105a <vector30>:
  10105a:	6a 00                	push   $0x0
  10105c:	6a 1e                	push   $0x1e
  10105e:	e9 99 00 00 00       	jmp    1010fc <alltraps>

00101063 <vector31>:
  101063:	6a 00                	push   $0x0
  101065:	6a 1f                	push   $0x1f
  101067:	e9 90 00 00 00       	jmp    1010fc <alltraps>

0010106c <vector32>:
  10106c:	6a 00                	push   $0x0
  10106e:	6a 20                	push   $0x20
  101070:	e9 87 00 00 00       	jmp    1010fc <alltraps>

00101075 <vector33>:
  101075:	6a 00                	push   $0x0
  101077:	6a 21                	push   $0x21
  101079:	e9 7e 00 00 00       	jmp    1010fc <alltraps>

0010107e <vector34>:
  10107e:	6a 00                	push   $0x0
  101080:	6a 22                	push   $0x22
  101082:	e9 75 00 00 00       	jmp    1010fc <alltraps>

00101087 <vector35>:
  101087:	6a 00                	push   $0x0
  101089:	6a 23                	push   $0x23
  10108b:	e9 6c 00 00 00       	jmp    1010fc <alltraps>

00101090 <vector36>:
  101090:	6a 00                	push   $0x0
  101092:	6a 24                	push   $0x24
  101094:	e9 63 00 00 00       	jmp    1010fc <alltraps>

00101099 <vector37>:
  101099:	6a 00                	push   $0x0
  10109b:	6a 25                	push   $0x25
  10109d:	e9 5a 00 00 00       	jmp    1010fc <alltraps>

001010a2 <vector38>:
  1010a2:	6a 00                	push   $0x0
  1010a4:	6a 26                	push   $0x26
  1010a6:	e9 51 00 00 00       	jmp    1010fc <alltraps>

001010ab <vector39>:
  1010ab:	6a 00                	push   $0x0
  1010ad:	6a 27                	push   $0x27
  1010af:	e9 48 00 00 00       	jmp    1010fc <alltraps>

001010b4 <vector40>:
  1010b4:	6a 00                	push   $0x0
  1010b6:	6a 28                	push   $0x28
  1010b8:	e9 3f 00 00 00       	jmp    1010fc <alltraps>

001010bd <vector41>:
  1010bd:	6a 00                	push   $0x0
  1010bf:	6a 29                	push   $0x29
  1010c1:	e9 36 00 00 00       	jmp    1010fc <alltraps>

001010c6 <vector42>:
  1010c6:	6a 00                	push   $0x0
  1010c8:	6a 2a                	push   $0x2a
  1010ca:	e9 2d 00 00 00       	jmp    1010fc <alltraps>

001010cf <vector43>:
  1010cf:	6a 00                	push   $0x0
  1010d1:	6a 2b                	push   $0x2b
  1010d3:	e9 24 00 00 00       	jmp    1010fc <alltraps>

001010d8 <vector44>:
  1010d8:	6a 00                	push   $0x0
  1010da:	6a 2c                	push   $0x2c
  1010dc:	e9 1b 00 00 00       	jmp    1010fc <alltraps>

001010e1 <vector45>:
  1010e1:	6a 00                	push   $0x0
  1010e3:	6a 2d                	push   $0x2d
  1010e5:	e9 12 00 00 00       	jmp    1010fc <alltraps>

001010ea <vector46>:
  1010ea:	6a 00                	push   $0x0
  1010ec:	6a 2e                	push   $0x2e
  1010ee:	e9 09 00 00 00       	jmp    1010fc <alltraps>

001010f3 <vector47>:
  1010f3:	6a 00                	push   $0x0
  1010f5:	6a 2f                	push   $0x2f
  1010f7:	e9 00 00 00 00       	jmp    1010fc <alltraps>

001010fc <alltraps>:
  1010fc:	1e                   	push   %ds
  1010fd:	06                   	push   %es
  1010fe:	0f a0                	push   %fs
  101100:	0f a8                	push   %gs
  101102:	60                   	pusha  
  101103:	66 b8 10 00          	mov    $0x10,%ax
  101107:	8e d8                	mov    %eax,%ds
  101109:	8e c0                	mov    %eax,%es
  10110b:	54                   	push   %esp
  10110c:	e8 f9 fb ff ff       	call   100d0a <trap>
  101111:	83 c4 04             	add    $0x4,%esp

00101114 <trapret>:
  101114:	61                   	popa   
  101115:	0f a9                	pop    %gs
  101117:	0f a1                	pop    %fs
  101119:	07                   	pop    %es
  10111a:	1f                   	pop    %ds
  10111b:	83 c4 08             	add    $0x8,%esp
  10111e:	cf                   	iret   

Disassembly of section .text.__x86.get_pc_thunk.bx:

0010111f <__x86.get_pc_thunk.bx>:
  10111f:	8b 1c 24             	mov    (%esp),%ebx
  101122:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

00101123 <__x86.get_pc_thunk.ax>:
  101123:	8b 04 24             	mov    (%esp),%eax
  101126:	c3                   	ret    
