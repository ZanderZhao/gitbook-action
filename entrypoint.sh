#!/bin/sh -x

####################### prepare  sh config ###############################
#  print missage style
# error 31XX
print_error(){
  echo  "\033[31m ERROR $@  \033[0m \a \n " > /dev/stderr
  echo  "\033[32m Find Detail From: https://ZanderZhao.github.io/gitbook-action/error \033[0m"
  exit  1
}
# info
print_info(){
  echo  "\033[32m INFO $@  \033[0m" > /dev/stderr
}
# warning 33XX
print_warning(){
  echo  "\033[33m WARNING $@  \033[0m \n " > /dev/stderr
  echo  "\033[32m Find Detail From: https://ZanderZhao.github.io/gitbook-action/warning \033[0m"
}

################################ prepare global config and show config ###############################
# prepare var and env
echo "--------------------------------------------"
print_info "STEP1  env_config"
echo "-------"

echo "--------------------"
echo "FOR global"
echo "----------"

TOKEN=""
if [ -n "${INPUT_TOKEN}" ]; then
  print_info "TOKEN provided"
  TOKEN=${INPUT_TOKEN}
else
  print_error "3101 need token please"
  
fi

# Set time for some plugins
if [ -n "${INPUT_TIME_ZONE}" ]; then 
  export TZ=${INPUT_TIME_ZONE}
  print_info "TIME_ZONE provided ${INPUT_TIME_ZONE}"
  echo "time `date '+%Y-%m-%d %H:%M:%S'`"
else
  echo "TIME_ZONE default System time"
  echo "time `date '+%Y-%m-%d %H:%M:%S'`"
  echo "You can set time at action.yml" 
fi

GIT_NAME=""
if [ -n "${INPUT_GIT_NAME}" ]; then 
  print_info "GIT_NAME provided"
  GIT_NAME=${INPUT_GIT_NAME}
else
  echo "GIT_NAME default GITHUB_ACTOR"
  GIT_NAME=${GITHUB_ACTOR}
fi

GIT_EMAIL=""
if [ -n "${INPUT_GIT_EMAIL}" ]; then 
  print_info "GIT_EMAIL provided"
  GIT_EMAIL=${INPUT_GIT_EMAIL}
else
  echo "GIT_EMAIL default GITHUB_ACTOR@users.noreply.github.com"
  GIT_EMAIL="${GITHUB_ACTOR}@users.noreply.github.com"
fi

echo "--------------------"
echo "FOR source"
echo "----------"

SOURCE_TOKEN=""
if [ -n "${INPUT_SOURCE_TOKEN}" ]; then 
  print_info "SOURCE_TOKEN provided"
  SOURCE_TOKEN=${INPUT_SOURCE_TOKEN}
else
  echo "SOURCE_TOKEN default TOKEN"
  SOURCE_TOKEN=${TOKEN}
fi

SOURCE_GIT_NAME=""
if [ -n "${INPUT_SOURCE_GIT_NAME}" ]; then 
  print_info "SOURCE2_GIT_NAME provided"
  SOURCE_GIT_NAME=${INPUT_SOURCE_GIT_NAME}
else
  echo "SOURCE_GIT_NAME default GIT_NAME"
  SOURCE_GIT_NAME=${GIT_NAME}
fi

SOURCE_REPO=""
if [ -n "${INPUT_SOURCE_REPO}" ]; then 
  print_info "SOURCE_REPO provided"
  SOURCE_REPO=${INPUT_SOURCE_REPO}
else
  echo "SOURCE_REPO default GITHUB_REPOSITORY"
  SOURCE_REPO=${GITHUB_REPOSITORY}
fi

if [ "${INPUT_SOURCE_HUB}" !=  "github.com" ]; then 
  print_info "SOURCE_HUB provided"
else
  echo "SOURCE_HUB default github.com"
fi

if [ "${INPUT_SOURCE_BRANCH}" != "master" ]; then 
  print_info "SOURCE_BRANCH provided"
else
  echo "SOURCE_BRANCH default master"
fi

if [ "${INPUT_SOURCE_DIR}" != "/" ]; then 
  print_info "SOURCE_DIR provided"
else
  echo "SOURCE_DIR default /"
fi

if [ "${INPUT_SOURCE_EDIT_TIME}" != "false" ]; then 
  print_info "SOURCE_EDIT_TIME provided"
else
  echo "SOURCE_EDIT_TIME default false"
fi

if [ "${INPUT_SOURCE_FILE_WITHOUT_PREFIX}" != "true" ]; then 
  print_info "SOURCE_EDIT_TIME provided"
else
  echo "SOURCE_FILE_WITHOUT_PREFIX default true"
fi

echo "--------------------"
echo "FOR publish"
echo "----------"

PUBLISH_TOKEN=""
if [ -n "${INPUT_PUBLISH_TOKEN}" ]; then
  print_info "PUBLISH_TOKEN provided"
  PUBLISH_TOKEN=${INPUT_PUBLISH_TOKEN}
else
  echo "PUBLISH_TOKEN default TOKEN"
  PUBLISH_TOKEN=${TOKEN}
fi

PUBLISH_GIT_EMAIL=""
if [ -n "${INPUT_PUBLISH_GIT_EMAIL}" ]; then 
  print_info "PUBLISH_GIT_EMAIL provided"
  PUBLISH_GIT_EMAIL=${INPUT_PUBLISH_GIT_EMAIL}
else
  echo "GIT_PUBLISH_EMAIL default GIT_EMAIL"
  PUBLISH_GIT_EMAIL=${GIT_EMAIL}
fi

PUBLISH_GIT_NAME=""
if [ -n "${INPUT_PUBLISH_GIT_NAME}" ]; then 
  print_info "PUBLISH_GIT_NAME provided"
  PUBLISH_GIT_NAME=${INPUT_PUBLISH_GIT_NAME}
