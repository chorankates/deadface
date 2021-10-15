# [01 - Monstrum_ex_Machina](https://deadface.ctfd.io/challenges#Monstrum%20ex%20Machina-22)

## description
```
Our person on the "inside" of Ghost Town was able to plant a packet sniffing device on Luciafer's computer. Based on our initial analysis, we know that she was attempting to hack a computer in Lytton Labs, and we have some idea of what she was doing, but we need a more in-depth analysis. This is where YOU come in.

We need YOU to help us analyze the packet capture. Look for relevant data to the potential attempted hack.

To gather some information on the victim, investigate the victim's computer activity. The "victim" was using a search engine to look up a name. Provide the name with standard capitalization: flag{Jerry Seinfeld}.

Download file
SHA1: 6c0caf366dae3e03bcbd7338de0030812536894c

NOTE: All of the packet capture challenges use this PCAP file.
```

### links

  * [pcap-challenge-final.pcapng](pcap-challenge-final.pcapng)

## walkthrough

apparently i can read pcaps better than expected - elapsed time ~30 seconds.

```
$ irb
Welcome to IRB. You are using ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux]. Have fun ;)
irb(main):001:0> 'd=%22charles%20geschickter' #=> "d=%22charles%20geschickter"
irb(main):002:0> require 'uri' #=> false
irb(main):003:0> URI.decode_www_form
irb(main):003:0> URI.decode_www_form_component('d=%22charles%20geschickter')   #=> "d=\"charles geschickter"
```

## flag
```
flag{Charles Geschickter}
```
