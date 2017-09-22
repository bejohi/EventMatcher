SET QUOTED_IDENTIFIER OFF;
GO
USE [EventMatcher];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Company'
CREATE TABLE [dbo].[Company] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(256)  NOT NULL unique
);
GO

-- Creating table 'Event'
CREATE TABLE [dbo].[Event] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CompanyId] int  NOT NULL,
    [Name] nvarchar(256)  NOT NULL unique
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(256)  NOT NULL unique,
    [Password] nvarchar(max)  NOT NULL,
    [EMail] nvarchar(256)  NOT NULL unique,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [Birthday] datetime  NOT NULL,
    [UserSettings_Id] int  NOT NULL
);
GO

-- Creating table 'Role'
CREATE TABLE [dbo].[Role] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(256)  NOT NULL unique
);
GO

-- Creating table 'Buzzword'
CREATE TABLE [dbo].[Buzzword] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(256)  NOT NULL unique
);
GO

-- Creating table 'TimeSlot'
CREATE TABLE [dbo].[TimeSlot] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartTime] datetime  NOT NULL,
    [EndTime] datetime  NOT NULL
);
GO

-- Creating table 'UserSettings'
CREATE TABLE [dbo].[UserSettings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EMailNotification] bit  NULL default  0
);
GO

-- Creating table 'Logging'
CREATE TABLE [dbo].[Logging] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Details] nvarchar(max)  NOT NULL,
    [TimeOfEvent] datetime  NOT NULL
);
GO

-- Creating table 'Session'
CREATE TABLE [dbo].[Session] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [Event_Id] int  NOT NULL
);
GO

-- Creating table 'Right'
CREATE TABLE [dbo].[Right] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(256)  NOT NULL unique
);
GO

-- Creating table 'Group'
CREATE TABLE [dbo].[Group] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL
);
GO

-- Creating table 'Rating'
CREATE TABLE [dbo].[Rating] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Time] datetime  NULL,
    [Points] int  NULL,
    [Comment] nvarchar(max)  NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'DashboardItem'
CREATE TABLE [dbo].[DashboardItem] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(256)  NOT NULL unique
);
GO

-- Creating table 'UserLogging'
CREATE TABLE [dbo].[UserLogging] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [EMailConfirmed] bit  NOT NULL,
    [Blocked] bit  NULL,
    [TimeOfCreation] datetime  NOT NULL default getdate(),
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'UserLoginTry'
CREATE TABLE [dbo].[UserLoginTry] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserLoggingId] int  NOT NULL,
    [Time] datetime  NOT NULL default getdate(),
    [Succeded] int  NULL default -1
);
GO

-- Creating table 'UserRole'
CREATE TABLE [dbo].[UserRole] (
    [User_Id] int  NOT NULL,
    [Role_Id] int  NOT NULL
);
GO

-- Creating table 'UserCompany'
CREATE TABLE [dbo].[UserCompany] (
    [User_Id] int  NOT NULL,
    [Company_Id] int  NOT NULL
);
GO

-- Creating table 'RightRole'
CREATE TABLE [dbo].[RightRole] (
    [Right_Id] int  NOT NULL,
    [Role_Id] int  NOT NULL
);
GO

