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
    - name: Gitbook Action                    # https://github.com/ZanderZhao/gitbook-action/releases
      uses: ZanderZhao/gitbook-action@v1.2.4  # -> or ZanderZhao/gitbook-action@master.If not use master click above, use latest please 
      with:                                   #    or fork this repo and use YourName/gitbook-action@master
        token: ${{ secrets.PERSONAL_TOKEN }}  # -> remember add this in settings/secrets as following
```

​    [Detailed step](https://zanderzhao.github.io/gitbook-action/how-to-use.html#addaction)  |  [Official introduction](https://help.github.com/cn/actions/getting-started-with-github-actions/starting-with-preconfigured-workflow-templates)

### **STEP2**  Generate Token and add to Secrets

Create token from https://github.com/settings/tokens

+ choose repo
+ click Generate token

​       [Detailed step](https://zanderzhao.github.io/gitbook-action/how-to-use.html#createtoken) |   [Official introduction](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line#creating-a-token)

Add your token to https://github.com/ **yourname/yourrepo** /settings/secrets

+ Name: PERSONAL_TOKEN
+ Value: which you get before

​       [Detail step](https://zanderzhao.github.io/gitbook-action/how-to-use.html#addtoken)  |  [Official introduction](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets#creating-encrypted-secrets)

### **STEP3** Choose options

+ **Set Default Above** source branch is `master`, and the target branch is `gh-pages`. If `gh-pages` does not exist, it will be created automatically.
+ **The following** are options.

## Option   {#option}


### For global   {#global}

+ **git_name**:

  + description: ' If git name is different with github, please add'
  + default: [GITHUB_ACTOR](https://help.github.com/en/actions/configuring-and-managing-workflows/using-environment-variables#default-environment-variables)


+ **git_email:**
+ description: ' If git name is different with github, please add'
  
+ default: [**@users.noreply.github.com](https://help.github.com/en/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address#setting-your-commit-email-address-on-github)


+ **time_zone:**

  + description: 'System Default, if set, like [Asia/Shanghai](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)'

### For Source Repo   {#source}

+ **source_repo**:
  + description: 'Default this [GITHUB_REPOSITORY](https://help.github.com/en/actions/configuring-and-managing-workflows/using-environment-variables#default-environment-variables), if not please add like username/reponame '

+ **source_token**:

  + description: 'Default token, if not please add (clone)'

+ **source_git_name**:

  + description: 'Default git_name, if not please add'


+ **source_hub**:
+ description: 'default is github.com,can be gitlib.com  gitee.com ...'
  
+ default: 'github.com'
  
+ **source_branch**:

  + description: 'Default master'

  + default: 'master'

+ **source_dir**:

  + description: 'Where gitbook source. Default is root, if not add like mydir, instead of /mydir or mydir/'

  + default:  '/'

+ **source_edit_time**:

  + description: 'Default false, if plugins need last edit time, set true'

  + default: false

+ **source_file_without_prefix**:

  + description: 'Default true, if you want to ignore file without prefix please set false'

  + default: true

### For Publish Repo   {#publish}

+ **publish_repo**:
  + description: 'Default this [GITHUB_REPOSITORY](https://help.github.com/en/actions/configuring-and-managing-workflows/using-environment-variables#default-environment-variables), if not please add like username/reponame'

+ **publish_token**:

  + description: 'Default token, if not please add (clone push)'


+ **publish_git_name**:

  + description: 'Default git_name, if not please add'


+ **publish_git_email**:

  + description: 'Default git_email, if not please add'


+ **publish_commit_message**:

  + description: 'Default Updated by gitbook-action and time, can use last commit message'
  + Tip: can set  `github.event.head_commit.message`  as [last commit message](https://help.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions#github-context)  [example1](https://github.com/ZanderZhao/gitbook-action/blob/master/.github/workflows/gitbook-action.yml)


+ **publish_hub**:
+ description: 'Default is github.com,can be gitlib.com gitee.com ...'
  
+ default: 'github.com'
  
+ **publish_branch**:

  + description: 'Defaule is gh-pages, auto create'

  + default: '[gh-pages](https://help.github.com/en/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)'

+ **publish_dir**:

  + description: 'Default is root, if not add like docs ...'

  + default:  '/'

+ **publish_commit_history**:

  + description: 'set false will only one commit at publish_repo'

  + default:  true

+ **publish_cname**:

  + description: 'Default null'

  + default:  'null'

+ **publish_nojekyll**:

  + description: 'Default false, if set true, it will add .nojekyll for publish'

  + default:  'false'


+ **publish_push_force**:

  + description: 'Default false. Set true will enable git push force'

  + default: false

+ **publish_remove_last_build**:

  + description: 'Default true. Set false not remove last build but rewrite same file'

  + default: true

### For Gitbook Setting   {#gitbooksetting} 

+ **gitbook_cli_version**:

  + description: 'Default is [2.3.2]( https://www.npmjs.com/package/gitbook-cli?activeTab=versions)'

  + default: '2.3.2'
+ **gitbook_version**:

  + description: 'Default is [3.2.3](https://www.npmjs.com/package/gitbook?activeTab=versions)'

  + default: '3.2.3'
+ **gitbook_pdf**:

  + description: 'Set true will generate pdf file'

  + default: false
+ **gitbook_pdf_dir**:

  + description: 'Where the pdf to put. Default mybook, can change / for root, or myebook'

  + default: 'mybook'
+ **gitbook_pdf_name**:

  + description: 'The name of your pdf. Default ebook'

  + default: 'ebook'
+ **gitbook_epub**:

  + description: 'Set true will generate epub file'

  + default: false
+ **gitbook_epub_dir**:

  + description: ''

  + default: 'mybook'
+ **gitbook_epub_name**:

  + description: ''

  + default: 'ebook'
+ **gitbook_mobi**:

  + description: 'Set true will generate mobi file'

  + default: false
+ **gitbook_mobi_dir**:

  + description: ''

  + default: 'mybook'
+ **gitbook_mobi_name**:

  + description: ''
  + default: 'ebook'

+ **font_install**
  + description: 'Install font for pdf, Not install any font, maybe affect the pdf/mobi/epub, can add font_install at book.json'
  + example: `sudo apt-get install fonts-noto-cjk`or`sudo apt-get install ttf-mscorefonts-installer`,use sudo install for global.

+ **not_clean**
  + description: 'Default false. Set true  will not remove working file when the workflow finish, if you set cache'

+ **prepare_install**
  + description: 'Some install for prepare, such as dependency, golbal setting'
  + example: `npm i --unsafe-perm -g svgexport@0.3.2`,install specific svgexport version for converting svg.

### For other repo   {#otherrepo}

#### For Source2 repo   {#source2}

+ **source2_repo**:
  + description: 'Default null, if use please add like username/reponame, (same with source will replace, different will mix)'
  + default: 'null'

+ **source2_git_name**:

  + description: 'Default git_name, if not please add'


+ **source2_token**:

  + description: 'Default token, if not please add (clone)'

+ **source2_hub**:

  + description: ''

  + default: 'github.com'

+ **source2_branch**:

  + description: ''

  + default: 'master'

+ **source2_dir**:

  + description: ''

  + default:  '/'

+ **source2_edit_time**:

  + description: 'Default false if plugins need last edit time, set true'

  + default: false

+ **source2_file_without_prefix**:

  + description: 'Default true, if you want to ignore file without prefix please set false'

  + default: true

#### For Publish2 repo   {#publish2}

+ **publish2_repo**:
  + description: 'Default null, if use please add like username/reponame'
  + default: 'null'

+ **publish2_git_name**:

  + description: 'Default git_name, if not please add'


+ **publish2_token**:

  + description: 'Default token, if not please add (clone push)'
    required: 'false'

+ **publish2_git_email**:

  + description: 'Default git_email, if not please add'


+ **publish2_commit_message**:

  + description: 'Default Updated by gitbook-action and time'


+ **publish2_hub**:

  + description: ''

  + default: 'github.com'

+ **publish2_branch**:

  + description: 'Default gh-pages'

  + default: 'gh-pages'

+ **publish2_dir**:

  + description: ''

  + default:  '/'

+ **publish2_cname**:

  + description: 'Default null'

  + default:  'null'

+ **publish2_push_force**:

  + description: 'Default false. Set true will enable git push force'

  + default: false

+ **publish_remove_last_build**:

  + description: 'Default true. Set false not remove last build but rewrite same file'

  + default: true

+ **publish2_commit_history**:

  + description: 'set false will only one commit at publish2_repo'

  + default:  true

+ **publish2_nojekyll**:

  + description: 'Default false, if set true, it will add .nojekyll for publish2'

  + default:  'false'

#### For Publish3 repo   {#publish3}

+ **publish3_git_name**:

  + description: 'Default git_name, if not please add'


+ **publish3_token**:

  + description: 'Default token, if not please add (clone push)'

+ **publish3_git_email**:

  + description: 'Default git_email, if not please add'


+ **publish3_commit_message**:

  + description: 'Default Updated by gitbook-action and time'


+ **publish3_hub**:

  + description: ''

  + default: 'github.com'

+ **publish3_repo**:

  + description: 'Default null, if use please add like username/reponame'

  + default: 'null'

+ **publish3_branch**:

  + description: 'Default gh-pages'

  + default: 'gh-pages'

+ **publish3_dir**:

  + description: 'Default root'

  + default:  '/'

+ **publish3_cname**:

  + description: 'Default null'

  + default:  'null'

+ **publish3_push_force**:

  + description: 'Default false. Set true will enable git push force'

  + default: false

+ **publish_remove_last_build**:

  + description: 'Default true. Set false not remove last build but rewrite same file'

  + default: true

+ **publish3_commit_history**:

  + description: 'set false will only one commit at publish3_repo'
  + default:  true

+ **publish3_nojekyll**:

  + description: 'Default false, if set true, it will add .nojekyll for publish3'

  + default:  'false'

## Example  {#example}

```yml
name: 'Gitbook-Action'

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout action
      uses: actions/checkout@v1

    # example1--> https://ZanderZhao.github.io/gitbook-action
    - name: Gitbook Action
      uses: zanderzhao/gitbook-action@v1.2.4 # https://github.com/ZanderZhao/gitbook-action/releases 
      with:                                # Just example, click above, use latest please 
        token: ${{ secrets.PERSONAL_TOKEN }}
        time_zone: Asia/Shanghai   # set time zone
        source_dir: source         # clone from source
        source_edit_time: true     # source time
        publish_commit_message: ${{ github.event.head_commit.message }}  # use last commit message

    # example2--> https://ZanderZhao.github.io/gitbook-action/gitbook-docs
    - name: Gitbook Action
      uses: zanderzhao/gitbook-action@v1.2.4
      with:
        token: ${{ secrets.PERSONAL_TOKEN }} 
        time_zone: Asia/Shanghai
        source_repo: GitbookIO/gitbook    # clone from https://github.com/GitbookIO/gitbook.git
        source_branch: master             # clone source master
        source_dir: docs                  # gitbook-sorce at dir:docs
        publish_dir: gitbook-docs            # publish for this repo dir:gitbook-docs
        publish2_repo: gitbook-org/gitbook   # publish for another repo dir default root

