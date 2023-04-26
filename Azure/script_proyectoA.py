from bs4 import BeautifulSoup
import requests
import pyodbc

url = 'https://ca.wikipedia.org/wiki/Web_scraping'
response = requests.get(url)

soup = BeautifulSoup(response.text, 'html.parser')
title = soup.title.string
list_item = soup.find('ul').find('li').get_text()

server = 'webscrapingbd.database.windows.net'
database = 'webscrapingBBDD'
username = 'adminbd'
password = 'Informatica_1'
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=' + server + ';DATABASE=' + database + ';UID=' + username + ';PWD=' + password)
cursor = cnxn.cursor()

cursor.execute("CREATE TABLE scraped_data (title varchar(255), list_item varchar(255))")
cnxn.commit()

cursor.execute("CREATE TABLE scraped_data (title varchar(255), list_item varchar(255))")
cnxn.commit()

cnxn.close()
