
CREATE TYPE [SystemDate]
	FROM DATETIME NULL
go

CREATE TYPE [tid]
	FROM CHAR VARYING(6) NOT NULL
go

CREATE TYPE [empid]
	FROM CHAR(11) NOT NULL
go

CREATE TYPE [ZIP_CODE]
	FROM CHAR VARYING(9) NULL
go

CREATE TYPE [STREET_ADDRESS]
	FROM VARCHAR(25) NULL
go

CREATE TYPE [FIRST_NAME]
	FROM VARCHAR(15) NULL
go

CREATE TYPE [St]
	FROM CHAR VARYING(4) NOT NULL
go

CREATE TYPE [LAST_NAME]
	FROM VARCHAR(25) NOT NULL
go

CREATE TYPE [CITY]
	FROM VARCHAR(25) NULL
go

CREATE TYPE [id]
	FROM CHAR(9) NOT NULL
go

CREATE TYPE [Standard Nbrs]
	FROM INTEGER NULL
go

CREATE TYPE [Phn Stuff]
	FROM INTEGER NULL
go

CREATE TYPE [AREA_CODE_PHONE]
	FROM INTEGER NULL
go

CREATE TYPE [PHONE_NUMBER]
	FROM INTEGER NULL
go

CREATE TYPE [FAX_AREA_CODE]
	FROM INTEGER NULL
go

CREATE TYPE [FAX_NUMBER]
	FROM INTEGER NULL
go

CREATE TABLE [Auth]
( 
	[Auth Identification] [id] ,
	[Auth Lst Nam]       [LAST_NAME] ,
	[Auth Frst Nam]      [FIRST_NAME] ,
	[Auth Phn Nbr]       [PHONE_NUMBER] ,
	[Auth Addr]          [STREET_ADDRESS] ,
	[Auth Cty]           [CITY] ,
	[Auth St]            [St] ,
	[Auth Zip Cd]        [ZIP_CODE] ,
	[Cntrct]             smallint  NULL 
)
go

CREATE TABLE [Back Ordr]
( 
	[Reschd Shipment Dt] datetime  NULL ,
	[Ordr Shipment Identifier] [id] 
	CONSTRAINT [area_codes_98240695]
		 DEFAULT  212
	CONSTRAINT [area_codes_98240695]
		CHECK  ( [Ordr Shipment Identifier]=201 OR [Ordr Shipment Identifier]=212 OR [Ordr Shipment Identifier]=215 OR [Ordr Shipment Identifier]=732 OR [Ordr Shipment Identifier]=908 ),
	[Ordr Nbr]           integer  NOT NULL ,
	[itm Seq Nbr]        integer  NOT NULL 
)
go

CREATE TABLE [Bk]
( 
	[Bk Identification]  [id] ,
	[Bk Nam]             char varying(80)  NULL ,
	[Bk Typ]             char(12)  NULL 
	CONSTRAINT [DF__titles__type__00551192]
		 DEFAULT  'UNDECIDED',
	[Publshr Identification] [id]  NULL ,
	[MSRP Price]         money  NULL ,
	[Advance]            money  NULL ,
	[Rylty Trms]         integer  NULL ,
	[Bk Note]            char varying(200)  NULL ,
	[Publication Dt]     [SystemDate] 
	CONSTRAINT [DF__system__date_168096172]
		 DEFAULT  SYSDATE
)
go

CREATE TABLE [Bk Retrun]
( 
	[Bk Return Identification] [id] ,
	[Ordr Nbr]           integer  NULL ,
	[itm Seq Nbr]        integer  NULL ,
	[Bk Return Dt]       datetime  NULL 
)
go

CREATE TABLE [Bk YTD Sls]
( 
	[Bk Identification]  [id] ,
	[Yr To Dt Sls Amt]   DECIMAL(10,2)  NULL ,
	[Yr To Dt Sls Dt]    [SystemDate] 
	CONSTRAINT [DF__system__date_539460128]
		 DEFAULT  SYSDATE
)
go

CREATE TABLE [BkAuth]
( 
	[Auth Identification] [id] ,
	[Bk Identification]  [id] 
)
go

CREATE TABLE [Crd Card]
( 
	[Card Nbr]           integer  NULL ,
	[Card Expiration Dt] datetime  NULL ,
	[Crd Card Typ]       CHAR(4)  NULL ,
	[Card Vendor Nam]    char varying(20)  NULL ,
	[Crd Card Amt]       numeric(7,2)  NULL ,
	[Pmt Nbr]            integer  NOT NULL 
)
go

CREATE TABLE [Crd Chk]
( 
	[Crd Chk Event]      CHAR(12)  NOT NULL ,
	[Crd Chk Dt]         [SystemDate] 
	CONSTRAINT [DF__system__date_731812462]
		 DEFAULT  SYSDATE,
	[Crd Stat]           CHAR(12)  NULL ,
	[Pmt Nbr]            integer  NOT NULL 
)
go

CREATE TABLE [Cust]
( 
	[Cust Identification] [id] ,
	[Cust Frst Nam]      [FIRST_NAME] ,
	[Cust Lst Nam]       [LAST_NAME] ,
	[Cust Street Addr]   [STREET_ADDRESS] ,
	[Cust Cmpy Nam]      varchar(40)  NULL ,
	[Cust Cty]           [CITY] ,
	[Cust St]            [St] 
	CONSTRAINT [state code_54470049]
		 DEFAULT  'NJ',
	[Cust Zip Cd]        [ZIP_CODE] ,
	[Cust Phn Area Cd]   [AREA_CODE_PHONE] 
	CONSTRAINT [area_codes_639217947]
		 DEFAULT  212,
	[Cust Phn Nbr]       [PHONE_NUMBER] ,
	[Cust Fax Area Cd]   [FAX_AREA_CODE] 
	CONSTRAINT [area_codes_756003109]
		 DEFAULT  212
	CONSTRAINT [area_codes_756003109]
		CHECK  ( [Cust Fax Area Cd]=201 OR [Cust Fax Area Cd]=212 OR [Cust Fax Area Cd]=215 OR [Cust Fax Area Cd]=732 OR [Cust Fax Area Cd]=908 ),
	[Cust Fax Nbr]       [FAX_NUMBER] 
)
go

CREATE TABLE [Disc]
( 
	[Disc Typ]           varchar(4)  NOT NULL ,
	[Low Qty]            smallint  NULL ,
	[High Qty]           smallint  NULL ,
	[Disc Pct]           decimal(4,2)  NULL 
)
go

CREATE TABLE [Emp]
( 
	[Emp Identification] [id] ,
	[Emp Frst Nam]       char varying(20)  NULL ,
	[Emp Middle Initial] char(1)  NULL ,
	[Emp Lst Nam]        char varying(30)  NULL ,
	[Job Identification] [id] 
	CONSTRAINT [DF__employee__job_id__1B0907CE]
		 DEFAULT  1
	CONSTRAINT [area_codes_1340590566]
		CHECK  ( [Job Identification]=201 OR [Job Identification]=212 OR [Job Identification]=215 OR [Job Identification]=732 OR [Job Identification]=908 ),
	[Current Emp Job Title] tinyint  NULL 
	CONSTRAINT [DF__employee__job_lv__1CF15040]
		 DEFAULT  10,
	[Emp Hire Dt]        [SystemDate] 
	CONSTRAINT [DF__system__date_2000488284]
		 DEFAULT  SYSDATE
)
go

CREATE TABLE [Job]
( 
	[Job Identification] [id] ,
	[Job Desc]           char varying(50)  NULL 
	CONSTRAINT [DF__jobs__job_desc__1273C1CD]
		 DEFAULT  'New Position - title not formalized yet',
	[Minimum Level]      tinyint  NULL 
	CONSTRAINT [CK__jobs__min_lvl__1367E606]
		CHECK  ( Minimum Level >= 10 ),
	[Maximum Level]      tinyint  NULL 
	CONSTRAINT [CK__jobs__max_lvl__145C0A3F]
		CHECK  ( Maximum Level <= 250 )
)
go

CREATE TABLE [Money Ordr]
( 
	[Money Ordr Nbr]     integer  NULL ,
	[Money Ordr Amt]     numeric(7,2)  NULL ,
	[Pmt Nbr]            integer  NOT NULL 
)
go

CREATE TABLE [Ordr itm]
( 
	[Ordr Qty]           smallint  NULL ,
	[Ordr Nbr]           integer  NOT NULL ,
	[Bk Identification]  [id] ,
	[itm Seq Nbr]        integer  NOT NULL ,
	[Disc Typ]           char varying(4)  NULL ,
	[Ordr Disc Amt]      DECIMAL(7,2)  NULL ,
	[Ordr Price]         DECIMAL(7,2)  NULL 
)
go

CREATE TABLE [Ordr Shipment]
( 
	[Ordr Shipment Identifier] [id] ,
	[Blng Addr]          [STREET_ADDRESS] ,
	[Shipping Addr]      [STREET_ADDRESS] ,
	[Shipment Stat]      CHAR(7)  NULL ,
	[Shed Shipment Dt]   [SystemDate] 
	CONSTRAINT [DF__system__date_218785949]
		 DEFAULT  SYSDATE,
	[Ordr Nbr]           integer  NOT NULL ,
	[itm Seq Nbr]        integer  NOT NULL 
)
go

CREATE TABLE [Personal Chk]
( 
	[Chk Nbr]            integer  NULL ,
	[Chk Account Nbr]    integer  NULL ,
	[Chk Bank Nbr]       integer  NULL ,
	[Chk Driver License Nbr] CHAR(15)  NULL ,
	[Chk Amt]            numeric(7,2)  NULL ,
	[Pmt Nbr]            integer  NOT NULL 
)
go

CREATE TABLE [Pmt]
( 
	[Pmt Nbr]            integer  NOT NULL ,
	[Pmt Dt]             [SystemDate] 
	CONSTRAINT [DF__system__date_1663253450]
		 DEFAULT  SYSDATE,
	[Pmt Amt]            DECIMAL(7,2)  NULL ,
	[Pmt Typ]            CHAR(9)  NULL 
)
go

