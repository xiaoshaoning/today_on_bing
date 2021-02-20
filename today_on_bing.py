#!/usr/bin/python3

from selenium import webdriver
import time

with open('link.txt', 'r') as fid:
    link = fid.readline()

    link = link.replace("\\u0026", "&")
    link = 'https://cn.bing.com/' + link + '&ensearch=1'

    options = webdriver.ChromeOptions()
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--test-type')
    options.add_argument('--headless')
    options.binary_location = "/usr/bin/chromium-browser"
    driver = webdriver.Chrome(chrome_options=options)
    driver.get(link)
    time.sleep(10)
    html = driver.page_source
    print(html)
