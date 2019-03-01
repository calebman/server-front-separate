# 概述

项目为博客[前后端分离开发模式的实践总结](https://calebman.github.io/2019-02-23-server-front-separate/)对应的源代码

# 目录结构

* front：前端项目
* server：后端项目
* dist：运行脚本以及打包目录

# 如何运行

```bash
# 后端打包
cd server/
mvn clean package
# 前端打包
cd ..
cd front/
npm run build
# 启动后台 生产环境
cd ..
cd dist/
sh ./bin/start.sh prod
# 启动nginx / 指向 dist/html
```

# 详情请见博客描述

[**点此进入**](https://calebman.github.io/2019-02-23-server-front-separate/)

