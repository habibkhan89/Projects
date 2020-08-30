# Data cleaning using Regular Expressions

# required libraries
import pandas as pd
import re

# Opening the txt file as STRING
with open('C:/Users/hukha/Desktop/MS - Data Science/misc/Projects/Data_regex2.txt','r') as file:
    data = file.read() # if use readlines or readline then it will open as list not str

# Double checking the type - It's string not List
type(data)
# Extracting info
info = re.findall(r'Name\s+(\w+)\s+Agency\s+(\w+)\s+Company\s+(\w+)\s+Dept\s+(\w+)\s+Location\s+([A-Za-z ]+)\s+Status\s+(\w+)\s+Sale\s+(\d+)\s+Profit\s+(\d+)',data)

# Printing all the required info as dataframe
pd.DataFrame(info, columns=['Name','Agency','Company','Dept','Location','Status','Sale','Profit']).head()

