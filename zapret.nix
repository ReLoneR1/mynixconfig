{ config, pkgs, zapret_drafts, ... }:

{
  imports = [
    "${zapret_drafts}/nixos/modules/services/networking/zapret.nix"
  ];
  disabledModules = [
    "services/networking/zapret.nix"
  ];

  services.zapret = {
    enable = true;
    params = [
      "--dpi-desync=fake --dpi-desync-ttl=3"
      "--dpi-desync-any-protocol"
    ];
    udpSupport = true;
    udpPorts = [
      "50000:50100"
      "443"
      "80"
    ];
    whitelist = [
      "archon.gg"
      #github.com/Flowseal/zapret-discord-youtube/blob/main/list-general.txt
      "googlevideo.com"
      "youtu.be"
      "youtube.com"
      "youtubei.googleapis.com"
      "youtubeembeddedplayer.googleapis.com"
      "ytimg.l.google.com"
      "ytimg.com"
      "jnn-pa.googleapis.com"
      "youtube-nocookie.com"
      "youtube-ui.l.google.com"
      "yt-video-upload.l.google.com"
      "wide-youtube.l.google.com"
      "youtubekids.com"
      "ggpht.com"
      "discord.com"
      "gateway.discord.gg"
      "cdn.discordapp.com"
      "discordapp.net"
      "discordapp.com"
      "discord.gg"
      "media.discordapp.net"
      "images-ext-1.discordapp.net"
      "discord.app"
      "discord.media"
      "discordcdn.com"
      "discord.dev"
      "discord.new"
      "discord.gift"
      "discordstatus.com"
      "dis.gd"
      "discord.co"
      "discord-attachments-uploads-prd.storage.googleapis.com"
      "7tv.app"
      "7tv.io"
      "10tv.app"
      "cloudflare-ech.com"
    ];
    iplist = [
      "5.200.14.249"
      "18.165.140.0/25"
      "23.227.38.74"
      "34.0.48.0/24"
      "34.0.49.64/26"
      "34.0.50.0/25"
      "34.0.51.0/24"
      "34.0.52.0/22"
      "34.0.56.0/23"
      "34.0.59.0/24"
      "34.0.60.0/24"
      "34.0.62.128/25"
      "34.0.63.228"
      "34.0.64.0/23"
      "34.0.66.130"
      "34.0.82.140"
      "34.0.129.128/25"
      "34.0.130.0/24"
      "34.0.131.130"
      "34.0.132.139"
      "34.0.133.75"
      "34.0.134.0/24"
      "34.0.135.251"
      "34.0.136.51"
      "34.0.137.0/24"
      "34.0.139.0/24"
      "34.0.140.0/23"
      "34.0.142.0/25"
      "34.0.144.0/23"
      "34.0.146.0/24"
      "34.0.148.25"
      "34.0.149.101"
      "34.0.151.0/25"
      "34.0.153.0/24"
      "34.0.155.0/24"
      "34.0.156.101"
      "34.0.157.0/25"
      "34.0.158.247"
      "34.0.159.188"
      "34.0.192.0/25"
      "34.0.193.0/24"
      "34.0.194.0/24"
      "34.0.195.172"
      "34.0.196.200/29"
      "34.0.197.81"
      "34.0.198.25"
      "34.0.199.0/24"
      "34.0.200.0/24"
      "34.0.201.81"
      "34.0.202.34"
      "34.0.203.0/24"
      "34.0.204.0/23"
      "34.0.206.0/25"
      "34.0.207.0/25"
      "34.0.208.195"
      "34.0.209.0/24"
      "34.0.210.20"
      "34.0.211.0/26"
      "34.0.212.0/24"
      "34.0.213.64/26"
      "34.0.215.128/25"
      "34.0.216.238"
      "34.0.217.0/24"
      "34.0.218.83"
      "34.0.220.103"
      "34.0.221.0/24"
      "34.0.222.193"
      "34.0.223.68"
      "34.0.227.0/24"
      "34.0.240.0/21"
      "34.0.248.0/23"
      "34.0.250.0/24"
      "34.0.251.0/25"
      "34.1.216.0/24"
      "34.1.221.166"
      "35.207.64.0/23"
      "35.207.67.116"
      "35.207.71.0/24"
      "35.207.72.32"
      "35.207.73.0/24"
      "35.207.74.0/24"
      "35.207.75.128/25"
      "35.207.76.128/26"
      "35.207.77.0/24"
      "35.207.78.129"
      "35.207.79.0/24"
      "35.207.80.76"
      "35.207.81.248/30"
      "35.207.82.0/23"
      "35.207.84.0/24"
      "35.207.85.160"
      "35.207.86.41"
      "35.207.87.184"
      "35.207.89.188"
      "35.207.91.146"
      "35.207.92.230"
      "35.207.95.0/24"
      "35.207.97.174"
      "35.207.99.134"
      "35.207.100.64/26"
      "35.207.101.130"
      "35.207.103.64/26"
      "35.207.104.0/24"
      "35.207.106.128/26"
      "35.207.107.19"
      "35.207.108.192/27"
      "35.207.109.185"
      "35.207.110.0/24"
      "35.207.111.174"
      "35.207.114.16"
      "35.207.115.163"
      "35.207.116.51"
      "35.207.117.0/24"
      "35.207.121.204"
      "35.207.122.0/25"
      "35.207.124.145"
      "35.207.125.116"
      "35.207.126.30"
      "35.207.129.0/24"
      "35.207.131.128/27"
      "35.207.132.247"
      "35.207.135.147"
      "35.207.136.69"
      "35.207.137.0/24"
      "35.207.139.0/24"
      "35.207.140.241"
      "35.207.141.119"
      "35.207.142.0/24"
      "35.207.143.96/27"
      "35.207.144.0/25"
      "35.207.145.0/24"
      "35.207.146.89"
      "35.207.147.0/24"
      "35.207.149.0/24"
      "35.207.150.0/24"
      "35.207.151.61"
      "35.207.153.117"
      "35.207.154.0/24"
      "35.207.155.128/25"
      "35.207.156.254"
      "35.207.157.7"
      "35.207.158.192"
      "35.207.160.160"
      "35.207.162.239"
      "35.207.163.0/24"
      "35.207.164.0/25"
      "35.207.165.147"
      "35.207.166.0/25"
      "35.207.167.0/24"
      "35.207.168.116"
      "35.207.170.0/23"
      "35.207.172.0/24"
      "35.207.174.55"
      "35.207.176.128/25"
      "35.207.178.0/24"
      "35.207.180.152"
      "35.207.181.76"
      "35.207.182.125"
      "35.207.184.101"
      "35.207.185.192"
      "35.207.186.128/25"
      "35.207.187.228"
      "35.207.188.0/24"
      "35.207.189.0/25"
      "35.207.190.194"
      "35.207.191.64/26"
      "35.207.193.165"
      "35.207.195.75"
      "35.207.196.0/24"
      "35.207.198.0/23"
      "35.207.201.186"
      "35.207.202.169"
      "35.207.205.211"
      "35.207.207.4"
      "35.207.209.0/25"
      "35.207.210.191"
      "35.207.211.253"
      "35.207.213.97"
      "35.207.214.0/24"
      "35.207.220.147"
      "35.207.221.58"
      "35.207.222.105"
      "35.207.224.151"
      "35.207.225.210"
      "35.207.227.0/24"
      "35.207.229.212"
      "35.207.232.26"
      "35.207.234.182"
      "35.207.238.0/24"
      "35.207.240.0/24"
      "35.207.245.0/24"
      "35.207.249.0/24"
      "35.207.250.212"
      "35.207.251.0/27"
      "35.212.4.134"
      "35.212.12.148"
      "35.212.88.11"
      "35.212.102.50"
      "35.212.111.0/26"
      "35.212.117.247"
      "35.212.120.122"
      "35.213.0.0/24"
      "35.213.2.8"
      "35.213.4.185"
      "35.213.6.118"
      "35.213.7.128/25"
      "35.213.8.168"
      "35.213.10.0/24"
      "35.213.11.21"
      "35.213.12.224/27"
      "35.213.13.19"
      "35.213.14.217"
      "35.213.16.67"
      "35.213.17.235"
      "35.213.23.166"
      "35.213.25.164"
      "35.213.26.62"
      "35.213.27.252"
      "35.213.32.0/24"
      "35.213.33.74"
      "35.213.34.204"
      "35.213.37.81"
      "35.213.38.186"
      "35.213.39.253"
      "35.213.42.0/24"
      "35.213.43.79"
      "35.213.45.0/24"
      "35.213.46.136"
      "35.213.49.17"
      "35.213.50.0/24"
      "35.213.51.213"
      "35.213.52.0/25"
      "35.213.53.0/24"
      "35.213.54.0/24"
      "35.213.56.0/25"
      "35.213.59.0/24"
      "35.213.61.58"
      "35.213.65.0/24"
      "35.213.67.0/24"
      "35.213.68.192/26"
      "35.213.70.151"
      "35.213.72.128/25"
      "35.213.73.245"
      "35.213.74.131"
      "35.213.78.0/24"
      "35.213.79.137"
      "35.213.80.0/25"
      "35.213.83.128/25"
      "35.213.84.245"
      "35.213.85.0/24"
      "35.213.88.145"
      "35.213.89.80/28"
      "35.213.90.0/24"
      "35.213.91.195"
      "35.213.92.0/24"
      "35.213.93.254"
      "35.213.94.78"
      "35.213.95.145"
      "35.213.96.87"
      "35.213.98.0/24"
      "35.213.99.126"
      "35.213.101.214"
      "35.213.102.0/24"
      "35.213.105.0/24"
      "35.213.106.128/25"
      "35.213.107.158"
      "35.213.109.0/24"
      "35.213.110.40"
      "35.213.111.0/25"
      "35.213.115.0/25"
      "35.213.120.0/24"
      "35.213.122.0/24"
      "35.213.124.89"
      "35.213.125.40"
      "35.213.126.185"
      "35.213.127.0/24"
      "35.213.128.0/22"
      "35.213.132.0/23"
      "35.213.134.140"
      "35.213.135.0/24"
      "35.213.136.0/23"
      "35.213.138.128/25"
      "35.213.139.0/24"
      "35.213.140.0/25"
      "35.213.141.164"
      "35.213.142.128/25"
      "35.213.143.0/24"
      "35.213.144.0/22"
      "35.213.148.0/23"
      "35.213.150.0/24"
      "35.213.152.0/23"
      "35.213.154.137"
      "35.213.155.134"
      "35.213.156.144"
      "35.213.157.0/24"
      "35.213.158.64/26"
      "35.213.160.90"
      "35.213.161.253"
      "35.213.162.0/25"
      "35.213.163.0/24"
      "35.213.164.0/23"
      "35.213.166.106"
      "35.213.167.160/27"
      "35.213.168.0/24"
      "35.213.169.179"
      "35.213.170.0/24"
      "35.213.171.201"
      "35.213.172.159"
      "35.213.173.0/24"
      "35.213.174.128/25"
      "35.213.175.128/26"
      "35.213.176.0/24"
      "35.213.177.0/25"
      "35.213.179.139"
      "35.213.180.0/24"
      "35.213.181.0/25"
      "35.213.182.0/23"
      "35.213.184.0/23"
      "35.213.186.70"
      "35.213.187.0/24"
      "35.213.188.128/25"
      "35.213.190.158"
      "35.213.191.0/24"
      "35.213.192.240/31"
      "35.213.193.74"
      "35.213.194.0/25"
      "35.213.195.178"
      "35.213.196.38"
      "35.213.197.68"
      "35.213.198.0/23"
      "35.213.200.0/23"
      "35.213.202.0/25"
      "35.213.203.195"
      "35.213.204.32/27"
      "35.213.205.170"
      "35.213.207.128/25"
      "35.213.208.85"
      "35.213.210.0/24"
      "35.213.211.176/29"
      "35.213.212.0/24"
      "35.213.213.225"
      "35.213.214.0/25"
      "35.213.215.255"
      "35.213.217.0/24"
      "35.213.218.248"
      "35.213.219.0/25"
      "35.213.220.211"
      "35.213.221.0/24"
      "35.213.222.215"
      "35.213.223.0/24"
      "35.213.225.0/24"
      "35.213.227.227"
      "35.213.229.17"
      "35.213.230.89"
      "35.213.231.0/24"
      "35.213.233.0/24"
      "35.213.234.134"
      "35.213.236.0/24"
      "35.213.237.212"
      "35.213.238.0/24"
      "35.213.240.212"
      "35.213.241.0/24"
      "35.213.242.10"
      "35.213.243.219"
      "35.213.244.146"
      "35.213.245.119"
      "35.213.246.0/23"
      "35.213.249.79"
      "35.213.250.0/24"
      "35.213.251.74"
      "35.213.252.0/24"
      "35.213.253.155"
      "35.213.254.89"
      "35.214.128.248"
      "35.214.129.220"
      "35.214.130.217"
      "35.214.131.144"
      "35.214.132.189"
      "35.214.133.0/24"
      "35.214.134.163"
      "35.214.137.0/24"
      "35.214.138.0/25"
      "35.214.140.0/24"
      "35.214.142.0/24"
      "35.214.143.41"
      "35.214.144.26"
      "35.214.145.200"
      "35.214.146.9"
      "35.214.147.135"
      "35.214.148.89"
      "35.214.149.110"
      "35.214.151.128/25"
      "35.214.152.0/24"
      "35.214.156.115"
      "35.214.158.181"
      "35.214.159.128/25"
      "35.214.160.128/25"
      "35.214.161.217"
      "35.214.162.0/24"
      "35.214.163.28"
      "35.214.165.102"
      "35.214.167.77"
      "35.214.169.0/24"
      "35.214.170.2"
      "35.214.171.0/25"
      "35.214.172.128/25"
      "35.214.173.0/24"
      "35.214.175.0/24"
      "35.214.177.183"
      "35.214.179.46"
      "35.214.180.0/23"
      "35.214.184.179"
      "35.214.185.28"
      "35.214.186.3"
      "35.214.187.0/24"
      "35.214.191.0/24"
      "35.214.192.128/25"
      "35.214.193.0/24"
      "35.214.194.128/25"
      "35.214.195.0/25"
      "35.214.196.64/26"
      "35.214.197.0/24"
      "35.214.198.7"
      "35.214.199.224"
      "35.214.201.0/25"
      "35.214.203.155"
      "35.214.204.0/23"
      "35.214.207.0/24"
      "35.214.208.128/25"
      "35.214.209.64"
      "35.214.210.0/24"
      "35.214.211.3"
      "35.214.212.64/26"
      "35.214.213.0/25"
      "35.214.214.0/24"
      "35.214.215.64/26"
      "35.214.216.0/23"
      "35.214.218.140"
      "35.214.219.0/24"
      "35.214.220.149"
      "35.214.221.0/24"
      "35.214.222.149"
      "35.214.223.0/24"
      "35.214.224.71"
      "35.214.225.0/24"
      "35.214.226.0/23"
      "35.214.228.0/23"
      "35.214.231.187"
      "35.214.233.8"
      "35.214.235.38"
      "35.214.237.0/24"
      "35.214.238.0/25"
      "35.214.239.0/24"
      "35.214.240.87"
      "35.214.241.0/24"
      "35.214.243.21"
      "35.214.244.0/24"
      "35.214.245.16/28"
      "35.214.246.106"
      "35.214.248.119"
      "35.214.249.154"
      "35.214.250.0/24"
      "35.214.251.128/25"
      "35.214.252.187"
      "35.214.253.0/24"
      "35.214.255.154"
      "35.215.72.85"
      "35.215.73.65"
      "35.215.83.0"
      "35.215.108.111"
      "35.215.115.120"
      "35.215.126.35"
      "35.215.127.34"
      "35.215.128.0/21"
      "35.215.136.0/26"
      "35.215.137.0/24"
      "35.215.138.0/23"
      "35.215.140.0/24"
      "35.215.141.64/27"
      "35.215.142.0/24"
      "35.215.143.83"
      "35.215.144.128/25"
      "35.215.145.0/24"
      "35.215.146.0/24"
      "35.215.147.86"
      "35.215.148.0/23"
      "35.215.150.0/26"
      "35.215.151.0/24"
      "35.215.152.0/24"
      "35.215.153.128/25"
      "35.215.154.240/28"
      "35.215.155.20"
      "35.215.156.0/24"
      "35.215.158.0/23"
      "35.215.160.192/26"
      "35.215.161.0/24"
      "35.215.163.0/24"
      "35.215.164.0/24"
      "35.215.165.236"
      "35.215.166.128/25"
      "35.215.167.128/25"
      "35.215.168.0/24"
      "35.215.169.12"
      "35.215.170.0/23"
      "35.215.172.0/22"
      "35.215.176.0/24"
      "35.215.177.72"
      "35.215.178.0/24"
      "35.215.179.161"
      "35.215.180.0/22"
      "35.215.184.253"
      "35.215.185.64/26"
      "35.215.186.0/25"
      "35.215.187.0/24"
      "35.215.188.0/23"
      "35.215.190.0/24"
      "35.215.191.61"
      "35.215.192.0/23"
      "35.215.194.192/28"
      "35.215.195.0/24"
      "35.215.196.0/25"
      "35.215.197.0/25"
      "35.215.198.230"
      "35.215.199.204"
      "35.215.200.0/23"
      "35.215.202.0/24"
      "35.215.203.0/25"
      "35.215.204.128/25"
      "35.215.205.0/25"
      "35.215.206.0/23"
      "35.215.208.0/24"
      "35.215.209.0/25"
      "35.215.210.0/23"
      "35.215.212.0/22"
      "35.215.216.0/22"
      "35.215.221.0/24"
      "35.215.222.128/25"
      "35.215.223.126"
      "35.215.224.0/23"
      "35.215.226.0/24"
      "35.215.227.0/25"
      "35.215.228.0/24"
      "35.215.229.64"
      "35.215.230.89"
      "35.215.231.0/24"
      "35.215.232.0/24"
      "35.215.233.0/25"
      "35.215.234.37"
      "35.215.235.0/24"
      "35.215.238.0/25"
      "35.215.239.119"
      "35.215.240.0/24"
      "35.215.241.128/25"
      "35.215.242.0/25"
      "35.215.243.0/24"
      "35.215.244.0/23"
      "35.215.246.222"
      "35.215.247.0/24"
      "35.215.248.0/22"
      "35.215.252.0/24"
      "35.215.253.118"
      "35.215.254.0/23"
      "35.217.0.0/24"
      "35.217.1.64/26"
      "35.217.2.5"
      "35.217.3.0/24"
      "35.217.4.72"
      "35.217.5.0/25"
      "35.217.6.0/24"
      "35.217.8.0/25"
      "35.217.9.0/24"
      "35.217.11.186"
      "35.217.12.0/24"
      "35.217.14.192/26"
      "35.217.15.65"
      "35.217.16.75"
      "35.217.17.128/25"
      "35.217.18.0/24"
      "35.217.19.183"
      "35.217.20.0/24"
      "35.217.21.128/25"
      "35.217.22.128/25"
      "35.217.23.128/25"
      "35.217.24.0/24"
      "35.217.25.81"
      "35.217.26.0/24"
      "35.217.27.128/25"
      "35.217.28.128/25"
      "35.217.29.0/24"
      "35.217.30.0/25"
      "35.217.31.0/25"
      "35.217.32.128/25"
      "35.217.33.0/24"
      "35.217.35.128/25"
      "35.217.36.0/23"
      "35.217.38.179"
      "35.217.39.186"
      "35.217.40.176"
      "35.217.41.204"
      "35.217.43.0/24"
      "35.217.45.248"
      "35.217.46.0/24"
      "35.217.47.128/25"
      "35.217.48.195"
      "35.217.49.160/27"
      "35.217.50.0/25"
      "35.217.51.0/24"
      "35.217.52.117"
      "35.217.53.128/25"
      "35.217.54.0/25"
      "35.217.55.96/27"
      "35.217.56.6"
      "35.217.57.184"
      "35.217.58.0/24"
      "35.217.59.64/26"
      "35.217.60.0/24"
      "35.217.61.128/25"
      "35.217.62.0/24"
      "35.217.63.128/25"
      "35.219.225.149"
      "35.219.226.57"
      "35.219.227.0/24"
      "35.219.228.37"
      "35.219.229.128/25"
      "35.219.230.0/23"
      "35.219.235.0/24"
      "35.219.236.198"
      "35.219.238.115"
      "35.219.239.0/24"
      "35.219.241.0/24"
      "35.219.242.221"
      "35.219.243.191"
      "35.219.244.1"
      "35.219.245.0/24"
      "35.219.246.159"
      "35.219.247.0/26"
      "35.219.248.0/24"
      "35.219.249.126"
      "35.219.251.186"
      "35.219.252.0/23"
      "35.219.254.0/24"
      "64.233.161.207"
      "64.233.162.207"
      "64.233.163.207"
      "64.233.164.207"
      "64.233.165.207"
      "66.22.196.0/26"
      "66.22.197.0/24"
      "66.22.198.0/26"
      "66.22.199.0/24"
      "66.22.200.0/26"
      "66.22.202.0/26"
      "66.22.204.0/24"
      "66.22.206.0/24"
      "66.22.208.0/25"
      "66.22.210.0/26"
      "66.22.212.0/24"
      "66.22.214.0/24"
      "66.22.216.0/23"
      "66.22.220.0/25"
      "66.22.221.0/24"
      "66.22.222.0/23"
      "66.22.224.0/25"
      "66.22.225.0/26"
      "66.22.226.0/25"
      "66.22.227.0/25"
      "66.22.228.0/22"
      "66.22.233.0/24"
      "66.22.234.0/24"
      "66.22.236.0/23"
      "66.22.238.0/24"
      "66.22.240.0/22"
      "66.22.244.0/23"
      "66.22.248.0/24"
      "74.125.131.207"
      "74.125.205.207"
      "104.17.51.93"
      "104.17.117.93"
      "104.18.4.161"
      "104.18.5.161"
      "104.18.8.105"
      "104.18.9.105"
      "104.18.30.128"
      "104.18.31.128"
      "104.21.2.204"
      "104.21.25.51"
      "104.21.40.151"
      "104.21.59.128"
      "104.21.72.221"
      "104.21.82.160"
      "108.177.14.207"
      "138.128.140.240/28"
      "142.250.150.207"
      "142.251.1.207"
      "162.159.128.232/30"
      "162.159.129.232/30"
      "162.159.130.232/30"
      "162.159.133.232/30"
      "162.159.134.232/30"
      "162.159.135.232/30"
      "162.159.136.232/30"
      "162.159.137.232/30"
      "162.159.138.232/30"
      "172.65.202.19"
      "172.66.41.34"
      "172.66.42.222"
      "172.67.152.224/28"
      "172.67.155.163"
      "172.67.159.89"
      "172.67.177.131"
      "172.67.222.182"
      "173.194.73.207"
      "173.194.220.207"
      "173.194.221.207"
      "173.194.222.207"
      "188.114.96.2"
      "188.114.97.2"
      "188.114.98.224"
      "188.114.99.224"
      "204.11.56.48"
      "209.85.233.207"
    ];
  };
}
