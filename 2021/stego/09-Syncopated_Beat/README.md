# [09 - Syncopated_Beat](https://deadface.ctfd.io/challenges#Syncopated%20Beat-10)

## description
```
We know there's a hidden message somewhere here, but none of our steg tools are able to reveal it. Maybe we need to think outside the box?

It is a well-known fact that demons sometimes hide messages in music. Demons speak lyrics to the musicians, and the demons insinuate their evil messages into the song.

Find the flag and enter it like this (all caps, dashes separating words): flag{SYNCOPATED-BEATS-ARE-EVIL}
```

### links

  * [syncopated-beat.mp4 ](syncopated-beat.mp4)

## walkthrough


it's a 'music' 'video' of `Behind The Mask - Dirtyprotest`, a dark room where light is flashing.

at 2:04, there is some 'demonic' speech -- it's reversed. so we just need to extract this bit, or reverse the whole thing

done with [ezgif.com](https://ezgif.com/reverse-video/ezgif-4-94707cf67a1c.mp4)

hearing

```
time is reversible
but the music is not
go back
go back
but before you 
do
don't forget to enter the flag
electric light orchestra all caps, separated by dashes
```

## flag
```
flag{ELECTRIC-LIGHT-ORCHESTRA}
```
