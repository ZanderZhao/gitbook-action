# 准备

你需要

+ 有一个仓库
+ 在该仓库内新建一个分支作为发布pages
+ 在该仓库添加5个Secrets
+ 仓库内有gitbook的`SUMMARY.md`和`README.md`以及其他内容



## 1.有一个仓库

可以是已有的，可以是新建的



## 2.在该仓库内新建一个分支作为发布pages

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104165934.png)

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104170014.png)

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104170113.png)

如果新建分支为`gh-pages`则上面的第5步会自动将该分支设为pages，如果不是想将`gh-pages`作为pages，则需要手动选择，第6步为可选步骤。



## 3.在该仓库添加5个Secrets

![](https://raw.githubusercontent.com/ZanderZhao/images/master/img2020/20200104170557.png)



| ame              | Value                                   | 说明                                                         |
| ---------------- | --------------------------------------- | ------------------------------------------------------------ |
| GIT_NAME         | your git name                           | 你的git名称                                                  |
| GIT_EMAIL        | your git email                          | 你的git的email                                               |
| THE_GITHUB_TOKEN | your Personal access tokens             | 可以在`Settings->Developer settings->Personal access tokens->Generate new token`生成，注意权限要给足 |
| THE_GITHUB_REF   | github.com/your_name/your_repo_name.git | 注意**不要**添加`https://`                                   |
| RES_FOR_PAGES    | your branch like `gh-pages`             | 注意要提前建好，且在设置里面设置为pages                      |



## 4.添加gitbook内容

仓库内至少有gitbook的`SUMMARY.md`和`README.md`，可以添加gitbook的book.json以及其他内容,gitbook使用暂时不在此介绍。