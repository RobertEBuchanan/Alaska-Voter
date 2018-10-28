/******************************************************************************
    
    Description:    Check if file exists.  For use prior to bulk loading data

    "Stolen" from https://stackoverflow.com/questions/11740000/check-for-file-exists-or-not-in-sql-server

*******************************************************************************/
CREATE view dbo.RawVotes
as
with
	raw_history as 
	(
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH1
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH2
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH3
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH4
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH5
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH6
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH7
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH8
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH9
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH10
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH11
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH12
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH13
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH14
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH15
		from dbo.RawStateVoterImport
	
		union all
	
		select 
			[ascension_number]	 = [ASCENSION #], 
			election			 = VH16
		from dbo.RawStateVoterImport
	)
	select 
		* ,
		[vote_year]		= cast(substring(election,1,2) as int),
		[vote_election]	= rtrim(substring(election,3,4)),	
		[vote_method]	= substring(reverse(election),1,2)
	from raw_history
	where election is not null


GO
