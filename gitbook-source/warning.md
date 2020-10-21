# WARNING

## 33XX

3301 

+ Source2 git success. It will replace what we git before, when have same file
  + Just  Emphasize
  + If source/dir and source2/dir have file with same name, will only source2 left
  + If diffenent , both left
  + They build together as one gitbook-source, not replace 



3302  3302-2   3302-3

+ Can't find this publish_branch, but find this repo, we checkout new branch
  + clone this repo sucess
  + but there no `publish_branch`
  + create new branch sucess



3303

+ gitbook built fail, maybe need some file or plugins, now we try again
  + Just  Emphasize
  + build without plugins fail
  + next will try to build again with plugins 



3304

+ Remove the CNAME(from source or source2), if need cname please add in gitbook_action.yml publish_cname:value
  + Just  Emphasize
  + if source has CNAME, here will remove
  + if use CNAME, can add `publish_cname: value`in action.yml



3305-0

+ Just tell you, You ALLOW PUSH FORCE
  + If work with others, try avoid it. 



3305  3305-2  3305-3

+ Can't push publish_repo/branch, try push force
  + Just  Emphasize
  + you allow push force, and now can push normal success
  + next will try to push force



3306  3306-2  3306-3

+ Push force success
  + Just  Emphasize
  + here publish force



3307

+ NOT_CLEAN set true, if two gitbook-action in one workflow may run fatal. If don't use cache, (source build file-->node_modules), please set false(Default), and CLEAN is not remove gitbook-cli and gitbook
  + Just  Emphasize
  + if two gitbook-action in one workflow may run fatal. 
  +  If don't use cache, (source build file-->node_modules), please set false(Default)
  +  CLEAN is not remove gitbook-cli and gitbook



3308

+ Not install any font, maybe affect the pdf/mobi/epub, can add font_install at book.json
  + If you use pdf/epub/mobi without installing any font may create fail.
  + You can use like `font_install: sudo apt-get install fonts-noto-cjk `to install the font you need in pdf. Not limited to this, remember install for global.













