# [01 - Big_Boss](https://deadface.ctfd.io/challenges#Big%20Boss-4)

## description
```
An anonymous tipster sent us this photo alleging that it's a note written by b3li3f1203. The tipster claims that the note was intended for someone who works at De Monne Financial. They also said it's likely that it has something to do with a phishing campaign. Provide the name of the target individual as the flag in this format: flag{FirstName_LastName}.
```

### links

  * [crypto04.jpg](crypto04.jpg)

## walkthrough

wow, eyeballed that `hvs` is rot13 for `the`. it's actually rot12, but still

```
hvs bslh asshwbu kwzz ps hcrom oh bccb. Bssr hc twbr cih Xwaaws'g kcfy gqvsrizs gc ks ybck kvsb wg psgh hc dvwgv vwa. Hvs qoadowub bssrg hc zccy zwys wh qoas tfca vwg pcgg, Aofqig Pmbsf. Vs kcfyg og ob Orjobqsr Gczihwcbg Gidsfjwgcf - rcb'h tcfush hc wbqzirs hvoh wb hvs saowz.
```

becomes 

```
the next meeting will be today at noon. Need to find out Jimmie's work schedule so we know when is best to phish him. The campaign needs to look like it came from his boss, Marcus Byner. He works as an Advanced Solutions Supervisor - don't forget to include that in the email.
```

## flag
```
flag{Marcus_Byner}
```
