from pyspark.sql import SparkSession
from pyspark.sql.functions import *

spark = SparkSession.builder.master('local').appName('SkipFirstFewRows').getOrCreate()

df=spark.read.csv("data.csv",header=True)
df.show()

rdd = sc.textFile("data.csv")
rdd.collect()

final_rdd = rdd.zipWithIndex().filter(lambda x: x[1] > 2).map(lambda a :a[0].split(","))
final_rdd.collect()

# get columns into list to create DataFrame
columns=final_rdd.collect()[0]
print(columns)

# skip header/columns from data 
skipline=final_rdd.first() #extract header for filter that row
data = final_rdd.filter(lambda col: col != skipline)   #filter out header
data.collect()

data.toDF(columns).show()
