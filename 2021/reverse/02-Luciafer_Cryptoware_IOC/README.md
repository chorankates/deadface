# [02 - Luciafer_Cryptoware_IOC](https://deadface.ctfd.io/challenges#Luciafer's%20Cryptoware%20IOC%202-61)

## description
```
Luciafer's cryptoware causes even more ruckus by encrypting the victim's file names. Decrypt the filename and enter it as the flag: Example flag{important-document.ext}.
```

### links

  * [fkduohv-d-jhvfklfnwhu-wr-gdun-dqjho-01.oodev](fkduohv-d-jhvfklfnwhu-wr-gdun-dqjho-01.oodev)

## walkthrough

pushing the filename through rotN,

```
[A-Z]+3	        CHARLESAGESCHICKTERTODARKANGELLLABS
[A-Z0-9]+3	CHARLESAGESCHICKTERTODARKANGELXYLLABS
```

rot23 it is
`charles-a-geschickter-to-dark-angel-01.llabs`


## flag
```
flag{charles-a-geschickter-to-dark-angel-01.llabs}
```
