-- ===================================================
-- Author:		Randy Minder
-- Create date: 05-October, 3018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[UserIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[UserIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.[User];

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.[User];

	IF (@OdsRowCount > @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-User', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables. We'll end up with rows in SF that are
		-- not in Ods.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.[User]
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwMH_Invoice_c
	)
		,RowDifferences
	AS
	(
		SELECT
			CAST(T.[Id] AS VARCHAR(18)) AS Id
		   ,T.Username
		   ,T.LastName
		   ,T.FirstName
		   ,T.Name
		   ,T.CompanyName
		   ,T.Division
		   ,T.Department
		   ,T.Title
		   ,T.Street
		   ,T.City
		   ,T.State
		   ,T.PostalCode
		   ,T.Country
		   ,T.StateCode
		   ,T.CountryCode
		   ,ROUND(T.Latitude, 7) AS Latitude
		   ,ROUND(T.Longitude, 7) AS Longitude
		   ,T.Email
		   ,T.EmailPreferencesAutoBcc
		   ,T.EmailPreferencesAutoBccStayInTouch
		   ,T.EmailPreferencesStayInTouchReminder
		   ,T.SenderEmail
		   ,T.SenderName
		   ,T.Signature
		   ,T.StayInTouchSubject
		   ,T.StayInTouchSignature
		   ,T.StayInTouchNote
		   ,T.Phone
		   ,T.Fax
		   ,T.MobilePhone
		   ,T.Alias
		   ,T.CommunityNickname
		   ,T.IsActive
		   ,T.TimeZoneSidKey
		   ,T.UserRoleId
		   ,T.LocaleSidKey
		   ,T.ReceivesInfoEmails
		   ,T.ReceivesAdminInfoEmails
		   ,T.EmailEncodingKey
		   ,T.ProfileId
		   ,T.UserType
		   ,T.LanguageLocaleKey
		   ,T.EmployeeNumber
		   ,T.DelegatedApproverId
		   ,T.ManagerId
		   ,T.LastLoginDate
		   ,T.LastPasswordChangeDate
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.OfflineTrialExpirationDate
		   ,T.OfflinePdaTrialExpirationDate
		   ,T.UserPermissionsMarketingUser
		   ,T.UserPermissionsOfflineUser
		   ,T.UserPermissionsAvantgoUser
		   ,T.UserPermissionsCallCenterAutoLogin
		   ,T.UserPermissionsMobileUser
		   ,T.UserPermissionsSFContentUser
		   ,T.UserPermissionsInteractionUser
		   ,T.UserPermissionsSupportUser
		   ,T.UserPermissionsChatterAnswersUser
		   ,T.ForecastEnabled
		   ,T.UserPreferencesActivityRemindersPopup
		   ,T.UserPreferencesEventRemindersCheckboxDefault
		   ,T.UserPreferencesTaskRemindersCheckboxDefault
		   ,T.UserPreferencesReminderSoundOff
		   ,T.UserPreferencesDisableAllFeedsEmail
		   ,T.UserPreferencesDisableFollowersEmail
		   ,T.UserPreferencesDisableProfilePostEmail
		   ,T.UserPreferencesDisableChangeCommentEmail
		   ,T.UserPreferencesDisableLaterCommentEmail
		   ,T.UserPreferencesDisProfPostCommentEmail
		   ,T.UserPreferencesContentNoEmail
		   ,T.UserPreferencesContentEmailAsAndWhen
		   ,T.UserPreferencesApexPagesDeveloperMode
		   ,T.UserPreferencesHideCSNGetChatterMobileTask
		   ,T.UserPreferencesDisableMentionsPostEmail
		   ,T.UserPreferencesDisMentionsCommentEmail
		   ,T.UserPreferencesHideCSNDesktopTask
		   ,T.UserPreferencesDisCommentAfterLikeEmail
		   ,T.UserPreferencesDisableLikeEmail
		   ,T.UserPreferencesDisableMessageEmail
		   ,T.UserPreferencesOptOutOfTouch
		   ,T.UserPreferencesDisableBookmarkEmail
		   ,T.UserPreferencesDisableSharePostEmail
		   ,T.UserPreferencesEnableAutoSubForFeeds
		   ,T.UserPreferencesDisableFileShareNotificationsForApi
		   ,T.UserPreferencesShowTitleToExternalUsers
		   ,T.UserPreferencesShowManagerToExternalUsers
		   ,T.UserPreferencesShowEmailToExternalUsers
		   ,T.UserPreferencesShowWorkPhoneToExternalUsers
		   ,T.UserPreferencesShowMobilePhoneToExternalUsers
		   ,T.UserPreferencesShowFaxToExternalUsers
		   ,T.UserPreferencesShowStreetAddressToExternalUsers
		   ,T.UserPreferencesShowCityToExternalUsers
		   ,T.UserPreferencesShowStateToExternalUsers
		   ,T.UserPreferencesShowPostalCodeToExternalUsers
		   ,T.UserPreferencesShowCountryToExternalUsers
		   ,T.UserPreferencesShowProfilePicToGuestUsers
		   ,T.UserPreferencesShowTitleToGuestUsers
		   ,T.UserPreferencesShowCityToGuestUsers
		   ,T.UserPreferencesShowStateToGuestUsers
		   ,T.UserPreferencesShowPostalCodeToGuestUsers
		   ,T.UserPreferencesShowCountryToGuestUsers
		   ,T.ContactId
		   ,T.AccountId
		   ,T.CallCenterId
		   ,T.Extension
		   ,T.PortalRole
		   ,T.IsPortalEnabled
		   ,T.IsPortalSelfRegistered
		   ,T.FederationIdentifier
		   ,T.AboutMe
		   ,T.FullPhotoUrl
		   ,T.SmallPhotoUrl
		   ,T.DigestFrequency
		   ,T.DefaultGroupNotificationFrequency
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.ServiceMaxDispatchConsoleSettings
		   ,T.ServiceMaxSelect
		   ,T.ServiceMaxFaceTimeId
		   ,T.ServiceMaxIsSuperDispatcher
		   ,T.BusinessUnit
		   ,T.MaterialHandlingSalesPersonId
		   ,T.SalesArea
		   ,T.SuperCenter
		   ,T.customerPod
		   ,T.CompanyLegalName
		   ,T.TemporaryEmployee
		   ,T.UserPermissionsKnowledgeUser
		   ,T.UserPermissionsJigsawProspectingUser
		   ,T.UserPermissionsWorkDotComUserFeature
		   ,T.UserPreferencesJigsawListUser
		   ,T.UserPreferencesLightningExperiencePreferred
		   ,T.JigsawImportLimitOverride
		   ,T.BadgeText
		   ,T.UserPreferencesHideChatterOnboardingSplash
		   ,T.UserPreferencesHideSecondChatterOnboardingSplash
		   ,T.UserPreferencesDisableFeedbackEmail
		   ,T.UserPreferencesDisableWorkEmail
		   ,T.UserPreferencesHideS1BrowserUI
		   ,T.UserPreferencesDisableEndorsementEmail
		   ,T.UserPreferencesPathAssistantCollapsed
		   ,T.UnityAgentId
		   ,T.UserManagerUnityAgentId
		   ,T.UserPreferencesSortFeedByComment
		   ,T.IgnoreValidations
		   ,T.UnityCustomerTeam
		   ,T.UnityCustomerTeamsSelected
		   ,T.UnityContactExternalId
		   ,T.GeocodeAccuracy
		   ,T.UserPreferencesCacheDiagnostics
		   ,T.UserPreferencesShowEmailToGuestUsers
		   ,T.UserPreferencesShowManagerToGuestUsers
		   ,T.UserPreferencesShowWorkPhoneToGuestUsers
		   ,T.UserPreferencesShowMobilePhoneToGuestUsers
		   ,T.UserPreferencesShowFaxToGuestUsers
		   ,T.UserPreferencesShowStreetAddressToGuestUsers
		   ,T.UserPreferencesPreviewLightning
		   ,T.UserPreferencesHideEndUserOnboardingAssistantModal
		   ,T.UserPreferencesHideLightningMigrationModal
		   ,T.UserPreferencesHideSfxWelcomeMat
		   ,T.UserPreferencesHideBiggerPhotoCallout
		   ,T.MediumPhotoUrl
		   ,T.BannerPhotoUrl
		   ,T.IsProfilePhotoActive
		   ,T.ServiceMaxServiceMax_User
		   ,T.UserPreferencesGlobalNavBarWTShown
		   ,T.UserPreferencesGlobalNavGridMenuWTShown
		   ,T.UserPreferencesCreateLEXAppsWTShown
		   ,T.UserPreferencesFavoritesWTShown
		   ,T.SmallBannerPhotoUrl
		   ,T.MediumBannerPhotoUrl
		   ,T.LastUpdate
		FROM ODSStaging.SF.vwUser T
			INNER JOIN CommonRows T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			T.[Id]
		   ,T.Username
		   ,T.LastName
		   ,T.FirstName
		   ,T.Name
		   ,T.CompanyName
		   ,T.Division
		   ,T.Department
		   ,T.Title
		   ,T.Street
		   ,T.City
		   ,T.State
		   ,T.PostalCode
		   ,T.Country
		   ,T.StateCode
		   ,T.CountryCode
		   ,ROUND(T.Latitude, 7) AS Latitude
		   ,ROUND(T.Longitude, 7) AS Longitude
		   ,T.Email
		   ,T.EmailPreferencesAutoBcc
		   ,T.EmailPreferencesAutoBccStayInTouch
		   ,T.EmailPreferencesStayInTouchReminder
		   ,T.SenderEmail
		   ,T.SenderName
		   ,T.Signature
		   ,T.StayInTouchSubject
		   ,T.StayInTouchSignature
		   ,T.StayInTouchNote
		   ,T.Phone
		   ,T.Fax
		   ,T.MobilePhone
		   ,T.Alias
		   ,T.CommunityNickname
		   ,T.IsActive
		   ,T.TimeZoneSidKey
		   ,T.UserRoleId
		   ,T.LocaleSidKey
		   ,T.ReceivesInfoEmails
		   ,T.ReceivesAdminInfoEmails
		   ,T.EmailEncodingKey
		   ,T.ProfileId
		   ,T.UserType
		   ,T.LanguageLocaleKey
		   ,T.EmployeeNumber
		   ,T.DelegatedApproverId
		   ,T.ManagerId
		   ,T.LastLoginDate
		   ,T.LastPasswordChangeDate
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.OfflineTrialExpirationDate
		   ,T.OfflinePdaTrialExpirationDate
		   ,T.UserPermissionsMarketingUser
		   ,T.UserPermissionsOfflineUser
		   ,T.UserPermissionsAvantgoUser
		   ,T.UserPermissionsCallCenterAutoLogin
		   ,T.UserPermissionsMobileUser
		   ,T.UserPermissionsSFContentUser
		   ,T.UserPermissionsInteractionUser
		   ,T.UserPermissionsSupportUser
		   ,T.UserPermissionsChatterAnswersUser
		   ,T.ForecastEnabled
		   ,T.UserPreferencesActivityRemindersPopup
		   ,T.UserPreferencesEventRemindersCheckboxDefault
		   ,T.UserPreferencesTaskRemindersCheckboxDefault
		   ,T.UserPreferencesReminderSoundOff
		   ,T.UserPreferencesDisableAllFeedsEmail
		   ,T.UserPreferencesDisableFollowersEmail
		   ,T.UserPreferencesDisableProfilePostEmail
		   ,T.UserPreferencesDisableChangeCommentEmail
		   ,T.UserPreferencesDisableLaterCommentEmail
		   ,T.UserPreferencesDisProfPostCommentEmail
		   ,T.UserPreferencesContentNoEmail
		   ,T.UserPreferencesContentEmailAsAndWhen
		   ,T.UserPreferencesApexPagesDeveloperMode
		   ,T.UserPreferencesHideCSNGetChatterMobileTask
		   ,T.UserPreferencesDisableMentionsPostEmail
		   ,T.UserPreferencesDisMentionsCommentEmail
		   ,T.UserPreferencesHideCSNDesktopTask
		   ,T.UserPreferencesDisCommentAfterLikeEmail
		   ,T.UserPreferencesDisableLikeEmail
		   ,T.UserPreferencesDisableMessageEmail
		   ,T.UserPreferencesOptOutOfTouch
		   ,T.UserPreferencesDisableBookmarkEmail
		   ,T.UserPreferencesDisableSharePostEmail
		   ,T.UserPreferencesEnableAutoSubForFeeds
		   ,T.UserPreferencesDisableFileShareNotificationsForApi
		   ,T.UserPreferencesShowTitleToExternalUsers
		   ,T.UserPreferencesShowManagerToExternalUsers
		   ,T.UserPreferencesShowEmailToExternalUsers
		   ,T.UserPreferencesShowWorkPhoneToExternalUsers
		   ,T.UserPreferencesShowMobilePhoneToExternalUsers
		   ,T.UserPreferencesShowFaxToExternalUsers
		   ,T.UserPreferencesShowStreetAddressToExternalUsers
		   ,T.UserPreferencesShowCityToExternalUsers
		   ,T.UserPreferencesShowStateToExternalUsers
		   ,T.UserPreferencesShowPostalCodeToExternalUsers
		   ,T.UserPreferencesShowCountryToExternalUsers
		   ,T.UserPreferencesShowProfilePicToGuestUsers
		   ,T.UserPreferencesShowTitleToGuestUsers
		   ,T.UserPreferencesShowCityToGuestUsers
		   ,T.UserPreferencesShowStateToGuestUsers
		   ,T.UserPreferencesShowPostalCodeToGuestUsers
		   ,T.UserPreferencesShowCountryToGuestUsers
		   ,T.ContactId
		   ,T.AccountId
		   ,T.CallCenterId
		   ,T.Extension
		   ,T.PortalRole
		   ,T.IsPortalEnabled
		   ,T.IsPortalSelfRegistered
		   ,T.FederationIdentifier
		   ,T.AboutMe
		   ,T.FullPhotoUrl
		   ,T.SmallPhotoUrl
		   ,T.DigestFrequency
		   ,T.DefaultGroupNotificationFrequency
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.ServiceMaxDispatchConsoleSettings
		   ,T.ServiceMaxSelect
		   ,T.ServiceMaxFaceTimeId
		   ,T.ServiceMaxIsSuperDispatcher
		   ,T.BusinessUnit
		   ,T.MaterialHandlingSalesPersonId
		   ,T.SalesArea
		   ,T.SuperCenter
		   ,T.CustomerPod
		   ,T.CompanyLegalName
		   ,T.TemporaryEmployee
		   ,T.UserPermissionsKnowledgeUser
		   ,T.UserPermissionsJigsawProspectingUser
		   ,T.UserPermissionsWorkDotComUserFeature
		   ,T.UserPreferencesJigsawListUser
		   ,T.UserPreferencesLightningExperiencePreferred
		   ,T.JigsawImportLimitOverride
		   ,T.BadgeText
		   ,T.UserPreferencesHideChatterOnboardingSplash
		   ,T.UserPreferencesHideSecondChatterOnboardingSplash
		   ,T.UserPreferencesDisableFeedbackEmail
		   ,T.UserPreferencesDisableWorkEmail
		   ,T.UserPreferencesHideS1BrowserUI
		   ,T.UserPreferencesDisableEndorsementEmail
		   ,T.UserPreferencesPathAssistantCollapsed
		   ,T.UnityAgentId
		   ,T.UserManagerUnityAgentId
		   ,T.UserPreferencesSortFeedByComment
		   ,T.IgnoreValidations
		   ,T.UnityCustomerTeam
		   ,T.UnityCustomerTeamsSelected
		   ,T.UnityContactExternalId
		   ,T.GeocodeAccuracy
		   ,T.UserPreferencesCacheDiagnostics
		   ,T.UserPreferencesShowEmailToGuestUsers
		   ,T.UserPreferencesShowManagerToGuestUsers
		   ,T.UserPreferencesShowWorkPhoneToGuestUsers
		   ,T.UserPreferencesShowMobilePhoneToGuestUsers
		   ,T.UserPreferencesShowFaxToGuestUsers
		   ,T.UserPreferencesShowStreetAddressToGuestUsers
		   ,T.UserPreferencesPreviewLightning
		   ,T.UserPreferencesHideEndUserOnboardingAssistantModal
		   ,T.UserPreferencesHideLightningMigrationModal
		   ,T.UserPreferencesHideSfxWelcomeMat
		   ,T.UserPreferencesHideBiggerPhotoCallout
		   ,T.MediumPhotoUrl
		   ,T.BannerPhotoUrl
		   ,T.IsProfilePhotoActive
		   ,T.ServiceMaxServiceMax_User
		   ,T.UserPreferencesGlobalNavBarWTShown
		   ,T.UserPreferencesGlobalNavGridMenuWTShown
		   ,T.UserPreferencesCreateLEXAppsWTShown
		   ,T.UserPreferencesFavoritesWTShown
		   ,T.SmallBannerPhotoUrl
		   ,T.MediumBannerPhotoUrl
		   ,T.LastUpdate
		FROM ODS.SF.vwUser		  T
			INNER JOIN CommonRows T2 ON T2.Id = T.Id
	)

	-- Store any differences into a temporary table. User, we only want to store differences where the SF last modified date
	-- is <= the Ods last modified date. These are rows that were updated in SF without the last modified date being changed.
	-- Rows where the SF last modifed date is > the Ods last modified date are simply rows that haven't been updated to Ods
	-- yet.
	SELECT
		T.Id
	   ,T2.LastModifiedDate AS SfLastModifiedDate
	   ,T3.LastModifiedDate AS OdsLastModifiedDate
	INTO #TempTable
	FROM RowDifferences					T
		INNER JOIN ODSStaging.SF.[User] T2 ON T.Id = T2.Id
		INNER JOIN ODS.SF.[User]		T3 ON T.Id = T3.Id
	WHERE T2.LastModifiedDate <= T3.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-User', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.[User]
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;