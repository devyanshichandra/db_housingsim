#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
HOUSING SEARCH AND APPLICATION
DATABASE DESIGN (CS3200) PROJECT
DEVYANSHI CHANDRA, RAHIL BADKUL
"""
import pymysql
import pandas as pd


""" 2. need to create system that allows us to call the functions of preferences, create a list of what
they like, then add to allocations table and print as df"""


def find_price(cnx, capacity, cstanding):
        
    price = str(input("Out of the three price categories, Enhanced, Standard, and Economy, which \
                          would you look to choose from?: "))
    if price.lower() == "economy" or price.lower() == "standard" or price.lower() == "enhanced":
        cur = cnx.cursor()
        query = "SELECT building_id, building_name, street_name, capacity FROM building WHERE price_cat=LOWER(%s) AND capacity >= %s \
                AND building_class = %s ORDER BY price_cat"
        cur.execute(query, (price, capacity, cstanding))
        rows = cur.fetchall()
        b_lst = []
        for row in rows:
            b_lst.append(row)
            
        pfilter = pd.DataFrame(b_lst)
        return pfilter
        cur.close()
        print("Invalid price category")
    
def find_loc(cnx, capacity, cstanding):
    loc = str(input("Which of the locations from the output above would you like to look at?: ")).lower()
    cur = cnx.cursor()
    
    query = ("SELECT building_id, building_name, street_name, capacity FROM building WHERE capacity >= %s  \
            AND building_class <= %s AND LOWER(street_name) LIKE LOWER(%s)")
    params = (capacity, cstanding, loc)
    cur.execute(query, params)
    rows = cur.fetchall()
    b_lst = []
    for row in rows:
        b_lst.append(row)
    
    lfilter = pd.DataFrame(b_lst)
    return lfilter
    cur.close()
    

def find_dorms(cnx, buildingid, capacity):
    
    cur = cnx.cursor()
    query = "SELECT * FROM dorm WHERE building_id = %s AND capacity >= %s"
    cur.execute(query, (buildingid, capacity))
    rows = cur.fetchall()
    
    d_lst = []
    for row in rows:
        d_lst.append(row)
        
    dorm_info = pd.DataFrame(d_lst)
    
    cur.close()
    return dorm_info

def find_rooms(cnx, dorm_num, capacity):
    cur = cnx.cursor()
    query = "SELECT * FROM room WHERE dorm_num = %s"
    cur.execute(query, dorm_num)
    rows = cur.fetchall()
    lst = []
    for row in rows:
        lst.append(row)
    
    rooms = pd.DataFrame(lst)
    cur.close()
    return rooms

# gives you your preferred building
def enter_preferences(cnx, capacity, cstanding, search = True):
    """calls in functions to insert preferences into table and asks for user input based on
    their choice of filter"""
    while search == True:
        bpref = str(input("Do you have a preference on which building you'd like to search for? Y/N:"))
        if bpref.upper() == "Y":
            cur = cnx.cursor()
            building = str(input("Which building would you like to look at? Please enter the full name: ")).lower()
            query = "SELECT building_id, street_name, price_cat FROM building WHERE LOWER(building_name)=LOWER(%s) \
                AND capacity >= %s AND building_class <= %s"
            params = (building, capacity, cstanding)
            cur.execute(query, params)
            rows = cur.fetchall()
            lst = []
            for row in rows:
                lst.append(row)
                    
            bfilter = pd.DataFrame(lst)
            print(bfilter)
                    
            
            if len(rows) == 0:
                print("This building either doesn't have enough capacity for your group or doesn't match your class standing")
                query = "SELECT building_name, capacity, building_class from building where LOWER(building_name)=LOWER(%s)"
                cur.execute(query, building)
                binfo = cur.fetchall()
                print("This is our information on the building: ")
                print(binfo)
                
                
            elif len(rows) > 0:
                print("Here are the available dorms in this building that can fit your capacity:")
                buildingid = bfilter["building_id"]
                print(find_dorms(cnx, capacity, buildingid))
                dorm_num = int(input("Which of these dorms would you like to look further at? Choose by Dorm #"))
                print(find_rooms(cnx, dorm_num, capacity))
            
                cnx.autocommit(True)
                add_pref = str(input("Would you like to add this building as a preference? Y/N: "))
                
                if add_pref.upper() == "Y":
                    print("works")
                    group = str(input("Enter your group ID again: "))
                    buildingid = str(input("Which building ID are you adding?: ")).upper()
                    query1 = "select building_id, building_name, street_name, price_cat FROM building \
                        WHERE building_id = %s"
                    cur.execute(query1, buildingid)
                    rows = cur.fetchall()
                    for row in rows:
                        print(rows)
                        b_id, bname = row["building_id"], row["building_name"]
                        loc, price = row["street_name"], row["price_cat"]
                    params = (building, buildingid, price, loc, group) 
                    query = "call add_preference(%s, %s, %s, %s, %s)"
                    cur.execute(query, params)
                    rows = cur.fetchall()
                    print("Added!")
                    
                elif add_pref == "N":
                    pass
    
        elif bpref.upper() == "N":
            cur = cnx.cursor()
            query = "SELECT building_id, street_name, price_cat FROM building WHERE capacity >= %s AND building_class = %s"
            cur.execute(query, (capacity, cstanding))
            rows = cur.fetchall()
            print("Here are all the buildings in our database, its location, and price category that are still available",
                  "and are within your class standing")
            b_lst = []
            for row in rows:
                b_lst.append(row)
            
            buildings = pd.DataFrame(b_lst)
            print(buildings)
            cur.close()
            
            filters = str(input("Would you like to filter your search results by price, location, or both?: "))
            if filters.lower() == "price":
                pfilter = find_price(cnx, capacity, cstanding)
                print(pfilter)
            elif filters.lower() == "location":
                lfilter = find_loc(cnx, capacity, cstanding)
                print(lfilter)
            elif filters.lower() == "both":
                pfilter = find_price(cnx, capacity, cstanding)
                print(pfilter)
                location = str(input("Which location out of these would you like to choose?: ")).capitalize()
                locprice = pfilter[pfilter["street_name"] == location]
                print("Here are your results: ")
                print(locprice)
                
            print("")
            
            print("If you'd like to skip the following, type 'N/A':")
            choose_d = str(input("To look at available dorms, type the building id: "))
            if choose_d.upper() == "N/A":
                pass
            else:
                if len(choose_d) > 2:
                    print("Too many searches. Please try again")
                else:
                    dorm = find_dorms(cnx, choose_d, capacity)
                    print(dorm)
                    rsearch = str(input("Would you like to look at the rooms? Y/N: "))
                    if rsearch.upper() == "Y":
                        dorm_num = int(input("Which dorm number?: "))
                        print(find_rooms(cnx, dorm_num, capacity))
                    elif rsearch.upper() == "N":
                        pass
                    
            
            add_pref = str(input("Would you like to add this building as a preference? Y/N: "))
            cur = cnx.cursor()
            if add_pref.upper() == "Y":
                choose_d = str(input("Which building ID are you adding?: "))
                group = int(input("Enter your group ID again: "))
                query1 = "select building_id, building_name, street_name, price_cat FROM building \
                    WHERE building_id = %s"
                cur.execute(query1, choose_d)
                rows = cur.fetchall()
                for row in rows:
                    print(rows)
                    b_id, bname = row["building_id"], row["building_name"]
                    loc, price = row["street_name"], row["price_cat"]
                print(bname, b_id, loc, price, group)
                params = (bname, b_id, loc, price, group)
                query2 = "call add_preference(%s, %s, %s, %s, %s)"
                cur.execute(query2, params)
                print("Preference added!")
    
            else:
                pass
                        
        else:
            print("Invalid Answer, please restart")
        
        action = str(input("Continue searching? Y/N: ")).upper()
        if action == "Y":
            search = True
        elif action == "N":
            search = False
            break
    
    

def main():
    username = input("Enter your username for the MySQL connection: ")
    password = input("Enter your password for the MySQL connection: ")
    try:
        cnx = pymysql.connect(host='localhost', user=username, password=password, \
                              db='housing', charset='utf8mb4', cursorclass=pymysql.cursors.DictCursor)
        cnx.autocommit(True)

    except pymysql.err.OperationalError as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))
        
    try:
        cur = cnx.cursor()
        create_group = input("Is your group within our database? Y/N: ")
        if str(create_group).upper() == "Y":
            action = str(input("Would you like to SEARCH for dorms or EDIT your roommate group? Please enter\
                                   one of the two options (search/edit): "))
                                   
            group = int(input("What is your group's ID?: "))
            query = "SELECT * FROM rooming_group WHERE rooming_group_id = %s"
            cur.execute(query, group)
            rows = cur.fetchall()
            assert len(rows) > 0, print("Invalid ID")
                
            if action.lower() == "edit":
                while True:
                    edits = str(input("Would you like to add or delete a student from your group?Type N/A if you'd like to break or (A/D): "))
                    if edits.upper() == "D":
                        for d in rows:
                            for k,v in d.items():
                                if v != None:
                                    print(k.capitalize(), v)
                        delete_id = int(input("Enter the student ID you'd like to remove from your group: "))
                        query = "call delete_student(%s)"
                        cur.execute(query, delete_id)
                        print("This student has been removed from the group", delete_id)
                    elif edits.upper() == "A":
                        add_id = int(input("Enter the student ID you'd like to add to your group: "))
                        query = "call add_student_to_existing_group(%s, %s)"
                        cur.execute(query, (add_id, group))
                        print("Member added!")
                    if edits.upper() == "N/A":
                        action = str(input("Would you like to search now?(Y/N): "))
                        if action.upper() == "Y":
                            action = "search"
                            break
                            
            if action.lower() == "search":
                for d in rows:
                    capacity = 0
                    cstanding = d["g_class_standing"]
                    for k, v in d.items():
                        if k != "selection_num" and k!= "g_class_standing" and v != None:
                            capacity += 1
            
            else:
                print("Invalid Action")
                
        elif str(create_group).upper() == "N":
            studids = input("Please enter the student IDs of all students you'd like to add in your group, \
                            including your own, seperated by commas and no spaces: ")
            id_lst = studids.split(",")
            for ids in id_lst:
                if len(ids) != 9:
                    print("This ID you've entered is invalid:", ids)
                    break
                elif int(ids) == False:
                    print("This ID you've entered is invalid:", ids)
                    break
            if len(id_lst) > 8:
                print("Roommate groups can only have up to 8 people!")
            else:
                id_lst = list(set(id_lst))
                if len(id_lst) <= 8:
                    capacity = len(id_lst)
                    for i in range(len(id_lst), 8):
                        id_lst.append(None)      
                            
                
            i = 0
            print("You will be entering more information regarding your roommate group")
            while i < len(id_lst):
                if id_lst[i] == None:
                    pass
                else:
                    currentid = id_lst[i]
                    print("ID: ", id_lst[i])
                    fname = str(input("Please enter this student's first name: "))
                    lname = str(input("Please enter this student's last name: "))
                    selectionnum = int(input("Please enter this student's selection number: "))
                    cstanding = int(input("Please enter this student's class standing(Second years as 2, Upperclassmen as 3):")) 
                    if selectionnum < 1000 or selectionnum > 9999:
                        print("Invalid Selection Number")
                    if cstanding != 2 and cstanding != 3:
                        print("Invalid Class Standing, this server is only for Second years and Upperclassmen")
                    else:
                        params = (currentid, fname, lname, cstanding, selectionnum)
                        cur.execute("call add_student(%s, %s, %s, %s, %s)", params) 
                    
                i+=1
            id_tup = tuple(id_lst)
            cur.execute("call add_group(%s,%s, %s, %s, %s, %s, %s, %s)", id_tup)
                
            stud1 = id_lst[0]
            query = "select * from rooming_group WHERE student_1_id=%s"
            cur.execute(query, stud1)
            rows = cur.fetchall()
            for d in rows:
                for k,v in d.items():
                    if k == "rooming_group_id":
                        print("This is your group ID: ", v)
                
                        
    except pymysql.err.OperationalError as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))
        
    try:
        enter_preferences(cnx, capacity, cstanding, search = True)
        
        cur = cnx.cursor()
        timeslot = str(input("Would you like to see your timeslot? (Y/N): "))
        if timeslot.upper() == "Y":
            group = int(input("Enter your group ID: "))
            query = "select * from time_slot where rooming_group_id = %s" 
            cur.execute(query, group)
            time = cur.fetchall()
            lst = []
            for t in time:
                lst.append(t)
                
            tslot = pd.DataFrame(lst)
            print("Here is your Time Slot: ")
            print(tslot)
                
        else:
            pass
        
        print("Thank you!")
            
    finally:
        cnx.close()
    


if __name__ == "__main__":
    main()
                            
