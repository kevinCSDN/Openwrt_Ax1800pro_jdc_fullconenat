#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '1i src-git kiddin https://github.com/kiddin9/openwrt-packages' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
./scripts/feeds install -a 
#rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}

git clone https://github.com/kiddin9/openwrt-packages
shopt -s extglob
#rm -rf openwrt-packages/!luci-app-netdata
cp -r openwrt-packages/{luci-app-netdata,firewall4,luci-app-fullconenat} package/
rm -rf openwrt-packages

rm -rf package/network/config/firewall
git clone https://github.com/fullcone-nat-nftables/openwrt-firewall4-with-fullcone.git package/network/config/firewall


git clone https://github.com/f8q8/luci-app-autoreboot package/luci-app-autoreboot
./scripts/feeds install -a 
