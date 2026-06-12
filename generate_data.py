from faker import Faker
import random
import pandas as pd

fake = Faker()

orders = []

for i in range(1000):
    orders.append({
        "customer_name": fake.name(),
        "order_date": fake.date_between(start_date='-2y', end_date='today'),
        "status": random.choice([
            "Completed",
            "Cancelled",
            "Pending"
        ]),
        "total_amount": round(random.uniform(50, 5000), 2)
    })

df = pd.DataFrame(orders)
df.to_csv("orders.csv", index=False)

print("1000 rows created")
