elivered-To: zero@asac.co
Received: by 10.140.102.210 with SMTP id w76csp123259qge;
        Thu, 30 Apr 2015 23:18:05 -0700 (PDT)
X-Received: by 10.70.62.97 with SMTP id x1mr14793597pdr.41.1430461084988;
        Thu, 30 Apr 2015 23:18:04 -0700 (PDT)
Return-Path: <fulldisclosure-bounces@seclists.org>
Received: from hb.insecure.org (nmap.org. [2600:3c01::f03c:91ff:fe70:d085])
        by mx.google.com with ESMTP id du9si6690958pdb.80.2015.04.30.23.18.04
        for <zero@asac.co>;
        Thu, 30 Apr 2015 23:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of fulldisclosure-bounces@seclists.org designates 2600:3c01::f03c:91ff:fe70:d085 as permitted sender) client-ip=2600:3c01::f03c:91ff:fe70:d085;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of fulldisclosure-bounces@seclists.org designates 2600:3c01::f03c:91ff:fe70:d085 as permitted sender) smtp.mail=fulldisclosure-bounces@seclists.org
Received: from nmap.org (localhost [IPv6:::1])
	by hb.insecure.org (Postfix) with ESMTP id C005C746E;
	Fri,  1 May 2015 06:07:34 +0000 (UTC)
X-Original-To: fulldisclosure@seclists.org
Delivered-To: fulldisclosure@seclists.org
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by hb.insecure.org (Postfix) with ESMTP id 2691C7379
	for <fulldisclosure@seclists.org>; Fri,  1 May 2015 03:26:47 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcsf-fulldisclosure@m.gmane.org>) id 1Yo1Zq-0000Lw-AJ
	for fulldisclosure@seclists.org; Fri, 01 May 2015 05:25:22 +0200
Received: from 50-197-143-225-static.hfc.comcastbusiness.net ([50.197.143.225])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <fulldisclosure@seclists.org>; Fri, 01 May 2015 05:25:22 +0200
Received: from taviso by 50-197-143-225-static.hfc.comcastbusiness.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <fulldisclosure@seclists.org>; Fri, 01 May 2015 05:25:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: fulldisclosure@seclists.org
From: Tavis Ormandy <taviso@cmpxchg8b.com>
Date: Thu, 30 Apr 2015 20:25:07 -0700
Lines: 15
Message-ID: <mpro.nnnitv01yjurg0kca.taviso@cmpxchg8b.com>
References: <CABN49-ZGn9Cb2RiPLaimX-qRJU13mrsykUd0ti3O9Yguz6Bt-Q@mail.gmail.com>
	<CABN49-Y-Nd2+GuOMe-Q5z0jLVyvBt_ws8of4krX1gXdG=DD6+Q@mail.gmail.com>
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 50-197-143-225-static.hfc.comcastbusiness.net
User-Agent: Messenger-Pro/2.72.0.3902 (Qt/4.8.6) (Linux-x86_64)
X-Mailman-Approved-At: Fri, 01 May 2015 01:07:29 -0500
Subject: Re: [FD] #WorldPenguinDay or this cant be right, can it?
X-BeenThere: fulldisclosure@seclists.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Improving network security through full disclosure
	<fulldisclosure.seclists.org>
List-Unsubscribe: <https://nmap.org/mailman/options/fulldisclosure>,
	<mailto:fulldisclosure-request@seclists.org?subject=unsubscribe>
List-Post: <mailto:fulldisclosure@seclists.org>
List-Help: <mailto:fulldisclosure-request@seclists.org?subject=help>
List-Subscribe: <https://nmap.org/mailman/listinfo/fulldisclosure>,
	<mailto:fulldisclosure-request@seclists.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: fulldisclosure-bounces@seclists.org
Sender: "Fulldisclosure" <fulldisclosure-bounces@seclists.org>

PIN <zero@asac.co> wrote:

> address space layout of a linux process.

It sounds like you're asking "If I can learn an address, have I defeated
ASLR", and the answer is usually yes. It depends on the circumstances of
course, but leaking any address to an attacker would usually be considered a
bug and renders ASLR essentially useless.

For example, if you can find some JavaScript that tells you the address of
an object on the heap or the base address of a module, that would be
considered a security bug. You don't usually run untrusted python, so
python's id() isn't a bug - but you do run untrusted JavaScript.

Tavis.


_______________________________________________
Sent through the Full Disclosure mailing list
https://nmap.org/mailman/listinfo/fulldisclosure
Web Archives & RSS: http://seclists.org/fulldisclosure/

> It sounds like you're asking "If I can learn an address, have I defeated
> ASLR", and the answer is usually yes.

