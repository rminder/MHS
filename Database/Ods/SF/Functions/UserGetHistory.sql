-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 04-September, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[UserGetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[UserGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Id] [nvarchar](18) NOT NULL,
	[Username] [nvarchar](80) NULL,
	[LastName] [nvarchar](80) NULL,
	[FirstName] [nvarchar](40) NULL,
	[Name] [nvarchar](121) NULL,
	[CompanyName] [nvarchar](80) NULL,
	[Division] [nvarchar](80) NULL,
	[Department] [nvarchar](80) NULL,
	[Title] [nvarchar](80) NULL,
	[Street] [nvarchar](255) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](80) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Country] [nvarchar](80) NULL,
	[StateCode] [nvarchar](10) NULL,
	[CountryCode] [nvarchar](10) NULL,
	[Latitude] [decimal](32, 16) NULL,
	[Longitude] [decimal](32, 16) NULL,
	[Email] [nvarchar](128) NULL,
	[EmailPreferencesAutoBcc] [tinyint] NULL,
	[EmailPreferencesAutoBccStayInTouch] [tinyint] NULL,
	[EmailPreferencesStayInTouchReminder] [tinyint] NULL,
	[SenderEmail] [nvarchar](80) NULL,
	[SenderName] [nvarchar](80) NULL,
	[Signature] [nvarchar](1333) NULL,
	[StayInTouchSubject] [nvarchar](80) NULL,
	[StayInTouchSignature] [nvarchar](512) NULL,
	[StayInTouchNote] [nvarchar](512) NULL,
	[Phone] [nvarchar](40) NULL,
	[Fax] [nvarchar](40) NULL,
	[MobilePhone] [nvarchar](40) NULL,
	[Alias] [nvarchar](8) NULL,
	[CommunityNickname] [nvarchar](40) NULL,
	[IsActive] [tinyint] NULL,
	[TimeZoneSidKey] [nvarchar](40) NULL,
	[UserRoleId] [nvarchar](18) NULL,
	[LocaleSidKey] [nvarchar](40) NULL,
	[ReceivesInfoEmails] [tinyint] NULL,
	[ReceivesAdminInfoEmails] [tinyint] NULL,
	[EmailEncodingKey] [nvarchar](40) NULL,
	[ProfileId] [nvarchar](18) NULL,
	[UserType] [nvarchar](40) NULL,
	[LanguageLocaleKey] [nvarchar](40) NULL,
	[EmployeeNumber] [nvarchar](20) NULL,
	[DelegatedApproverId] [nvarchar](18) NULL,
	[ManagerId] [nvarchar](18) NULL,
	[LastLoginDate] [datetime2](7) NULL,
	[LastPasswordChangeDate] [datetime2](7) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [nvarchar](18) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[LastModifiedById] [nvarchar](18) NULL,
	[SystemModstamp] [datetime2](7) NULL,
	[OfflineTrialExpirationDate] [datetime2](7) NULL,
	[OfflinePdaTrialExpirationDate] [datetime2](7) NULL,
	[UserPermissionsMarketingUser] [tinyint] NULL,
	[UserPermissionsOfflineUser] [tinyint] NULL,
	[UserPermissionsAvantgoUser] [tinyint] NULL,
	[UserPermissionsCallCenterAutoLogin] [tinyint] NULL,
	[UserPermissionsMobileUser] [tinyint] NULL,
	[UserPermissionsSFContentUser] [tinyint] NULL,
	[UserPermissionsInteractionUser] [tinyint] NULL,
	[UserPermissionsSupportUser] [tinyint] NULL,
	[UserPermissionsChatterAnswersUser] [tinyint] NULL,
	[ForecastEnabled] [tinyint] NULL,
	[UserPreferencesActivityRemindersPopup] [tinyint] NULL,
	[UserPreferencesEventRemindersCheckboxDefault] [tinyint] NULL,
	[UserPreferencesTaskRemindersCheckboxDefault] [tinyint] NULL,
	[UserPreferencesReminderSoundOff] [tinyint] NULL,
	[UserPreferencesDisableAllFeedsEmail] [tinyint] NULL,
	[UserPreferencesDisableFollowersEmail] [tinyint] NULL,
	[UserPreferencesDisableProfilePostEmail] [tinyint] NULL,
	[UserPreferencesDisableChangeCommentEmail] [tinyint] NULL,
	[UserPreferencesDisableLaterCommentEmail] [tinyint] NULL,
	[UserPreferencesDisProfPostCommentEmail] [tinyint] NULL,
	[UserPreferencesContentNoEmail] [tinyint] NULL,
	[UserPreferencesContentEmailAsAndWhen] [tinyint] NULL,
	[UserPreferencesApexPagesDeveloperMode] [tinyint] NULL,
	[UserPreferencesHideCSNGetChatterMobileTask] [tinyint] NULL,
	[UserPreferencesDisableMentionsPostEmail] [tinyint] NULL,
	[UserPreferencesDisMentionsCommentEmail] [tinyint] NULL,
	[UserPreferencesHideCSNDesktopTask] [tinyint] NULL,
	[UserPreferencesDisCommentAfterLikeEmail] [tinyint] NULL,
	[UserPreferencesDisableLikeEmail] [tinyint] NULL,
	[UserPreferencesDisableMessageEmail] [tinyint] NULL,
	[UserPreferencesOptOutOfTouch] [tinyint] NULL,
	[UserPreferencesDisableBookmarkEmail] [tinyint] NULL,
	[UserPreferencesDisableSharePostEmail] [tinyint] NULL,
	[UserPreferencesEnableAutoSubForFeeds] [tinyint] NULL,
	[UserPreferencesDisableFileShareNotificationsForApi] [tinyint] NULL,
	[UserPreferencesShowTitleToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowManagerToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowEmailToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowWorkPhoneToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowMobilePhoneToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowFaxToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowStreetAddressToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowCityToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowStateToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowPostalCodeToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowCountryToExternalUsers] [tinyint] NULL,
	[UserPreferencesShowProfilePicToGuestUsers] [tinyint] NULL,
	[UserPreferencesShowTitleToGuestUsers] [tinyint] NULL,
	[UserPreferencesShowCityToGuestUsers] [tinyint] NULL,
	[UserPreferencesShowStateToGuestUsers] [tinyint] NULL,
	[UserPreferencesShowPostalCodeToGuestUsers] [tinyint] NULL,
	[UserPreferencesShowCountryToGuestUsers] [tinyint] NULL,
	[ContactId] [nvarchar](18) NULL,
	[AccountId] [nvarchar](18) NULL,
	[CallCenterId] [nvarchar](18) NULL,
	[Extension] [nvarchar](40) NULL,
	[PortalRole] [nvarchar](40) NULL,
	[IsPortalEnabled] [tinyint] NULL,
	[IsPortalSelfRegistered] [tinyint] NULL,
	[FederationIdentifier] [nvarchar](512) NULL,
	[AboutMe] [nvarchar](max) NULL,
	[FullPhotoUrl] [nvarchar](1024) NULL,
	[SmallPhotoUrl] [nvarchar](1024) NULL,
	[DigestFrequency] [nvarchar](40) NULL,
	[DefaultGroupNotificationFrequency] [nvarchar](40) NULL,
	[LastViewedDate] [datetime2](7) NULL,
	[LastReferencedDate] [datetime2](7) NULL,
	[ServiceMaxDispatchConsoleSettings] [nvarchar](max) NULL,
	[ServiceMaxSelect] [tinyint] NULL,
	[ServiceMaxFaceTimeId] [nvarchar](100) NULL,
	[ServiceMaxIsSuperDispatcher] [tinyint] NULL,
	[BusinessUnit] [nvarchar](255) NULL,
	[MaterialHandlingSalesPersonId] [nvarchar](10) NULL,
	[SalesArea] [nvarchar](255) NULL,
	[SuperCenter] [nvarchar](255) NULL,
	[CustomerPod] [nvarchar](18) NULL,
	[CompanyLegalName] [nvarchar](100) NULL,
	[TemporaryEmployee] [tinyint] NULL,
	[UserPermissionsKnowledgeUser] [tinyint] NULL,
	[UserPermissionsJigsawProspectingUser] [tinyint] NULL,
	[UserPermissionsWorkDotComUserFeature] [tinyint] NULL,
	[UserPreferencesJigsawListUser] [tinyint] NULL,
	[UserPreferencesLightningExperiencePreferred] [tinyint] NULL,
	[JigsawImportLimitOverride] [int] NULL,
	[BadgeText] [nvarchar](80) NULL,
	[UserPreferencesHideChatterOnboardingSplash] [tinyint] NULL,
	[UserPreferencesHideSecondChatterOnboardingSplash] [tinyint] NULL,
	[UserPreferencesDisableFeedbackEmail] [tinyint] NULL,
	[UserPreferencesDisableWorkEmail] [tinyint] NULL,
	[UserPreferencesHideS1BrowserUI] [tinyint] NULL,
	[UserPreferencesDisableEndorsementEmail] [tinyint] NULL,
	[UserPreferencesPathAssistantCollapsed] [tinyint] NULL,
	[UnityAgentId] [nvarchar](18) NULL,
	[UserManagerUnityAgentId] [nvarchar](18) NULL,
	[UserPreferencesSortFeedByComment] [tinyint] NULL,
	[IgnoreValidations] [tinyint] NULL,
	[UnityCustomerTeam] [nvarchar](max) NULL,
	[UnityCustomerTeamsSelected] [nvarchar](255) NULL,
	[UnityContactExternalId] [nvarchar](80) NULL,
	[GeocodeAccuracy] [nvarchar](40) NULL,
	[UserPreferencesCacheDiagnostics] [tinyint] NULL,
	[UserPreferencesShowEmailToGuestUsers] [tinyint] NULL,
	[UserPreferencesShowManagerToGuestUsers] [tinyint] NULL,
	[UserPreferencesShowWorkPhoneToGuestUsers] [tinyint] NULL,
	[UserPreferencesShowMobilePhoneToGuestUsers] [tinyint] NULL,
	[UserPreferencesShowFaxToGuestUsers] [tinyint] NULL,
	[UserPreferencesShowStreetAddressToGuestUsers] [tinyint] NULL,
	[UserPreferencesPreviewLightning] [tinyint] NULL,
	[UserPreferencesHideEndUserOnboardingAssistantModal] [tinyint] NULL,
	[UserPreferencesHideLightningMigrationModal] [tinyint] NULL,
	[UserPreferencesHideSfxWelcomeMat] [tinyint] NULL,
	[UserPreferencesHideBiggerPhotoCallout] [tinyint] NULL,
	[MediumPhotoUrl] [nvarchar](1024) NULL,
	[BannerPhotoUrl] [nvarchar](1024) NULL,
	[IsProfilePhotoActive] [tinyint] NULL,
	[ServiceMaxServiceMax_User] [tinyint] NULL,
	[UserPreferencesGlobalNavBarWTShown] [tinyint] NULL,
	[UserPreferencesGlobalNavGridMenuWTShown] [tinyint] NULL,
	[UserPreferencesCreateLEXAppsWTShown] [tinyint] NULL,
	[UserPreferencesFavoritesWTShown] [tinyint] NULL,
	[SmallBannerPhotoUrl] [nvarchar](1024) NULL,
	[MediumBannerPhotoUrl] [nvarchar](1024) NULL,
	[LastUpdate] [datetime2](7) NOT NULL,
	[ImportDate] [datetime2](7) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL,
	[__Operation] CHAR(1) NOT NULL,
	[__OperationDate] DATETIME2 NOT NULL
)
AS
BEGIN
	DECLARE @DistinctPKValue TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)
	)
	DECLARE @ActivityTable TABLE 
	(
		RowId BIGINT NOT NULL,
		ValidFrom DATETIME2	 NOT NULL,
		ValidTo DATETIME2 NOT NULL,
		RowNumber INT NOT NULL,
		MaxRowNumber INT NOT NULL,
		UNIQUE CLUSTERED (RowId, ValidFrom, ValidTo)
	)
	DECLARE @EndDateTableState TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)	
	)
	DECLARE @InsertUpdateDeleteTable TABLE 
	(
		RowId BIGINT NOT NULL,
		Operation CHAR(1) NOT NULL,
		OperationDate DATETIME2 NOT NULL,
		UNIQUE CLUSTERED (RowId, Operation, OperationDate)
	)

	-- Find and store all distinct PK values found for the desired time period.
	INSERT INTO @DistinctPKValue (RowId)
	SELECT DISTINCT RowId
	FROM SF.[User] FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.[User]
		FOR SYSTEM_TIME AS OF @EndDateUtc T
	INNER JOIN @EndDateTableState T2 ON T2.RowId = T.RowId

	-- For each PK value found above, store all activity for those rows.
	INSERT INTO @ActivityTable (RowId, ValidFrom, ValidTo, RowNumber, MaxRowNumber)
	SELECT
		 T.RowId
		,ValidFrom
		,ValidTo
		,ROW_NUMBER() OVER (PARTITION BY T.RowId ORDER BY ValidFrom) AS [RowNumber]
		,SUM(1) OVER (PARTITION BY T.RowId) AS MaxRowNumber
	FROM SF.[User] FOR SYSTEM_TIME ALL T 
	INNER JOIN @DistinctPKValue T2 ON T2.RowId = T.RowId

	-- Store all the inserts. An insert can be identified by a row in @ActivityTable that has a RowNumber = 1 and
	-- ValidFrom within the desired time period. The ValidFrom is the date the row was 'born'
	INSERT Into @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		RowId
		,'I' AS Operation
		,ValidFrom AS OperationDate
	FROM @ActivityTable
	WHERE RowNumber = 1 AND ValidFrom BETWEEN @StartDateUtc AND @EndDateUtc

	-- Store all the deletes. A delete can be identified by a row in @ActivityTable where RowNumber = MaxRowNumber and the row
	-- doesn't exist in @EndDateStateTable
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
	   ,'D'		AS Operation
	   ,ValidTo AS OperationDate
	FROM @ActivityTable				 T
		LEFT JOIN @EndDateTableState T2 ON T2.RowId = T.RowId
	WHERE
		T.RowNumber = T.MaxRowNumber
		AND T2.RowId IS NULL;

	-- Store all updates. An update can be identified by a row whose RowNumber > 1. If a row is inserted and then deleted (with no updates)
	-- there will only be a single row in history. Each time a row is updated, an entry is added to history. Therefore, the total number of
	-- updates for a row will be maximum row number - 1.
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
		,'U' AS Operation
		,T.ValidFrom AS OperationDate
	FROM @ActivityTable T
	WHERE RowNumber > 1

	-- ====================================================================================================================
	-- Now we're going to gather all the results and store them in the return table.
	-- ====================================================================================================================

	;WITH BaseTableActivity AS
	(
		SELECT 
			 [RowId]
			,[Id]
			,[Username]
			,[LastName]
			,[FirstName]
			,[Name]
			,[CompanyName]
			,[Division]
			,[Department]
			,[Title]
			,[Street]
			,[City]
			,[State]
			,[PostalCode]
			,[Country]
			,[StateCode]
			,[CountryCode]
			,[Latitude]
			,[Longitude]
			,[Email]
			,[EmailPreferencesAutoBcc]
			,[EmailPreferencesAutoBccStayInTouch]
			,[EmailPreferencesStayInTouchReminder]
			,[SenderEmail]
			,[SenderName]
			,[Signature]
			,[StayInTouchSubject]
			,[StayInTouchSignature]
			,[StayInTouchNote]
			,[Phone]
			,[Fax]
			,[MobilePhone]
			,[Alias]
			,[CommunityNickname]
			,[IsActive]
			,[TimeZoneSidKey]
			,[UserRoleId]
			,[LocaleSidKey]
			,[ReceivesInfoEmails]
			,[ReceivesAdminInfoEmails]
			,[EmailEncodingKey]
			,[ProfileId]
			,[UserType]
			,[LanguageLocaleKey]
			,[EmployeeNumber]
			,[DelegatedApproverId]
			,[ManagerId]
			,[LastLoginDate]
			,[LastPasswordChangeDate]
			,[CreatedDate]
			,[CreatedById]
			,[LastModifiedDate]
			,[LastModifiedById]
			,[SystemModstamp]
			,[OfflineTrialExpirationDate]
			,[OfflinePdaTrialExpirationDate]
			,[UserPermissionsMarketingUser]
			,[UserPermissionsOfflineUser]
			,[UserPermissionsAvantgoUser]
			,[UserPermissionsCallCenterAutoLogin]
			,[UserPermissionsMobileUser]
			,[UserPermissionsSFContentUser]
			,[UserPermissionsInteractionUser]
			,[UserPermissionsSupportUser]
			,[UserPermissionsChatterAnswersUser]
			,[ForecastEnabled]
			,[UserPreferencesActivityRemindersPopup]
			,[UserPreferencesEventRemindersCheckboxDefault]
			,[UserPreferencesTaskRemindersCheckboxDefault]
			,[UserPreferencesReminderSoundOff]
			,[UserPreferencesDisableAllFeedsEmail]
			,[UserPreferencesDisableFollowersEmail]
			,[UserPreferencesDisableProfilePostEmail]
			,[UserPreferencesDisableChangeCommentEmail]
			,[UserPreferencesDisableLaterCommentEmail]
			,[UserPreferencesDisProfPostCommentEmail]
			,[UserPreferencesContentNoEmail]
			,[UserPreferencesContentEmailAsAndWhen]
			,[UserPreferencesApexPagesDeveloperMode]
			,[UserPreferencesHideCSNGetChatterMobileTask]
			,[UserPreferencesDisableMentionsPostEmail]
			,[UserPreferencesDisMentionsCommentEmail]
			,[UserPreferencesHideCSNDesktopTask]
			,[UserPreferencesDisCommentAfterLikeEmail]
			,[UserPreferencesDisableLikeEmail]
			,[UserPreferencesDisableMessageEmail]
			,[UserPreferencesOptOutOfTouch]
			,[UserPreferencesDisableBookmarkEmail]
			,[UserPreferencesDisableSharePostEmail]
			,[UserPreferencesEnableAutoSubForFeeds]
			,[UserPreferencesDisableFileShareNotificationsForApi]
			,[UserPreferencesShowTitleToExternalUsers]
			,[UserPreferencesShowManagerToExternalUsers]
			,[UserPreferencesShowEmailToExternalUsers]
			,[UserPreferencesShowWorkPhoneToExternalUsers]
			,[UserPreferencesShowMobilePhoneToExternalUsers]
			,[UserPreferencesShowFaxToExternalUsers]
			,[UserPreferencesShowStreetAddressToExternalUsers]
			,[UserPreferencesShowCityToExternalUsers]
			,[UserPreferencesShowStateToExternalUsers]
			,[UserPreferencesShowPostalCodeToExternalUsers]
			,[UserPreferencesShowCountryToExternalUsers]
			,[UserPreferencesShowProfilePicToGuestUsers]
			,[UserPreferencesShowTitleToGuestUsers]
			,[UserPreferencesShowCityToGuestUsers]
			,[UserPreferencesShowStateToGuestUsers]
			,[UserPreferencesShowPostalCodeToGuestUsers]
			,[UserPreferencesShowCountryToGuestUsers]
			,[ContactId]
			,[AccountId]
			,[CallCenterId]
			,[Extension]
			,[PortalRole]
			,[IsPortalEnabled]
			,[IsPortalSelfRegistered]
			,[FederationIdentifier]
			,[AboutMe]
			,[FullPhotoUrl]
			,[SmallPhotoUrl]
			,[DigestFrequency]
			,[DefaultGroupNotificationFrequency]
			,[LastViewedDate]
			,[LastReferencedDate]
			,[ServiceMaxDispatchConsoleSettings]
			,[ServiceMaxSelect]
			,[ServiceMaxFaceTimeId]
			,[ServiceMaxIsSuperDispatcher]
			,[BusinessUnit]
			,[MaterialHandlingSalesPersonId]
			,[SalesArea]
			,[SuperCenter]
			,[CustomerPod]
			,[CompanyLegalName]
			,[TemporaryEmployee]
			,[UserPermissionsKnowledgeUser]
			,[UserPermissionsJigsawProspectingUser]
			,[UserPermissionsWorkDotComUserFeature]
			,[UserPreferencesJigsawListUser]
			,[UserPreferencesLightningExperiencePreferred]
			,[JigsawImportLimitOverride]
			,[BadgeText]
			,[UserPreferencesHideChatterOnboardingSplash]
			,[UserPreferencesHideSecondChatterOnboardingSplash]
			,[UserPreferencesDisableFeedbackEmail]
			,[UserPreferencesDisableWorkEmail]
			,[UserPreferencesHideS1BrowserUI]
			,[UserPreferencesDisableEndorsementEmail]
			,[UserPreferencesPathAssistantCollapsed]
			,[UnityAgentId]
			,[UserManagerUnityAgentId]
			,[UserPreferencesSortFeedByComment]
			,[IgnoreValidations]
			,[UnityCustomerTeam]
			,[UnityCustomerTeamsSelected]
			,[UnityContactExternalId]
			,[GeocodeAccuracy]
			,[UserPreferencesCacheDiagnostics]
			,[UserPreferencesShowEmailToGuestUsers]
			,[UserPreferencesShowManagerToGuestUsers]
			,[UserPreferencesShowWorkPhoneToGuestUsers]
			,[UserPreferencesShowMobilePhoneToGuestUsers]
			,[UserPreferencesShowFaxToGuestUsers]
			,[UserPreferencesShowStreetAddressToGuestUsers]
			,[UserPreferencesPreviewLightning]
			,[UserPreferencesHideEndUserOnboardingAssistantModal]
			,[UserPreferencesHideLightningMigrationModal]
			,[UserPreferencesHideSfxWelcomeMat]
			,[UserPreferencesHideBiggerPhotoCallout]
			,[MediumPhotoUrl]
			,[BannerPhotoUrl]
			,[IsProfilePhotoActive]
			,[ServiceMaxServiceMax_User]
			,[UserPreferencesGlobalNavBarWTShown]
			,[UserPreferencesGlobalNavGridMenuWTShown]
			,[UserPreferencesCreateLEXAppsWTShown]
			,[UserPreferencesFavoritesWTShown]
			,[SmallBannerPhotoUrl]
			,[MediumBannerPhotoUrl]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
		FROM SF.[User]
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
		 (
			 [RowId]
			,[Id]
			,[Username]
			,[LastName]
			,[FirstName]
			,[Name]
			,[CompanyName]
			,[Division]
			,[Department]
			,[Title]
			,[Street]
			,[City]
			,[State]
			,[PostalCode]
			,[Country]
			,[StateCode]
			,[CountryCode]
			,[Latitude]
			,[Longitude]
			,[Email]
			,[EmailPreferencesAutoBcc]
			,[EmailPreferencesAutoBccStayInTouch]
			,[EmailPreferencesStayInTouchReminder]
			,[SenderEmail]
			,[SenderName]
			,[Signature]
			,[StayInTouchSubject]
			,[StayInTouchSignature]
			,[StayInTouchNote]
			,[Phone]
			,[Fax]
			,[MobilePhone]
			,[Alias]
			,[CommunityNickname]
			,[IsActive]
			,[TimeZoneSidKey]
			,[UserRoleId]
			,[LocaleSidKey]
			,[ReceivesInfoEmails]
			,[ReceivesAdminInfoEmails]
			,[EmailEncodingKey]
			,[ProfileId]
			,[UserType]
			,[LanguageLocaleKey]
			,[EmployeeNumber]
			,[DelegatedApproverId]
			,[ManagerId]
			,[LastLoginDate]
			,[LastPasswordChangeDate]
			,[CreatedDate]
			,[CreatedById]
			,[LastModifiedDate]
			,[LastModifiedById]
			,[SystemModstamp]
			,[OfflineTrialExpirationDate]
			,[OfflinePdaTrialExpirationDate]
			,[UserPermissionsMarketingUser]
			,[UserPermissionsOfflineUser]
			,[UserPermissionsAvantgoUser]
			,[UserPermissionsCallCenterAutoLogin]
			,[UserPermissionsMobileUser]
			,[UserPermissionsSFContentUser]
			,[UserPermissionsInteractionUser]
			,[UserPermissionsSupportUser]
			,[UserPermissionsChatterAnswersUser]
			,[ForecastEnabled]
			,[UserPreferencesActivityRemindersPopup]
			,[UserPreferencesEventRemindersCheckboxDefault]
			,[UserPreferencesTaskRemindersCheckboxDefault]
			,[UserPreferencesReminderSoundOff]
			,[UserPreferencesDisableAllFeedsEmail]
			,[UserPreferencesDisableFollowersEmail]
			,[UserPreferencesDisableProfilePostEmail]
			,[UserPreferencesDisableChangeCommentEmail]
			,[UserPreferencesDisableLaterCommentEmail]
			,[UserPreferencesDisProfPostCommentEmail]
			,[UserPreferencesContentNoEmail]
			,[UserPreferencesContentEmailAsAndWhen]
			,[UserPreferencesApexPagesDeveloperMode]
			,[UserPreferencesHideCSNGetChatterMobileTask]
			,[UserPreferencesDisableMentionsPostEmail]
			,[UserPreferencesDisMentionsCommentEmail]
			,[UserPreferencesHideCSNDesktopTask]
			,[UserPreferencesDisCommentAfterLikeEmail]
			,[UserPreferencesDisableLikeEmail]
			,[UserPreferencesDisableMessageEmail]
			,[UserPreferencesOptOutOfTouch]
			,[UserPreferencesDisableBookmarkEmail]
			,[UserPreferencesDisableSharePostEmail]
			,[UserPreferencesEnableAutoSubForFeeds]
			,[UserPreferencesDisableFileShareNotificationsForApi]
			,[UserPreferencesShowTitleToExternalUsers]
			,[UserPreferencesShowManagerToExternalUsers]
			,[UserPreferencesShowEmailToExternalUsers]
			,[UserPreferencesShowWorkPhoneToExternalUsers]
			,[UserPreferencesShowMobilePhoneToExternalUsers]
			,[UserPreferencesShowFaxToExternalUsers]
			,[UserPreferencesShowStreetAddressToExternalUsers]
			,[UserPreferencesShowCityToExternalUsers]
			,[UserPreferencesShowStateToExternalUsers]
			,[UserPreferencesShowPostalCodeToExternalUsers]
			,[UserPreferencesShowCountryToExternalUsers]
			,[UserPreferencesShowProfilePicToGuestUsers]
			,[UserPreferencesShowTitleToGuestUsers]
			,[UserPreferencesShowCityToGuestUsers]
			,[UserPreferencesShowStateToGuestUsers]
			,[UserPreferencesShowPostalCodeToGuestUsers]
			,[UserPreferencesShowCountryToGuestUsers]
			,[ContactId]
			,[AccountId]
			,[CallCenterId]
			,[Extension]
			,[PortalRole]
			,[IsPortalEnabled]
			,[IsPortalSelfRegistered]
			,[FederationIdentifier]
			,[AboutMe]
			,[FullPhotoUrl]
			,[SmallPhotoUrl]
			,[DigestFrequency]
			,[DefaultGroupNotificationFrequency]
			,[LastViewedDate]
			,[LastReferencedDate]
			,[ServiceMaxDispatchConsoleSettings]
			,[ServiceMaxSelect]
			,[ServiceMaxFaceTimeId]
			,[ServiceMaxIsSuperDispatcher]
			,[BusinessUnit]
			,[MaterialHandlingSalesPersonId]
			,[SalesArea]
			,[SuperCenter]
			,[CustomerPod]
			,[CompanyLegalName]
			,[TemporaryEmployee]
			,[UserPermissionsKnowledgeUser]
			,[UserPermissionsJigsawProspectingUser]
			,[UserPermissionsWorkDotComUserFeature]
			,[UserPreferencesJigsawListUser]
			,[UserPreferencesLightningExperiencePreferred]
			,[JigsawImportLimitOverride]
			,[BadgeText]
			,[UserPreferencesHideChatterOnboardingSplash]
			,[UserPreferencesHideSecondChatterOnboardingSplash]
			,[UserPreferencesDisableFeedbackEmail]
			,[UserPreferencesDisableWorkEmail]
			,[UserPreferencesHideS1BrowserUI]
			,[UserPreferencesDisableEndorsementEmail]
			,[UserPreferencesPathAssistantCollapsed]
			,[UnityAgentId]
			,[UserManagerUnityAgentId]
			,[UserPreferencesSortFeedByComment]
			,[IgnoreValidations]
			,[UnityCustomerTeam]
			,[UnityCustomerTeamsSelected]
			,[UnityContactExternalId]
			,[GeocodeAccuracy]
			,[UserPreferencesCacheDiagnostics]
			,[UserPreferencesShowEmailToGuestUsers]
			,[UserPreferencesShowManagerToGuestUsers]
			,[UserPreferencesShowWorkPhoneToGuestUsers]
			,[UserPreferencesShowMobilePhoneToGuestUsers]
			,[UserPreferencesShowFaxToGuestUsers]
			,[UserPreferencesShowStreetAddressToGuestUsers]
			,[UserPreferencesPreviewLightning]
			,[UserPreferencesHideEndUserOnboardingAssistantModal]
			,[UserPreferencesHideLightningMigrationModal]
			,[UserPreferencesHideSfxWelcomeMat]
			,[UserPreferencesHideBiggerPhotoCallout]
			,[MediumPhotoUrl]
			,[BannerPhotoUrl]
			,[IsProfilePhotoActive]
			,[ServiceMaxServiceMax_User]
			,[UserPreferencesGlobalNavBarWTShown]
			,[UserPreferencesGlobalNavGridMenuWTShown]
			,[UserPreferencesCreateLEXAppsWTShown]
			,[UserPreferencesFavoritesWTShown]
			,[SmallBannerPhotoUrl]
			,[MediumBannerPhotoUrl]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
			,__Operation
			,__OperationDate
		)
	SELECT DISTINCT
		 T.RowId
		,T.Id
		,[Username]
		,[LastName]
		,[FirstName]
		,[Name]
		,[CompanyName]
		,[Division]
		,[Department]
		,T.Title
		,[Street]
		,[City]
		,[State]
		,[PostalCode]
		,[Country]
		,[StateCode]
		,[CountryCode]
		,[Latitude]
		,[Longitude]
		,[Email]
		,[EmailPreferencesAutoBcc]
		,[EmailPreferencesAutoBccStayInTouch]
		,[EmailPreferencesStayInTouchReminder]
		,[SenderEmail]
		,[SenderName]
		,[Signature]
		,[StayInTouchSubject]
		,[StayInTouchSignature]
		,[StayInTouchNote]
		,[Phone]
		,[Fax]
		,[MobilePhone]
		,[Alias]
		,[CommunityNickname]
		,[IsActive]
		,[TimeZoneSidKey]
		,[UserRoleId]
		,[LocaleSidKey]
		,[ReceivesInfoEmails]
		,[ReceivesAdminInfoEmails]
		,[EmailEncodingKey]
		,[ProfileId]
		,[UserType]
		,[LanguageLocaleKey]
		,[EmployeeNumber]
		,[DelegatedApproverId]
		,[ManagerId]
		,[LastLoginDate]
		,[LastPasswordChangeDate]
		,T.CreatedDate
		,T.CreatedById
		,T.LastModifiedDate
		,T.LastModifiedById
		,T.SystemModstamp
		,[OfflineTrialExpirationDate]
		,[OfflinePdaTrialExpirationDate]
		,[UserPermissionsMarketingUser]
		,[UserPermissionsOfflineUser]
		,[UserPermissionsAvantgoUser]
		,[UserPermissionsCallCenterAutoLogin]
		,[UserPermissionsMobileUser]
		,[UserPermissionsSFContentUser]
		,[UserPermissionsInteractionUser]
		,[UserPermissionsSupportUser]
		,[UserPermissionsChatterAnswersUser]
		,[ForecastEnabled]
		,[UserPreferencesActivityRemindersPopup]
		,[UserPreferencesEventRemindersCheckboxDefault]
		,[UserPreferencesTaskRemindersCheckboxDefault]
		,[UserPreferencesReminderSoundOff]
		,[UserPreferencesDisableAllFeedsEmail]
		,[UserPreferencesDisableFollowersEmail]
		,[UserPreferencesDisableProfilePostEmail]
		,[UserPreferencesDisableChangeCommentEmail]
		,[UserPreferencesDisableLaterCommentEmail]
		,[UserPreferencesDisProfPostCommentEmail]
		,[UserPreferencesContentNoEmail]
		,[UserPreferencesContentEmailAsAndWhen]
		,[UserPreferencesApexPagesDeveloperMode]
		,[UserPreferencesHideCSNGetChatterMobileTask]
		,[UserPreferencesDisableMentionsPostEmail]
		,[UserPreferencesDisMentionsCommentEmail]
		,[UserPreferencesHideCSNDesktopTask]
		,[UserPreferencesDisCommentAfterLikeEmail]
		,[UserPreferencesDisableLikeEmail]
		,[UserPreferencesDisableMessageEmail]
		,[UserPreferencesOptOutOfTouch]
		,[UserPreferencesDisableBookmarkEmail]
		,[UserPreferencesDisableSharePostEmail]
		,[UserPreferencesEnableAutoSubForFeeds]
		,[UserPreferencesDisableFileShareNotificationsForApi]
		,[UserPreferencesShowTitleToExternalUsers]
		,[UserPreferencesShowManagerToExternalUsers]
		,[UserPreferencesShowEmailToExternalUsers]
		,[UserPreferencesShowWorkPhoneToExternalUsers]
		,[UserPreferencesShowMobilePhoneToExternalUsers]
		,[UserPreferencesShowFaxToExternalUsers]
		,[UserPreferencesShowStreetAddressToExternalUsers]
		,[UserPreferencesShowCityToExternalUsers]
		,[UserPreferencesShowStateToExternalUsers]
		,[UserPreferencesShowPostalCodeToExternalUsers]
		,[UserPreferencesShowCountryToExternalUsers]
		,[UserPreferencesShowProfilePicToGuestUsers]
		,[UserPreferencesShowTitleToGuestUsers]
		,[UserPreferencesShowCityToGuestUsers]
		,[UserPreferencesShowStateToGuestUsers]
		,[UserPreferencesShowPostalCodeToGuestUsers]
		,[UserPreferencesShowCountryToGuestUsers]
		,[ContactId]
		,[AccountId]
		,[CallCenterId]
		,[Extension]
		,[PortalRole]
		,[IsPortalEnabled]
		,[IsPortalSelfRegistered]
		,[FederationIdentifier]
		,[AboutMe]
		,[FullPhotoUrl]
		,[SmallPhotoUrl]
		,[DigestFrequency]
		,[DefaultGroupNotificationFrequency]
		,[LastViewedDate]
		,[LastReferencedDate]
		,[ServiceMaxDispatchConsoleSettings]
		,[ServiceMaxSelect]
		,[ServiceMaxFaceTimeId]
		,[ServiceMaxIsSuperDispatcher]
		,[BusinessUnit]
		,[MaterialHandlingSalesPersonId]
		,[SalesArea]
		,[SuperCenter]
		,[CustomerPod]
		,[CompanyLegalName]
		,[TemporaryEmployee]
		,[UserPermissionsKnowledgeUser]
		,[UserPermissionsJigsawProspectingUser]
		,[UserPermissionsWorkDotComUserFeature]
		,[UserPreferencesJigsawListUser]
		,[UserPreferencesLightningExperiencePreferred]
		,[JigsawImportLimitOverride]
		,[BadgeText]
		,[UserPreferencesHideChatterOnboardingSplash]
		,[UserPreferencesHideSecondChatterOnboardingSplash]
		,[UserPreferencesDisableFeedbackEmail]
		,[UserPreferencesDisableWorkEmail]
		,[UserPreferencesHideS1BrowserUI]
		,[UserPreferencesDisableEndorsementEmail]
		,[UserPreferencesPathAssistantCollapsed]
		,T.UnityAgentId
		,[UserManagerUnityAgentId]
		,[UserPreferencesSortFeedByComment]
		,[IgnoreValidations]
		,[UnityCustomerTeam]
		,[UnityCustomerTeamsSelected]
		,[UnityContactExternalId]
		,[GeocodeAccuracy]
		,[UserPreferencesCacheDiagnostics]
		,[UserPreferencesShowEmailToGuestUsers]
		,[UserPreferencesShowManagerToGuestUsers]
		,[UserPreferencesShowWorkPhoneToGuestUsers]
		,[UserPreferencesShowMobilePhoneToGuestUsers]
		,[UserPreferencesShowFaxToGuestUsers]
		,[UserPreferencesShowStreetAddressToGuestUsers]
		,[UserPreferencesPreviewLightning]
		,[UserPreferencesHideEndUserOnboardingAssistantModal]
		,[UserPreferencesHideLightningMigrationModal]
		,[UserPreferencesHideSfxWelcomeMat]
		,[UserPreferencesHideBiggerPhotoCallout]
		,[MediumPhotoUrl]
		,[BannerPhotoUrl]
		,[IsProfilePhotoActive]
		,[ServiceMaxServiceMax_User]
		,[UserPreferencesGlobalNavBarWTShown]
		,[UserPreferencesGlobalNavGridMenuWTShown]
		,[UserPreferencesCreateLEXAppsWTShown]
		,[UserPreferencesFavoritesWTShown]
		,[SmallBannerPhotoUrl]
		,[MediumBannerPhotoUrl]
		,T.LastUpdate
		,T.ImportDate
		,T.ValidFrom
		,T.ValidTo
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END