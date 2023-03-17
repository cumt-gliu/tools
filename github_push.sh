#!/bin/bash
bash_path=$1

commit_message="atuo commit from ["$USER"]"
echo $commit_message

for file in $bash_path/*; do
	# 判断是否是目录并且是git仓库
    if test -d $file && test -d "$file/.git/"
    then
    	# 进入仓库执行git命令
    	cd $file
    	# 获取当前分支
    	current_branch=`git branch --show-current`
    	echo "path = $file + current_branch = $current_branch"
    	git pull --rebase origin $current_branch
    	echo "pull origin branch success!"
    	git add .
    	git commit -m "$commit_message"
    	git push origin $current_branch
    	echo "push ${current_branch} to remote success!"
    	cd -
    else
    	echo $file 不是目录
    fi
done


