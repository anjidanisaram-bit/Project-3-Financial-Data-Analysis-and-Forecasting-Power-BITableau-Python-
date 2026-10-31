1. Stock Performance
Which 10 stocks have the highest average closing prices during the available historical period?
SELECT
    "Stock",
    ROUND(AVG("Close")::numeric, 2) AS average_closing_price
FROM nifty50_cleaned
GROUP BY "Stock"
ORDER BY average_closing_price DESC
LIMIT 10;

2. Best Performing Stocks
Which stocks have the highest average daily returns, and which stocks have the lowest average daily returns?
SELECT
    "Stock",
    ROUND(AVG("Daily_Return_%")::numeric, 4) AS average_daily_return
FROM nifty50_cleaned
WHERE "Daily_Return_%" IS NOT NULL
GROUP BY "Stock"
ORDER BY average_daily_return DESC;

Find the 10 lowest average daily returns

SELECT
    "Stock",
    ROUND(AVG("Daily_Return_%")::numeric, 4) AS average_daily_return
FROM nifty50_cleaned
WHERE "Daily_Return_%" IS NOT NULL
GROUP BY "Stock"
ORDER BY average_daily_return ASC
LIMIT 10;



3. Stock Volatility
Which 10 stocks have the highest daily return volatility, and what does this indicate about their investment risk?
SELECT
    "Stock",
    ROUND(STDDEV("Daily_Return_%")::numeric, 4) AS daily_return_volatility
FROM nifty50_cleaned
WHERE "Daily_Return_%" IS NOT NULL
GROUP BY "Stock"
ORDER BY daily_return_volatility DESC
LIMIT 10;

4. Historical Price Trends
How has RELIANCE's closing price changed over the available historical period?

SELECT
    "Date",
    "Stock",
    "Close"
FROM nifty50_cleaned
WHERE "Stock" = 'RELIANCE'
ORDER BY "Date" ASC;

5. Trading Activity
Which months show the highest and lowest average trading volumes for RELIANCE?

SELECT
    EXTRACT(MONTH FROM "Date") AS month_number,
    TO_CHAR("Date", 'Month') AS month_name,
    ROUND(AVG("Volume"), 2) AS average_trading_volume
FROM nifty50_cleaned
WHERE "Stock" = 'RELIANCE'
GROUP BY
    EXTRACT(MONTH FROM "Date"),
    TO_CHAR("Date", 'Month')
ORDER BY average_trading_volume DESC;

6. Monthly Stock Returns
Which months have the highest and lowest monthly returns for RELIANCE?

WITH monthly_prices AS (
    SELECT
        DATE_TRUNC('month', "Date") AS month,
        FIRST_VALUE("Close") OVER (
            PARTITION BY DATE_TRUNC('month', "Date")
            ORDER BY "Date" ASC
        ) AS first_close,
        LAST_VALUE("Close") OVER (
            PARTITION BY DATE_TRUNC('month', "Date")
            ORDER BY "Date" ASC
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS last_close
    FROM nifty50_cleaned
    WHERE "Stock" = 'RELIANCE'
),
monthly_returns AS (
    SELECT DISTINCT
        month,
        first_close,
        last_close,
        (last_close - first_close) / NULLIF(first_close, 0) * 100 AS monthly_return
    FROM monthly_prices
)
SELECT
    TO_CHAR(month, 'YYYY-MM') AS month,
    ROUND(first_close::numeric, 2) AS first_closing_price,
    ROUND(last_close::numeric, 2) AS last_closing_price,
    ROUND(monthly_return::numeric, 2) AS monthly_return_percentage
FROM monthly_returns
ORDER BY monthly_return DESC
LIMIT 1;

7. Price and Volume Relationship
Is there a relationship between RELIANCE's daily trading volume and daily stock returns?

SELECT
    ROUND(
        CORR("Volume"::numeric, "Daily_Return_%"::numeric)::numeric,
        4
    ) AS volume_return_correlation
FROM nifty50_cleaned
WHERE "Stock" = 'RELIANCE'
  AND "Volume" IS NOT NULL
  AND "Daily_Return_%" IS NOT NULL;
8. Risk Analysis
How has RELIANCE's 20-day rolling volatility changed over time, and when did it experience high volatility?
SELECT
    "Date",
    "Stock",
    ROUND("Volatility_20D_%"::numeric, 4) AS rolling_volatility_20d
FROM nifty50_cleaned
WHERE "Stock" = 'RELIANCE'
  AND "Volatility_20D_%" IS NOT NULL
ORDER BY "Date";

Identify the 10 highest volatility dates

SELECT
    "Date",
    ROUND("Volatility_20D_%"::numeric, 4) AS rolling_volatility_20d
FROM nifty50_cleaned
WHERE "Stock" = 'RELIANCE'
  AND "Volatility_20D_%" IS NOT NULL
ORDER BY "Volatility_20D_%" DESC
LIMIT 10;

9. Stock Feature Correlation
What relationships exist between RELIANCE's closing price, opening price, high price, low price, trading volume, and daily returns?
SELECT
    ROUND(CORR("Close", "Open")::numeric, 4) AS close_open_correlation,
    ROUND(CORR("Close", "High")::numeric, 4) AS close_high_correlation,
    ROUND(CORR("Close", "Low")::numeric, 4) AS close_low_correlation,
    ROUND(CORR("Close", "Volume")::numeric, 4) AS close_volume_correlation,
    ROUND(CORR("Close", "Daily_Return_%")::numeric, 4) AS close_return_correlation,
    ROUND(CORR("Volume", "Daily_Return_%")::numeric, 4) AS volume_return_correlation
FROM nifty50_cleaned
WHERE "Stock" = 'RELIANCE';

10. Stock Price Forecasting
How accurately can an ARIMA model predict RELIANCE's closing price, based on historical data, and what are its limitations?

SELECT
    "Date",
    ROUND("Actual_Close"::numeric, 2) AS actual_closing_price,
    ROUND("Predicted_Close"::numeric, 2) AS predicted_closing_price,
    ROUND(
        ("Actual_Close" - "Predicted_Close")::numeric, 2
    ) AS prediction_error
FROM reliance_arima_forecast
ORDER BY "Date";


Calculate model performance metrics

SELECT
    ROUND(
        AVG(ABS("Actual_Close" - "Predicted_Close"))::numeric, 2
    ) AS MAE,

    ROUND(
        AVG(POWER("Actual_Close" - "Predicted_Close", 2))::numeric, 2
    ) AS MSE,

    ROUND(
        SQRT(AVG(POWER("Actual_Close" - "Predicted_Close", 2)))::numeric, 2
    ) AS RMSE,

    ROUND(
        (
            AVG(
                ABS(
                    ("Actual_Close" - "Predicted_Close")
                    / NULLIF("Actual_Close", 0)
                )
            ) * 100
        )::numeric, 2
    ) AS MAPE

FROM reliance_arima_forecast;