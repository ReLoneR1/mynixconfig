{ config, pkgs, ... }:

{
  services.zapret = {
    enable = true;
    params = [
      "--dpi-desync=fake"
      "--dpi-desync-ttl=3"
    ];
    whitelist = [
      ######################################################################
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
      ######################################################################
      "archon.gg"
    ];
  };
}