CREATE TABLE [Publshr]
( 
	[Publshr Identification] [id] ,
	[Publshr Nam]        char varying(40)  NULL ,
	[Publshr Addr]       [STREET_ADDRESS] ,
	[Publshr Cty]        [CITY] ,
	[Publshr St]         [St] 
	CONSTRAINT [DF__publisher__count__7D78A4E7]
		 DEFAULT  'USA',
	[Publshr Zip Cd]     [ZIP_CODE] 
)
go

CREATE TABLE [Publshr Logo]
( 
	[Publshr Identification] [id] ,
	[Publshr Logo]       character(500)  NULL ,
	[Publshr Public Rel Inf] varchar(200)  NULL 
)
go

CREATE TABLE [Purchase Ordr]
( 
	[Stor Identification] [id] ,
	[Ordr Nbr]           integer  NOT NULL ,
	[Ordr Dt]            [SystemDate] 
	CONSTRAINT [DF__system__date_1059370398]
		 DEFAULT  SYSDATE,
	[Pmt Trms]           char varying(12)  NULL ,
	[Cust Identification] [id]  NULL 
)
go

CREATE TABLE [Reporting Structure]
( 
	[Manager]            [id] ,
	[Reports To]         [id] ,
	[Start Dt]           datetime  NULL ,
	[End Dt]             datetime  NULL 
)
go

CREATE TABLE [Rgn]
( 
	[Rgn Identification] [id] ,
	[Rgn Area]           CHAR(7)  NULL ,
	[Rgn Desc]           varchar(75)  NULL 
)
go

CREATE TABLE [Rylty]
( 
	[Low Rnge]           integer  NULL ,
	[High Rnge]          integer  NULL ,
	[Rylty Amt]          numeric(5,2)  NULL ,
	[Rylty Identification] [id] 
)
go

CREATE TABLE [Rylty Hist]
( 
	[Ordr Nbr]           integer  NULL ,
	[itm Seq Nbr]        integer  NULL ,
	[Rylty Hist Identification] [id] ,
	[Rylty Pmt Dt]       [SystemDate] 
	CONSTRAINT [DF__system__date_1982260988]
		 DEFAULT  SYSDATE,
	[Rylty Pmt Amt]      decimal(6,2)  NULL ,
	[Rylty Payee]        char(30)  NULL 
)
go

CREATE TABLE [Rylty Pmt]
( 
	[Auth Identification] [id] ,
	[Bk Identification]  [id] ,
	[Rylty Identification] [id] 
	CONSTRAINT [area_codes_1273508896]
		 DEFAULT  212
	CONSTRAINT [area_codes_1273508896]
		CHECK  ( [Rylty Identification]=201 OR [Rylty Identification]=212 OR [Rylty Identification]=215 OR [Rylty Identification]=732 OR [Rylty Identification]=908 ),
	[Pmt Dt]             [SystemDate] 
	CONSTRAINT [DF__system__date_672213706]
		 DEFAULT  SYSDATE,
	[Pmt Amt]            DECIMAL(7,2)  NULL 
)
go

CREATE TABLE [Stor Nam]
( 
	[Stor Identification] [id] ,
	[Stor Nam]           char varying(40)  NULL ,
	[Stor Addr]          [STREET_ADDRESS] ,
	[Stor Cty]           [CITY] ,
	[Stor St]            [St] ,
	[Stor Zip Cd]        [ZIP_CODE] ,
	[Rgn Identification] [id]  NULL 
)
go

ALTER TABLE [Auth]
	ADD CONSTRAINT [UPKCL_auidind] PRIMARY KEY  NONCLUSTERED ([Auth Identification] ASC)
go

CREATE INDEX [aunmind] ON [Auth]
( 
	[Auth Lst Nam]        ASC,
	[Auth Frst Nam]       ASC
)
go

ALTER TABLE [Back Ordr]
	ADD CONSTRAINT [XPKBack Order] PRIMARY KEY  NONCLUSTERED ([Ordr Shipment Identifier] ASC,[Ordr Nbr] ASC,[itm Seq Nbr] ASC)
go

ALTER TABLE [Bk]
	ADD CONSTRAINT [UPKCL_titleidind] PRIMARY KEY  NONCLUSTERED ([Bk Identification] ASC)
go

CREATE INDEX [titleind] ON [Bk]
( 
	[Bk Nam]              ASC
)
go

ALTER TABLE [Bk Retrun]
	ADD CONSTRAINT [XPKBook Retrun] PRIMARY KEY  NONCLUSTERED ([Bk Return Identification] ASC)
go

ALTER TABLE [Bk YTD Sls]
	ADD CONSTRAINT [XPKBook YTD Sales] PRIMARY KEY  NONCLUSTERED ([Bk Identification] ASC)
go

ALTER TABLE [BkAuth]
	ADD CONSTRAINT [UPKCL_taind] PRIMARY KEY  NONCLUSTERED ([Auth Identification] ASC,[Bk Identification] ASC)
go

ALTER TABLE [Crd Card]
	ADD CONSTRAINT [XPKCredit Card] PRIMARY KEY  NONCLUSTERED ([Pmt Nbr] ASC)
go

ALTER TABLE [Crd Chk]
	ADD CONSTRAINT [XPKCredit Check] PRIMARY KEY  NONCLUSTERED ([Crd Chk Event] ASC)
go

ALTER TABLE [Cust]
	ADD CONSTRAINT [XPKCustomer] PRIMARY KEY  NONCLUSTERED ([Cust Identification] ASC)
go

CREATE INDEX [XIE1Customer] ON [Cust]
( 
	[Cust Lst Nam]        ASC,
	[Cust Frst Nam]       ASC
)
go

ALTER TABLE [Disc]
	ADD CONSTRAINT [XPKDiscount] PRIMARY KEY  NONCLUSTERED ([Disc Typ] ASC)
go

ALTER TABLE [Emp]
	ADD CONSTRAINT [PK_emp_id] PRIMARY KEY  NONCLUSTERED ([Emp Identification] ASC)
go

CREATE INDEX [employee_ind] ON [Emp]
( 
	[Emp Lst Nam]         ASC,
	[Emp Frst Nam]        ASC,
	[Emp Middle Initial]  ASC
)
go

ALTER TABLE [Job]
	ADD CONSTRAINT [PK__jobs__117F9D94] PRIMARY KEY  NONCLUSTERED ([Job Identification] ASC)
go

ALTER TABLE [Ordr itm]
	ADD CONSTRAINT [XPKOrder Item] PRIMARY KEY  NONCLUSTERED ([Ordr Nbr] ASC,[itm Seq Nbr] ASC)
go

ALTER TABLE [Ordr Shipment]
	ADD CONSTRAINT [XPKOrder Shipment] PRIMARY KEY  NONCLUSTERED ([Ordr Shipment Identifier] ASC,[Ordr Nbr] ASC,[itm Seq Nbr] ASC)
go

ALTER TABLE [Pmt]
	ADD CONSTRAINT [XPKPayment] PRIMARY KEY  NONCLUSTERED ([Pmt Nbr] ASC)
go

ALTER TABLE [Publshr]
	ADD CONSTRAINT [UPKCL_pubind] PRIMARY KEY  NONCLUSTERED ([Publshr Identification] ASC)
go

ALTER TABLE [Publshr Logo]
	ADD CONSTRAINT [UPKCL_pubinfo] PRIMARY KEY  NONCLUSTERED ([Publshr Identification] ASC)
go

ALTER TABLE [Purchase Ordr]
	ADD CONSTRAINT [UPKCL_sales] PRIMARY KEY  NONCLUSTERED ([Ordr Nbr] ASC)
go

ALTER TABLE [Reporting Structure]
	ADD CONSTRAINT [XPKReporting Structure] PRIMARY KEY  NONCLUSTERED ([Manager] ASC,[Reports To] ASC)
go

ALTER TABLE [Rgn]
	ADD CONSTRAINT [XPKRegion] PRIMARY KEY  NONCLUSTERED ([Rgn Identification] ASC)
go

ALTER TABLE [Rylty]
	ADD CONSTRAINT [XPKRoyalty] PRIMARY KEY  NONCLUSTERED ([Rylty Identification] ASC)
go

ALTER TABLE [Rylty Hist]
	ADD CONSTRAINT [XPKRoyalty History] PRIMARY KEY  NONCLUSTERED ([Rylty Hist Identification] ASC)
go

ALTER TABLE [Rylty Pmt]
	ADD CONSTRAINT [XPKRoyalty Payment] PRIMARY KEY  NONCLUSTERED ([Auth Identification] ASC,[Bk Identification] ASC,[Rylty Identification] ASC)
go

ALTER TABLE [Stor Nam]
	ADD CONSTRAINT [UPK_storeid] PRIMARY KEY  NONCLUSTERED ([Stor Identification] ASC)
go

CREATE VIEW titleview
   (Book_Nam, Auth_Id, Auth_Lst_Nam, MRSP_Prc, Publshr_Id)
AS SELECT
   Book.Book_Nam, Auth.Auth_Id, Auth.Auth_Lst_Nam,
   Book.MRSP_Prc, Book.Publshr_Id
FROM Book, Auth, BookAuth

go

CREATE VIEW [Order_View]([Stor Nam],[Ordr Nbr],[Ordr Dt],[Bk Nam],[Ordr Qty],[Ordr Disc Amt],[Ordr Price])
AS
SELECT [Stor Nam].[Stor Nam],[Purchase Ordr].[Ordr Nbr],[Purchase Ordr].[Ordr Dt],[Bk].[Bk Nam],[Ordr itm].[Ordr Qty],[Ordr itm].[Ordr Disc Amt],[Ordr itm].[Ordr Price]
	FROM [Ordr itm],[Bk],[Purchase Ordr],[Stor Nam]
go