else
  echo "PUBLISH_GIT_NAME default GIT_NAME"
  PUBLISH_GIT_NAME=${GIT_NAME}
fi

PUBLISH_REPO=""
if [ -n "${INPUT_PUBLISH_REPO}" ]; then 
  print_info "PUBLISH_REPO provided"
  PUBLISH_REPO=${INPUT_PUBLISH_REPO}
else
  echo "PUBLISH_REPO default GITHUB_REPOSITORY"
  PUBLISH_REPO=${GITHUB_REPOSITORY}
fi

PUBLISH_COMMIT_MESSAGE=""
if [ -n "${INPUT_PUBLISH_COMMIT_MESSAGE}" ]; then 
  print_info "PUBLISH_COMMIT_MESSAGE provided"
  PUBLISH_COMMIT_MESSAGE=${INPUT_PUBLISH_COMMIT_MESSAGE}
else
  echo "PUBLISH_COMMIT_MESSAGE default Updated by gitbook-action and time"
  PUBLISH_COMMIT_MESSAGE="Updated by gitbook-action `date '+%Y-%m-%d %H:%M:%S'`"
fi

if [ "${INPUT_PUBLISH_HUB}" != "github.com" ]; then 
  print_info "PUBLISH_HUB provided"
else
  echo "PUBLISH_HUB default github.com"
fi

if [ "${INPUT_PUBLISH_BRANCH}" != "gh-pages" ]; then 
  print_info "PUBLISH_BRANCH provided"
else
  echo "PUBLISH_BRANCH default gh-pages"
fi

if [ "${INPUT_PUBLISH_DIR}" != "/" ]; then 
  print_info "PUBLISH_DIR provided"
else
  echo "PUBLISH_DIR default /"
fi

if [ "${INPUT_PUBLISH_COMMIT_HISTORY}" != "true" ]; then 
  print_info "PUBLISH_COMMIT_HISTORY provided"
else
  echo "PUBLISH_COMMIT_HISTORY default true"
fi

if [ "${INPUT_PUBLISH_CNAME}" != "null" ]; then 
  print_info "PUBLISH_CNAME provided"
else
  echo "PUBLISH_CNAME default null"
fi

if [ "${INPUT_PUBLISH_NOJEKYLL}" != "false"  ]; then 
  print_info "PUBLISH_NOJEKYLL provided"
else
  echo "PUBLISH_NOJEKYLL default false"
fi

if [ "${INPUT_PUBLISH_PUSH_FORCE}" != "false" ]; then 
  print_info "PUBLISH_PUSH_FORCE provided"
else
  echo "PUBLISH_PUSH_FORCE default false"
fi

if [ "${INPUT_PUBLISH_REMOVE_LAST_BUILD}" != "true" ]; then 
  print_info "PUBLISH_REMOVE_LAST_BUILD provided"
else
  echo "PUBLISH_REMOVE_LAST_BUILD default true"
fi

if [ "${INPUT_PUBLISH_COMMIT_HISTORY}" = "false" ]; then
  print_warning "3305-0: Pay Attention:You allow push force"
  if [ "${INPUT_PUBLISH_PUSH_FORCE}" = "false" ]; then 
    print_error "3108:You set publish_commit_history:false , must set publish_push_force:true at same time"
  fi
fi



echo "--------------------"
echo "FOR Gitbook"
echo "----------"

if [ -n "${INPUT_GITBOOK_CLI_VERSION}" ]; then 
  print_info "GITBOOK_CLI_VERSION provided"
else
  echo "GITBOOK_CLI_VERSION default 2.3.2"
fi

GITBOOK_BUILD_VERSION=""
if [ -n "${INPUT_GITBOOK_VERSION}" ]; then
  echo "GITBOOK_VERSION provided, it will replace the version in book.json(if you set)"
  GITBOOK_BUILD_VERSION=${INPUT_GITBOOK_VERSION}
else
  echo "If you not set GITBOOK VERSION in book.json, it will DEFAULT 3.2.3"
fi

if [ "${INPUT_GITBOOK_PDF}" != "false" ]; then 
  print_info "GITBOOK_PDF provided"
  if [ "${INPUT_GITBOOK_PDF_DIR}" != "mybook" ]; then 
    print_info "GITBOOK_PDF_DIR provided"
  else
    echo "GITBOOK_PDF_DIR default mybook"
  fi
  if [ "${INPUT_GITBOOK_PDF_NAME}" != "ebook" ]; then 
    print_info "GITBOOK_PDF_NAME provided"
  else
    echo "GITBOOK_PDF_NAME default "
  fi
else
  echo "GITBOOK_PDF default false"
fi

if [ "${INPUT_GITBOOK_EPUB}" != "false" ]; then 
  print_info "GITBOOK_EPUB provided"
  if [ "${INPUT_GITBOOK_EPUB_DIR}" != "mybook" ]; then 
    print_info "GITBOOK_EPUB_DIR provided"
  else
    echo "GITBOOK_EPUB_DIR default mybook"
  fi
  if [ "${INPUT_GITBOOK_EPUB_NAME}" != "ebook" ]; then 
    print_info "GITBOOK_EPUB_NAME provided"
  else
    echo "GITBOOK_EPUB_NAME default "
  fi
else
  echo "GITBOOK_EPUB default false"
fi

if [ "${INPUT_GITBOOK_MOBI}" != "false" ]; then 
  print_info "GITBOOK_MOBI provided"
  if [ "${INPUT_GITBOOK_MOBI_DIR}" != "mybook" ]; then 
    print_info "GITBOOK_MOBI_DIR provided"
  else
    echo "GITBOOK_MOBI_DIR default mybook"
  fi
  if [ "${INPUT_GITBOOK_MOBI_NAME}" != "ebook" ]; then 
    print_info "GITBOOK_MOBI_NAME provided"
  else
    echo "GITBOOK_MOBI_NAME default "
  fi
