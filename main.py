import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

engine = create_engine(
"postgresql://postgres:password@localhost/shopdb"
)

query = "SELECT * FROM orders"

df = pd.read_sql(query, engine)

df['order_date'] = pd.to_datetime(df['order_date'])

# 1. Cleaning
df = df.dropna()

# 2. Rolling Mean
daily = df.groupby('order_date')['total_amount'].sum()

rolling = daily.rolling(7).mean()

# 3. Pivot Table
pivot = pd.pivot_table(
    df,
    values='total_amount',
    index='status',
    aggfunc='sum'
)

# 4. Percent Change
monthly = daily.resample('M').sum()
monthly_change = monthly.pct_change()

# 5. Statistics
print(df.describe())

# LINE CHART
plt.figure(figsize=(8,5))
plt.plot(monthly)
plt.title("Monthly Sales")
plt.savefig("line_chart.png")
plt.close()

# BAR CHART
top5 = df.groupby('status')['total_amount'].sum()

plt.figure(figsize=(8,5))
top5.plot(kind='bar')
plt.title("Sales by Status")
plt.savefig("bar_chart.png")
plt.close()

# PIE CHART
df['status'].value_counts().plot(
kind='pie',
autopct='%1.1f%%'
)

plt.savefig("pie_chart.png")
plt.close()

# SCATTER
plt.scatter(
df.index,
df['total_amount']
)

plt.savefig("scatter.png")
plt.close()

# HISTOGRAM
plt.hist(df['total_amount'], bins=20)

plt.savefig("histogram.png")
plt.close()

print("Analysis complete")
