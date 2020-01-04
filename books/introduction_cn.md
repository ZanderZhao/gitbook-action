# 简介

GitHub Action For Gitbook

适用于Gitbook的Github Action自动集成部署

# 用法

### 1.在`repo->Setting->Secrets->Add a new secret`添加下列内容

| Name             | Value                                   | 说明                                                         |
| ---------------- | --------------------------------------- | ------------------------------------------------------------ |
| GIT_NAME         | your git name                           | 你的git名称                                                  |
| GIT_EMAIL        | your git email                          | 你的git的email                                               |
| THE_GITHUB_TOKEN | your Personal access tokens             | 可以在`Settings->Developer settings->Personal access tokens->Generate new token`生成，注意权限要给足 |
| THE_GITHUB_REF   | github.com/your_name/your_repo_name.git | 注意**不要**添加`https://`                                   |
| RES_FOR_PAGES    | your branch                             | 注意要提前建好，且在设置里面设置为pages                      |



### 2.保存`gitbook_action.yml`

在`Actions`里面添加`gitbook_action.yml`内容，或将`gitbook_action.yml`保存到需要自动编译成gitbook的仓库下master的`/.github/workflows/`目录下

下面是`gitbook_action.yml`内容：

```yml
# You must put this in your repo master branch  as repo/.github/workflow/gitbook_action.yml
# You must add the following secrets in your Secrets(repo->Setting->Secrets->Add a new secret)  
# Name:   GIT_NAME              Value:  your git name like ZanderZhao
# Name:   GIT_EMAIL             Value:  your git email like example@exp.com
# Name:   THE_GITHUB_TOKEN      Value:  you can git it from Settings->Developer settings->Personal access tokens->Generate new token
# Name:   THE_GITHUB_REF        Value:  github.com/your_name/your_repo_name.git
# Name:   RES_FOR_PAGES         Value:  put the branch name here like gh-pages,where the build book you want put for
# Pay attention，THE_GITHUB_REF can't add https:// before, 
# And RES_FOR_PAGES must be create and be set as pages before.
# When you make THE_GITHUB_TOKEN ,the push permission is must have，the others, you can add.
# You can visit https://zlogs.net/gitbook-action/ for more information.

name: 'Gitbook Action'

on:
  push:
    branches:    
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [8]

    steps:
    - uses: actions/checkout@v1
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v1
      with:
        node-version: ${{ matrix.node-version }}
    - name: install_gitbook_plugins
      run: |
        npm install gitbook-cli  -g
        gitbook -v
        gitbook install
    - name: build_gitbook
      run: |
        gitbook build
    - name: push_to_pages
      run: |
        cd ./_book
        git init
        git config --local user.name "${{ secrets.GIT_NAME }}"
        git config --local user.email "${{ secrets.GIT_EMAIL }}"
        git add *
        git commit -m "update"
        git push --force  "https://${{ secrets.THE_GITHUB_TOKEN }}@${{ secrets.THE_GITHUB_REF }}" master:${{ secrets.RES_FOR_PAGES }}
      env:
        CI: true
```



### 3.下面就可以正常使用了

根目录下面的`README.md`和`SUMMARY.md`是必须的，`SUMMARY.md`为gitbook内容为目录格式，就不在此介绍了，当然你也可以新建`book.json`添加插件及其个性化样式。





### 4.正常使用

克隆这个repo，更改SUMMARY.md，添加其他内容，将自动完成部署，发布在你的pages上。

