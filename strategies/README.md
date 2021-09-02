# My Freqtrade stuff

In this Github repository I will share my freqtrade files with you.
I want to help people with this repository who don't know Freqtrade so much yet.

You should check the [freqtrade repository](https://github.com/freqtrade/freqtrade/) and the offical [freqtrade Website](https://www.freqtrade.io/en/latest/)

- [Freqtrade Discord Server](https://discord.gg/p7nuUNVfP7)

And if you need more help, I can recommend this youtube video

[![Video](https://i.ytimg.com/vi/wq3uLSDJxUQ/hqdefault.jpg?sqp=-oaymwEjCOADEI4CSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLAq0Kl2t-u_Vruy8BSRQRxMSTvHKA)](https://www.youtube.com/watch?v=wq3uLSDJxUQ)

## Disclaimer

Use the examples / information here at your own risk.


This software is for educational purposes only. Do not risk money which
you are afraid to lose. USE THE SOFTWARE AT YOUR OWN RISK. THE AUTHORS
AND ALL AFFILIATES ASSUME NO RESPONSIBILITY FOR YOUR TRADING RESULTS.

Always start by running a trading bot in Dry-run and do not engage money
before you understand how it works and what profit/loss you should
expect.

We strongly recommend you to have coding and Python knowledge. Do not
hesitate to read the source code and understand the mechanism of this bot.


## Strategy files

And if u are using [NASOSv4 strategy](https://github.com/Foxel05/freqtrade-stuff/blob/master/strategies/NASOSv4.py), there is **important stuff** to change in the NASOS strategy. You will find the setting trailing_stop and use_costum_stoploss in the strategy [(strategy-file)](https://github.com/Foxel05/freqtrade-stuff/blob/master/strategies/NASOSv4.py).

If u want to backtest the strategy, u must:

- set trailing_stop = True
- set use_custom_stoploss = False

If u want to use the strategy for live/dry-run, u must:
- set trailing_stop = False
- set use_custom_stoploss = True

```
# This is only required in the NASOSv4 strategy
# for live trailing_stop = False and use_custom_stoploss = True
# for backtest trailing_stop = True and use_custom_stoploss = False
```

## Backtest

I will add some backtest here later!
