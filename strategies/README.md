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

## General Recommendations

For optimal performance, suggested to use between 4 and 6 open trades, with unlimited stake.

A pairlist with 40 to 80 pairs. Volume pairlist works well.

Prefer stable coin (USDT, BUSD etc) pairs, instead of BTC or ETH pairs.

Highly recommended to blacklist leveraged tokens (*BULL, *BEAR, *UP, *DOWN etc).

#### docker install pandas_ta

I heard this does not work for everyone, but it worked fine for me.

Add an extra docker file (`Dockerfile.custom`) with this stuff:
```
FROM freqtradeorg/freqtrade:develop

# Switch user to root if you must install something from apt
# Don't forget to switch the user back below!
# USER root

# The below dependency - pyti - serves as an example. Please use whatever you need!
# RUN pip install pyti
# RUN pip --no-cache-dir install pandas_ta
# RUN apt-get install python3-pandas -y
RUN pip install ta finta pandas_ta


# USER ftuser
```

Now you have to link this extra docker file to the freqtrade main docker file
```
   build:
      context: .
      dockerfile: "./Dockerfile.custom"
```

You can find all that stuff on: 
- https://www.freqtrade.io/en/latest/docker_quickstart/#additional-dependencies-with-docker-compose

## Backtest

I will add some backtest here later!