Really? Because leaking a heap address in windows, openbsd, etc doesn't yield a full collapse of all loaded modules randomization given the preconditions; I'm asking that it's not just my box exhibiting this behavior- which is a long story why it must just be mine.

>It depends on the circumstances of
> course, but leaking any address to an attacker would usually be considered a
> bug and renders ASLR essentially useless.

Well, you are somewhat missing the gravity here. If this is generally reproducible, you don't need the address to leak, you just need a series of arithmetic operations to land you at a fixed offset within the target module. no read back requisite.

I wouldn't argue that finding the exact required arguments for arithmetic was not rare however, just that an ASLR "metaprogramming primitive" potentially exists.

> For example, if you can find some JavaScript that tells you the address of
> an object on the heap or the base address of a module, that would be
> considered a security bug.

I'm fairly positive that no ASLR scheme is intended to entirely and totally collapse given a single address that you don't necessarily even need to know. Thus I find it hard to believe this is the case.

>You don't usually run untrusted python, > so
> python's id() isn't a bug - but you do run untrusted JavaScript.

Really? Because your employer does exactly that. The bigger question was the behavior, not python. It seems a practical extension of the spy in the sandbox stuff to potentially grab enough of an address to leverage this in javascript, although code is not yet forthcoming there. However giving the cache line and physical to virtual address scheme mappings, this seems likely.

elivered-To: zero@asac.co
Received: by 10.140.102.210 with SMTP id w76csp299876qge;
        Fri, 1 May 2015 06:51:44 -0700 (PDT)
X-Received: by 10.170.194.9 with SMTP id l9mr7520146yke.28.1430488304658;
        Fri, 01 May 2015 06:51:44 -0700 (PDT)
Return-Path: <taviso@cmpxchg8b.com>
Received: from mail-yh0-x22f.google.com (mail-yh0-x22f.google.com. [2607:f8b0:4002:c01::22f])
        by mx.google.com with ESMTPS id t4si2947999yhb.82.2015.05.01.06.51.44
        for <zero@asac.co>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 May 2015 06:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of taviso@cmpxchg8b.com designates 2607:f8b0:4002:c01::22f as permitted sender) client-ip=2607:f8b0:4002:c01::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of taviso@cmpxchg8b.com designates 2607:f8b0:4002:c01::22f as permitted sender) smtp.mail=taviso@cmpxchg8b.com;
       dkim=pass header.i=@cmpxchg8b.com
Received: by yhcb70 with SMTP id b70so18022521yhc.0
        for <zero@asac.co>; Fri, 01 May 2015 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg8b.com; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=5Cefkjte4sDMaD+71vXax6bhuid7UPZOMFlDArcpIBA=;
        b=Mhaegi/158D5EzIVRHkugK7VNmjKdM0lkNAvtrzsCE0Byp9RUxU3GLjErPis93/3o8
         m5T/XF5grwnow434VyplB1pmhYTdrAjAolK3VWRC+71L/9hn2/89N+dVturhl5dUMrQ6
         VjVQ8y9Jhp4zfXK+PFrZOjynAthOujHXKOz20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=5Cefkjte4sDMaD+71vXax6bhuid7UPZOMFlDArcpIBA=;
        b=DlkEhQkzaw3dd+dMJ674x+Q9GlvJACkCDjiH0J2gSDr0zR83SnfVXyZ3d0T9fX4rd/
         /rDV3V0a9YUy7N0P12Bsw65M1XBWo7YFSEtGVb8RjOXChuVGVNsVJThsR+9rXLZR2OdU
         URhuyonU69b3E+I6JVV7InGs6YUaMLZ7hi0tTh46/4jAMMW6aRtNhcYQIuPTED6SC5V4
         iE8CznGyPIzJQHUitgE70s6ZnefNxWWERqQCHXRH2e+4Vzh6W2lxxI7MBvS8EegHuHu5
         WWhUZKi5Kky1IOTv0IZHvpv5j9HRS9VQ5zHkvEUEvoDcL7z6FbGjB55295RW5awlRZtK
         x00A==
X-Gm-Message-State: ALoCoQkEUGQoud4D8X6F7ttsaNRaP8fiHuwsOZtwazDbvM2vYgkdcLHJi9INOFRGeLvisHmgSSOq
MIME-Version: 1.0
X-Received: by 10.170.220.214 with SMTP id m205mr7687991ykf.13.1430488303931;
 Fri, 01 May 2015 06:51:43 -0700 (PDT)
