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


## Config settings

Normal settings

- The `stake_amount` configuration statically configures the amount of stake-currency your bot will use for each trade. You can set the `stake_amount` to `'unlimited'`

- To allow the bot to trade all the available `stake_currency` in your account (minus `tradable_balance_ratio`) set


```javascript
"max_open_trades": 4,
"stake_currency": "USDT",
"stake_amount": "unlimited",
"tradable_balance_ratio": 0.99,
"fiat_display_currency": "USD",
"timeframe": "5m",
"dry_run": true,
"dry_run_wallet": 300,
"cancel_open_orders_on_exit": false,
"unfilledtimeout": {
    "buy": 5,
    "sell": 5,
    "unit": "minutes"
```

Order types

```javascript
"order_types": {
    "buy": "limit",
    "sell": "market",
    "emergencysell": "market",
    "forcebuy": "market",
    "forcesell": "market",
    "stoploss": "market",
    "stoploss_on_exchange": false,
    "stoploss_on_exchange_interval": 60
},
```

bid strategy

```javascript
"bid_strategy": {
    "price_side": "ask",
    "ask_last_balance": 0.0,
    "use_order_book": false,
    "order_book_top": 1,
    "check_depth_of_market": {
        "enabled": false,
        "bids_to_ask_delta": 1
    }
},
```  

ask strategy

```javascript
"ask_strategy": {
    "price_side": "bid",
    "use_order_book": false,
    "order_book_min": 1,
    "order_book_max": 1,
    "use_sell_signal": true,
    "sell_profit_only": false,
    "ignore_roi_if_buy_signal": true
},
```  

### Pairlist



#### Price Filter

The PriceFilter allows filtering of pairs by price. Currently the following price filters are supported:

- min_price
- max_price
- max_value
- low_price_ratio

#### Spread Filter

Removes pairs that have a difference between asks and bids above the specified ratio, `max_spread_ratio` (defaults to `0.005`).

##### Example:

If `DOGE/BTC` maximum bid is 0.00000026 and minimum ask is 0.00000027, the ratio is calculated as: `1 - bid/ask ~= 0.037` which is `> 0.005` and this pair will be filtered out.

#### RangeStabilityFilter
Removes pairs where the difference between lowest low and highest high over `lookback_days` days is below `min_rate_of_change` or above `max_rate_of_change`. Since this is a filter that requires additional data, the results are cached for `refresh_period`.



```javascript
"pairlists": [
    {
        "method": "VolumePairList",
        "number_assets": 75,
        "sort_key": "quoteVolume",
        "refresh_period": 1800
    },
    {"method": "AgeFilter", "min_days_listed": 14},
    {"method": "SpreadFilter", "max_spread_ratio": 0.005},
    {
        "method": "PriceFilter",
        "min_price": 0.001
    },
    {
        "method": "RangeStabilityFilter",
        "lookback_days": 3,
        "min_rate_of_change": 0.1,
        "refresh_period": 1800
    },
    {
        "method": "VolatilityFilter",
        "lookback_days": 3,
        "min_volatility": 0.02,
        "max_volatility": 0.75,
        "refresh_period": 43200
    },
    {"method": "ShuffleFilter"}
],
```

### Pair blacklist
```javascript
"pair_blacklist": [
    
    "(BNB)/.*",
    
    ".*(BTC|ETH)/.*",
    
    ".*(_PREMIUM|BEAR|BULL|DOWN|HALF|HEDGE|UP|[1235][SL])/.*",
    
    "(AUD|BRZ|CAD|CHF|EUR|GBP|HKD|IDRT|JPY|NGN|RUB|SGD|TRY|UAH|USD|ZAR)/.*",
    
    "(BUSD|CUSDT|DAI|PAXG|SUSD|TUSD|USDC|USDP|USDT|VAI)/.*",
    
    "(ACM|AFA|ALA|ALL|APL|ASR|ATM|BAR|CAI|CITY|FOR|GAL|GOZ|IBFK|JUV|LEG|LOCK-1|NAVI|NMR|NOV|OG|PFL|PSG|ROUSH|STV|TH|TRA|UCH|UFC|YBO)/.*",
    
    "(CHZ|CTXC|HBAR|NMR|SHIB|SLP|XVS|ONG|ARDR)/.*"
]
```
