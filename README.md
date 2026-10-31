# NIFTY 50 Financial Data Analysis and Forecasting

## Project Overview

This project focuses on analyzing historical NIFTY 50 stock market data to understand stock performance, price movements, trading volume, daily returns, and market volatility.

Python was used for data cleaning, exploratory data analysis (EDA), feature engineering, correlation analysis, and time-series forecasting. An ARIMA model was applied to RELIANCE historical closing prices to evaluate forecasting performance.

PostgreSQL was used to store and analyze the processed financial data using SQL queries. Power BI was used to create interactive dashboards to present stock performance and forecasting results.

**Project Industry:** Finance / Stock Market Analytics

**Project Type:** Data Analysis and Time-Series Forecasting

## Project Objectives

- Analyze historical NIFTY 50 stock market data.
- Clean and preprocess financial datasets.
- Compare stock performance using closing prices and daily returns.
- Analyze trading volume and market volatility.
- Identify relationships between financial variables.
- Apply ARIMA forecasting to RELIANCE closing prices.
- Evaluate forecasting performance using error metrics.
- Store processed data in PostgreSQL.
- Perform financial analysis using SQL.
- Develop interactive Power BI dashboards.

## Dataset Information

- **Dataset Name:** NIFTY 50 Historical Stock Market Data
- **Data sources:** https://www.kaggle.com/datasets/rohanrao/nifty50-stock-market-data
- **Date Range:** 1 January 2000 – 30 April 2021
- **Combined Dataset:** 235,192 rows and 16 original columns before feature engineering.
- **Format:** CSV files provided in a ZIP archive.

### Important Columns

| Column | Description |
|---|---|
| Date | Trading date |
| Stock | Stock symbol |
| Prev Close | Previous closing price |
| Open | Opening price |
| High | Highest price |
| Low | Lowest price |
| Last | Last traded price |
| Close | Closing price |
| VWAP | Volume Weighted Average Price |
| Volume | Trading volume |
| Turnover | Trading turnover |
| Trades | Number of trades |
| Deliverable Volume | Deliverable shares volume |
| %Deliverble | Percentage of deliverable volume |

## Tools and Technologies

- **Python:** Data analysis and forecasting
- **Pandas:** Data cleaning and manipulation
- **NumPy:** Numerical operations
- **Matplotlib:** Data visualization
- **Seaborn:** Statistical visualization
- **Statsmodels:** ARIMA forecasting
- **Scikit-learn:** Model evaluation metrics
- **PostgreSQL:** Database management
- **SQLAlchemy:** Python and PostgreSQL connection
- **SQL:** Financial data querying
- **Power BI:** Interactive dashboard development
- **Jupyter Notebook:** Python development environment

## Project Workflow

The project follows this workflow:

1. Data Extraction
2. Data Understanding
3. Data Cleaning and Preprocessing
4. Feature Engineering
5. Exploratory Data Analysis
6. Correlation Analysis
7. ARIMA Time-Series Forecasting
8. Model Evaluation
9. CSV Export
10. PostgreSQL Database Integration
11. SQL Analysis
12. Power BI Dashboard Development

## 1. Data Extraction and Cleaning

- Extracted individual stock CSV files from the dataset ZIP archive.
- Combined the individual stock files into one DataFrame.
- Excluded the already combined dataset and stock metadata file from the combination process.
- Converted the Date column into datetime format.
- Converted financial columns into appropriate numeric data types.
- Checked and removed duplicate records.
- Handled missing values in essential fields.
- Removed records with invalid closing prices.
- Sorted the data by Stock and Date.

The combined dataset contained **235,192 rows and 16 original columns** before feature engineering.

Missing values in optional fields such as Trades, Deliverable Volume, and %Deliverble were reviewed during preprocessing.

## 2. Feature Engineering

Created additional features to support financial analysis:

- **Year:** Extracted the year from the trading date.
- **Month:** Extracted the month from the trading date.
- **Daily_Return_%:** Calculated the percentage change in closing price for each stock.
- **Price_Change:** Calculated the difference between consecutive closing prices.
- **Volatility_20D_%:** Calculated the 20-day rolling standard deviation of daily returns.
- **Year_Month:** Created a year-month field for monthly analysis.

## 3. Exploratory Data Analysis (EDA)

Performed exploratory analysis to understand stock market trends and patterns.

### Analysis Performed