else
  echo "GITBOOK_MOBI default false"
fi


# if need two source repo

if [ ${INPUT_SOURCE2_REPO} != "null" ]; then
  echo "--------------------"
  print_info "FOR source2  (SOURCE2_REPO provided)"
  SOURCE2_REPO=${INPUT_SOURCE2_REPO}
  echo "----------"
  SOURCE2_TOKEN=""
  if [ -n "${INPUT_SOURCE2_TOKEN}" ]; then 
    print_info "SOURCE2_TOKEN provided"
    SOURCE2_TOKEN=${INPUT_SOURCE2_TOKEN}
  else
    echo "SOURCE2_TOKEN default TOKEN"
    SOURCE2_TOKEN=${TOKEN}
  fi
  SOURCE2_GIT_NAME=""
  if [ -n "${INPUT_SOURCE2_GIT_NAME}" ]; then 
    print_info "SOURCE2_GIT_NAME provided"
    SOURCE2_GIT_NAME=${INPUT_SOURCE2_GIT_NAME}
  else
    echo "SOURCE2_GIT_NAME default GIT_NAME"
    SOURCE2_GIT_NAME=${GIT_NAME}
  fi
  if [ "${INPUT_SOURCE2_HUB}" != "github.com"  ]; then 
    print_info "SOURCE2_HUB provided"
  else
    echo "SOURCE2_HUB default github.com"
  fi
  if [ "${INPUT_SOURCE2_BRANCH}" != "master"  ]; then 
    print_info "SOURCE2_BRANCH provided"
  else
    echo "SOURCE2_BRANCH default master"
  fi
  if [ "${INPUT_SOURCE2_DIR}" != "/"  ]; then 
    print_info "SOURCE2_DIR provided"
  else
    echo "SOURCE2_DIR default /"
  fi
  if [ "${INPUT_SOURCE2_EDIT_TIME}" != "false"  ]; then 
    print_info "SOURCE2_EDIT_TIME provided"
  else
    echo "SOURCE2_EDIT_TIME default false"
  fi
  if [ "${INPUT_SOURCE2_FILE_WITHOUT_PREFIX}" != "true" ]; then 
    print_info "SOURCE2_EDIT_TIME provided"
  else
    echo "SOURCE2_FILE_WITHOUT_PREFIX default true"
  fi
else
  echo "SOURCE2 default false, if need you can use two source repo to build together"
fi


if [ ${INPUT_PUBLISH2_REPO} != "null" ]; then
  echo "--------------------"
  print_info "FOR publish2 (PUBLISH2_REPO provided)"
  PUBLISH2_REPO=${INPUT_PUBLISH2_REPO}
  echo "----------"
  PUBLISH2_TOKEN=""
  if [ -n "${INPUT_PUBLISH2_TOKEN}" ]; then  
    print_info "PUBLISH2_TOKEN provided"
    PUBLISH2_TOKEN=${INPUT_PUBLISH2_TOKEN}
  else
    echo "PUBLISH2_TOKEN default TOKEN"
    PUBLISH2_TOKEN=${TOKEN}
  fi
  PUBLISH2_GIT_EMAIL=""
  if [ -n "${INPUT_PUBLISH2_GIT_EMAIL}" ]; then 
    print_info "PUBLISH2_GIT_EMAIL provided"
    PUBLISH2_GIT_EMAIL=${INPUT_PUBLISH2_GIT_EMAIL}
  else
    echo "PUBLISH2_GIT_EMAIL default GIT_EMAIL"
    PUBLISH2_GIT_EMAIL=${GIT_EMAIL}
  fi
  PUBLISH2_GIT_NAME=""
  if [ -n "${INPUT_PUBLISH2_GIT_NAME}" ]; then 
    print_info "PUBLISH2_GIT_NAME provided"
    PUBLISH2_GIT_NAME=${INPUT_PUBLISH2_GIT_NAME}
  else
    echo "PUBLISH2_GIT_NAME default GIT_NAME"
    PUBLISH2_GIT_NAME=${GIT_NAME}
  fi
  if [ -n "${INPUT_PUBLISH2_COMMIT_MESSAGE}" ]; then 
    print_info "PUBLISH2_COMMIT_MESSAGE provided"
    PUBLISH2_COMMIT_MESSAGE=${INPUT_PUBLISH2_COMMIT_MESSAGE}
  else
    echo "PUBLISH3_COMMIT_MESSAGE default Updated by gitbook-action and time"
    PUBLISH2_COMMIT_MESSAGE="Updated by gitbook-action `date '+%Y-%m-%d %H:%M:%S'`"
  fi
  if [ "${INPUT_PUBLISH2_HUB}" != "github.com"  ]; then 
    print_info "PUBLISH2_HUB provided"
  else
    echo "PUBLISH2_HUB default github.com"
  fi
  if [ "${INPUT_PUBLISH2_BRANCH}" != "gh-pages"  ]; then 
    print_info "PUBLISH2_BRANCH provided"
  else
    echo "PUBLISH2_BRANCH default gh-pages"
  fi
  if [ "${INPUT_PUBLISH2_DIR}" != "/"  ]; then 
    print_info "PUBLISH2_DIR provided"
  else
    echo "PUBLISH2_DIR default /"
  fi
  if [ "${INPUT_PUBLISH2_COMMIT_HISTORY}" != "true"  ]; then 
    print_info "PUBLISH2_COMMIT_HISTORY provided"
  else
    echo "PUBLISH2_COMMIT_HISTORY default true"
  fi
  if [ "${INPUT_PUBLISH2_CNAME}" != "null"  ]; then 
    print_info "PUBLISH2_CNAME provided"
  else
    echo "PUBLISH2_CNAME default null"
  fi
  if [ "${INPUT_PUBLISH2_NOJEKYLL}" != "false"  ]; then 
    print_info "PUBLISH2_NOJEKYLL provided"
  else
    echo "PUBLISH2_NOJEKYLL default false"
  fi
  if [ "${INPUT_PUBLISH2_PUSH_FORCE}" != "false"  ]; then 
    print_info "PUBLISH2_PUSH_FORCE provided"
  else
    echo "PUBLISH2_PUSH_FORCE default false"
  fi
  if [ "${INPUT_PUBLISH2_REMOVE_LAST_BUILD}" != "true"  ]; then 
    print_info "PUBLISH2_REMOVE_LAST_BUILD provided"
  else
    echo "PUBLISH2_REMOVE_LAST_BUILD default true"
  fi
  if [ "${INPUT_PUBLISH2_COMMIT_HISTORY}" = "false" -a "${INPUT_PUBLISH2_PUSH_FORCE}" = "false" ]; then 
    print_error "3108-2:You set publish2_commit_history:false , must set publish2_push_force:true at same time"
  fi
