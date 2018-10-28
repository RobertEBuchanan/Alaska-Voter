# Alaska-Voter
The purpose of this project is to make working with voter data easer and more efficient. I personally get at least a few requests for help every year.  Manually loading and cleaning the voter roles is a pain.

# Techninology
- Database 
  - SSDT
  - SQL 2017+
- DataAcess Layer 
  - EF6(?) 
    Currently planning to use EF6
    Why? The (very nice) EF Reverse POCO Generator (Simon Hughes) still doesn't support EF core. 
- Admin App - Probably just a tool for importing data.  This may actually be just a glorified "open-file" dialog. 
  - Probably a WinForms (easy) 
  - Maybe just a PowerShell Script   
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