- Top 10 stocks by average closing price.
- Top 10 stocks by average daily return.
- Top 10 stocks by return volatility.
- RELIANCE historical closing price analysis.
- RELIANCE historical trading volume analysis.
- RELIANCE monthly average closing price.
- RELIANCE monthly return analysis.
- Daily return distribution.
- Daily trading volume distribution.
- Daily returns versus trading volume.
- 20-day rolling volatility.
- Monthly average trading volume.
- Monthly returns versus trading volume.
- Correlation analysis of RELIANCE financial variables.

### Sample Visualizations


**Top 10 Stocks by Average Closing Price**

<img width="1385" height="677" alt="Screenshot 2026-10-31 013151" src="https://github.com/user-attachments/assets/43f49153-6019-4a53-ab95-e0e6cee984cd" />


**Top 10 Stocks by Average Daily Return**

<img width="1421" height="680" alt="Screenshot 2026-10-31 013204" src="https://github.com/user-attachments/assets/43cdc607-3cd3-483f-87db-f73ae3105483" />


**RELIANCE Historical Closing Price**

<img width="1388" height="602" alt="Screenshot 2026-10-31 013228" src="https://github.com/user-attachments/assets/efc00537-f7c0-4350-87b1-4e1c86b5c47b" />


**RELIANCE Correlation Heatmap**

<img width="876" height="647" alt="Screenshot 2026-10-31 013406" src="https://github.com/user-attachments/assets/1377dcda-c519-44d0-bf15-8c0a882a9167" />



## 4. ARIMA Time-Series Forecasting

ARIMA was used to analyze and forecast RELIANCE historical closing prices.

### Model Details

- **Selected Stock:** RELIANCE
- **Model:** ARIMA
- **Parameters:** (5,1,0)
- **Training and Testing Split:** 80:20
- **Training Observations:** 4,244
- **Testing Observations:** 1,062

The dataset was divided chronologically to ensure that the model was trained on earlier observations and evaluated on later observations.

### Model Evaluation Results

| Evaluation Metric | Result |
|---|---:|
| MAE | 365.95 |
| MSE | 239,320.84 |
| RMSE | 489.20 |
| MAPE | 23.03% |

The results show that the model has noticeable prediction errors and limitations in capturing changing stock price movements over the testing period.

### Actual vs Predicted Closing Prices



**Important:** These results represent historical model evaluation. They are not predictions of current or future stock market prices and should not be treated as investment advice.

## 5. PostgreSQL Database Integration

PostgreSQL was used to store the processed financial data and analysis results.

**Database Name:** `nifty50_analysis`

### Database Tables

| Table Name | Description |
|---|---|
| nifty50_cleaned | Cleaned combined financial dataset |
| stock_summary | Stock-wise performance summary |
| reliance_monthly | RELIANCE monthly analysis |
| reliance_monthly_volume | RELIANCE monthly trading volume |
| reliance_correlation | RELIANCE correlation results |
| reliance_arima_forecast | Actual and predicted closing prices |

Python was connected to PostgreSQL using SQLAlchemy and psycopg2.

## 6. SQL Analysis

SQL queries were prepared to analyze financial performance and forecasting results.

### Queries Included

1. Top 10 stocks by average closing price.
2. Highest and lowest average daily returns.
3. Top 10 stocks by return volatility.
4. RELIANCE historical closing price analysis.
5. Monthly trading volume analysis.
6. Monthly return analysis.
7. Trading volume and daily return correlation.
8. RELIANCE 20-day rolling volatility analysis.
9. RELIANCE financial variables correlation analysis.
10. ARIMA forecast performance evaluation.

**SQL File:** `NIFTY50_Financial_Analysis_SQL_Queries.sql`

## 7. Power BI Dashboard

Power BI was used to create an interactive dashboard using the processed financial data stored in PostgreSQL.

The dashboard contains two pages.

### Page 1: NIFTY 50 Stock Performance

Key performance indicators:

- Total Stocks
- Average Closing Price
- Average Daily Return
- Total Trading Volume

Visualizations:

- Top 10 stocks by average closing price.
- Top 10 stocks by average daily return.
- Stock-wise return volatility.
- RELIANCE closing price trend.
- RELIANCE trading volume trend.
- Daily average closing price across available stocks.
- Daily total trading volume.

Interactive filters:

- Stock
- Date

<img width="1056" height="546" alt="Screenshot 2026-10-31 004524" src="https://github.com/user-attachments/assets/f2b89b9a-f25f-4fb2-afeb-80f5e31bc34a" />


