#!/usr/bin/env bash

## Hexo模组 Hexo moudle

install_hexo(){
TERM=ansi whiptail --title "安装中" --infobox "安装Hexo中..." 7 68
  colorEcho ${INFO} "Install Hexo ing..."
  cd /usr/share/nginx
  npm install -g npm
  npm install hexo-cli -g
  npm update
  hexo init hexo
  cd /usr/share/nginx/hexo
  npm audit fix
  npm prune
  hexo new page ${password1}
  cd /usr/share/nginx/hexo/themes
  git clone https://github.com/theme-next/hexo-theme-next next
  cd /usr/share/nginx/hexo
  npm install hexo-generator-feed --save
  npm i hexo-filter-nofollow --save
    cat > '/usr/share/nginx/hexo/_config.yml' << EOF
#title: xxx's Blog
#author: xxx
language: zh-tw
url: https://${domain}
theme: next
post_asset_folder: true
feed:
  type: atom
  path: atom.xml
  limit: 20
  hub:
  content: true
  content_limit: 140
  content_limit_delim: ' '
  order_by: -date
  icon: icon.png
  autodiscovery: true
  template:
nofollow:
  enable: true
  field: site
  exclude:
    - 'exclude1.com'
    - 'exclude2.com'
EOF
cd /usr/share/nginx/hexo/source/${password1}
if [[ -f index.md ]]; then
  rm index.md
fi
cat > "index.md" << EOF
---
title: VPS Toolbox Result
---
Welcome to [VPSToolBox](https://github.com/johnrosen1/vpstoolbox)! This page is generated by [Hexo](https://hexo.io/zh-tw/docs/) and you can ask me on [Telegram](https://t.me/vpstoolbox_chat).

欢迎使用[VPSToolBox](https://github.com/johnrosen1/vpstoolbox) ! 此页面由[Hexo](https://hexo.io/zh-tw/docs/)全自动生成,如果你在使用VPSToolBox时遇到任何问题,请仔细阅读以下所有链接以及信息或者**通过 [Telegram](https://t.me/vpstoolbox_chat)请求支援** !

> *如果你安装的时候没有选择相应的软件，请自行忽略相关内容 ❗*

**以下所有链接以及信息都是有用的，请在提任何问题或者issue前仔细阅读相关内容,否则你的issue将会被立即关闭 ❗**

***⚠️WARNING⚠️请不要自行修改默认配置,除非你知道你在做什么 ❗❗❗***

---

### Trojan-GFW

*默认安装: ✅*

> Introduction: An unidentifiable mechanism that helps you bypass GFW.

PS: ***不支援Cloudflare CDN ❗***

#### Trojan-GFW client config profiles(客户端配置文件)

1. <a href="https://$domain/client1-$password1.json" target="_blank" rel="noreferrer">Profile 1</a>
2. <a href="https://$domain/client2-$password2.json" target="_blank" rel="noreferrer">Profile 2</a>

#### Trojan-GFW Share Links

1. trojan://$password1@$domain:443
2. trojan://$password2@$domain:443

#### Trojan-GFW QR codes(二维码) (不支援python3-qrcode的系统会404!)

1. <a href="https://$domain/$password1.png" target="_blank">QR code 1</a>
2. <a href="https://$domain/$password2.png" target="_blank">QR code 2</a>

#### 相关链接(重要!)

1. <a href="https://github.com/trojan-gfw/igniter/releases" target="_blank" rel="noreferrer">Android client</a> 安卓客户端
2. <a href="https://apps.apple.com/us/app/shadowrocket/id932747118" target="_blank" rel="noreferrer">ios client</a>苹果客户端
3. <a href="https://github.com/trojan-gfw/trojan/releases/latest" target="_blank" rel="noreferrer">windows client</a>windows客户端
4. <a href="https://github.com/NetchX/Netch" target="_blank" rel="noreferrer">https://github.com/NetchX/Netch</a>推荐的**游戏**客户端
5. <a href="https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif" target="_blank" rel="noreferrer">Proxy SwitchyOmega</a>
6. <a href="https://github.com/gfwlist/gfwlist/blob/master/gfwlist.txt" target="_blank" rel="noreferrer">Gfwlist(请配合SwichyOmega食用)</a>

---

### Nextcloud

*默认安装: ❎*

<a href="https://$domain/nextcloud/" target="_blank" rel="noreferrer">https://$domain/nextcloud/</a>
- 用户名(username): **admin**
- 密碼(password): **${password1}**

PS: 推荐自行参考GitHub相关内容修正Nextcloud配置文件。

---

### Hexo

*默认安装: ✅*

> 简介: 快速、簡單且強大的網誌框架。

#### Hexo location

{% blockquote %}
cd /usr/share/nginx/hexo/source/_posts/
{% endblockquote %}

{% blockquote %}
hexo new post title(标题)
{% endblockquote %}

{% blockquote %}
hexo g && hexo d
{% endblockquote %}

#### Docs

1. <a href="https://hexo.io/zh-tw/docs/" target="_blank" rel="noreferrer">Hexo docs</a>
2. <a href="https://www.typora.io" target="_blank" rel="noreferrer">A new way to read & write Markdown</a>

---
### Rsshub + TT-RSS

*默认安装: ❎*

> 简介: RSSHUB + Tiny Tiny RSS。

#### RSSHUB

<a href="https://$domain/${password1}_rsshub/" target="_blank" rel="noreferrer">https://$domain/${password1}_rsshub/</a>

#### Tiny Tiny RSS

- <a href="https://$domain/ttrss/" target="_blank" rel="noreferrer">https://$domain/ttrss/</a>
- 用户名(username): **admin**
- 密碼(password): **password**

> *请自行修改初始密码！*

---

### Qbittorrent Enhanced Version

*默认安装: ❎*

> 简介: 一款用于 **下载bt资源到你的VPS上** 的软件

Introduction: download resources you want to your vps(support bt only but extremely fast)

- <a href="https://$domain$qbtpath" target="_blank" rel="noreferrer">https://$domain$qbtpath</a>
- 用户名(username): admin
- 密碼(password): adminadmin

> *请自行修改初始用户名和密码！*

#### Tips:

1. 请将Bittorrent加密選項改为 ***強制加密(Require encryption)***！
2. 请手动修改Trackers源为 <a href="https://trackerslist.com/all.txt" target="_blank" rel="noreferrer">https://trackerslist.com/all.txt</a>

---

### Aria2

*默认安装: ❎*

> 简介: 将任何你想下载的东西(支援http/https/ftp/bt等,不支援emule/ed2k)**下载到你的VPS**上的软件。

PS: 推荐使用**Ariang**连接(aria2没有官方web interface!)

#### Aria2

- https://$domain:443$ariapath
- 密碼(token): **$ariapasswd**
- **<a href="https://github.com/mayswind/AriaNg/releases" target="_blank" rel="noreferrer">AriaNG</a>**
- <a href="https://play.google.com/store/apps/details?id=com.gianlu.aria2app" target="_blank" rel="noreferrer">Aria2 for Android</a>

---

### Filebrowser

*默认安装: ❎*

> 简介: 一款 **从VPS上下载资源(在aria2/qbt下载完成后)到本地网络** 的软件。

Introduction: download any resources(formaly downloaded by qbt or aria2) from your vps to your local network

#### Filebrowser

- <a href="https://$domain:443$filepath" target="_blank" rel="noreferrer">https://$domain$filepath</a>
- 用户名(username): **admin**
- 密碼(token): **admin**

> *请自行修改初始用户名和密码！*

---

### Speedtest

*默认安装: ❎*

> 简介: 一款 **测试本地网络到VPS的延迟及带宽** 的应用。

Introduction: test download and upload speed from vps to your local network.

#### Speedtest

- <a href="https://$domain:443/${password1}_speedtest/" target="_blank" rel="noreferrer">https://$domain/${password1}_speedtest/</a>

---

### Netdata

*默认安装: ✅*

> 简介: 一款 **实时效能监测工具** 应用。

> Introduction: Open-source, distributed, real-time, performance and health monitoring for systems and applications.

#### Netdata

- <a href="https://$domain:443$netdatapath" target="_blank" rel="noreferrer">https://${domain}${netdatapath}</a>

---

### Rocket Chat

*默认安装: ❎*

> 简介: 聊天应用。

Introduction: just like discord.

- <a href="https://$domain:443/rocketchat/" target="_blank" rel="noreferrer">https://$domain/rocketchat/</a>

---

### Tor Service

*默认安装: ❎*

> 简介: 自建的onion站点。

> Introduction: self-build onion site.

${torhostname}

---

### i2p Service

*默认安装: ❎*

> 简介: 自建的i2p站点。

> Introduction: self-build onion site.

- <a href="https://$domain:443/${password1}_i2p/" target="_blank" rel="noreferrer">https://$domain/${password1}_i2p/</a>

---

### Mail Service

*默认安装: ❎*

***⚠️WARNING⚠️请不要自行修改任何邮件配置,除非你知道你在做什么 ❗❗❗***

> 简介: 邮件软件。

> Introduction: Mail Service

PS: 不支援自定义证书,仅支援全自动申请的let证书!

#### Roundcube Webmail

- <a href="https://${domain}/mail/" target="_blank" rel="noreferrer">Roundcube Webmail</a>
- 用户名(username): **${mailuser}**
- 密碼(password): **${password1}**
- 收件地址: **${mailuser}@${domain}**

#### Tips:

1. 阿里云，gcp等厂商默认不开放25(包括对外访问)端口，不能发邮件，请注意。
2. 请自行添加SPF(TXT) RECORD: v=spf1 mx ip4:${myip} a ~all
3. 请自行运行sudo cat /etc/opendkim/keys/${domain}/default.txt 来获取生成的DKIM(TXT) RECORD

---

### Bittorrent-trackers

*默认安装: ❎*

> 简介: Bittorrent-tracker , 可作为私人或公开Bt-tracker。

> Introduction: Bittorrent-tracker as private or public.

#### Bittorrent-trackers

udp://$domain:6969/announce

#### Info link

<a href="https://$domain/tracker/" target="_blank" rel="noreferrer">https://$domain/tracker/</a>

#### Tips:

1. 请手动将此Tracker添加于你的BT客户端中，发布种子时记得填上即可。
2. 请记得将此Tracker分享给你的朋友们。

---

### MariaDB

*默认安装: ❎*

> 简介: MariaDB 数据库。

> Introduction: MariaDB Database.

无默认root密码,为了安全起见,外网访问已禁用,请直接使用以下命令访问数据库！

{% blockquote %}
mysql -u root
{% endblockquote %}

如果需要外网访问,请自行注释掉/etc/mysql/my.cnf中的bind-address选项并重启mariadb！

Please edit /etc/mysql/my.cnf and restart mariadb if you need remote access !

---

### 相关链接

##### Qbt相关链接

1. <a href="https://www.qbittorrent.org/download.php" target="_blank" rel="noreferrer">win等平台下载页面</a>
2. <a href="https://github.com/qbittorrent/qBittorrent" target="_blank" rel="noreferrer">Github页面</a>
3. <a href="https://play.google.com/store/apps/details?id=com.lgallardo.qbittorrentclientpro" target="_blank" rel="noreferrer">Android远程操控客户端</a>
4. <a href="https://www.qbittorrent.org/" target="_blank" rel="noreferrer">https://www.qbittorrent.org/</a>
1. <a href="https://thepiratebay.org/" target="_blank" rel="noreferrer">https://thepiratebay.org/</a>
2. <a href="https://sukebei.nyaa.si/" target="_blank" rel="noreferrer">https://sukebei.nyaa.si/</a></li>
3. <a href="https://rarbgprx.org/torrents.php" target="_blank" rel="noreferrer">https://rarbgprx.org/torrents.php</a>

##### Rsshub相关链接

1. <a href="https://docs.rsshub.app/" target="_blank" rel="noreferrer">RSSHUB docs</a>
2. <a href="https://github.com/DIYgod/RSSHub-Radar" target="_blank" rel="noreferrer">RSSHub Radar</a>(推荐自行将默认的rsshub.app换成上述自建的)
3. <a href="https://docs.rsshub.app/social-media.html" target="_blank" rel="noreferrer">RSSHUB路由</a>
4. <a href="https://wzfou.com/tt-rss/" target="_blank" rel="noreferrer">自建RSS阅读器Tiny Tiny RSS安装和配置自动更新</a>(仅供参考 !)

*[提问的智慧](https://github.com/ryanhanwu/How-To-Ask-Questions-The-Smart-Way/blob/master/README-zh_CN.md)*

##### Aria相关链接

1. <a href="https://github.com/aria2/aria2" target="_blank" rel="noreferrer">https://github.com/aria2/aria2</a>
2. <a href="https://aria2.github.io/manual/en/html/index.html" target="_blank" rel="noreferrer">https://aria2.github.io/manual/en/html/index.html</a> 官方文档

##### Filebrowser相关链接

1. <a href="https://github.com/filebrowser/filebrowser" target="_blank" rel="noreferrer">https://github.com/filebrowser/filebrowser</a>
2. <a href="https://filebrowser.xyz/" target="_blank" rel="noreferrer">https://filebrowser.xyz/</a>


##### Speedtest相关链接

1. <a href="https://github.com/librespeed/speedtest" target="_blank" rel="noreferrer">https://github.com/librespeed/speedtest</a>

##### Netdata相关链接

1. <a href="https://play.google.com/store/apps/details?id=com.kpots.netdata" target="_blank" rel="noreferrer">https://play.google.com/store/apps/details?id=com.kpots.netdata</a>安卓客户端
2. <a href="https://github.com/netdata/netdata" target="_blank" rel="noreferrer">https://github.com/netdata/netdata</a>

##### Mail服务相关链接

1. <a href="https://www.mail-tester.com/" target="_blank" rel="noreferrer">https://www.mail-tester.com/</a>
2. <a href="https://lala.im/6838.html" target="_blank" rel="noreferrer">Debian10使用Postfix+Dovecot+Roundcube搭建邮件服务器</a>(仅供参考!)
EOF
cd
hexo_location=$(which hexo)
    cat > '/etc/systemd/system/hexo.service' << EOF
[Unit]
Description=Hexo Server Service
Documentation=https://hexo.io/zh-tw/docs/
After=network.target

[Service]
WorkingDirectory=/usr/share/nginx/hexo
ExecStart=${hexo_location} server -i 127.0.0.1
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable hexo
systemctl restart hexo
}
