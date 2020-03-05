# STEP1 Add Action  {#addaction}

 Add `.github/workflows/gitbook-action.yml`in your repo, with  following content.

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304203049.png)

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304203445.png)


```
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
    - name: Gitbook Action
      uses: zanderzhao/gitbook-action@v2
      with:
        token: ${{ secrets.PERSONAL_TOKEN }}
```


![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304204230.png)

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304204602.png)



### **STEP2**  Greate Token and add to Secrets   {#token}

#### step2.1 Create token  {#createtoken}

- click https://github.com/settings/tokens

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304205657.png)

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304205817.png)

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304210004.png)

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304210104.png)

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304210306.png)


#### step2.2 Add token to repo {#addtoken}

- go to  https://github.com/ **yourname/yourrepo** /settings/secrets

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304210813.png)

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304210926.png)

![](https://cdn.jsdelivr.net/gh/ZanderZhao/img20/file/20200304211301.png)



### **STEP3** Choose options   {#chooseoption}

- **Set Default Above** 
  - Source branch is `master`, and the target branch is `gh-pages`. If `gh-pages` does not exist, it will be created automatically.
- **More Options And Example**.
  - Introduction  on  <https://ZanderZhao.github.io/gitbook-action/>
    - Source repo and publish repo can be different
    - Source git from other people
    - Choose your own gitbook version
    - Clean commit history
    - Keep time setting of file
    - ... ...





