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
  + or the `token` or`source_token`without auth



3105

+ gitbook built fail,please check is there something wrong with your book.json or others
  + What happened
    + build fail with plugins
  + maybe something wrong with SUMMARY.md README.md or other file
    + TypeError: Path must be a string. Received undefined
      + Maybe use ` <img> ` in article, ` \<img\> ` or with backquote but not  `<img>` 
  + or wrong with book.json
    + Maybe there are extra commas.
    + Error: GitBook doesn't satisfy the requirements of this plugin: >=4.0.0-alpha.0
      + If not add `"gitbook": "XXX"`in`book.json`or add `gitbook_version: XXX`in`gitbook-action.yml`, default is `3.2.3`, maybe your plugins need different version, can find in package.json of plugin
  + or some plugins can't installs
    + maybe author remove it
  + or plugins run fail
    + Error: Cannot find module '/github/workspace/local_source/node_modules/XXX/package.json'
      + There something wrong with plugin, or  or incompatible versions



3016  3016-2  3016-3

+ Can't push publish_repo/branch, maybe not add publish_token(with access) in gitbook_action.yml
  + can't push and push force sucess
  + maybe your token without auth to push this repo



3107  3017-2  3017-3

+ Can't push publish_repo/branch, maybe not add publish_token(with access) in gitbook_action.yml or try set publish_push_force true
  + can't push sucess
  + maybe your token without auth to push this repo
  + or try to allow push force, add `publish_push_force: true`



3108 3108-2 3108-3

+ You set publish_commit_history:false , must set publish_push_force:true at same time
  + clean commit need push force
  + set publish_commit_history:false , must set publish_push_force:true at same time


3201

+ description [Publish sucessfully, But Github pages build fail](https://github.com/ZanderZhao/gitbook-action/issues/4)
  
  + The workflows run successfully, and push for gh-pages successfully, **But** the github **pages build failed**
  
  + ```
    //From Settings
    Your site is having problems building: Page build failed. For more information, see https://docs.github.com/github/working-with-github-pages/troubleshooting-jekyll-build-errors-for-github-pages-sites#troubleshooting-build-errors.
    ```
  
+ Why

  + 1:There is something wrong with the page build with `jekyll`.
  + 2:If you add `.nojekyll` in source but use the version of gitbook action is 1.2.2 or early, which use `cp -rfp ./*  /` will ignore the `.nojekyll` , can cause this.

+ How to Fix

  + step1
    + use   `zanderzhao/gitbook-action@master` 
    + or `zanderzhao/gitbook-action@v1.2.4` or latest
  + step2
    + add`.nojekyll` in source
    + or add `publish_nojekyll: true` at action config


