Received: by 10.13.206.193 with HTTP; Fri, 1 May 2015 06:51:43 -0700 (PDT)
In-Reply-To: <CABN49-aGnjPP6FUK06hauRFLuwZMVr1UwC0GuJc4+da3j5KOsg@mail.gmail.com>
References: <CABN49-ZGn9Cb2RiPLaimX-qRJU13mrsykUd0ti3O9Yguz6Bt-Q@mail.gmail.com>
	<CABN49-Y-Nd2+GuOMe-Q5z0jLVyvBt_ws8of4krX1gXdG=DD6+Q@mail.gmail.com>
	<mpro.nnnitv01yjurg0kca.taviso@cmpxchg8b.com>
	<CABN49-aGnjPP6FUK06hauRFLuwZMVr1UwC0GuJc4+da3j5KOsg@mail.gmail.com>
Date: Fri, 1 May 2015 06:51:43 -0700
Message-ID: <CA+YQQ6VLSFEJ+hcoLD6TumgLmQ=73XNKPmngashnGOhTP6dzpQ@mail.gmail.com>
Subject: Re: [FD] #WorldPenguinDay or this cant be right, can it?
From: Tavis Ormandy <taviso@cmpxchg8b.com>
To: PIN <zero@asac.co>
Cc: "fulldisclosure@seclists.org" <fulldisclosure@seclists.org>
Content-Type: text/plain; charset=UTF-8

On 1 May 2015 at 00:11, PIN <zero@asac.co> wrote:
>> It sounds like you're asking "If I can learn an address, have I defeated
>> ASLR", and the answer is usually yes.
>
> Really? Because leaking a heap address in windows, openbsd, etc doesn't
> yield a full collapse of all loaded modules randomization given the
> preconditions; I'm asking that it's not just my box exhibiting this
> behavior- which is a long story why it must just be mine.

That wasn't what I said.

> Well, you are somewhat missing the gravity here. If this is generally
> reproducible, you don't need the address to leak, you just need a series of
> arithmetic operations to land you at a fixed offset within the target
> module. no read back requisite.

Sure, If code with knowledge of an address is willing to act as an
oracle, then ASLR is not useful. This is really just an indirect (and
unlikely) way of leaking an address though.

> I'm fairly positive that no ASLR scheme is intended to entirely and totally
> collapse given a single address that you don't necessarily even need to
> know. Thus I find it hard to believe this is the case.

Well, if you know in advance which address to leak you can arrange for
it to be a useless one, it would usually have to be MMAP_FIXED and be
sanitized (think KUSER_SHARED_DATA on Windows or the vsyscall page on
Linux) so as not to weaken ASLR.

That isn't usually the case though, so the scheme will usually be defeated.

>>You don't usually run untrusted python, > so
>> python's id() isn't a bug - but you do run untrusted JavaScript.
>
> Really? Because your employer does exactly that.

Creepy. I said "usually".

> The bigger question was the
> behavior, not python. It seems a practical extension of the spy in the
> sandbox stuff to potentially grab enough of an address to leverage this in
> javascript, although code is not yet forthcoming there. However giving the
> cache line and physical to virtual address scheme mappings, this seems
> likely.

Well, good luck.

Tavis.

-- 
-------------------------------------
taviso@cmpxchg8b.com | pgp encrypted mail preferred
-------------------------------------------------------

                                                                                                                                                                                                                                                               
MIME-Version: 1.0
Received: by 10.140.69.178 with HTTP; Fri, 1 May 2015 07:08:40 -0700 (PDT)
X-Originating-IP: [172.56.2.116]
Received: by 10.140.69.178 with HTTP; Fri, 1 May 2015 07:08:40 -0700 (PDT)
In-Reply-To: <CA+YQQ6VLSFEJ+hcoLD6TumgLmQ=73XNKPmngashnGOhTP6dzpQ@mail.gmail.com>
References: <CABN49-ZGn9Cb2RiPLaimX-qRJU13mrsykUd0ti3O9Yguz6Bt-Q@mail.gmail.com>
	<CABN49-Y-Nd2+GuOMe-Q5z0jLVyvBt_ws8of4krX1gXdG=DD6+Q@mail.gmail.com>
	<mpro.nnnitv01yjurg0kca.taviso@cmpxchg8b.com>
	<CABN49-aGnjPP6FUK06hauRFLuwZMVr1UwC0GuJc4+da3j5KOsg@mail.gmail.com>
	<CA+YQQ6VLSFEJ+hcoLD6TumgLmQ=73XNKPmngashnGOhTP6dzpQ@mail.gmail.com>
Date: Fri, 1 May 2015 10:08:40 -0400
Delivered-To: zero@asac.co
Message-ID: <CABN49-aZbiijPxsxLQd88D6OJWSnjW7NtQsUtybcYH7HoQJ=6g@mail.gmail.com>
Subject: Re: [FD] #WorldPenguinDay or this cant be right, can it?
From: PIN <zero@asac.co>
To: Tavis Ormandy <taviso@cmpxchg8b.com>
Cc: fulldisclosure@seclists.org
Content-Type: multipart/alternative; boundary=001a11c03ca0cf1d21051505bfe0