else
  echo "PUBLISH2 default false, if need you can publish different repo/branch"
fi


if [ ${INPUT_PUBLISH3_REPO} != "null" ]; then
  echo "--------------------"
  print_info "FOR publish3 (PUBLISH3_REPO provided)"
  PUBLISH3_REPO=${INPUT_PUBLISH3_REPO}
  echo "----------"
  PUBLISH3_TOKEN=""
  if [ -n "${INPUT_PUBLISH3_TOKEN}" ]; then  
    print_info "PUBLISH3_TOKEN provided"
    PUBLISH3_TOKEN=${INPUT_PUBLISH3_TOKEN}
  else
    echo "PUBLISH3_TOKEN default TOKEN"
    PUBLISH3_TOKEN=${TOKEN}
  fi
  PUBLISH3_GIT_EMAIL=""
  if [ -n "${INPUT_PUBLISH3_GIT_EMAIL}" ]; then 
    print_info "PUBLISH3_GIT_EMAIL provided"
    GIT_PUBLISH_EMAIL=${INPUT_GIT_PUBLISH_EMAIL}
  else
    echo "PUBLISH3_GIT_EMAIL default GIT_EMAIL"
    GIT_PUBLISH_EMAIL=${GIT_EMAIL}
  fi
  PUBLISH3_GIT_NAME=""
  if [ -n "${INPUT_PUBLISH3_GIT_NAME}" ]; then 
    print_info "PUBLISH3_GIT_NAME provided"
    PUBLISH3_GIT_NAME=${INPUT_PUBLISH3_GIT_NAME}
  else
    echo "PUBLISH3_GIT_NAME default GIT_NAME"
    PUBLISH3_GIT_NAME=${GIT_NAME}
  fi
  PUBLISH3_COMMIT_MESSAGE=""
  if [ -n "${INPUT_PUBLISH3_COMMIT_MESSAGE}" ]; then 
    print_info "PUBLISH3_COMMIT_MESSAGE provided"
    PUBLISH3_COMMIT_MESSAGE=${INPUT_PUBLISH3_COMMIT_MESSAGE}
  else
    echo "PUBLISH3_COMMIT_MESSAGE default Updated by gitbook-action and time"
    PUBLISH3_COMMIT_MESSAGE="Updated by gitbook-action `date '+%Y-%m-%d %H:%M:%S'`"
  fi
  if [ "${INPUT_PUBLISH3_HUB}" != "github.com"  ]; then 
    print_info "PUBLISH3_HUB provided"
  else
    echo "PUBLISH3_HUB default github.com"
  fi
  if [ "${INPUT_PUBLISH3_BRANCH}" != "gh-pages"  ]; then 
    print_info "PUBLISH3_BRANCH provided"
  else
    echo "PUBLISH3_BRANCH default gh-pages"
  fi
  if [ "${INPUT_PUBLISH3_DIR}" != "/"  ]; then 
    print_info "PUBLISH3_DIR provided"
  else
    echo "PUBLISH3_DIR default /"
  fi
  if [ "${INPUT_PUBLISH3_COMMIT_HISTORY}" != "true"  ]; then 
    print_info "PUBLISH3_COMMIT_HISTORY provided"
  else
    echo "PUBLISH3_COMMIT_HISTORY default true"
  fi
  if [ "${INPUT_PUBLISH3_CNAME}" != "null"  ]; then 
    print_info "PUBLISH3_CNAME provided"
  else
    echo "PUBLISH3_CNAME default null"
  fi
  if [ "${INPUT_PUBLISH3_NOJEKYLL}" != "false"  ]; then 
    print_info "PUBLISH3_NOJEKYLL provided"
  else
    echo "PUBLISH3_NOJEKYLL default false"
  fi
  if [ "${INPUT_PUBLISH3_PUSH_FORCE}" != "false"  ]; then 
    print_info "PUBLISH3_PUSH_FORCE provided"
  else
    echo "PUBLISH3_PUSH_FORCE default false"
  fi
  if [ "${INPUT_PUBLISH3_REMOVE_LAST_BUILD}" != "true"  ]; then 
    print_info "PUBLISH3_REMOVE_LAST_BUILD provided"
  else
    echo "PUBLISH3_REMOVE_LAST_BUILD default true"
  fi
  if [ "${INPUT_PUBLISH3_COMMIT_HISTORY}" = "false" -a "${INPUT_PUBLISH3_PUSH_FORCE}" = "false" ] ; then 
    print_error "3108-3:You set publish3_commit_history:false , must set publish3_push_force:true at same time"
  fi
else
  echo "PUBLISH3 default false, if need you can publish different repo/branch"
fi

# install gitbook if not default version

echo "--------------------"
echo "FOR git node npm gitbook-cli"
echo "----------"

git config --global user.name ${GIT_NAME}
git config --global user.email ${GIT_EMAIL}
echo "git"
git --version
echo "node"
node --version
echo "npm"
npm --version
if [ -n "${INPUT_GITBOOK_CLI_VERSION}" ]; then 
  npm install gitbook-cli@${INPUT_GITBOOK_CLI_VERSION}  -g
