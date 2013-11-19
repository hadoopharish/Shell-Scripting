Shell-Scripting
===============
Assignment - Build a Contact Management System
 
Requirements:
1. Script should accept a command line argument which is the file to store the contacts in
   & Validate the command line argument and show usage if arg is not passed
   I. check if the file exists passed as cmd-line arg and create if not present
 
2. Using Menu Driven, menu should be as follows:
```
    SHELL PROGRAMMING DATABASE
      MAIN MENU
 
What do you wish to do?
 
  1.  Create records
  2.  View records
  3.  Search for records
  4.  Delete records that match a pattern
 
Answer (or 'q' to quit)? 
```
3. File Structure:
firstname:lastname:address:city:state:zip
 
4. Menu Options:
  I. Create records:
      Users can create records using the structure specified
      ```
      Please enter the following contact details:
 
      Given name: 
         Surname: 
         Address: 
            City: 
           State: 
             Zip:
      ```
    Script should prompt for user to validate whether the values are correct if
    yes store them in the file else reject them and ask user to re-enter the
    details.
  II. View records
      Parse the records from the file and show them in prety format
      ```
      First Name    Surname         Address             City           State Zip
      ============================================================================
                                                                            
      ashrith       m               3226                hayward        ca    94545
 
      There are 2 contacts in the database
      Hit <ENTER> to continue: 
      ```
  III. Search records based on pattern
  IV. Delete records in the file based on the pattern or all entries if no pattern is eneterd.
