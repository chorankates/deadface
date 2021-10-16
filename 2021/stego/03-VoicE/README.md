# [03 - VoicE](https://deadface.ctfd.io/challenges#V0icE-12)

## description
```
A friend of mine sent me an audio file which supposes to tell me the time of our night out meeting, but I can't comprehend the voice in the audio file. Can you help me figure it out? I want to hang out with my friends.

Download file
SHA1:3173700e9ba2f062a18707b375fac61049310413
```

### links

  * [midnight.wav](midnight.wav)

## walkthrough

never don't forget stegseek works on wavs:

```
$ stegseek midnight.wav
StegSeek version 0.5
stegseek: the wav file "midnight.wav" is corrupted.
conor@pride:~/git/ctf-meta/deadface/2021/stego/03-VoicE[chorankates/deadface|main|87b2fd7|U]
 2:51.32 [10672] $ file midnight.wav
midnight.wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, stereo 22050 Hz
conor@pride:~/git/ctf-meta/deadface/2021/stego/03-VoicE[chorankates/deadface|main|87b2fd7|U]
 2:51.37 [10673] $ zsteg midnight.wav
[!] #<ZPNG::NotSupported: Unsupported header "RIFFP\xBF\x06\x00" in #<File:midnight.wav>>
conor@pride:~/git/ctf-meta/deadface/2021/stego/03-VoicE[chorankates/deadface|main|87b2fd7|U]
 2:51.40 [10674] $ strings -n 10 midnight.wav
conor@pride:~/git/ctf-meta/deadface/2021/stego/03-VoicE[chorankates/deadface|main|87b2fd7|U]
 2:51.44 [10675] $ meta_exif midnight.wav
  ExifToolVersion = 12.16
  FileName = midnight.wav
  Directory = .
  FileSize = 442200
  FileModifyDate = 1634331041
  FileAccessDate = 1634331041
  FileInodeChangeDate = 1634331083
  FilePermissions = 33204
  FileType = WAV
  FileTypeExtension = WAV
  MIMEType = audio/x-wav
RIFF 'fmt ' chunk (20 bytes of data):
  AudioFormat (SubDirectory) -->
  + [BinaryData directory, 20 bytes]
  | Encoding = 1
  | NumChannels = 2
  | SampleRate = 22050
  | AvgBytesPerSec = 88200
  | BitsPerSample = 16
RIFF 'data' chunk (442152 bytes of data):
conor@pride:~/git/ctf-meta/deadface/2021/stego/03-VoicE[chorankates/deadface|main|87b2fd7|U]
 2:51.49 [10676] $ bw midnight.wav

Scan Time:     2021-10-15 14:51:55
Target File:   /home/conor/git/ctf-meta/deadface/2021/stego/03-VoicE/midnight.wav
MD5 Checksum:  9fd1d97cb6be26b473716cf03e43df94
Signatures:    411

DECIMAL       HEXADECIMAL     DESCRIPTION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
```

unless they're corrupted.. so likely this is just backwards?

nope - running this through a [spectrum analyzer](https://academo.org/demos/spectrum-analyzer/) shows `flag{1257}`

## flag
```
flag{1257}
```
