# Creating ATM Program in Python

# Balance
balance = {'john': 943, 'peter': 456, 'steven': 9733}

# Card Holder
print("Welcome to Chase!")

# Looping through user's name and options
while True:
    name = input("Please enter your name: ")
    if name == '':
        break
    
    if name not in balance:
        print("You don't have account with us! Please try again with account holder's name")
    
    if name in balance:
        print("Welcome", name.upper())
        print("\n")
        print(""" Please select one option:
            1- Balance
            2- Withdraw
            3- Deposit
            4- Quit
                    
                    """)
        break

    
while True:
    option = int(input("Select one option: "))
    if option in range(1,4):
        print("Please wait a moment while we access your information")
        #break
        
    if option == 1:
        print("Balance: $", balance[name])     
    
    if option ==2:
        print("How much do you want to withdraw?")
        withdraw = int(input("Enter withdrawal amount!: "))
        balance[name] = balance[name] - withdraw
        print("Your new balance is $", balance[name])
    
    if option == 3:
        print("How much do you want to deposit?")
        deposit = int(input("Enter deposit amount: "))
        balance[name] = balance[name] + deposit
        print("Your new balance is $", balance[name])
        
    if option == 4:
        print("Thank you for visiting us")
        break

        
        
        
        
        
        
        
        
        
        