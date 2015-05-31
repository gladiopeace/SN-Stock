/****** Object:  Stored Procedure [dbo].ContentParameterDelete    Script Date: 28 May 2009 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spContentParameterDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spContentParameterDelete]
GO

	
/******************************************************************************
**		File: 
**		Name: [dbo].spContentParameterDelete
**		Desc: 
**
**		Return values:
** 
**		Called by:   
**              
**		Parameters:
**		Input							Output
**     ----------							-----------
**
**		Auth: CodeSmith
**		Date: 28/05/2009 16:59:42
*******************************************************************************
**		Change History
*******************************************************************************
**		Date:		Author:				Description:
**		--------		--------				-------------------------------------------
**    
*******************************************************************************/
CREATE PROCEDURE [dbo].spContentParameterDelete
	@ContentParameterID int
AS

DELETE FROM [dbo].[ContentParameter]
WHERE
	[ContentParameterID] = @ContentParameterID
GO
	
	

	
