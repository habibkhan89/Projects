# -*- coding: utf-8 -*-
"""
Created on Sat Aug 15 22:12:12 2020

@author: Habib K
"""

# Define calculate function
def calculate():
    operation = input('''
Welcome to the calculator,                   
    Please type in the math operation you would like to complete:
                          +  -  x  /
                          ''')
    number1 = int(input('Please type the first number: '))
    number2 = int(input('Please type the second number: '))
        
    # addition
    if operation == '+':
        print('{} + {} = '.format(number1, number2))
        print(number1 + number2)
    
    # subtraction
    elif operation == '-':
        print('{} - {} = '.format(number1, number2))
        print(number1 - number2)
    
    # multiplication
    elif operation == 'x':
        print('{} x {} ='.format(number1, number2))
        print(number1 * number2)
    
    # Divide
    elif operation == '/':
        print('{} / {} ='.format(number1,number2))
        print(number1 / number2)
    
    # error
    else:
        print("You have not typed a valid operator, please run the program again")

    
    again() # this calls again function for repeated calculations

# Define again function
def again():
    calc_again = input('''
    Do you want to calculate again? Please type Y or N for yes and no.
                       ''')
    if calc_again.upper() == "Y":
        calculate()
    elif calc_again.upper() == 'N':
        print('See you again')

    else:
        again()

   
        
calculate()