else
  echo "gitbook-cli 2.3.2"
fi


######################## clone source ###################################3

# git clone source from repo/branch
# source is must have. source2 can be not 

echo "--------------------------------------------"
print_info "STEP2  git_clone_gitbook_source"
echo "---------------------"

mkdir local_source   #to store one or mix two source

git clone -b ${INPUT_SOURCE_BRANCH} https://${SOURCE_GIT_NAME}:${SOURCE_TOKEN}@${INPUT_SOURCE_HUB}/${SOURCE_REPO}.git  local_source_temp

if [ $? -eq 0 ]; then  # clone success

  if [ ${INPUT_SOURCE_EDIT_TIME} = "true" ]; then  # Some plugins need last edit time
    cd local_source_temp
    # https://serverfault.com/a/401450
    git ls-tree -r --name-only HEAD | while read filename; do
      touch -d  "$(git log -1 --pretty=format:"%ai"  -- $filename  )"  $filename ;
    done
    cd ..
    print_info "Message:Source git clone success and time set success"
  fi

  if [ ${INPUT_SOURCE_FILE_WITHOUT_PREFIX} = "true" ] ; then
    rm -rf local_source_temp/${INPUT_SOURCE_DIR}/.git  # remove the .git in source if exists
    cp -rfp local_source_temp/${INPUT_SOURCE_DIR}/.  local_source # move file without name like .nojekyll, may cause some error
  else
    cp -rfp local_source_temp/${INPUT_SOURCE_DIR}/*  local_source # move source with source2 to build together 
  fi

  if [ $? -eq 0 ]; then
    print_info "Message:Source git clone and move success, prepare to build"
  else  # git clone success but the gitbook source dir set wrong
    print_error "3102:Source git clone success, but not find gitbook-source file in ${INPUT_SOURCE_DIR}"
  fi

else  # can't git clone 1. no repo 2.no auth
  print_error "3103:Can't find this source_repo/branch, maybe not add token or source_token(with access) in gitbook_action.yml"
fi


# The following is the same with above .
# Can use loop, but for different function later, I'm not


if [ ${INPUT_SOURCE2_REPO} != "null" ]; then
  git clone -b ${INPUT_SOURCE2_BRANCH} https://${SOURCE2_GIT_NAME}:${SOURCE2_TOKEN}@${INPUT_SOURCE2_HUB}/${SOURCE2_REPO}.git  local_source2_temp 
  if [ $? -eq 0 ]; then
    if [ ${INPUT_SOURCE2_EDIT_TIME} = "true" ] ; then
      cd local_source2_temp
      git ls-tree -r --name-only HEAD | while read filename; do
        touch -d  "$(git log -1 --pretty=format:"%ai"  -- $filename )"  $filename ;
      done
      cd ..
      print_info "Message:Source2 time set success"
    fi

    if [ ${INPUT_SOURCE2_FILE_WITHOUT_PREFIX} = "true" ] ; then  # defaule true, remove file without name like .nojekyll, may cause some error
      rm -rf local_source2_temp/${INPUT_SOURCE2_DIR}/.git  # remove the .git in source if exists
      cp -rfp local_source2_temp/${INPUT_SOURCE2_DIR}/.  local_source 
    else
      cp -rfp local_source2_temp/${INPUT_SOURCE2_DIR}/*  local_source
    fi
    if [ $? -eq 0 ]; then
      print_warning "3301:Source2 git success. It will replace what we git before, when have same file"
    else
      print_error "3102-2:Source2 git clone success, but not find gitbook-source file in ${INPUT_SOURCE2_DIR}"
      
    fi

  else 
    print_error "3103-2:Can't find this source2_repo/branch, maybe not add token_source2(with access) in gitbook_action.yml"
    
  fi
fi

########################### clone publish branch ####################################
# maybe different repo and need history before or be a part of repo 

# git clone publish history, prepare for the gitbook build file is apart of other object

echo "--------------------------------------------"
print_info "STEP3  git_clone_history_publish"
echo "----------------------------"

git clone -b ${INPUT_PUBLISH_BRANCH} https://${PUBLISH_GIT_NAME}:${PUBLISH_TOKEN}@${INPUT_PUBLISH_HUB}/${PUBLISH_REPO}.git  local_publish 
if [ $? -eq 0 ]; then  # git clone this repo.branch success
  print_info "Message:publish git success"
else  # can't git clone this repo.branch try git clone this repo
  git clone  https://${PUBLISH_GIT_NAME}:${PUBLISH_TOKEN}@${INPUT_PUBLISH_HUB}/${PUBLISH_REPO}.git  local_publish 
  if [ $? -eq 0 ]; then # clone repo success, create new branch
    cd local_publish
    git checkout --orphan  ${INPUT_PUBLISH_BRANCH}
    git rm -rf .
    git add -A
    git commit -m "Initial commit"
    cd ..
    print_warning "3302:Can't find this publish_branch, but find this repo, we checkout new branch"
  else    # can't git clone 1. no repo 2.no auth
    print_error "3104:Can't find this publish_repo, maybe not add token or publish_token(with access) in gitbook_action.yml" 
    
  fi
fi

# The following is the same with above .
# Can use loop, but for different function later(like backup), I'm not
if [ ${INPUT_PUBLISH2_REPO} != "null" ]; then
  git clone -b ${INPUT_PUBLISH2_BRANCH} https://${PUBLISH2_GIT_NAME}:${PUBLISH2_TOKEN}@${INPUT_PUBLISH2_HUB}/${PUBLISH2_REPO}.git  local_publish2 
  if [ $? -eq 0 ]; then
    print_info "Message:publish2 git success"
  else
    git clone  https://${PUBLISH2_GIT_NAME}:${PUBLISH2_TOKEN}@${INPUT_PUBLISH2_HUB}/${PUBLISH2_REPO}.git  local_publish2 
    if [ $? -eq 0 ]; then
      cd local_publish2
      git checkout --orphan  ${INPUT_PUBLISH2_BRANCH}
      git rm -rf .
      git add -A
      git commit -m "Initial commit"
      cd ..
      print_warning "3302-2:Can't find this publish2_branch, but find this repo, we checkout new branch"
    else
      print_error "3104-2:Can't find this publish2_repo, maybe not add publish2_token(with access) in gitbook_action.yml" 
      
    fi
  fi
fi

if [ ${INPUT_PUBLISH3_REPO} != "null" ]; then
  git clone -b ${INPUT_PUBLISH3_BRANCH} https://${PUBLISH3_GIT_NAME}:${PUBLISH3_TOKEN}@${INPUT_PUBLISH3_HUB}/${PUBLISH3_REPO}.git  local_publish3 
  if [ $? -eq 0 ]; then
    print_info "Message:publish3 git success"
  else
    git clone  https://${PUBLISH3_GIT_NAME}:${PUBLISH3_TOKEN}@${INPUT_PUBLISH3_HUB}/${PUBLISH3_REPO}.git  local_publish3 
    if [ $? -eq 0 ]; then
      cd local_publish3
      git checkout --orphan  ${INPUT_PUBLISH3_BRANCH}
      git rm -rf .
      git add -A
      git commit -m "Initial commit"
      cd ..
      print_warning "3302-3:Can't find this publish3_branch, but find this repo, we checkout new branch"
    else
      print_error "3104-3:Can't find this publish3_repo, maybe not add publish3_token(with access) in gitbook_action.yml" 
      
    fi
  fi
fi

################ Build #################################3

echo "--------------------------------------------"
print_info "STEP4  build_gitbook_and_generate_file"
echo "-----------------------------------"


cd local_source
ls

# prepare install
if [ -n "${INPUT_PREPARE_INSTALL}" ]; then 
  print_info "Message:Runing user's prepare_install"
  ${INPUT_PREPARE_INSTALL}
  # just like npm i --unsafe-perm -g svgexport@0.3.2
  # which has been installed before ? -> https://hub.docker.com/r/zanderzhao/gitbook-action/dockerfile
else
  echo "no prepare_install"
fi

# install font
if ${INPUT_GITBOOK_PDF} || ${INPUT_GITBOOK_EPUB} || ${INPUT_GITBOOK_MOBI} ; then
  if [ -n "${INPUT_FONT_INSTALL}" ]; then 
    apt-get update
    apt-get install sudo -y
    print_info "Message:Runing user's font_install"
    ${INPUT_FONT_INSTALL}
    #sudo apt-get install fonts-noto-cjk
    #sudo apt-get install ttf-mscorefonts-installer
  else
    print_warning "3308:Not install any font, maybe affect the pdf/mobi/epub, can add font_install at book.json"
  fi
fi

# disable livereload.js
sed "s/\"livereload\"/\"-livereload\"/" <book.json >tmp && mv -f tmp book.json && cat book.json
print_info "Disable livereload.js online!"

gitbook build --gitbook=${GITBOOK_BUILD_VERSION}
if [ $? -eq 0 ]; then
  print_info "Message:gitbook built success"
else  # need plugins or README.md SUMMARY.md
  print_warning "3303:gitbook built fail, maybe need some file or plugins, now we try again"
  gitbook init
  gitbook install
  gitbook build --gitbook=${GITBOOK_BUILD_VERSION}
  if [ $? -eq 0 ]; then  # build again success with plugins
    print_info "Message:gitbook built success(with plugins)"
  else
    print_error "3105:gitbook built fail,please check is there something wrong with your book.json or others"
  fi
fi



# gitbook pdf
if ${INPUT_GITBOOK_PDF} ; then
  mkdir -p _book/${INPUT_GITBOOK_PDF_DIR}
  gitbook pdf ./  ./_book/${INPUT_GITBOOK_PDF_DIR}/${INPUT_GITBOOK_PDF_NAME}.pdf
fi
if ${INPUT_GITBOOK_EPUB} ; then
  mkdir -p _book/${INPUT_GITBOOK_EPUB_DIR}
  gitbook epub ./  ./_book/${INPUT_GITBOOK_EPUB_DIR}/${INPUT_GITBOOK_EPUB_NAME}.epub
fi
if ${INPUT_GITBOOK_MOBI} ; then
  mkdir -p _book/${INPUT_GITBOOK_MOBI_DIR}
  gitbook mobi ./  ./_book/${INPUT_GITBOOK_MOBI_DIR}/${INPUT_GITBOOK_MOBI_NAME}.mobi
fi
cd ..


echo "--------------------------------------------"
print_info "STEP5  push_to_pages"
echo "--------------------------------------------"

# remove cname in source or source2
# why? maybe use other src_repo which we can't  control whether it has cname before
# if need cname please add at config
if [ -f local_source/_book/CNAME ]; then 
  rm -rf local_source/_book/CNAME;
  if [ $? -eq 0 ]; then
    if [ "${INPUT_PUBLISH_CNAME}" != "null"  -o  "${INPUT_PUBLISH2_CNAME}" != "null"  -o  "${INPUT_PUBLISH3_CNAME}" != "null" ] ; then
      print_info "Message:Remove the CNAME(from source or source2) success"
    else
      print_warning "3304:Remove the CNAME(from source or source2), if need cname please add in gitbook_action.yml publish_cname:value"
    fi
  fi
fi

######################### For publish #########################################


###  need or not gitbook build history
#  I want use this config setting keep build history to get different time https://github.com/ZanderZhao/gitbook-action/issues/1
#  But I fine it can't work, because some plugins still use the time when the action git clone src
#  So I use https://github.com/Dream4ever/Knowledge-Base/issues/69 replace it like 'source_edit_time'
if [ ${INPUT_PUBLISH_REMOVE_LAST_BUILD} = "true" ] ; then
  cd local_publish
  git rm -rf --ignore-unmatch  ./${INPUT_PUBLISH_DIR}/*
#  git rm -rf --ignore-unmatch  ./${INPUT_PUBLISH_DIR}/.*
  cd ..
fi

# if branch is new, need pubilsh_dir(if not /)  or rm by this action before
# this is below INPUT_PUBLISH_REMOVE_LAST_BUILD -> https://github.com/ZanderZhao/gitbook-action/issues/5
if [ ! -d "./local_publish/${INPUT_PUBLISH_DIR}" ] ; then
  mkdir ./local_publish/${INPUT_PUBLISH_DIR} 
fi

# move build file to each publish dir
cp -rfp local_source/_book/.  local_publish/${INPUT_PUBLISH_DIR}

cd local_publish

# add CNAME which set in gitbook_action.yml
if [ "${INPUT_PUBLISH_CNAME}" != "null" ]; then  # CNAME
  # can set different cname with '\n' or '  ' between them
  echo "${INPUT_PUBLISH_CNAME}" | sed 's/ /\n/g' | sed '/^[  ]*$/d' > CNAME
  if [ $? -eq 0 ]; then
    print_info "Message:Create CNAME success"
  fi
fi

# may push sucessfully, but built fail, try use this option in config -> https://github.com/ZanderZhao/gitbook-action/issues/4
if [ "${INPUT_PUBLISH_NOJEKYLL}" != "false" ]; then  # add .nojekyll
  touch .nojekyll
  if [ $? -eq 0 ]; then
    print_info "Message:Create .nojekyll for Publish success"
  fi
fi

# git config
# maybe someone need different name for publish
git config --local user.name ${PUBLISH_GIT_NAME}
git config --local user.email ${PUBLISH_GIT_EMAIL}

# git commit
#  need or not  publish commit history
if [ ${INPUT_PUBLISH_COMMIT_HISTORY} = "false" ]  ; then # Clean commit history
  # https://stackoverflow.com/a/26000395
  # Checkout
  git checkout --orphan latest_branch
  # Add all the files
  git add .
  # Commit the changes
  git commit -am "${PUBLISH_COMMIT_MESSAGE}"
  # Delete the branch
  git branch -D ${INPUT_PUBLISH_BRANCH}
  # Rename the current branch
  git branch -m ${INPUT_PUBLISH_BRANCH}
  # Finally, force update your repository
  # git push -f origin master
  # --------
  #  rm -rf ./.git
  #  git init
  #  git checkout -b ${INPUT_PUBLISH_BRANCH}
  print_info "Message:Clean commit history success"
else
  git add .
  git commit -m "${PUBLISH_COMMIT_MESSAGE}"
fi


# git push
git push https://${PUBLISH_GIT_NAME}:${PUBLISH_TOKEN}@${INPUT_PUBLISH_HUB}/${PUBLISH_REPO}.git  ${INPUT_PUBLISH_BRANCH}:${INPUT_PUBLISH_BRANCH}
if [ $? -eq 0 ]; then
  print_info "Message:publish success"
elif [ ${INPUT_PUBLISH_PUSH_FORCE}  = "true" ]  ; then  # try push force
  print_warning "3305:Can't push publish_repo/branch, try push force"
    git push --force https://${PUBLISH_GIT_NAME}:${PUBLISH_TOKEN}@${INPUT_PUBLISH_HUB}/${PUBLISH_REPO}.git  ${INPUT_PUBLISH_BRANCH}:${INPUT_PUBLISH_BRANCH}
    if [ $? -eq 0 ]; then
      print_warning "3306:Push force success"
    else
      print_error "3106:Can't push publish_repo/branch, maybe not add publish_token(with access) in gitbook_action.yml"
    fi
else
  print_error "3107:Can't push publish_repo/branch, maybe not add publish_token(with access) in gitbook_action.yml or try set publish_push_force true"
fi
cd ..


######################### For publish2 #########################################
# why publish2 exists ? maybe someone need publish for different place, eg gitlib.
# The following is the same with above except if.
# Can use loop, but for different function later(like backup), I'm not now

if [ ${INPUT_PUBLISH2_REPO} != "null" ]; then

#  need or not gitbook build history
  if  [ ${INPUT_PUBLISH2_REMOVE_LAST_BUILD} = "true" ]  ; then
    cd local_publish2
    git rm -rf --ignore-unmatch  ./${INPUT_PUBLISH2_DIR}/*
#    git rm -rf --ignore-unmatch  ./${INPUT_PUBLISH2_DIR}/.*
    cd ..
  fi

  if [ ! -d "./local_publish2/${INPUT_PUBLISH2_DIR}" ]; then
    mkdir ./local_publish2/${INPUT_PUBLISH2_DIR}
  fi

  cp -rfp local_source/_book/.  local_publish2/${INPUT_PUBLISH2_DIR}
  cd local_publish2

  if [ "${INPUT_PUBLISH2_CNAME}" != "null" ]; then  # CNAME
    echo "${INPUT_PUBLISH2_CNAME}" | sed 's/ /\n/g' | sed '/^[  ]*$/d' > CNAME
    if [ $? -eq 0 ]; then
      print_info "Message:Create Publish2_CNAME success"
    fi
  fi
  if [ "${INPUT_PUBLISH2_NOJEKYLL}" != "false" ]; then  # add .nojekyll
    touch .nojekyll
    if [ $? -eq 0 ]; then
      print_info "Message:Create .nojekyll for Publish2 success"
    fi
  fi


  git config --local user.name ${PUBLISH2_GIT_NAME}
  git config --local user.email ${PUBLISH2_GIT_EMAIL}

  if [ ${INPUT_PUBLISH2_COMMIT_HISTORY}  = "false" ] ; then 
    git checkout --orphan latest_branch
    git add .
    git commit -am "${PUBLISH2_COMMIT_MESSAGE}"
    git branch -D ${INPUT_PUBLISH2_BRANCH}
    git branch -m ${INPUT_PUBLISH2_BRANCH}
    print_info "Message:Clean publish2 commit history sucess"
  else
    git add .
    git commit -m "${PUBLISH2_COMMIT_MESSAGE}"
  fi

  git push https://${PUBLISH2_GIT_NAME}:${PUBLISH2_TOKEN}@${INPUT_PUBLISH2_HUB}/${PUBLISH2_REPO}.git  ${INPUT_PUBLISH2_BRANCH}:${INPUT_PUBLISH2_BRANCH}
  if [ $? -eq 0 ]; then
    print_info "Message:publish2 success"
  elif [ ${INPUT_PUBLISH2_PUSH_FORCE}  = "true" ] ; then
    print_warning "3305-2:Can't push publish2_repo/branch, try push force"
      git push --force https://${PUBLISH2_GIT_NAME}:${PUBLISH2_TOKEN}@${INPUT_PUBLISH2_HUB}/${PUBLISH2_REPO}.git  ${INPUT_PUBLISH2_BRANCH}:${INPUT_PUBLISH2_BRANCH}
      if [ $? -eq 0 ]; then
        print_warning "3306-2:Push force success"
      else
        print_error "3016-2:Can't push publish2_repo/branch, maybe not add publish2_token(with access) in gitbook_action.yml"
        
      fi
  else
    print_error "3017-2:Can't push publish2_repo/branch, maybe not add publish2_token(with access) in gitbook_action.yml or try set publish2_push_force true"
  fi
  cd ..
fi

######################### For publish3 #########################################

if [ ${INPUT_PUBLISH3_REPO} != "null" ]; then



#  need or not gitbook build history
  if  [ ${INPUT_PUBLISH3_REMOVE_LAST_BUILD} = "true" ]  ; then
    cd local_publish3
    git rm -rf --ignore-unmatch  ./${INPUT_PUBLISH3_DIR}/*
#    git rm -rf --ignore-unmatch  ./${INPUT_PUBLISH3_DIR}/.*
    cd ..
  fi

  if [ ! -d "./local_publish3/${INPUT_PUBLISH3_DIR}" ]; then
    mkdir ./local_publish3/${INPUT_PUBLISH3_DIR}
  fi
  
  cp -rfp local_source/_book/.  local_publish3/${INPUT_PUBLISH3_DIR}
  cd local_publish3

  if [ "${INPUT_PUBLISH3_CNAME}" != "null" ]; then  # CNAME
    echo "${INPUT_PUBLISH3_CNAME}" | sed 's/ /\n/g' | sed '/^[  ]*$/d' > CNAME
    if [ $? -eq 0 ]; then
      print_info "Message:Create Publish3_CNAME success"
    fi
  fi

  if [ "${INPUT_PUBLISH3_NOJEKYLL}" != "false" ]; then  # add .nojekyll
    touch .nojekyll
    if [ $? -eq 0 ]; then
      print_info "Message:Create .nojekyll for Publish3 success"
    fi
  fi

  git config --local user.name ${PUBLISH3_GIT_NAME}
  git config --local user.email ${PUBLISH3_GIT_EMAIL}

  if [ ${INPUT_PUBLISH3_COMMIT_HISTORY}  = "false" ] ; then 
    git checkout --orphan latest_branch
    git add .
    git commit -am "${PUBLISH3_COMMIT_MESSAGE}"
    git branch -D ${INPUT_PUBLISH3_BRANCH}
    git branch -m ${INPUT_PUBLISH3_BRANCH}
    print_info "Message:Clean publish3 commit history sucess"
  else
    git add .
    git commit -m "${PUBLISH3_COMMIT_MESSAGE}"
  fi


  git push https://${PUBLISH3_GIT_NAME}:${PUBLISH3_TOKEN}@${INPUT_PUBLISH3_HUB}/${PUBLISH3_REPO}.git  ${INPUT_PUBLISH3_BRANCH}:${INPUT_PUBLISH3_BRANCH}
  if [ $? -eq 0 ]; then
    print_info "Message:publish3 success"
  elif [ ${INPUT_PUBLISH3_PUSH_FORCE}  = "true" ] ; then
    print_warning "3305-3:Can't push publish3_repo/branch, try push force"
      git push --force https://${PUBLISH3_GIT_NAME}:${PUBLISH3_TOKEN}@${INPUT_PUBLISH3_HUB}/${PUBLISH3_REPO}.git  ${INPUT_PUBLISH3_BRANCH}:${INPUT_PUBLISH3_BRANCH}
      if [ $? -eq 0 ]; then
        print_warning "3306-3:Push force success"
      else
        print_error "3016-3:Can't push publish3_repo/branch, maybe not add publish3_token(with access) in gitbook_action.yml"
        
      fi
  else
    print_error "3017-3:Can't push publish3_repo/branch, maybe not add publish3_token(with access) in gitbook_action.yml or try set publish3_push_force true"
  fi
  cd ..
fi

# TODO prepare for other gitbook action (if two or more gitbook-action in one action)(local_source exists), 
# but at same time remove the plugins file (node_modules) for cache, maybe can remove to one place

if [ "${INPUT_NOT_CLEAN}" = "false" ]; then 
  rm -rf local_source
  rm -rf local_source_temp
  rm -rf local_source2_temp
  rm -rf local_publish
  rm -rf local_publish2
  rm -rf local_publish3
  if [ $? -eq 0 ]; then
    print_info "Message:Clean success"
  fi
else
  print_warning "3307:NOT_CLEAN set true, if two gitbook-action in one workflow may run fatal. If don't use cache, (source build file-->node_modules), please set false(Default), and CLEAN is not remove gitbook-cli and gitbook"
fi
