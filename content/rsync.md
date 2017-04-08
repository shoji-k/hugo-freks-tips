+++
title = "rsync"
draft = false
date = "2017-04-08T13:39:07+09:00"
categories = [ "engineer" ]
tags = [ "aws", "ecr" ]

+++

# backup remote files

$ rsync --exclude="/src/app/cache" --exclude=".git" --exclude=".gitignore" -rltuvz sample:/var/www/html ./
