# gitbook-action

## Introduction

GitHub Action For Gitbook

Put your gitbook file in your master branch, and create `gh-pages`, add the following five secrets and `gitbook_action.yml` in your repo, it will deploy auto.

You can visit <https://zlogs.net/gitbook-action/> for more information.

## Usage

### 1.add the following in `repo->Setting->Secrets->Add a new secret`

| Name             | Value                                            | Tip                                                        |
| ---------------- | ------------------------------------------------ | ------------------------------------------------------------ |
| GIT_NAME         | your git name                                    | like zanderzhao                                              |
| GIT_EMAIL        | your git email                                   | like example@exp.com                                         |
| THE_GITHUB_TOKEN | your personal access token                       | get the token from`Settings->Developer settings->Personal access tokens->Generate new token`,when you make it, push permission is  needed. |
| THE_GITHUB_REF   | `github.com/your_name/your_repo_name.git`        | can **not** add`https://`                                    |
| RES_FOR_PAGES    | your branch like `gh-pages` to function as pages | create the pages before and set it  as pages                 |



### 2.Save`gitbook_action.yml`

Click`Actions`，and add`gitbook_action.yml`，or save`gitbook_action.yml` in`/.github/workflows/`

You can add my, create it by your own.

`gitbook_action.yml`：

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



### 3.To use

`README.md`an`SUMMARY.md`in`root` is need. `SUMMARY.md`is gitbook's, you can also add`book.json`to make you own style.

Clone this repo, update SUMMARY.md, add others, will build and push to your pages auto.

If you like please star, thinks.

