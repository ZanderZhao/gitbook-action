# ERROR

## 31XX

3101 

+ need token please
  + need main token, which is other default token



3102     3102-2   

+ Source git clone success, but not find gitbook-source file in dir
  + find repo, and clone repo success, 
  + but not find gitbook-source in `source_dir`



3103     3103-2     3104    3104-2    3104-3

+ Can't find this source_repo/branch, maybe not add token or source_token(with access) in gitbook_action.yml
  + can't git clone repo
  + maybe not exists this `source_repo`
  + or you don't add `token` 
  + or the `token` or`source_token`without oath



3105

+ gitbook built fail,please check is there something wrong with your book.json or others
  + build fail with plugins
  + maybe something wrong with SUMMARY.md README.md
  + or wrong with book.json
  + or wrong other file
  + or some plugins can't install
  + or plugins run fail



3016  3016-2  3016-3

+ Can't push publish_repo/branch, maybe not add publish_token(with access) in gitbook_action.yml
  + can't push and push force sucess
  + maybe your token without oath to push this repo



3107  3017-2  3017-3

+ Can't push publish_repo/branch, maybe not add publish_token(with access) in gitbook_action.yml or try set publish_push_force true
  + can't push sucess
  + maybe your token without oath to push this repo
  + or try to allow push force, add `publish_push_force: true`



3108 3108-2 3108-3

+ You set publish_commit_history:false , must set publish_push_force:true at same time
  + clean commit need push force
  + set publish_commit_history:false , must set publish_push_force:true at same time





