### Page 2: RELIANCE Forecasting and Risk Analysis

Key performance indicators:

- MAE
- RMSE
- MAPE
- Forecast Model

Visualizations:

- RELIANCE monthly returns.
- Monthly trading volume.
- 20-day rolling volatility.
- Actual versus predicted closing prices.
- Forecast performance summary.

<img width="1056" height="546" alt="Screenshot 2026-10-31 004524" src="https://github.com/user-attachments/assets/2f543f35-6b72-461b-8ab8-d8ac959608d3" />


## 8. Key Findings

The analysis produced the following observations from the processed historical dataset:

- NESTLEIND had the highest average closing price in the stock-wise summary, at approximately 7,512.04.
- SHREECEM had the highest average daily return in the summary, at approximately 0.1517%.
- VEDL had the highest average daily return volatility, at approximately 3.5804%.
- COALINDIA had the lowest average daily return in the summary, at approximately -0.0188%.
- RELIANCE historical prices, trading volume, monthly returns, and rolling volatility were examined separately.
- The ARIMA model achieved a MAPE of approximately 23.03% on the historical testing dataset.

Average closing price is not the same as investment return. These findings describe the historical dataset and do not indicate future stock performance.

## 9. Project Limitations

- The dataset covers the period from January 2000 to April 2021 and does not include more recent market data.
- The ARIMA model was evaluated on historical RELIANCE data only.
- The selected ARIMA model has noticeable prediction errors.
- Stock market prices are influenced by many factors not included in this analysis.
- Correlation does not establish causation.
- Historical performance does not guarantee future results.

## 10. Future Improvements

- Update the analysis with more recent stock market data.
- Compare ARIMA with other time-series forecasting models.
- Experiment with parameter tuning and model selection.
- Explore additional financial indicators and technical features.
- Evaluate forecasting performance across multiple stocks.
- Improve dashboard interactivity and add more financial comparisons.
- Investigate external market factors that may influence stock price movements.

## 11. Project Deliverables

The project deliverables include:

- Python Jupyter Notebook.
- Cleaned NIFTY 50 financial dataset.
- Stock-wise summary CSV file.
- RELIANCE monthly analysis CSV files.
- RELIANCE correlation analysis CSV file.
- RELIANCE ARIMA forecast results CSV file.
- PostgreSQL database tables.
- SQL analysis queries.
- Power BI dashboard.
- Final project report.

## 12. Conclusion

The NIFTY 50 Financial Data Analysis and Forecasting project demonstrates an end-to-end financial data analytics workflow using Python, PostgreSQL, SQL, and Power BI.

The project involved cleaning historical stock market data, creating financial features, analyzing stock performance, examining trading volume and volatility, and applying ARIMA forecasting to RELIANCE closing prices.

PostgreSQL and SQL supported structured data storage and financial analysis, while Power BI provided interactive dashboards to communicate the results.

This project helped develop practical skills in Python programming, financial data analysis, time-series forecasting, SQL querying, database integration, and dashboard development.

---

**Project Category:** Financial Data Analysis and Forecasting  
**Dataset Period:** January 2000 – April 2021  
**Forecasting Model:** ARIMA (5,1,0)  
**Tools:** Python | PostgreSQL | SQL | Power BI

**Note:** This project is for educational and analytical purposes only. It is not financial or investment advice.


NIFTY-50-Financial-Data-Analysis/
│
├── README.md
├── NIFTY50_Financial_Data_Analysis_and_Forecasting.ipynb
├── NIFT50_Financial_Analysis_SQL_Queries.sql
│
├── data/
│   ├── NIFTY50_Cleaned_Financial_Data.csv
│   ├── NIFTY50_Stock_Wise_Summary.csv
│   ├── RELIANCE_Monthly_Analysis.csv
│   ├── RELIANCE_Monthly_Volume.csv
│   ├── RELIANCE_Correlation_Analysis.csv
│   └── RELIANCE_ARIMA_Forecast_Results.csv
│
└── images/
    ├── top_10_average_closing_price.png
    ├── top_10_average_daily_return.png
    ├── reliance_closing_price.png
    ├── reliance_correlation_heatmap.png
    ├── arima_actual_vs_predicted.png
    ├── nifty50_stock_performance_dashboard.png
    └── reliance_forecasting_dashboard.png


