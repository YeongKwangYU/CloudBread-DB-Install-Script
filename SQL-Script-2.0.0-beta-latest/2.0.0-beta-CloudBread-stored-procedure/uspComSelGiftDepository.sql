--DROP PROC uspComSelGiftDepository
CREATE PROC uspComSelGiftDepository
@GiftDepositoryID NVARCHAR(MAX)
AS 
select 
GiftDepositoryID, ItemListID, ItemCount, FromMemberID, ToMemberID, sCol1, sCol2, sCol3, sCol4, sCol5, sCol6, sCol7, sCol8, sCol9, sCol10
from GiftDepositories with(nolock)
where GiftDepositoryID like @GiftDepositoryID  and HideYN like 'N' and DeleteYN like 'N'
GO

/*
-----------------------------------------------------------------------
EXEC uspComSelGiftDepository 'GiftID1'
EXEC uspComSelGiftDepository 'noexists'
-----------------------------------------------------------------------

select * from GiftDepositories
SELECT * FROM members
select * from Members
*/