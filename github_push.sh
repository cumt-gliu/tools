#!/bin/bash
bash_path=$1

echo "需要提交代码的仓库路径: $bash_path"

for file in $bash_path/*; do
	# 判断是否是目录并且是git仓库
    if test -d $file && test -d "$file/.git/"
    then
    	# 进入仓库执行git命令
    	cd $file
    	# 获取当前分支
    	current_branch=`git branch --show-current`
    	echo "current_branch = $current_branch"
    	git add .
    	git commit -m "auto commit from ["$USER"]"
    	git push origin current_branch
    	cd -
    else
    	echo $file 不是目录
    fi
done



