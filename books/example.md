# Example

# 例子

## 1.准备

### 1.1新建仓库，如果用原来的可以忽略本步

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104173658.png)

### 1.2创建`gh-pages`分支



![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104165934.png)



### 1.3将gh-pages分支设为pages

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104170014.png)

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104170113.png)

如果新建分支为`gh-pages`则上面的第5步会自动将该分支设为pages，如果不是想将`gh-pages`作为pages，则需要手动选择，第6步为可选步骤。



### 1.4在该仓库添加5个Secrets

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104170557.png)



待添加的secrets如下表

| ame              | Value                                   | 说明                                                         |
| ---------------- | --------------------------------------- | ------------------------------------------------------------ |
| GIT_NAME         | your git name                           | 你的git名称                                                  |
| GIT_EMAIL        | your git email                          | 你的git的email                                               |
| THE_GITHUB_TOKEN | your Personal access tokens             | 可以在`Settings->Developer settings->Personal access tokens->Generate new token`生成，注意权限要给足 |
| THE_GITHUB_REF   | github.com/your_name/your_repo_name.git | 注意**不要**添加`https://`                                   |
| RES_FOR_PAGES    | your branch like `gh-pages`             | 注意要提前建好，且在设置里面设置为pages                      |



![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104170809.png)

token获取可以参考<https://zlogs.net/blog/19/10051840/>，注意至少要给push权限

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104180131.png)

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104180432.png)

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104180652.png)

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104180940.png)

> 注意2要改为自己名字



### 1.5添加gitbook内容

克隆到本地添加gitbook内容，再push上去

注意gitbook的`SUMMARY.md`和`README.md`要在根目录，如果不在根目录下面的`yml`文件要自行修改



## 2.使用工作流

### 2.1点击Actions选择工作流

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104175312.png)

### 2.2配置`yml`

1.文件名`gitbook_action.yml`或者其他自定义的，

2.复制下面内容，

3.commit

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104175251.png)



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



### 2.3查看工作流

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104175607.png)

注意：若上面Secret未添加，或者添加错误，或者github的token权限不足，比如没有push权限可能导致失败

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104181148.png)



检查：

1.Secret是否5个都添加

2.Secret可能有错误，

- 比如添加了`https://`
- gh-pages没有创建
- token没有给push权限

若为绿色则通过，可以访问pages地址查看部署结果，若无结果，查看是否正确设置gh-pages为pages



## 3.正常使用gitbook

在web或者本地clone-push添加或者更新SUMMARY和内容，push之后会自动触发更新pages