CREATE VIEW [Publisher View]([Emp Frst Nam],[Emp Lst Nam],[Publshr Nam],[Bk Nam],[Yr To Dt Sls Amt])
AS
SELECT [Emp].[Emp Frst Nam],[Emp].[Emp Lst Nam],[Publshr].[Publshr Nam],[Bk].[Bk Nam],[Bk YTD Sls].[Yr To Dt Sls Amt]
	FROM [Publshr],[Bk],[Bk YTD Sls],[Emp]
go

CREATE VIEW [Payment View]([Card Nbr],[Crd Card Amt],[Money Ordr Nbr],[Money Ordr Amt],[Chk Nbr],[Chk Amt],[Cust Frst Nam],[Cust Lst Nam],[Ordr Nbr],[Ordr Dt])
AS
SELECT [Crd Card].[Card Nbr],[Crd Card].[Crd Card Amt],[Money Ordr].[Money Ordr Nbr],[Money Ordr].[Money Ordr Amt],[Personal Chk].[Chk Nbr],[Personal Chk].[Chk Amt],[Cust].[Cust Frst Nam],[Cust].[Cust Lst Nam],[Purchase Ordr].[Ordr Nbr],[Purchase Ordr].[Ordr Dt]
	FROM [Money Ordr],[Pmt],[Crd Card],[Personal Chk],[Cust],[Purchase Ordr]
go


