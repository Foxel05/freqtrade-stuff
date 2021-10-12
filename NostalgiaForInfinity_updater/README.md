# NFI Tags Auto Updater

This is just a copy of someone else's work!!!

Credits to:
- https://github.com/shanejones/nfi-auto-update 

- https://github.com/krsh-off/nfi-tags-auto-update

- https://github.com/StudyRemy/Hybrid-NFI-updater

Simple Bash script to check for [NostalgiaForInfinityNext](https://github.com/iterativv/NostalgiaForInfinity) newly added tags and update it for usage with [Freqtrade](https://github.com/freqtrade/freqtrade) bot.

### Differance between [`update.sh`](https://github.com/Foxel05/freqtrade-stuff/blob/master/NostalgiaForInfinity_updater/update.sh) and [`docker_update.sh`](https://github.com/Foxel05/freqtrade-stuff/blob/master/NostalgiaForInfinity_updater/docker_update.sh) 

If you have freqtrade running in Docker - the Docker container will be restarted automatically

## Installation [`update.sh`](https://github.com/Foxel05/freqtrade-stuff/blob/master/NostalgiaForInfinity_updater/update.sh)

Clone the update.sh file

Open [`update.sh`](https://github.com/Foxel05/freqtrade-stuff/blob/master/NostalgiaForInfinity_updater/update.sh) file and change some variables:
- `ROOT_PATH` - path to the directory where `NostalgiaForInfinityNext` and `freqtrade` directories are places
- `TG_TOKEN` - Telegram token you've got for the bot
- `TG_CHAT_ID` - Telegram chat ID with your bot
- `TG_FT_BOT_ID` - Telegram ID of your Freqtrade bot, the one that ends in `bot`

Make the file executable:
```
chmod +x update.sh
```

Setup a Cron job to execute the script periodically.

Log into your server and type `crontab -e`. Next you should be editing the cron file, add in the following line at the bottom of the file.

```
*/30 * * * * /bin/bash -c "{path to the file}/update.sh"
```

Once that is saved, the updater will check for new git updates every 30 mins and notify you via Telegram if there was anything new so you can restart it.

## Installation [`docker_update.sh`](https://github.com/Foxel05/freqtrade-stuff/blob/master/NostalgiaForInfinity_updater/docker_update.sh)

Clone the docker_update.sh file

Open [`docker_update.sh`](https://github.com/Foxel05/freqtrade-stuff/blob/master/NostalgiaForInfinity_updater/docker_update.sh) file and change some variables:
- `ROOT_PATH` - path to the directory where `NostalgiaForInfinityNext` and `freqtrade` directories are places
- `TG_TOKEN` - Telegram token you've got for the bot
- `TG_CHAT_ID` - Telegram chat ID with your bot
- `TG_FT_BOT_ID` - Telegram ID of your Freqtrade bot, the one that ends in `bot`

Make the file executable:
```
chmod +x docker_update.sh
```

Setup a Cron job to execute the script periodically.

Log into your server and type `crontab -e`. Next you should be editing the cron file, add in the following line at the bottom of the file.

```
*/30 * * * * /bin/bash -c "{path to the file}/docker_update.sh"
```

Once that is saved, the updater will check for new git updates every 30 mins and notify you via Telegram if there was anything new and it will restart automatically.
