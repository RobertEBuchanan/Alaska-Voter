# Alaska-Voter
The primary purpose of this project is to make working with voter data easer and more efficient. Manually loading and cleaning voter data is a pain. I have time at the moment to build automation.

The secondary purpose is self improvement and practice.
* Learning new MS SQL and TSQL features 
* More practice using SSDT database project for database development.  (I normally SSMS)

# Domain
Voter data is available to anyone fromthe the ALaska Division of Elections.  The data is avaiable as a CSV file on CD.  There is a small user fee of $21.

# Technical 

## Data
The backend is MS SQL 2017+.  

For development, I am currently using the latest CTP of 2019.  
* I want a chance to play with new features.  
* By the time this project is finished, SQL 2019 shoudl be close to release. 

I am building the database with a database project in SSDT.
* Lower friction deployments. (Perhaps CI?)
* Project helps to organise SLQ code.

# Plans
- Database 
  - SSDT
  - SQL 2017+
- DataAcess Layer 
  - EF6(?) 
    Currently planning to use EF6
    Why? The (very nice) EF Reverse POCO Generator (Simon Hughes) still doesn't support EF core. 
- Admin App - Probably just a tool for importing data.  This may actually be just a glorified "open-file" dialog. 
  - Probably a WinForms (easy) 
  - Not using EF6 code for this.  Not worth trouble.  It looks like it won't actually do much data access. (Just a call to a proc to import voter data)
- Web Application:
  - Would allow self service and would scale to more people.  The major parties have their own databases.  Buiness can afford to buy lists.  Many folks can't afford good data.
  - MVC?
  - 
  

# TODO
- Frame out solution
  - Data Ingestion                   
  - DB Schema / Setup
    - tables
        - processing schema 
          - raw (used for import)
        - voter schema 
          - registration (ascension #)
          - election 
          - vote
        - user schema (?)
          - user
          - some privs taable(s)
          - billig info?? subscription info???
    - features / tech
      - >= SQL 2016
      - (?) Unit tests w/ lSQLt or some other tool
      - Containers?
      - Row Level security?
- Design
  - Web UI in Balsamiq | PPT | Visio?
- User Stories 
  - Get my own data
  - Get super voters
  - Households mailing
