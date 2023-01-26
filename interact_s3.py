import boto3
import pandas as pd

#criar um cliente para interagir com AWS s3
s3_client = boto3.client('s3')
s3_client.download_file("andrevaz-enem2020",
                        "andrevaz-enem2020/enem 2020/MICRODADOS_ENEM_2020.csv",
                        "andrevaz-enem2020/enem 2020/MICRODADOS_ENEM_2020.csv")

df = pd.read_csv("andrevaz-enem2020/enem 2020/MICRODADOS_ENEM_2020.csv", sep=";")
print(df)

