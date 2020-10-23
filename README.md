# Gitbook Action

This action builds and publishes a gitbook to github pages and other pages. [Click here for more information](https://ZanderZhao.github.io/gitbook-action). 

> [GitHub](https://github.com/ZanderZhao/gitbook-action) | [MarketPlace](https://github.com/marketplace/actions/gitbook-action) | [Page](https://ZanderZhao.github.io/gitbook-action/) | [Community](https://gitter.im/Gitbook-Action/community)

## How to Use

### **STEP1** Add Action

 Add `.github/workflows/gitbook-action.yml`in your repo, with  following content.

```yml
name: 'Gitbook Action Build'
on:
  push:
    branches:
      - master  # trigger branch
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout action
      uses: actions/checkout@v2
    - name: Gitbook Action           # https://github.com/ZanderZhao/gitbook-action/releases
      uses: ZanderZhao/gitbook-action@v1.2.4  # -> or ZanderZhao/gitbook-action@master.  If not use master click above, use latest please 
      with:                                   #    or fork this repo and use YourName/gitbook-action@master
        token: ${{ secrets.PERSONAL_TOKEN }}  # -> remember add this in settings/secrets as following
```

​    [Detailed step](https://zanderzhao.github.io/gitbook-action/how-to-use.html#addaction)  |  [Official introduction](https://help.github.com/cn/actions/getting-started-with-github-actions/starting-with-preconfigured-workflow-templates)

### **STEP2**  Generate Token and add to Secrets

Create token from https://github.com/settings/tokens

+ choose repo
+ click Generate token

​       [Detailed step](https://zanderzhao.github.io/gitbook-action/how-to-use.html#createtoken)  |  [Official introduction](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line#creating-a-token)

Add your token to https://github.com/ **yourname/yourrepo** /settings/secrets

+ Name: PERSONAL_TOKEN
+ Value: which you get before

​       [Detail step](https://zanderzhao.github.io/gitbook-action/how-to-use.html#addtoken)  |  [Official introduction](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets#creating-encrypted-secrets)


### **STEP3** Choose options

+ **Set Default Above** 
  + Source branch is `master`, and the target branch is `gh-pages`. If `gh-pages` does not exist, it will be created automatically.
+ **More Options And Example**.
  + Introduction  on  <https://ZanderZhao.github.io/gitbook-action/#option>
    + Source repo and publish repo can be different
    + Source git from other people
    + Choose your own gitbook version
    + Clean commit history
    + Keep time setting of file
    + ... ...

## Option

The following is options, [click here, to detail](https://ZanderZhao.github.io/gitbook-action/#option)

```yml
# for global
time_zone
git_name
git_email

# for source
source_repo
source_branch
source_dir
source_edit_time
source_token
source_git_name
source_hub

# for publish
publish_repo
publish_commit_message
publish_hub
publish_branch
publish_dir
publish_commit_history
publish_cname
publish_push_force
publish_token
publish_git_name
publish_git_email
publish_remove_last_build

# for gitbook
gitbook_cli_version
gitbook_version
gitbook_pdf
gitbook_pdf_dir
gitbook_pdf_name
gitbook_epub
gitbook_epub_dir
gitbook_epub_name
gitbook_mobi
gitbook_mobi_dir
gitbook_mobi_name
font_install
not_clean
prepare_install

# for source2
source2_repo
source2_git_name
source2_token
source2_hub
source2_branch
source2_dir
source2_edit_time

# for publish2
publish2_repo
publish2_git_name
publish2_token
publish2_git_email
publish2_commit_message
publish2_hub
publish2_branch
publish2_commit_history
publish2_dir
publish2_cname
publish2_push_force
publish2_remove_last_build

# for publish3
publish3_repo
publish3_git_name
publish3_token
publish3_git_email
publish3_commit_message
publish3_hub
publish3_branch
publish3_commit_history
publish3_dir
publish3_cname
publish3_push_force
publish3_remove_last_build
```



## Example

[Example](https://ZanderZhao.github.io/gitbook-action/#example)



## FAQ

[Q&A](https://zanderzhao.github.io/gitbook-action#faq)

[ERROR](https://zanderzhao.github.io/gitbook-action/error.html)

[WARNING](https://zanderzhao.github.io/gitbook-action/warning.html)



## Community

[Gitter](https://gitter.im/Gitbook-Action/community)



## External links

+ <https://help.github.com/en/actions>
+ <https://ZanderZhao.github.io/gitbook-action>
+ <https://github.com/marketplace/actions/github-pages-action>
+ <https://github.com/marketplace/actions/publish-gitbook>