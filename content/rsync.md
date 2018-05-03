+++
title = "rsync"
draft = false
date = "2017-04-08T13:39:07+09:00"
categories = [ "engineer" ]
tags = [ "aws", "ecr" ]

+++

# backup remote files

$ rsync -C --filter=":- .gitignore" --exclude="/src/app/cache" --exclude=".git" --exclude=".gitignore" -rltuvz sample:/var/www/html ./

-C --filter=":- .gitignore" auto-ignore files in the same way CVS does  
-r recursive  
-l copy symlinks  
-t preserve modification time  
-u skip file that are newer  
-v verbose  
-z compress  

-n dry run  
--delete 手元で消したファイルを向こう側でも消す  