--001a11c03ca0cf1d21051505bfe0
Content-Type: text/plain; charset=UTF-8

> Sure, If code with knowledge of an address is willing to act as an
> oracle, then ASLR is not useful. This is really just an indirect (and
> unlikely) way of leaking an address though.

We'll but keep in mind here that the knowledge we are talking about is
based on the binary image as far as I can tell and knowledge of the order
of mapping, which given the mechanisms in place for privilege separation or
at least common forking a child is not that far of a stretch. "I am mapping
X and there will be Y mappings with a total size of Z before me whose base
address is A from the first/last loaded module"

>
> Well, if you know in advance which address to leak you can arrange for
> it to be a useless one, it would usually have to be MMAP_FIXED and be
> sanitized (think KUSER_SHARED_DATA on Windows or the vsyscall page on
> Linux) so as not to weaken ASLR.

Well but these addresses are not fixed, it's just that modules are being
loaded in alphabetical order sans ld.so and the distance between them is
not randomized. Is KUSER_SHARED_DATA still not randomized?

Compare all of this with the openbsd allocator and it's output and loaded
modules. I haven't looked at their kernel  but I'm assuming they randomize
mmap base, then in the allocator the use arc4 to further randomize the
offset into the allocated memory. This would fix circumstances except for
where a module has a long string of repeated instructions that could be
utilized.

Also It's not just the first mapping, it can be any malloc (or direct mmap)
output that you how many and the size of those who came before you. This is
actually not a stretch especially in post-auth server-side paradigms.

> Well, good luck.

Thanks. I seem to recall hearing that once before in relation to similar in
another OS when I pointed it out, "creepy"

I'll just get my hands on another linux box somewhere; if this pattern
holds its actually a really big problem.

Consider akin to (and this is somewhat of an imaginary stretch)

call malloc
mov rcx, [user]
lea rbx, [rax+rcx] ; wrap
call  [rbx+vtableoff] ; actually lands in libc

--001a11c03ca0cf1d21051505bfe0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
&gt; Sure, If code with knowledge of an address is willing to act as an<br>
&gt; oracle, then ASLR is not useful. This is really just an indirect (and<=
br>
&gt; unlikely) way of leaking an address though.</p>
<p dir=3D"ltr">We&#39;ll but keep in mind here that the knowledge we are ta=
lking about is based on the binary image as far as I can tell and knowledge=
 of the order of mapping, which given the mechanisms in place for privilege=
 separation or at least common forking a child is not that far of a stretch=
. &quot;I am mapping X and there will be Y mappings with a total size of Z =
before me whose base address is A from the first/last loaded module&quot; <=
br></p>
<p dir=3D"ltr">&gt;<br>
&gt; Well, if you know in advance which address to leak you can arrange for=
<br>
&gt; it to be a useless one, it would usually have to be MMAP_FIXED and be<=
br>
&gt; sanitized (think KUSER_SHARED_DATA on Windows or the vsyscall page on<=
br>
&gt; Linux) so as not to weaken ASLR.</p>
<p dir=3D"ltr">Well but these addresses are not fixed, it&#39;s just that m=
odules are being loaded in alphabetical order sans ld.so and the distance b=
etween them is not randomized. Is KUSER_SHARED_DATA still not randomized? <=
/p>
<p dir=3D"ltr">Compare all of this with the openbsd allocator and it&#39;s =
output and loaded modules. I haven&#39;t looked at their kernel=C2=A0 but I=
&#39;m assuming they randomize mmap base, then in the allocator the use arc=
4 to further randomize the offset into the allocated memory. This would fix=
 circumstances except for where a module has a long string of repeated inst=
ructions that could be utilized.</p>
<p dir=3D"ltr">Also It&#39;s not just the first mapping, it can be any mall=
oc (or direct mmap) output that you how many and the size of those who came=
 before you. This is actually not a stretch especially in post-auth server-=
side paradigms. <br></p>
<p dir=3D"ltr">&gt; Well, good luck.</p>
<p dir=3D"ltr">Thanks. I seem to recall hearing that once before in relatio=
n to similar in another OS when I pointed it out, &quot;creepy&quot;</p>
<p dir=3D"ltr">I&#39;ll just get my hands on another linux box somewhere; i=
f this pattern holds its actually a really big problem.</p>
<p dir=3D"ltr">Consider akin to (and this is somewhat of an imaginary stret=
ch) </p>
<p dir=3D"ltr">call malloc <br>
mov rcx, [user]<br>
lea rbx, [rax+rcx] ; wrap <br>
call=C2=A0 [rbx+vtableoff] ; actually lands in libc<br><br><br></p>

--001a11c03ca0cf1d21051505bfe0--
