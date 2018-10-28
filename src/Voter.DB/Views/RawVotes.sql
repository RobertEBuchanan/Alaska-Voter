/******************************************************************************
    
    Description:    Turns voter history from Div of Elctions into more relational form
    
*******************************************************************************/
CREATE view dbo.RawVotes
as
with
	raw_history as 
	(
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH1
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH2
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH3
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH4
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH5
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH6
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH7
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH8
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH9
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH10
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH11
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH12
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH13
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH14
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH15
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			VoterId	 = [ASCENSION #], 
			Election = VH16
		from dbo.RawStateVoterImport
	)
	select 
		* ,
		[VoteYear]		= cast(substring(election,1,2) as int),
		[VoteElection]	= rtrim(substring(election,3,4)),	
		[VoteMethod]	= substring(reverse(election),1,2)
	from raw_history
	where Election is not null

GO