ALTER TABLE [Back Ordr]
	ADD CONSTRAINT [FK_Ordr Shipment_Back Ordr] FOREIGN KEY ([Ordr Shipment Identifier],[Ordr Nbr],[itm Seq Nbr]) REFERENCES [Ordr Shipment]([Ordr Shipment Identifier],[Ordr Nbr],[itm Seq Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Bk]
	ADD CONSTRAINT [FK_Publshr_Bk] FOREIGN KEY ([Publshr Identification]) REFERENCES [Publshr]([Publshr Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Bk Retrun]
	ADD CONSTRAINT [FK_Ordr itm_Bk Retrun] FOREIGN KEY ([Ordr Nbr],[itm Seq Nbr]) REFERENCES [Ordr itm]([Ordr Nbr],[itm Seq Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Bk YTD Sls]
	ADD CONSTRAINT [FK_Bk_Bk YTD Sls] FOREIGN KEY ([Bk Identification]) REFERENCES [Bk]([Bk Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [BkAuth]
	ADD CONSTRAINT [FK_Auth_BkAuth] FOREIGN KEY ([Auth Identification]) REFERENCES [Auth]([Auth Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [BkAuth]
	ADD CONSTRAINT [FK_Bk_BkAuth] FOREIGN KEY ([Bk Identification]) REFERENCES [Bk]([Bk Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Crd Chk]
	ADD CONSTRAINT [FK_Crd Card_Crd Chk] FOREIGN KEY ([Pmt Nbr]) REFERENCES [Crd Card]([Pmt Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Emp]
	ADD CONSTRAINT [FK_Job_Emp] FOREIGN KEY ([Job Identification]) REFERENCES [Job]([Job Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Money Ordr]
	ADD CONSTRAINT [FK_Pmt_Money Ordr] FOREIGN KEY ([Pmt Nbr]) REFERENCES [Pmt]([Pmt Nbr])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Ordr itm]
	ADD CONSTRAINT [FK_Disc_Ordr itm] FOREIGN KEY ([Disc Typ]) REFERENCES [Disc]([Disc Typ])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Ordr itm]
	ADD CONSTRAINT [FK_Purchase Ordr_Ordr itm] FOREIGN KEY ([Ordr Nbr]) REFERENCES [Purchase Ordr]([Ordr Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Ordr itm]
	ADD CONSTRAINT [FK_Bk_Ordr itm] FOREIGN KEY ([Bk Identification]) REFERENCES [Bk]([Bk Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Ordr Shipment]
	ADD CONSTRAINT [FK_Ordr itm_Ordr Shipment] FOREIGN KEY ([Ordr Nbr],[itm Seq Nbr]) REFERENCES [Ordr itm]([Ordr Nbr],[itm Seq Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Personal Chk]
	ADD CONSTRAINT [FK_Pmt_Personal Chk] FOREIGN KEY ([Pmt Nbr]) REFERENCES [Pmt]([Pmt Nbr])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Publshr Logo]
	ADD CONSTRAINT [FK_Publshr_Publshr Logo] FOREIGN KEY ([Publshr Identification]) REFERENCES [Publshr]([Publshr Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Purchase Ordr]
	ADD CONSTRAINT [FK_Cust_Purchase Ordr] FOREIGN KEY ([Cust Identification]) REFERENCES [Cust]([Cust Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Purchase Ordr]
	ADD CONSTRAINT [FK_Stor Nam_Purchase Ordr] FOREIGN KEY ([Stor Identification]) REFERENCES [Stor Nam]([Stor Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Reporting Structure]
	ADD CONSTRAINT [FK_Emp_Reporting Structure] FOREIGN KEY ([Manager]) REFERENCES [Emp]([Emp Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Reporting Structure]
	ADD CONSTRAINT [FK_Emp_Reporting Structure] FOREIGN KEY ([Reports To]) REFERENCES [Emp]([Emp Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Rylty Hist]
	ADD CONSTRAINT [FK_Ordr itm_Rylty Hist] FOREIGN KEY ([Ordr Nbr],[itm Seq Nbr]) REFERENCES [Ordr itm]([Ordr Nbr],[itm Seq Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Rylty Pmt]
	ADD CONSTRAINT [FK_Rylty_Rylty Pmt] FOREIGN KEY ([Rylty Identification]) REFERENCES [Rylty]([Rylty Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Rylty Pmt]
	ADD CONSTRAINT [FK_BkAuth_Rylty Pmt] FOREIGN KEY ([Auth Identification],[Bk Identification]) REFERENCES [BkAuth]([Auth Identification],[Bk Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Stor Nam]
	ADD CONSTRAINT [FK_Rgn_Stor Nam] FOREIGN KEY ([Rgn Identification]) REFERENCES [Rgn]([Rgn Identification])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

CREATE  PROCEDURE [byroyalty] 
--   (<argument name> <in out nocopy> <argument datatype> <default value>)
AS
BEGIN
   select au_id 
   from titleauthor
   where titleauthor.royaltyper = @percentage;
END;
go

CREATE  PROCEDURE [reptq1] 
--   (<argument name> <in out nocopy> <argument datatype> <default value>)
AS
BEGIN
   select 
	case when grouping(pub_id) = 1 then 'ALL' 
             else pub_id end as pub_id, avg(price) as avg_price
   from titles
   where price is NOT NULL
   group by pub_id with rollup
   order by pub_id;
END;
go

CREATE  PROCEDURE [reptq2] 
--   (<argument name> <in out nocopy> <argument datatype> <default value>)
AS
BEGIN
   select 
      case when grouping(type) = 1 then 'ALL' 
      else type end as type, 
      case when grouping(pub_id) = 1 then 'ALL' 
      else pub_id end as pub_id, avg(ytd_sales) as avg_ytd_sales
   from titles
   where pub_id is NOT NULL
   group by pub_id, type with rollup;
END;
go

CREATE  PROCEDURE [reptq3x] 
--   (<argument name> <in out nocopy> <argument datatype> <default value>)
AS
BEGIN
   select 
      case when grouping(pub_id) = 1 then 'ALL' 
      else pub_id end as pub_id, 
      case when grouping(type) = 1 then 'ALL' 
      else type end as type, count(title_id) as cnt
   from titles
   where price >@lolimit AND price <@hilimit AND 
         type = @type OR type LIKE '%cook%'
   group by pub_id, type with rollup;
END;
go

CREATE TRIGGER tD_BookAuthor ON BkAuth FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on BkAuth */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* BkAuth  Rylty Pmt on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003762a", PARENT_OWNER="", PARENT_TABLE="BkAuth"
    CHILD_OWNER="", CHILD_TABLE="Rylty Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_BkAuth_Rylty Pmt", FK_COLUMNS="Auth Identification""Bk Identification" */
    IF EXISTS (
      SELECT * FROM deleted,Rylty Pmt
      WHERE
        /*  %JoinFKPK(Rylty Pmt,deleted," = "," AND") */
        Rylty Pmt.Auth Identification = deleted.Auth Identification AND
        Rylty Pmt.Bk Identification = deleted.Bk Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete BkAuth because Rylty Pmt exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Bk  BkAuth on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="BkAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_BkAuth", FK_COLUMNS="Bk Identification" */
    IF EXISTS (SELECT * FROM deleted,Bk
      WHERE
        /* %JoinFKPK(deleted,Bk," = "," AND") */
        deleted.Bk Identification = Bk.Bk Identification AND
        NOT EXISTS (
          SELECT * FROM BkAuth
          WHERE
            /* %JoinFKPK(BkAuth,Bk," = "," AND") */
            BkAuth.Bk Identification = Bk.Bk Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last BkAuth because Bk exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Auth  BkAuth on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Auth"
    CHILD_OWNER="", CHILD_TABLE="BkAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Auth_BkAuth", FK_COLUMNS="Auth Identification" */
    IF EXISTS (SELECT * FROM deleted,Auth
      WHERE
        /* %JoinFKPK(deleted,Auth," = "," AND") */
        deleted.Auth Identification = Auth.Auth Identification AND
        NOT EXISTS (
          SELECT * FROM BkAuth
          WHERE
            /* %JoinFKPK(BkAuth,Auth," = "," AND") */
            BkAuth.Auth Identification = Auth.Auth Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last BkAuth because Auth exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_BookAuthor ON BkAuth FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on BkAuth */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAuth Identification id, 
           @insBk Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* BkAuth  Rylty Pmt on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00040406", PARENT_OWNER="", PARENT_TABLE="BkAuth"
    CHILD_OWNER="", CHILD_TABLE="Rylty Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_BkAuth_Rylty Pmt", FK_COLUMNS="Auth Identification""Bk Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Auth Identification) OR
    UPDATE(Bk Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rylty Pmt
      WHERE
        /*  %JoinFKPK(Rylty Pmt,deleted," = "," AND") */
        Rylty Pmt.Auth Identification = deleted.Auth Identification AND
        Rylty Pmt.Bk Identification = deleted.Bk Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update BkAuth because Rylty Pmt exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Bk  BkAuth on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="BkAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_BkAuth", FK_COLUMNS="Bk Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Bk Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Bk
        WHERE
          /* %JoinFKPK(inserted,Bk) */
          inserted.Bk Identification = Bk.Bk Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update BkAuth because Bk does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Auth  BkAuth on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Auth"
    CHILD_OWNER="", CHILD_TABLE="BkAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Auth_BkAuth", FK_COLUMNS="Auth Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Auth Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Auth
        WHERE
          /* %JoinFKPK(inserted,Auth) */
          inserted.Auth Identification = Auth.Auth Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update BkAuth because Auth does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Store_Name ON Stor Nam FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Stor Nam */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Stor Nam  Purchase Ordr on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00024ef2", PARENT_OWNER="", PARENT_TABLE="Stor Nam"
    CHILD_OWNER="", CHILD_TABLE="Purchase Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Stor Nam_Purchase Ordr", FK_COLUMNS="Stor Identification" */
    IF EXISTS (
      SELECT * FROM deleted,Purchase Ordr
      WHERE
        /*  %JoinFKPK(Purchase Ordr,deleted," = "," AND") */
        Purchase Ordr.Stor Identification = deleted.Stor Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Stor Nam because Purchase Ordr exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Rgn  Stor Nam on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Rgn"
    CHILD_OWNER="", CHILD_TABLE="Stor Nam"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Rgn_Stor Nam", FK_COLUMNS="Rgn Identification" */
    IF EXISTS (SELECT * FROM deleted,Rgn
      WHERE
        /* %JoinFKPK(deleted,Rgn," = "," AND") */
        deleted.Rgn Identification = Rgn.Rgn Identification AND
        NOT EXISTS (
          SELECT * FROM Stor Nam
          WHERE
            /* %JoinFKPK(Stor Nam,Rgn," = "," AND") */
            Stor Nam.Rgn Identification = Rgn.Rgn Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Stor Nam because Rgn exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Store_Name ON Stor Nam FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Stor Nam */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStor Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Stor Nam  Purchase Ordr on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002a8ac", PARENT_OWNER="", PARENT_TABLE="Stor Nam"
    CHILD_OWNER="", CHILD_TABLE="Purchase Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Stor Nam_Purchase Ordr", FK_COLUMNS="Stor Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Stor Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Purchase Ordr
      WHERE
        /*  %JoinFKPK(Purchase Ordr,deleted," = "," AND") */
        Purchase Ordr.Stor Identification = deleted.Stor Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Stor Nam because Purchase Ordr exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Rgn  Stor Nam on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Rgn"
    CHILD_OWNER="", CHILD_TABLE="Stor Nam"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Rgn_Stor Nam", FK_COLUMNS="Rgn Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Rgn Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Rgn
        WHERE
          /* %JoinFKPK(inserted,Rgn) */
          inserted.Rgn Identification = Rgn.Rgn Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Rgn Identification IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Stor Nam because Rgn does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Purchase_Order ON Purchase Ordr FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Purchase Ordr */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Purchase Ordr  Ordr itm on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00039491", PARENT_OWNER="", PARENT_TABLE="Purchase Ordr"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Purchase Ordr_Ordr itm", FK_COLUMNS="Ordr Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,Ordr itm
      WHERE
        /*  %JoinFKPK(Ordr itm,deleted," = "," AND") */
        Ordr itm.Ordr Nbr = deleted.Ordr Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Purchase Ordr because Ordr itm exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Cust  Purchase Ordr on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cust"
    CHILD_OWNER="", CHILD_TABLE="Purchase Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cust_Purchase Ordr", FK_COLUMNS="Cust Identification" */
    IF EXISTS (SELECT * FROM deleted,Cust
      WHERE
        /* %JoinFKPK(deleted,Cust," = "," AND") */
        deleted.Cust Identification = Cust.Cust Identification AND
        NOT EXISTS (
          SELECT * FROM Purchase Ordr
          WHERE
            /* %JoinFKPK(Purchase Ordr,Cust," = "," AND") */
            Purchase Ordr.Cust Identification = Cust.Cust Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Purchase Ordr because Cust exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Stor Nam  Purchase Ordr on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Stor Nam"
    CHILD_OWNER="", CHILD_TABLE="Purchase Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Stor Nam_Purchase Ordr", FK_COLUMNS="Stor Identification" */
    IF EXISTS (SELECT * FROM deleted,Stor Nam
      WHERE
        /* %JoinFKPK(deleted,Stor Nam," = "," AND") */
        deleted.Stor Identification = Stor Nam.Stor Identification AND
        NOT EXISTS (
          SELECT * FROM Purchase Ordr
          WHERE
            /* %JoinFKPK(Purchase Ordr,Stor Nam," = "," AND") */
            Purchase Ordr.Stor Identification = Stor Nam.Stor Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Purchase Ordr because Stor Nam exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Purchase_Order ON Purchase Ordr FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Purchase Ordr */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOrdr Nbr integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Purchase Ordr  Ordr itm on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003fc16", PARENT_OWNER="", PARENT_TABLE="Purchase Ordr"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Purchase Ordr_Ordr itm", FK_COLUMNS="Ordr Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Ordr Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Ordr itm
      WHERE
        /*  %JoinFKPK(Ordr itm,deleted," = "," AND") */
        Ordr itm.Ordr Nbr = deleted.Ordr Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Purchase Ordr because Ordr itm exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Cust  Purchase Ordr on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Cust"
    CHILD_OWNER="", CHILD_TABLE="Purchase Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cust_Purchase Ordr", FK_COLUMNS="Cust Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cust Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Cust
        WHERE
          /* %JoinFKPK(inserted,Cust) */
          inserted.Cust Identification = Cust.Cust Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cust Identification IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Purchase Ordr because Cust does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Stor Nam  Purchase Ordr on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Stor Nam"
    CHILD_OWNER="", CHILD_TABLE="Purchase Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Stor Nam_Purchase Ordr", FK_COLUMNS="Stor Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Stor Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Stor Nam
        WHERE
          /* %JoinFKPK(inserted,Stor Nam) */
          inserted.Stor Identification = Stor Nam.Stor Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Purchase Ordr because Stor Nam does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Royalty ON Rylty FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Rylty */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Rylty  Rylty Pmt on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012140", PARENT_OWNER="", PARENT_TABLE="Rylty"
    CHILD_OWNER="", CHILD_TABLE="Rylty Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Rylty_Rylty Pmt", FK_COLUMNS="Rylty Identification" */
    IF EXISTS (
      SELECT * FROM deleted,Rylty Pmt
      WHERE
        /*  %JoinFKPK(Rylty Pmt,deleted," = "," AND") */
        Rylty Pmt.Rylty Identification = deleted.Rylty Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Rylty because Rylty Pmt exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Royalty ON Rylty FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Rylty */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRylty Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Rylty  Rylty Pmt on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013983", PARENT_OWNER="", PARENT_TABLE="Rylty"
    CHILD_OWNER="", CHILD_TABLE="Rylty Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Rylty_Rylty Pmt", FK_COLUMNS="Rylty Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Rylty Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rylty Pmt
      WHERE
        /*  %JoinFKPK(Rylty Pmt,deleted," = "," AND") */
        Rylty Pmt.Rylty Identification = deleted.Rylty Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Rylty because Rylty Pmt exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Discount ON Disc FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Disc */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Disc  Ordr itm on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00010373", PARENT_OWNER="", PARENT_TABLE="Disc"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Disc_Ordr itm", FK_COLUMNS="Disc Typ" */
    IF EXISTS (
      SELECT * FROM deleted,Ordr itm
      WHERE
        /*  %JoinFKPK(Ordr itm,deleted," = "," AND") */
        Ordr itm.Disc Typ = deleted.Disc Typ
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Disc because Ordr itm exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Discount ON Disc FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Disc */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insDisc Typ varchar(4),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Disc  Ordr itm on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00011f63", PARENT_OWNER="", PARENT_TABLE="Disc"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Disc_Ordr itm", FK_COLUMNS="Disc Typ" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Disc Typ)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Ordr itm
      WHERE
        /*  %JoinFKPK(Ordr itm,deleted," = "," AND") */
        Ordr itm.Disc Typ = deleted.Disc Typ
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Disc because Ordr itm exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Job ON Job FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Job */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Job  Emp on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000100f5", PARENT_OWNER="", PARENT_TABLE="Job"
    CHILD_OWNER="", CHILD_TABLE="Emp"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Job_Emp", FK_COLUMNS="Job Identification" */
    IF EXISTS (
      SELECT * FROM deleted,Emp
      WHERE
        /*  %JoinFKPK(Emp,deleted," = "," AND") */
        Emp.Job Identification = deleted.Job Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Job because Emp exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Job ON Job FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Job */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insJob Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Job  Emp on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00012826", PARENT_OWNER="", PARENT_TABLE="Job"
    CHILD_OWNER="", CHILD_TABLE="Emp"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Job_Emp", FK_COLUMNS="Job Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Job Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Emp
      WHERE
        /*  %JoinFKPK(Emp,deleted," = "," AND") */
        Emp.Job Identification = deleted.Job Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Job because Emp exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Publisher_Logo ON Publshr Logo FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Publshr Logo */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Publshr  Publshr Logo on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016e81", PARENT_OWNER="", PARENT_TABLE="Publshr"
    CHILD_OWNER="", CHILD_TABLE="Publshr Logo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Publshr_Publshr Logo", FK_COLUMNS="Publshr Identification" */
    IF EXISTS (SELECT * FROM deleted,Publshr
      WHERE
        /* %JoinFKPK(deleted,Publshr," = "," AND") */
        deleted.Publshr Identification = Publshr.Publshr Identification AND
        NOT EXISTS (
          SELECT * FROM Publshr Logo
          WHERE
            /* %JoinFKPK(Publshr Logo,Publshr," = "," AND") */
            Publshr Logo.Publshr Identification = Publshr.Publshr Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Publshr Logo because Publshr exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Publisher_Logo ON Publshr Logo FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Publshr Logo */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPublshr Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Publshr  Publshr Logo on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000185f6", PARENT_OWNER="", PARENT_TABLE="Publshr"
    CHILD_OWNER="", CHILD_TABLE="Publshr Logo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Publshr_Publshr Logo", FK_COLUMNS="Publshr Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Publshr Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Publshr
        WHERE
          /* %JoinFKPK(inserted,Publshr) */
          inserted.Publshr Identification = Publshr.Publshr Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Publshr Logo because Publshr does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE  TRIGGER [employee_insupd]
  AFTER INSERT OR UPDATE
  ON Emp
  
  
  

--Get the range of level for this job type from the jobs table.
declare Xmin_lvl smallint;
        Xmax_lvl smallint;
        Xemp_lvl smallint;
        Xjob_id  smallint;

Begin
   select Xmin_lvl = min_lvl,
      Xmax_lvl = max_lvl,
      Xemp_lvl = i.job_lvl,
      Xjob_id = i.job_id
   from employee e, jobs j, inserted i
   where e.emp_id = i.emp_id AND i.job_id = j.job_id;

   IF (Xjob_id = 1) and (Xemp_lvl <> 10) then
      raise_application_error (-20001, 
      'Job id 1 expects the default level of 10.');
   ELSE
      IF NOT (Xemp_lvl BETWEEN Xmin_lvl AND Xmax_lvl) then
         raise_application_error (-20002, 
         'The level for job_id:%d should be between %d and %d.', 
         Xjob_id, Xmin_lvl, Xmax_lvl);
      end if;
   end if;
END;

ENABLE TRIGGER [employee_insupd] ON Emp
go

CREATE TRIGGER tD_Employee ON Emp FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Emp */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Emp  Reporting Structure on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000353b7", PARENT_OWNER="", PARENT_TABLE="Emp"
    CHILD_OWNER="", CHILD_TABLE="Reporting Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Emp_Reporting Structure", FK_COLUMNS="Reports To" */
    IF EXISTS (
      SELECT * FROM deleted,Reporting Structure
      WHERE
        /*  %JoinFKPK(Reporting Structure,deleted," = "," AND") */
        Reporting Structure.Reports To = deleted.Emp Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Emp because Reporting Structure exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Emp  Reporting Structure on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Emp"
    CHILD_OWNER="", CHILD_TABLE="Reporting Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Emp_Reporting Structure", FK_COLUMNS="Manager" */
    IF EXISTS (
      SELECT * FROM deleted,Reporting Structure
      WHERE
        /*  %JoinFKPK(Reporting Structure,deleted," = "," AND") */
        Reporting Structure.Manager = deleted.Emp Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Emp because Reporting Structure exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Job  Emp on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Job"
    CHILD_OWNER="", CHILD_TABLE="Emp"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Job_Emp", FK_COLUMNS="Job Identification" */
    IF EXISTS (SELECT * FROM deleted,Job
      WHERE
        /* %JoinFKPK(deleted,Job," = "," AND") */
        deleted.Job Identification = Job.Job Identification AND
        NOT EXISTS (
          SELECT * FROM Emp
          WHERE
            /* %JoinFKPK(Emp,Job," = "," AND") */
            Emp.Job Identification = Job.Job Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Emp because Job exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Employee ON Emp FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Emp */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmp Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Emp  Reporting Structure on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003b805", PARENT_OWNER="", PARENT_TABLE="Emp"
    CHILD_OWNER="", CHILD_TABLE="Reporting Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Emp_Reporting Structure", FK_COLUMNS="Reports To" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Emp Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Reporting Structure
      WHERE
        /*  %JoinFKPK(Reporting Structure,deleted," = "," AND") */
        Reporting Structure.Reports To = deleted.Emp Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Emp because Reporting Structure exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Emp  Reporting Structure on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Emp"
    CHILD_OWNER="", CHILD_TABLE="Reporting Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Emp_Reporting Structure", FK_COLUMNS="Manager" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Emp Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Reporting Structure
      WHERE
        /*  %JoinFKPK(Reporting Structure,deleted," = "," AND") */
        Reporting Structure.Manager = deleted.Emp Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Emp because Reporting Structure exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Job  Emp on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Job"
    CHILD_OWNER="", CHILD_TABLE="Emp"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Job_Emp", FK_COLUMNS="Job Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Job Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Job
        WHERE
          /* %JoinFKPK(inserted,Job) */
          inserted.Job Identification = Job.Job Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Emp because Job does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Author ON Auth FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Auth */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Auth  BkAuth on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011949", PARENT_OWNER="", PARENT_TABLE="Auth"
    CHILD_OWNER="", CHILD_TABLE="BkAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Auth_BkAuth", FK_COLUMNS="Auth Identification" */
    IF EXISTS (
      SELECT * FROM deleted,BkAuth
      WHERE
        /*  %JoinFKPK(BkAuth,deleted," = "," AND") */
        BkAuth.Auth Identification = deleted.Auth Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Auth because BkAuth exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Author ON Auth FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Auth */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAuth Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Auth  BkAuth on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013e23", PARENT_OWNER="", PARENT_TABLE="Auth"
    CHILD_OWNER="", CHILD_TABLE="BkAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Auth_BkAuth", FK_COLUMNS="Auth Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Auth Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,BkAuth
      WHERE
        /*  %JoinFKPK(BkAuth,deleted," = "," AND") */
        BkAuth.Auth Identification = deleted.Auth Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Auth because BkAuth exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Publisher ON Publshr FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Publshr */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Publshr  Publshr Logo on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00021c57", PARENT_OWNER="", PARENT_TABLE="Publshr"
    CHILD_OWNER="", CHILD_TABLE="Publshr Logo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Publshr_Publshr Logo", FK_COLUMNS="Publshr Identification" */
    IF EXISTS (
      SELECT * FROM deleted,Publshr Logo
      WHERE
        /*  %JoinFKPK(Publshr Logo,deleted," = "," AND") */
        Publshr Logo.Publshr Identification = deleted.Publshr Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Publshr because Publshr Logo exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Publshr  Bk on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Publshr"
    CHILD_OWNER="", CHILD_TABLE="Bk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Publshr_Bk", FK_COLUMNS="Publshr Identification" */
    IF EXISTS (
      SELECT * FROM deleted,Bk
      WHERE
        /*  %JoinFKPK(Bk,deleted," = "," AND") */
        Bk.Publshr Identification = deleted.Publshr Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Publshr because Bk exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Publisher ON Publshr FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Publshr */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPublshr Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Publshr  Publshr Logo on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002573c", PARENT_OWNER="", PARENT_TABLE="Publshr"
    CHILD_OWNER="", CHILD_TABLE="Publshr Logo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Publshr_Publshr Logo", FK_COLUMNS="Publshr Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Publshr Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Publshr Logo
      WHERE
        /*  %JoinFKPK(Publshr Logo,deleted," = "," AND") */
        Publshr Logo.Publshr Identification = deleted.Publshr Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Publshr because Publshr Logo exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Publshr  Bk on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Publshr"
    CHILD_OWNER="", CHILD_TABLE="Bk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Publshr_Bk", FK_COLUMNS="Publshr Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Publshr Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Bk
      WHERE
        /*  %JoinFKPK(Bk,deleted," = "," AND") */
        Bk.Publshr Identification = deleted.Publshr Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Publshr because Bk exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Book ON Bk FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Bk */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Bk  BkAuth on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00042745", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="BkAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_BkAuth", FK_COLUMNS="Bk Identification" */
    IF EXISTS (
      SELECT * FROM deleted,BkAuth
      WHERE
        /*  %JoinFKPK(BkAuth,deleted," = "," AND") */
        BkAuth.Bk Identification = deleted.Bk Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Bk because BkAuth exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Bk  Bk YTD Sls on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="Bk YTD Sls"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_Bk YTD Sls", FK_COLUMNS="Bk Identification" */
    IF EXISTS (
      SELECT * FROM deleted,Bk YTD Sls
      WHERE
        /*  %JoinFKPK(Bk YTD Sls,deleted," = "," AND") */
        Bk YTD Sls.Bk Identification = deleted.Bk Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Bk because Bk YTD Sls exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Bk  Ordr itm on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_Ordr itm", FK_COLUMNS="Bk Identification" */
    IF EXISTS (
      SELECT * FROM deleted,Ordr itm
      WHERE
        /*  %JoinFKPK(Ordr itm,deleted," = "," AND") */
        Ordr itm.Bk Identification = deleted.Bk Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Bk because Ordr itm exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Publshr  Bk on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Publshr"
    CHILD_OWNER="", CHILD_TABLE="Bk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Publshr_Bk", FK_COLUMNS="Publshr Identification" */
    IF EXISTS (SELECT * FROM deleted,Publshr
      WHERE
        /* %JoinFKPK(deleted,Publshr," = "," AND") */
        deleted.Publshr Identification = Publshr.Publshr Identification AND
        NOT EXISTS (
          SELECT * FROM Bk
          WHERE
            /* %JoinFKPK(Bk,Publshr," = "," AND") */
            Bk.Publshr Identification = Publshr.Publshr Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Bk because Publshr exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Book ON Bk FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Bk */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBk Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Bk  BkAuth on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004a9e5", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="BkAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_BkAuth", FK_COLUMNS="Bk Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Bk Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,BkAuth
      WHERE
        /*  %JoinFKPK(BkAuth,deleted," = "," AND") */
        BkAuth.Bk Identification = deleted.Bk Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Bk because BkAuth exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Bk  Bk YTD Sls on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="Bk YTD Sls"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_Bk YTD Sls", FK_COLUMNS="Bk Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Bk Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Bk YTD Sls
      WHERE
        /*  %JoinFKPK(Bk YTD Sls,deleted," = "," AND") */
        Bk YTD Sls.Bk Identification = deleted.Bk Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Bk because Bk YTD Sls exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Bk  Ordr itm on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_Ordr itm", FK_COLUMNS="Bk Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Bk Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Ordr itm
      WHERE
        /*  %JoinFKPK(Ordr itm,deleted," = "," AND") */
        Ordr itm.Bk Identification = deleted.Bk Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Bk because Ordr itm exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Publshr  Bk on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Publshr"
    CHILD_OWNER="", CHILD_TABLE="Bk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Publshr_Bk", FK_COLUMNS="Publshr Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Publshr Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Publshr
        WHERE
          /* %JoinFKPK(inserted,Publshr) */
          inserted.Publshr Identification = Publshr.Publshr Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Publshr Identification IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Bk because Publshr does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Order_Item ON Ordr itm FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Ordr itm */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Ordr itm  Ordr Shipment on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0006b1c2", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Ordr Shipment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Ordr Shipment", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,Ordr Shipment
      WHERE
        /*  %JoinFKPK(Ordr Shipment,deleted," = "," AND") */
        Ordr Shipment.Ordr Nbr = deleted.Ordr Nbr AND
        Ordr Shipment.itm Seq Nbr = deleted.itm Seq Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Ordr itm because Ordr Shipment exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Ordr itm  Bk Retrun on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Bk Retrun"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Bk Retrun", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,Bk Retrun
      WHERE
        /*  %JoinFKPK(Bk Retrun,deleted," = "," AND") */
        Bk Retrun.Ordr Nbr = deleted.Ordr Nbr AND
        Bk Retrun.itm Seq Nbr = deleted.itm Seq Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Ordr itm because Bk Retrun exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Ordr itm  Rylty Hist on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Rylty Hist"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Rylty Hist", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,Rylty Hist
      WHERE
        /*  %JoinFKPK(Rylty Hist,deleted," = "," AND") */
        Rylty Hist.Ordr Nbr = deleted.Ordr Nbr AND
        Rylty Hist.itm Seq Nbr = deleted.itm Seq Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Ordr itm because Rylty Hist exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Bk  Ordr itm on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_Ordr itm", FK_COLUMNS="Bk Identification" */
    IF EXISTS (SELECT * FROM deleted,Bk
      WHERE
        /* %JoinFKPK(deleted,Bk," = "," AND") */
        deleted.Bk Identification = Bk.Bk Identification AND
        NOT EXISTS (
          SELECT * FROM Ordr itm
          WHERE
            /* %JoinFKPK(Ordr itm,Bk," = "," AND") */
            Ordr itm.Bk Identification = Bk.Bk Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Ordr itm because Bk exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Disc  Ordr itm on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Disc"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Disc_Ordr itm", FK_COLUMNS="Disc Typ" */
    IF EXISTS (SELECT * FROM deleted,Disc
      WHERE
        /* %JoinFKPK(deleted,Disc," = "," AND") */
        deleted.Disc Typ = Disc.Disc Typ AND
        NOT EXISTS (
          SELECT * FROM Ordr itm
          WHERE
            /* %JoinFKPK(Ordr itm,Disc," = "," AND") */
            Ordr itm.Disc Typ = Disc.Disc Typ
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Ordr itm because Disc exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Purchase Ordr  Ordr itm on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Purchase Ordr"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Purchase Ordr_Ordr itm", FK_COLUMNS="Ordr Nbr" */
    IF EXISTS (SELECT * FROM deleted,Purchase Ordr
      WHERE
        /* %JoinFKPK(deleted,Purchase Ordr," = "," AND") */
        deleted.Ordr Nbr = Purchase Ordr.Ordr Nbr AND
        NOT EXISTS (
          SELECT * FROM Ordr itm
          WHERE
            /* %JoinFKPK(Ordr itm,Purchase Ordr," = "," AND") */
            Ordr itm.Ordr Nbr = Purchase Ordr.Ordr Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Ordr itm because Purchase Ordr exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Order_Item ON Ordr itm FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Ordr itm */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOrdr Nbr integer, 
           @insitm Seq Nbr integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Ordr itm  Ordr Shipment on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00079f44", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Ordr Shipment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Ordr Shipment", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Ordr Nbr) OR
    UPDATE(itm Seq Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Ordr Shipment
      WHERE
        /*  %JoinFKPK(Ordr Shipment,deleted," = "," AND") */
        Ordr Shipment.Ordr Nbr = deleted.Ordr Nbr AND
        Ordr Shipment.itm Seq Nbr = deleted.itm Seq Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Ordr itm because Ordr Shipment exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Ordr itm  Bk Retrun on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Bk Retrun"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Bk Retrun", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Ordr Nbr) OR
    UPDATE(itm Seq Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Bk Retrun
      WHERE
        /*  %JoinFKPK(Bk Retrun,deleted," = "," AND") */
        Bk Retrun.Ordr Nbr = deleted.Ordr Nbr AND
        Bk Retrun.itm Seq Nbr = deleted.itm Seq Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Ordr itm because Bk Retrun exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Ordr itm  Rylty Hist on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Rylty Hist"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Rylty Hist", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Ordr Nbr) OR
    UPDATE(itm Seq Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Rylty Hist
      WHERE
        /*  %JoinFKPK(Rylty Hist,deleted," = "," AND") */
        Rylty Hist.Ordr Nbr = deleted.Ordr Nbr AND
        Rylty Hist.itm Seq Nbr = deleted.itm Seq Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Ordr itm because Rylty Hist exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Bk  Ordr itm on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_Ordr itm", FK_COLUMNS="Bk Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Bk Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Bk
        WHERE
          /* %JoinFKPK(inserted,Bk) */
          inserted.Bk Identification = Bk.Bk Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Ordr itm because Bk does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Disc  Ordr itm on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Disc"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Disc_Ordr itm", FK_COLUMNS="Disc Typ" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Disc Typ)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Disc
        WHERE
          /* %JoinFKPK(inserted,Disc) */
          inserted.Disc Typ = Disc.Disc Typ
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Disc Typ IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Ordr itm because Disc does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Purchase Ordr  Ordr itm on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Purchase Ordr"
    CHILD_OWNER="", CHILD_TABLE="Ordr itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Purchase Ordr_Ordr itm", FK_COLUMNS="Ordr Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Ordr Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Purchase Ordr
        WHERE
          /* %JoinFKPK(inserted,Purchase Ordr) */
          inserted.Ordr Nbr = Purchase Ordr.Ordr Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Ordr itm because Purchase Ordr does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Royalty_Payment ON Rylty Pmt FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Rylty Pmt */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* BkAuth  Rylty Pmt on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002d471", PARENT_OWNER="", PARENT_TABLE="BkAuth"
    CHILD_OWNER="", CHILD_TABLE="Rylty Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_BkAuth_Rylty Pmt", FK_COLUMNS="Auth Identification""Bk Identification" */
    IF EXISTS (SELECT * FROM deleted,BkAuth
      WHERE
        /* %JoinFKPK(deleted,BkAuth," = "," AND") */
        deleted.Auth Identification = BkAuth.Auth Identification AND
        deleted.Bk Identification = BkAuth.Bk Identification AND
        NOT EXISTS (
          SELECT * FROM Rylty Pmt
          WHERE
            /* %JoinFKPK(Rylty Pmt,BkAuth," = "," AND") */
            Rylty Pmt.Auth Identification = BkAuth.Auth Identification AND
            Rylty Pmt.Bk Identification = BkAuth.Bk Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rylty Pmt because BkAuth exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Rylty  Rylty Pmt on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Rylty"
    CHILD_OWNER="", CHILD_TABLE="Rylty Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Rylty_Rylty Pmt", FK_COLUMNS="Rylty Identification" */
    IF EXISTS (SELECT * FROM deleted,Rylty
      WHERE
        /* %JoinFKPK(deleted,Rylty," = "," AND") */
        deleted.Rylty Identification = Rylty.Rylty Identification AND
        NOT EXISTS (
          SELECT * FROM Rylty Pmt
          WHERE
            /* %JoinFKPK(Rylty Pmt,Rylty," = "," AND") */
            Rylty Pmt.Rylty Identification = Rylty.Rylty Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rylty Pmt because Rylty exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Royalty_Payment ON Rylty Pmt FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Rylty Pmt */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAuth Identification id, 
           @insBk Identification id, 
           @insRylty Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* BkAuth  Rylty Pmt on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0003128f", PARENT_OWNER="", PARENT_TABLE="BkAuth"
    CHILD_OWNER="", CHILD_TABLE="Rylty Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_BkAuth_Rylty Pmt", FK_COLUMNS="Auth Identification""Bk Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Auth Identification) OR
    UPDATE(Bk Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,BkAuth
        WHERE
          /* %JoinFKPK(inserted,BkAuth) */
          inserted.Auth Identification = BkAuth.Auth Identification and
          inserted.Bk Identification = BkAuth.Bk Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rylty Pmt because BkAuth does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Rylty  Rylty Pmt on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Rylty"
    CHILD_OWNER="", CHILD_TABLE="Rylty Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Rylty_Rylty Pmt", FK_COLUMNS="Rylty Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Rylty Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Rylty
        WHERE
          /* %JoinFKPK(inserted,Rylty) */
          inserted.Rylty Identification = Rylty.Rylty Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rylty Pmt because Rylty does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Book_YTD_Sales ON Bk YTD Sls FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Bk YTD Sls */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Bk  Bk YTD Sls on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00014e0c", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="Bk YTD Sls"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_Bk YTD Sls", FK_COLUMNS="Bk Identification" */
    IF EXISTS (SELECT * FROM deleted,Bk
      WHERE
        /* %JoinFKPK(deleted,Bk," = "," AND") */
        deleted.Bk Identification = Bk.Bk Identification AND
        NOT EXISTS (
          SELECT * FROM Bk YTD Sls
          WHERE
            /* %JoinFKPK(Bk YTD Sls,Bk," = "," AND") */
            Bk YTD Sls.Bk Identification = Bk.Bk Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Bk YTD Sls because Bk exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Book_YTD_Sales ON Bk YTD Sls FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Bk YTD Sls */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBk Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Bk  Bk YTD Sls on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00016c88", PARENT_OWNER="", PARENT_TABLE="Bk"
    CHILD_OWNER="", CHILD_TABLE="Bk YTD Sls"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Bk_Bk YTD Sls", FK_COLUMNS="Bk Identification" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Bk Identification)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Bk
        WHERE
          /* %JoinFKPK(inserted,Bk) */
          inserted.Bk Identification = Bk.Bk Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Bk YTD Sls because Bk does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Royalty_History ON Rylty Hist FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Rylty Hist */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Ordr itm  Rylty Hist on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00017b68", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Rylty Hist"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Rylty Hist", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
    IF EXISTS (SELECT * FROM deleted,Ordr itm
      WHERE
        /* %JoinFKPK(deleted,Ordr itm," = "," AND") */
        deleted.Ordr Nbr = Ordr itm.Ordr Nbr AND
        deleted.itm Seq Nbr = Ordr itm.itm Seq Nbr AND
        NOT EXISTS (
          SELECT * FROM Rylty Hist
          WHERE
            /* %JoinFKPK(Rylty Hist,Ordr itm," = "," AND") */
            Rylty Hist.Ordr Nbr = Ordr itm.Ordr Nbr AND
            Rylty Hist.itm Seq Nbr = Ordr itm.itm Seq Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Rylty Hist because Ordr itm exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Royalty_History ON Rylty Hist FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Rylty Hist */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRylty Hist Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Ordr itm  Rylty Hist on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001bc2a", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Rylty Hist"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Rylty Hist", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Ordr Nbr) OR
    UPDATE(itm Seq Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Ordr itm
        WHERE
          /* %JoinFKPK(inserted,Ordr itm) */
          inserted.Ordr Nbr = Ordr itm.Ordr Nbr and
          inserted.itm Seq Nbr = Ordr itm.itm Seq Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Ordr Nbr IS NULL AND
      inserted.itm Seq Nbr IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Rylty Hist because Ordr itm does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Reporting_Structure ON Reporting Structure FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Reporting Structure */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Emp  Reporting Structure on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="000294f8", PARENT_OWNER="", PARENT_TABLE="Emp"
    CHILD_OWNER="", CHILD_TABLE="Reporting Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Emp_Reporting Structure", FK_COLUMNS="Reports To" */
    IF EXISTS (SELECT * FROM deleted,Emp
      WHERE
        /* %JoinFKPK(deleted,Emp," = "," AND") */
        deleted.Reports To = Emp.Emp Identification AND
        NOT EXISTS (
          SELECT * FROM Reporting Structure
          WHERE
            /* %JoinFKPK(Reporting Structure,Emp," = "," AND") */
            Reporting Structure.Reports To = Emp.Emp Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Reporting Structure because Emp exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Emp  Reporting Structure on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Emp"
    CHILD_OWNER="", CHILD_TABLE="Reporting Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Emp_Reporting Structure", FK_COLUMNS="Manager" */
    IF EXISTS (SELECT * FROM deleted,Emp
      WHERE
        /* %JoinFKPK(deleted,Emp," = "," AND") */
        deleted.Manager = Emp.Emp Identification AND
        NOT EXISTS (
          SELECT * FROM Reporting Structure
          WHERE
            /* %JoinFKPK(Reporting Structure,Emp," = "," AND") */
            Reporting Structure.Manager = Emp.Emp Identification
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Reporting Structure because Emp exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Reporting_Structure ON Reporting Structure FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Reporting Structure */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insManager id, 
           @insReports To id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Emp  Reporting Structure on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002c571", PARENT_OWNER="", PARENT_TABLE="Emp"
    CHILD_OWNER="", CHILD_TABLE="Reporting Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Emp_Reporting Structure", FK_COLUMNS="Reports To" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Reports To)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Emp
        WHERE
          /* %JoinFKPK(inserted,Emp) */
          inserted.Reports To = Emp.Emp Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Reporting Structure because Emp does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Emp  Reporting Structure on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Emp"
    CHILD_OWNER="", CHILD_TABLE="Reporting Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Emp_Reporting Structure", FK_COLUMNS="Manager" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Manager)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Emp
        WHERE
          /* %JoinFKPK(inserted,Emp) */
          inserted.Manager = Emp.Emp Identification
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Reporting Structure because Emp does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Customer ON Cust FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Cust */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Cust  Purchase Ordr on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000128d7", PARENT_OWNER="", PARENT_TABLE="Cust"
    CHILD_OWNER="", CHILD_TABLE="Purchase Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cust_Purchase Ordr", FK_COLUMNS="Cust Identification" */
    IF EXISTS (
      SELECT * FROM deleted,Purchase Ordr
      WHERE
        /*  %JoinFKPK(Purchase Ordr,deleted," = "," AND") */
        Purchase Ordr.Cust Identification = deleted.Cust Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Cust because Purchase Ordr exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Customer ON Cust FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Cust */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCust Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Cust  Purchase Ordr on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001475e", PARENT_OWNER="", PARENT_TABLE="Cust"
    CHILD_OWNER="", CHILD_TABLE="Purchase Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Cust_Purchase Ordr", FK_COLUMNS="Cust Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cust Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Purchase Ordr
      WHERE
        /*  %JoinFKPK(Purchase Ordr,deleted," = "," AND") */
        Purchase Ordr.Cust Identification = deleted.Cust Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Cust because Purchase Ordr exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Book_Retrun ON Bk Retrun FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Bk Retrun */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Ordr itm  Bk Retrun on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001741f", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Bk Retrun"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Bk Retrun", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
    IF EXISTS (SELECT * FROM deleted,Ordr itm
      WHERE
        /* %JoinFKPK(deleted,Ordr itm," = "," AND") */
        deleted.Ordr Nbr = Ordr itm.Ordr Nbr AND
        deleted.itm Seq Nbr = Ordr itm.itm Seq Nbr AND
        NOT EXISTS (
          SELECT * FROM Bk Retrun
          WHERE
            /* %JoinFKPK(Bk Retrun,Ordr itm," = "," AND") */
            Bk Retrun.Ordr Nbr = Ordr itm.Ordr Nbr AND
            Bk Retrun.itm Seq Nbr = Ordr itm.itm Seq Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Bk Retrun because Ordr itm exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Book_Retrun ON Bk Retrun FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Bk Retrun */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBk Return Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Ordr itm  Bk Retrun on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001b978", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Bk Retrun"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Bk Retrun", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Ordr Nbr) OR
    UPDATE(itm Seq Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Ordr itm
        WHERE
          /* %JoinFKPK(inserted,Ordr itm) */
          inserted.Ordr Nbr = Ordr itm.Ordr Nbr and
          inserted.itm Seq Nbr = Ordr itm.itm Seq Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Ordr Nbr IS NULL AND
      inserted.itm Seq Nbr IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Bk Retrun because Ordr itm does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Credit_Card ON Crd Card FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Crd Card */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Crd Card  Crd Chk on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000101e9", PARENT_OWNER="", PARENT_TABLE="Crd Card"
    CHILD_OWNER="", CHILD_TABLE="Crd Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Crd Card_Crd Chk", FK_COLUMNS="Pmt Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,Crd Chk
      WHERE
        /*  %JoinFKPK(Crd Chk,deleted," = "," AND") */
        Crd Chk.Pmt Nbr = deleted.Pmt Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Crd Card because Crd Chk exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Credit_Card ON Crd Card FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Crd Card */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPmt Nbr integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Crd Card  Crd Chk on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00011fdd", PARENT_OWNER="", PARENT_TABLE="Crd Card"
    CHILD_OWNER="", CHILD_TABLE="Crd Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Crd Card_Crd Chk", FK_COLUMNS="Pmt Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Pmt Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Crd Chk
      WHERE
        /*  %JoinFKPK(Crd Chk,deleted," = "," AND") */
        Crd Chk.Pmt Nbr = deleted.Pmt Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Crd Card because Crd Chk exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Payment ON Pmt FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Pmt */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Pmt  Personal Chk on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00025402", PARENT_OWNER="", PARENT_TABLE="Pmt"
    CHILD_OWNER="", CHILD_TABLE="Personal Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Pmt_Personal Chk", FK_COLUMNS="Pmt Nbr" */
    DELETE Personal Chk
      FROM Personal Chk,deleted
      WHERE
        /*  %JoinFKPK(Personal Chk,deleted," = "," AND") */
        Personal Chk.Pmt Nbr = deleted.Pmt Nbr

    /* erwin Builtin Trigger */
    /* Pmt  Money Ordr on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pmt"
    CHILD_OWNER="", CHILD_TABLE="Money Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Pmt_Money Ordr", FK_COLUMNS="Pmt Nbr" */
    DELETE Money Ordr
      FROM Money Ordr,deleted
      WHERE
        /*  %JoinFKPK(Money Ordr,deleted," = "," AND") */
        Money Ordr.Pmt Nbr = deleted.Pmt Nbr

    /* erwin Builtin Trigger */
    /* Pmt  Crd Card on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pmt"
    CHILD_OWNER="", CHILD_TABLE="Crd Card"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Pmt_Crd Card", FK_COLUMNS="Pmt Nbr" */
    DELETE Crd Card
      FROM Crd Card,deleted
      WHERE
        /*  %JoinFKPK(Crd Card,deleted," = "," AND") */
        Crd Card.Pmt Nbr = deleted.Pmt Nbr


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Payment ON Pmt FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Pmt */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPmt Nbr integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Pmt  Personal Chk on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0004169d", PARENT_OWNER="", PARENT_TABLE="Pmt"
    CHILD_OWNER="", CHILD_TABLE="Personal Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Pmt_Personal Chk", FK_COLUMNS="Pmt Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Pmt Nbr)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPmt Nbr = inserted.Pmt Nbr
        FROM inserted
      UPDATE Personal Chk
      SET
        /*  %JoinFKPK(Personal Chk,@ins," = ",",") */
        Personal Chk.Pmt Nbr = @insPmt Nbr
      FROM Personal Chk,inserted,deleted
      WHERE
        /*  %JoinFKPK(Personal Chk,deleted," = "," AND") */
        Personal Chk.Pmt Nbr = deleted.Pmt Nbr
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Pmt update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Pmt  Money Ordr on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pmt"
    CHILD_OWNER="", CHILD_TABLE="Money Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Pmt_Money Ordr", FK_COLUMNS="Pmt Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Pmt Nbr)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPmt Nbr = inserted.Pmt Nbr
        FROM inserted
      UPDATE Money Ordr
      SET
        /*  %JoinFKPK(Money Ordr,@ins," = ",",") */
        Money Ordr.Pmt Nbr = @insPmt Nbr
      FROM Money Ordr,inserted,deleted
      WHERE
        /*  %JoinFKPK(Money Ordr,deleted," = "," AND") */
        Money Ordr.Pmt Nbr = deleted.Pmt Nbr
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Pmt update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Pmt  Crd Card on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Pmt"
    CHILD_OWNER="", CHILD_TABLE="Crd Card"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Pmt_Crd Card", FK_COLUMNS="Pmt Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Pmt Nbr)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPmt Nbr = inserted.Pmt Nbr
        FROM inserted
      UPDATE Crd Card
      SET
        /*  %JoinFKPK(Crd Card,@ins," = ",",") */
        Crd Card.Pmt Nbr = @insPmt Nbr
      FROM Crd Card,inserted,deleted
      WHERE
        /*  %JoinFKPK(Crd Card,deleted," = "," AND") */
        Crd Card.Pmt Nbr = deleted.Pmt Nbr
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Pmt update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Region ON Rgn FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Rgn */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Rgn  Stor Nam on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00010b38", PARENT_OWNER="", PARENT_TABLE="Rgn"
    CHILD_OWNER="", CHILD_TABLE="Stor Nam"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Rgn_Stor Nam", FK_COLUMNS="Rgn Identification" */
    IF EXISTS (
      SELECT * FROM deleted,Stor Nam
      WHERE
        /*  %JoinFKPK(Stor Nam,deleted," = "," AND") */
        Stor Nam.Rgn Identification = deleted.Rgn Identification
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Rgn because Stor Nam exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Region ON Rgn FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Rgn */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRgn Identification id,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Rgn  Stor Nam on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000135b2", PARENT_OWNER="", PARENT_TABLE="Rgn"
    CHILD_OWNER="", CHILD_TABLE="Stor Nam"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Rgn_Stor Nam", FK_COLUMNS="Rgn Identification" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Rgn Identification)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Stor Nam
      WHERE
        /*  %JoinFKPK(Stor Nam,deleted," = "," AND") */
        Stor Nam.Rgn Identification = deleted.Rgn Identification
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Rgn because Stor Nam exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Order_Shipment ON Ordr Shipment FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Ordr Shipment */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Ordr Shipment  Back Ordr on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002c3a4", PARENT_OWNER="", PARENT_TABLE="Ordr Shipment"
    CHILD_OWNER="", CHILD_TABLE="Back Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr Shipment_Back Ordr", FK_COLUMNS="Ordr Shipment Identifier""Ordr Nbr""itm Seq Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,Back Ordr
      WHERE
        /*  %JoinFKPK(Back Ordr,deleted," = "," AND") */
        Back Ordr.Ordr Shipment Identifier = deleted.Ordr Shipment Identifier AND
        Back Ordr.Ordr Nbr = deleted.Ordr Nbr AND
        Back Ordr.itm Seq Nbr = deleted.itm Seq Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Ordr Shipment because Back Ordr exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Ordr itm  Ordr Shipment on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Ordr Shipment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Ordr Shipment", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
    IF EXISTS (SELECT * FROM deleted,Ordr itm
      WHERE
        /* %JoinFKPK(deleted,Ordr itm," = "," AND") */
        deleted.Ordr Nbr = Ordr itm.Ordr Nbr AND
        deleted.itm Seq Nbr = Ordr itm.itm Seq Nbr AND
        NOT EXISTS (
          SELECT * FROM Ordr Shipment
          WHERE
            /* %JoinFKPK(Ordr Shipment,Ordr itm," = "," AND") */
            Ordr Shipment.Ordr Nbr = Ordr itm.Ordr Nbr AND
            Ordr Shipment.itm Seq Nbr = Ordr itm.itm Seq Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Ordr Shipment because Ordr itm exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Order_Shipment ON Ordr Shipment FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Ordr Shipment */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOrdr Shipment Identifier id, 
           @insOrdr Nbr integer, 
           @insitm Seq Nbr integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Ordr Shipment  Back Ordr on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002f932", PARENT_OWNER="", PARENT_TABLE="Ordr Shipment"
    CHILD_OWNER="", CHILD_TABLE="Back Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr Shipment_Back Ordr", FK_COLUMNS="Ordr Shipment Identifier""Ordr Nbr""itm Seq Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Ordr Shipment Identifier) OR
    UPDATE(Ordr Nbr) OR
    UPDATE(itm Seq Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Back Ordr
      WHERE
        /*  %JoinFKPK(Back Ordr,deleted," = "," AND") */
        Back Ordr.Ordr Shipment Identifier = deleted.Ordr Shipment Identifier AND
        Back Ordr.Ordr Nbr = deleted.Ordr Nbr AND
        Back Ordr.itm Seq Nbr = deleted.itm Seq Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Ordr Shipment because Back Ordr exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Ordr itm  Ordr Shipment on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Ordr itm"
    CHILD_OWNER="", CHILD_TABLE="Ordr Shipment"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr itm_Ordr Shipment", FK_COLUMNS="Ordr Nbr""itm Seq Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Ordr Nbr) OR
    UPDATE(itm Seq Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Ordr itm
        WHERE
          /* %JoinFKPK(inserted,Ordr itm) */
          inserted.Ordr Nbr = Ordr itm.Ordr Nbr and
          inserted.itm Seq Nbr = Ordr itm.itm Seq Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Ordr Shipment because Ordr itm does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Back_Order ON Back Ordr FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Back Ordr */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Ordr Shipment  Back Ordr on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001ea69", PARENT_OWNER="", PARENT_TABLE="Ordr Shipment"
    CHILD_OWNER="", CHILD_TABLE="Back Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr Shipment_Back Ordr", FK_COLUMNS="Ordr Shipment Identifier""Ordr Nbr""itm Seq Nbr" */
    IF EXISTS (SELECT * FROM deleted,Ordr Shipment
      WHERE
        /* %JoinFKPK(deleted,Ordr Shipment," = "," AND") */
        deleted.Ordr Shipment Identifier = Ordr Shipment.Ordr Shipment Identifier AND
        deleted.Ordr Nbr = Ordr Shipment.Ordr Nbr AND
        deleted.itm Seq Nbr = Ordr Shipment.itm Seq Nbr AND
        NOT EXISTS (
          SELECT * FROM Back Ordr
          WHERE
            /* %JoinFKPK(Back Ordr,Ordr Shipment," = "," AND") */
            Back Ordr.Ordr Shipment Identifier = Ordr Shipment.Ordr Shipment Identifier AND
            Back Ordr.Ordr Nbr = Ordr Shipment.Ordr Nbr AND
            Back Ordr.itm Seq Nbr = Ordr Shipment.itm Seq Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Back Ordr because Ordr Shipment exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Back_Order ON Back Ordr FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Back Ordr */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOrdr Shipment Identifier id, 
           @insOrdr Nbr integer, 
           @insitm Seq Nbr integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Ordr Shipment  Back Ordr on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001d887", PARENT_OWNER="", PARENT_TABLE="Ordr Shipment"
    CHILD_OWNER="", CHILD_TABLE="Back Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Ordr Shipment_Back Ordr", FK_COLUMNS="Ordr Shipment Identifier""Ordr Nbr""itm Seq Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Ordr Shipment Identifier) OR
    UPDATE(Ordr Nbr) OR
    UPDATE(itm Seq Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Ordr Shipment
        WHERE
          /* %JoinFKPK(inserted,Ordr Shipment) */
          inserted.Ordr Shipment Identifier = Ordr Shipment.Ordr Shipment Identifier and
          inserted.Ordr Nbr = Ordr Shipment.Ordr Nbr and
          inserted.itm Seq Nbr = Ordr Shipment.itm Seq Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Back Ordr because Ordr Shipment does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Credit_Check ON Crd Chk FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Crd Chk */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Crd Card  Crd Chk on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00013bad", PARENT_OWNER="", PARENT_TABLE="Crd Card"
    CHILD_OWNER="", CHILD_TABLE="Crd Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Crd Card_Crd Chk", FK_COLUMNS="Pmt Nbr" */
    IF EXISTS (SELECT * FROM deleted,Crd Card
      WHERE
        /* %JoinFKPK(deleted,Crd Card," = "," AND") */
        deleted.Pmt Nbr = Crd Card.Pmt Nbr AND
        NOT EXISTS (
          SELECT * FROM Crd Chk
          WHERE
            /* %JoinFKPK(Crd Chk,Crd Card," = "," AND") */
            Crd Chk.Pmt Nbr = Crd Card.Pmt Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Crd Chk because Crd Card exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tU_Credit_Check ON Crd Chk FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Crd Chk */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCrd Chk Event CHAR(12),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Crd Card  Crd Chk on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00016225", PARENT_OWNER="", PARENT_TABLE="Crd Card"
    CHILD_OWNER="", CHILD_TABLE="Crd Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Crd Card_Crd Chk", FK_COLUMNS="Pmt Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Pmt Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Crd Card
        WHERE
          /* %JoinFKPK(inserted,Crd Card) */
          inserted.Pmt Nbr = Crd Card.Pmt Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Crd Chk because Crd Card does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