```



## FAQ   {#faq}

### [ERROR](https://zanderzhao.github.io/gitbook-action/error.html)

### [WARNING](https://zanderzhao.github.io/gitbook-action/warning.html)

### Q&A

+ About last edit time
  + How to keep the last edit time ?
    + Add `source_edit_time: true`

+ About CNAME
  +  How to add CNAME ?
     +  Add `publish_cname: www.example.com`
     +  And add two CNAME like `publish_cname: example.com www.example.com`
        +  `example.com` and `www.example.com`should have space.
     +  [Github pages: custom-domain-names-that-are-unsupported](https://help.github.com/cn/github/working-with-github-pages/troubleshooting-custom-domains-and-github-pages#custom-domain-names-that-are-unsupported)

+ About PDF/EPUB/MOBI

  + How to build pdf ?
    + Add `gitbook_pdf: true`
      + You can choose `gitbook_pdf_dir` and `gitbook_pdf_name`
      + [Detail](https://zanderzhao.github.io/gitbook-action/#gitbooksetting)
    + Why the font format is wrong ?
      + You need install font, add `font_install`
      + example: `font_install: sudo apt-get install fonts-noto-cjk`or`font_install: sudo apt-get install ttf-mscorefonts-installer`,use sudo install for global.

+ About source_repo

  + source_repo is the repo where gitbook-source(SUMMARY.md README.md) deposit

  + you can set `source_repo`、 `source_branch`and`source_dir`

    + example: <https://github.com/GitbookIO/gitbook/tree/master/docs>

```
        source_repo: GitbookIO/gitbook
        source_branch: master
        source_dir: docs
```

+ About publish_repo
  + publish_repo is the file gitbook build push to
  + you can set `publish_repo`、`publish_branch`and`publish_dir`
  + This action **only change** the file in `publish_dir`
+ About work
  + Pull docker from [docker](https://hub.docker.com/r/zanderzhao/gitbook-action/dockerfile)
    + In which Gitbook and Tools has installed 
  + Clone from publish 
    +  If exists publish2 and publish3 
      + Then clone publish2 and publish3 
      + Mix publish, publish2 and publish3  together
  + Build
    + If exists plugins
      + install plugins
    + if need pdf
      + if set font
        + install font if you set before
      + build pdf
  + Publish
    + Publish to publish_repo
    + If exists publish2 or publish3, then publish
  + Clean
    + It will clean all things, If you need cache can set false, and you can find detail in OPTION above





## Community   {#community}

[Gitter](https://gitter.im/Gitbook-Action/community)




## External links  {#external}

+ <https://github.com/marketplace/actions/gitbook-action>
+ <https://github.com/marketplace/actions/github-pages-action>
+ <https://github.com/marketplace/actions/publish-gitbook>
+ <https://ZanderZhao.github.io/gitbook-action>
+ <https://help.github.com/en/actions>