-- Creating table 'EventUser'
CREATE TABLE [dbo].[EventUser] (
    [Event_Id] int  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'BuzzwordUser'
CREATE TABLE [dbo].[BuzzwordUser] (
    [Buzzword_Id] int  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'SessionGroup'
CREATE TABLE [dbo].[SessionGroup] (
    [Session_Id] int  NOT NULL,
    [Group_Id] int  NOT NULL
);
GO

-- Creating table 'UserGroup'
CREATE TABLE [dbo].[UserGroup] (
    [User_Id] int  NOT NULL,
    [Group_Id] int  NOT NULL
);
GO

-- Creating table 'SessionTimeSlot'
CREATE TABLE [dbo].[SessionTimeSlot] (
    [Session_Id] int  NOT NULL,
    [TimeSlot_Id] int  NOT NULL
);
GO

-- Creating table 'GroupTimeSlot'
CREATE TABLE [dbo].[GroupTimeSlot] (
    [Group_Id] int  NOT NULL,
    [TimeSlot_Id] int  NOT NULL
);
GO

-- Creating table 'UserSettingsDashboardItem'
CREATE TABLE [dbo].[UserSettingsDashboardItem] (
    [UserSettings_Id] int  NOT NULL,
    [DashboardItem_Id] int  NOT NULL
);
GO

-- Creating table 'TimeSlotStatus'
CREATE TABLE [dbo].[TimeSlotStatus] (
    [TimeSlot_Id] int  NOT NULL,
    [Status_Id] int  NOT NULL
);
GO

-- Creating table 'UserStatus'
CREATE TABLE [dbo].[UserStatus] (
    [User_Id] int  NOT NULL,
    [Status_Id] int  NOT NULL
);
GO

-- Creating table 'SessionStatus'
CREATE TABLE [dbo].[SessionStatus] (
    [Session_Id] int  NOT NULL,
    [Status_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Company'
ALTER TABLE [dbo].[Company]
ADD CONSTRAINT [PK_Company]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Event'
ALTER TABLE [dbo].[Event]
ADD CONSTRAINT [PK_Event]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Role'
ALTER TABLE [dbo].[Role]
ADD CONSTRAINT [PK_Role]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Buzzword'
ALTER TABLE [dbo].[Buzzword]
ADD CONSTRAINT [PK_Buzzword]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TimeSlot'
ALTER TABLE [dbo].[TimeSlot]
ADD CONSTRAINT [PK_TimeSlot]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserSettings'
ALTER TABLE [dbo].[UserSettings]
ADD CONSTRAINT [PK_UserSettings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Logging'
ALTER TABLE [dbo].[Logging]
ADD CONSTRAINT [PK_Logging]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Session'
ALTER TABLE [dbo].[Session]
ADD CONSTRAINT [PK_Session]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Right'
ALTER TABLE [dbo].[Right]
ADD CONSTRAINT [PK_Right]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Group'
ALTER TABLE [dbo].[Group]
ADD CONSTRAINT [PK_Group]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Rating'
ALTER TABLE [dbo].[Rating]
ADD CONSTRAINT [PK_Rating]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DashboardItem'
ALTER TABLE [dbo].[DashboardItem]
ADD CONSTRAINT [PK_DashboardItem]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserLogging'
ALTER TABLE [dbo].[UserLogging]
ADD CONSTRAINT [PK_UserLogging]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserLoginTry'
ALTER TABLE [dbo].[UserLoginTry]
ADD CONSTRAINT [PK_UserLoginTry]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [User_Id], [Role_Id] in table 'UserRole'
ALTER TABLE [dbo].[UserRole]
ADD CONSTRAINT [PK_UserRole]
    PRIMARY KEY CLUSTERED ([User_Id], [Role_Id] ASC);
GO

-- Creating primary key on [User_Id], [Company_Id] in table 'UserCompany'
ALTER TABLE [dbo].[UserCompany]
ADD CONSTRAINT [PK_UserCompany]
    PRIMARY KEY CLUSTERED ([User_Id], [Company_Id] ASC);
GO

-- Creating primary key on [Right_Id], [Role_Id] in table 'RightRole'
ALTER TABLE [dbo].[RightRole]
ADD CONSTRAINT [PK_RightRole]
    PRIMARY KEY CLUSTERED ([Right_Id], [Role_Id] ASC);
GO

-- Creating primary key on [Event_Id], [User_Id] in table 'EventUser'
ALTER TABLE [dbo].[EventUser]
ADD CONSTRAINT [PK_EventUser]
    PRIMARY KEY CLUSTERED ([Event_Id], [User_Id] ASC);
GO

-- Creating primary key on [Buzzword_Id], [User_Id] in table 'BuzzwordUser'
ALTER TABLE [dbo].[BuzzwordUser]
ADD CONSTRAINT [PK_BuzzwordUser]
    PRIMARY KEY CLUSTERED ([Buzzword_Id], [User_Id] ASC);
GO

-- Creating primary key on [Session_Id], [Group_Id] in table 'SessionGroup'
ALTER TABLE [dbo].[SessionGroup]
ADD CONSTRAINT [PK_SessionGroup]
    PRIMARY KEY CLUSTERED ([Session_Id], [Group_Id] ASC);
GO

-- Creating primary key on [User_Id], [Group_Id] in table 'UserGroup'
ALTER TABLE [dbo].[UserGroup]
ADD CONSTRAINT [PK_UserGroup]
    PRIMARY KEY CLUSTERED ([User_Id], [Group_Id] ASC);
GO

-- Creating primary key on [Session_Id], [TimeSlot_Id] in table 'SessionTimeSlot'
ALTER TABLE [dbo].[SessionTimeSlot]
ADD CONSTRAINT [PK_SessionTimeSlot]
    PRIMARY KEY CLUSTERED ([Session_Id], [TimeSlot_Id] ASC);
GO

-- Creating primary key on [Group_Id], [TimeSlot_Id] in table 'GroupTimeSlot'
ALTER TABLE [dbo].[GroupTimeSlot]
ADD CONSTRAINT [PK_GroupTimeSlot]
    PRIMARY KEY CLUSTERED ([Group_Id], [TimeSlot_Id] ASC);
GO

-- Creating primary key on [UserSettings_Id], [DashboardItem_Id] in table 'UserSettingsDashboardItem'
ALTER TABLE [dbo].[UserSettingsDashboardItem]
ADD CONSTRAINT [PK_UserSettingsDashboardItem]
    PRIMARY KEY CLUSTERED ([UserSettings_Id], [DashboardItem_Id] ASC);
GO

-- Creating primary key on [TimeSlot_Id], [Status_Id] in table 'TimeSlotStatus'
ALTER TABLE [dbo].[TimeSlotStatus]
ADD CONSTRAINT [PK_TimeSlotStatus]
    PRIMARY KEY CLUSTERED ([TimeSlot_Id], [Status_Id] ASC);
GO

-- Creating primary key on [User_Id], [Status_Id] in table 'UserStatus'
ALTER TABLE [dbo].[UserStatus]
ADD CONSTRAINT [PK_UserStatus]
    PRIMARY KEY CLUSTERED ([User_Id], [Status_Id] ASC);
GO

-- Creating primary key on [Session_Id], [Status_Id] in table 'SessionStatus'
ALTER TABLE [dbo].[SessionStatus]
ADD CONSTRAINT [PK_SessionStatus]
    PRIMARY KEY CLUSTERED ([Session_Id], [Status_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [User_Id] in table 'UserRole'
ALTER TABLE [dbo].[UserRole]
ADD CONSTRAINT [FK_UserRole_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Role_Id] in table 'UserRole'
ALTER TABLE [dbo].[UserRole]
ADD CONSTRAINT [FK_UserRole_Role]
    FOREIGN KEY ([Role_Id])
    REFERENCES [dbo].[Role]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRole_Role'
CREATE INDEX [IX_FK_UserRole_Role]
ON [dbo].[UserRole]
    ([Role_Id]);
GO

-- Creating foreign key on [UserSettings_Id] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [FK_UserUserSettings]
    FOREIGN KEY ([UserSettings_Id])
    REFERENCES [dbo].[UserSettings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserSettings'
CREATE INDEX [IX_FK_UserUserSettings]
ON [dbo].[User]
    ([UserSettings_Id]);
GO

-- Creating foreign key on [User_Id] in table 'UserCompany'
ALTER TABLE [dbo].[UserCompany]
ADD CONSTRAINT [FK_UserCompany_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Company_Id] in table 'UserCompany'
ALTER TABLE [dbo].[UserCompany]
ADD CONSTRAINT [FK_UserCompany_Company]
    FOREIGN KEY ([Company_Id])
    REFERENCES [dbo].[Company]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCompany_Company'
CREATE INDEX [IX_FK_UserCompany_Company]
ON [dbo].[UserCompany]
    ([Company_Id]);
GO

-- Creating foreign key on [Right_Id] in table 'RightRole'
ALTER TABLE [dbo].[RightRole]
ADD CONSTRAINT [FK_RightRole_Right]
    FOREIGN KEY ([Right_Id])
    REFERENCES [dbo].[Right]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Role_Id] in table 'RightRole'
ALTER TABLE [dbo].[RightRole]
ADD CONSTRAINT [FK_RightRole_Role]
    FOREIGN KEY ([Role_Id])
    REFERENCES [dbo].[Role]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RightRole_Role'
CREATE INDEX [IX_FK_RightRole_Role]
ON [dbo].[RightRole]
    ([Role_Id]);
GO

-- Creating foreign key on [Event_Id] in table 'EventUser'
ALTER TABLE [dbo].[EventUser]
ADD CONSTRAINT [FK_EventUser_Event]
    FOREIGN KEY ([Event_Id])
    REFERENCES [dbo].[Event]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [User_Id] in table 'EventUser'
ALTER TABLE [dbo].[EventUser]
ADD CONSTRAINT [FK_EventUser_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventUser_User'
CREATE INDEX [IX_FK_EventUser_User]
ON [dbo].[EventUser]
    ([User_Id]);
GO

-- Creating foreign key on [Buzzword_Id] in table 'BuzzwordUser'
ALTER TABLE [dbo].[BuzzwordUser]
ADD CONSTRAINT [FK_BuzzwordUser_Buzzword]
    FOREIGN KEY ([Buzzword_Id])
    REFERENCES [dbo].[Buzzword]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [User_Id] in table 'BuzzwordUser'
ALTER TABLE [dbo].[BuzzwordUser]
ADD CONSTRAINT [FK_BuzzwordUser_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BuzzwordUser_User'
CREATE INDEX [IX_FK_BuzzwordUser_User]
ON [dbo].[BuzzwordUser]
    ([User_Id]);
GO

-- Creating foreign key on [Event_Id] in table 'Session'
ALTER TABLE [dbo].[Session]
ADD CONSTRAINT [FK_SessionEvent]
    FOREIGN KEY ([Event_Id])
    REFERENCES [dbo].[Event]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SessionEvent'
CREATE INDEX [IX_FK_SessionEvent]
ON [dbo].[Session]
    ([Event_Id]);
GO

-- Creating foreign key on [Session_Id] in table 'SessionGroup'
ALTER TABLE [dbo].[SessionGroup]
ADD CONSTRAINT [FK_SessionGroup_Session]
    FOREIGN KEY ([Session_Id])
    REFERENCES [dbo].[Session]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Group_Id] in table 'SessionGroup'
ALTER TABLE [dbo].[SessionGroup]
ADD CONSTRAINT [FK_SessionGroup_Group]
    FOREIGN KEY ([Group_Id])
    REFERENCES [dbo].[Group]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SessionGroup_Group'
CREATE INDEX [IX_FK_SessionGroup_Group]
ON [dbo].[SessionGroup]
    ([Group_Id]);
GO

-- Creating foreign key on [User_Id] in table 'UserGroup'
ALTER TABLE [dbo].[UserGroup]
ADD CONSTRAINT [FK_UserGroup_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Group_Id] in table 'UserGroup'
ALTER TABLE [dbo].[UserGroup]
ADD CONSTRAINT [FK_UserGroup_Group]
    FOREIGN KEY ([Group_Id])
    REFERENCES [dbo].[Group]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserGroup_Group'
CREATE INDEX [IX_FK_UserGroup_Group]
ON [dbo].[UserGroup]
    ([Group_Id]);
GO

-- Creating foreign key on [Session_Id] in table 'SessionTimeSlot'
ALTER TABLE [dbo].[SessionTimeSlot]
ADD CONSTRAINT [FK_SessionTimeSlot_Session]
    FOREIGN KEY ([Session_Id])
    REFERENCES [dbo].[Session]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TimeSlot_Id] in table 'SessionTimeSlot'
ALTER TABLE [dbo].[SessionTimeSlot]
ADD CONSTRAINT [FK_SessionTimeSlot_TimeSlot]
    FOREIGN KEY ([TimeSlot_Id])
    REFERENCES [dbo].[TimeSlot]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SessionTimeSlot_TimeSlot'
CREATE INDEX [IX_FK_SessionTimeSlot_TimeSlot]
ON [dbo].[SessionTimeSlot]
    ([TimeSlot_Id]);
GO

-- Creating foreign key on [Group_Id] in table 'GroupTimeSlot'
ALTER TABLE [dbo].[GroupTimeSlot]
ADD CONSTRAINT [FK_GroupTimeSlot_Group]
    FOREIGN KEY ([Group_Id])
    REFERENCES [dbo].[Group]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TimeSlot_Id] in table 'GroupTimeSlot'
ALTER TABLE [dbo].[GroupTimeSlot]
ADD CONSTRAINT [FK_GroupTimeSlot_TimeSlot]
    FOREIGN KEY ([TimeSlot_Id])
    REFERENCES [dbo].[TimeSlot]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GroupTimeSlot_TimeSlot'
CREATE INDEX [IX_FK_GroupTimeSlot_TimeSlot]
ON [dbo].[GroupTimeSlot]
    ([TimeSlot_Id]);
GO

-- Creating foreign key on [UserSettings_Id] in table 'UserSettingsDashboardItem'
ALTER TABLE [dbo].[UserSettingsDashboardItem]
ADD CONSTRAINT [FK_UserSettingsDashboardItem_UserSettings]
    FOREIGN KEY ([UserSettings_Id])
    REFERENCES [dbo].[UserSettings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [DashboardItem_Id] in table 'UserSettingsDashboardItem'
ALTER TABLE [dbo].[UserSettingsDashboardItem]
ADD CONSTRAINT [FK_UserSettingsDashboardItem_DashboardItem]
    FOREIGN KEY ([DashboardItem_Id])
    REFERENCES [dbo].[DashboardItem]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSettingsDashboardItem_DashboardItem'
CREATE INDEX [IX_FK_UserSettingsDashboardItem_DashboardItem]
ON [dbo].[UserSettingsDashboardItem]
    ([DashboardItem_Id]);
GO

-- Creating foreign key on [TimeSlot_Id] in table 'TimeSlotStatus'
ALTER TABLE [dbo].[TimeSlotStatus]
ADD CONSTRAINT [FK_TimeSlotStatus_TimeSlot]
    FOREIGN KEY ([TimeSlot_Id])
    REFERENCES [dbo].[TimeSlot]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Status_Id] in table 'TimeSlotStatus'
ALTER TABLE [dbo].[TimeSlotStatus]
ADD CONSTRAINT [FK_TimeSlotStatus_Status]
    FOREIGN KEY ([Status_Id])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TimeSlotStatus_Status'
CREATE INDEX [IX_FK_TimeSlotStatus_Status]
ON [dbo].[TimeSlotStatus]
    ([Status_Id]);
GO

-- Creating foreign key on [User_Id] in table 'UserStatus'
ALTER TABLE [dbo].[UserStatus]
ADD CONSTRAINT [FK_UserStatus_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Status_Id] in table 'UserStatus'
ALTER TABLE [dbo].[UserStatus]
ADD CONSTRAINT [FK_UserStatus_Status]
    FOREIGN KEY ([Status_Id])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserStatus_Status'
CREATE INDEX [IX_FK_UserStatus_Status]
ON [dbo].[UserStatus]
    ([Status_Id]);
GO

-- Creating foreign key on [CompanyId] in table 'Event'
ALTER TABLE [dbo].[Event]
ADD CONSTRAINT [FK_CompanyEvent]
    FOREIGN KEY ([CompanyId])
    REFERENCES [dbo].[Company]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompanyEvent'
CREATE INDEX [IX_FK_CompanyEvent]
ON [dbo].[Event]
    ([CompanyId]);
GO

-- Creating foreign key on [Session_Id] in table 'SessionStatus'
ALTER TABLE [dbo].[SessionStatus]
ADD CONSTRAINT [FK_SessionStatus_Session]
    FOREIGN KEY ([Session_Id])
    REFERENCES [dbo].[Session]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Status_Id] in table 'SessionStatus'
ALTER TABLE [dbo].[SessionStatus]
ADD CONSTRAINT [FK_SessionStatus_Status]
    FOREIGN KEY ([Status_Id])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SessionStatus_Status'
CREATE INDEX [IX_FK_SessionStatus_Status]
ON [dbo].[SessionStatus]
    ([Status_Id]);
GO

-- Creating foreign key on [UserLoggingId] in table 'UserLoginTry'
ALTER TABLE [dbo].[UserLoginTry]
ADD CONSTRAINT [FK_UserLoggingUserLoginTry]
    FOREIGN KEY ([UserLoggingId])
    REFERENCES [dbo].[UserLogging]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserLoggingUserLoginTry'
CREATE INDEX [IX_FK_UserLoggingUserLoginTry]
ON [dbo].[UserLoginTry]
    ([UserLoggingId]);
GO

-- Creating foreign key on [User_Id] in table 'UserLogging'
ALTER TABLE [dbo].[UserLogging]
ADD CONSTRAINT [FK_UserLoggingUser]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserLoggingUser'
CREATE INDEX [IX_FK_UserLoggingUser]
ON [dbo].[UserLogging]
    ([User_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Rating'
ALTER TABLE [dbo].[Rating]
ADD CONSTRAINT [FK_RatingUser]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RatingUser'
CREATE INDEX [IX_FK_RatingUser]
ON [dbo].[Rating]
    ([User_Id]);
GO