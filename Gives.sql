USE [master]
GO
/****** Object:  Database [Gives]    Script Date: 11.03.2018 22:37:15 ******/
CREATE DATABASE [Gives]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gives', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Gives.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Gives_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Gives_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Gives] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gives].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gives] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gives] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gives] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gives] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gives] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gives] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gives] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gives] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gives] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gives] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gives] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gives] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gives] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gives] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gives] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gives] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gives] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gives] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gives] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gives] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gives] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gives] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gives] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gives] SET  MULTI_USER 
GO
ALTER DATABASE [Gives] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gives] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gives] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gives] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Gives] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Gives]
GO
/****** Object:  Table [dbo].[About]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Text] [text] NULL,
	[Image] [nvarchar](250) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admins]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](500) NULL,
	[Fullname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Text] [text] NULL,
	[Date] [datetime] NULL,
	[Status] [tinyint] NULL,
	[ModeratorId] [int] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlogImages]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](50) NULL,
	[BlogId] [int] NULL,
 CONSTRAINT [PK_BlogImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Causes]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Causes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Text] [text] NULL,
	[Need] [int] NULL,
	[Image] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Causes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
	[Website] [nvarchar](50) NULL,
	[Text] [text] NULL,
	[ReplyComId] [int] NULL,
	[Date] [datetime] NULL,
	[BlogId] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doings]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Icon] [nvarchar](30) NULL,
	[Text] [text] NULL,
 CONSTRAINT [PK_Doings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donations]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[Amount] [int] NULL,
	[CauseId] [int] NULL,
 CONSTRAINT [PK_Donations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
	[Subject] [nvarchar](50) NULL,
	[Text] [text] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Moderators]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moderators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](30) NULL,
	[LevelType] [tinyint] NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](500) NULL,
	[About] [nvarchar](500) NULL,
 CONSTRAINT [PK_Moderators] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Partners]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Logo] [nvarchar](250) NULL,
	[Website] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Partners_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Settings]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Logo] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slider]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Slogan] [nvarchar](500) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subscribe]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subscribe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Volunteers]    Script Date: 11.03.2018 22:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Position] [nvarchar](50) NULL,
	[Text] [text] NULL,
	[Image] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Volunteers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([Id], [Title], [Text], [Image], [Date]) VALUES (1, N'HI WE PROVIDE WORLDWIDE CHARITY SERVICE SINCE 1978', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus sapiente deleniti commodi provident veniam vitae
                        blanditiis rerum temporibus totam est, omnis sint excepturi maiores iure similique. Sequi magni,
                        suscipit laudantium velit. Excepturi sint placeat vel, porro, saepe ratione sunt natus, quod
                        rem error ipsum ipsa.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga voluptates dolor reprehenderit, deserunt, quibusdam repellat
                        architecto blanditiis a, nulla inventore minima necessitatibus illum molestias, quas molestiae
                        maiores tempora temporibus incidunt ea! Voluptate temporibus repellat nulla omnis nesciunt illum
                        odit dicta fuga id!
                    </p>" " ', N'featured-image-11.png', CAST(N'2018-02-22 01:25:34.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([Id], [Email], [Password], [Fullname]) VALUES (1, N'shohret550@gmail.com', N'AAqhJa5+jo4ELRJq0gRxh3jOztqP84+JNejIP6b6ypvaswFIHhnresUfXFEmXixPEQ==', N'123123')
INSERT [dbo].[Admins] ([Id], [Email], [Password], [Fullname]) VALUES (2, N'mshohrat.p501@code.edu.az', N'AM/KcFQn8nQE9FaXmbeUsm7TI7x93U/hb19Ji0sYRE+XGkKEW//ZV55vBNxYNasxAg==', N'123321')
INSERT [dbo].[Admins] ([Id], [Email], [Password], [Fullname]) VALUES (3, N'merhemet24@gmail.com', N'ACNZZEq4qBftOWvn5GbMpGoP+8OKXrNKjIvknjaJY4AZeNLb64KDF+N69GqxVmqxdw==', N'123159')
SET IDENTITY_INSERT [dbo].[Admins] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Id], [Title], [Text], [Date], [Status], [ModeratorId], [CategoryId]) VALUES (1, N'1 Helping kids Grow up Stronger', N'<p>
                            Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante.
                            Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam.
                            Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus.
                            In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat
                            consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate
                            lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices
                        </p>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae
                            neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum
                            dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente
                            explicabo velit dolorem suscipit nesciunt non.
                        </p>
                        <h4>
                            Lorem Ipsum The Cite
                        </h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi
                            ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati.
                            Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam,
                            laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque
                            cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt,
                            perferendis.
                        </p>
                        <div class="quote">
                            <i class="fa fa-quote-left" aria-hidden="true"></i>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio
                                temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!
                            </p>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia excepturi quae facere voluptate blanditiis, accusantium
                            libero eaque nulla obcaecati quidem, aliquid quam magni perferendis sit hic deserunt incidunt
                            quis accusamus possimus inventore. Animi accusamus perferendis, voluptatem quos ullam ducimus
                            perspiciatis.
                        </p>', CAST(N'2018-02-02 00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[Blog] ([Id], [Title], [Text], [Date], [Status], [ModeratorId], [CategoryId]) VALUES (2, N'2 Helping kids Grow up Stronger', N'<p>Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante. Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam. Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus. In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices</p>

<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente explicabo velit dolorem suscipit nesciunt non.</p>

<p>Lorem Ipsum The Cite</p>

<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati. Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam, laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt, perferendis.</p>

<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!</p>

<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia excepturi quae facere voluptate blanditiis, accusantium libero eaque nulla obcaecati quidem, aliquid quam magni perferendis sit hic deserunt incidunt quis accusamus possimus inventore. Animi accusamus perferendis, voluptatem quos ullam ducimus perspiciatis.</p>
', CAST(N'2018-02-22 03:17:16.000' AS DateTime), 1, 2, 1)
INSERT [dbo].[Blog] ([Id], [Title], [Text], [Date], [Status], [ModeratorId], [CategoryId]) VALUES (3, N'3 Helping kids Grow up Stronger', N'<p>
                            Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante.
                            Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam.
                            Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus.
                            In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat
                            consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate
                            lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices
                        </p>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae
                            neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum
                            dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente
                            explicabo velit dolorem suscipit nesciunt non.
                        </p>
                        <h4>
                            Lorem Ipsum The Cite
                        </h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi
                            ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati.
                            Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam,
                            laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque
                            cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt,
                            perferendis.
                        </p>
                        <div class="quote">
                            <i class="fa fa-quote-left" aria-hidden="true"></i>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio
                                temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!
                            </p>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia excepturi quae facere voluptate blanditiis, accusantium
                            libero eaque nulla obcaecati quidem, aliquid quam magni perferendis sit hic deserunt incidunt
                            quis accusamus possimus inventore. Animi accusamus perferendis, voluptatem quos ullam ducimus
                            perspiciatis.
                        </p>', CAST(N'2018-01-05 00:00:00.000' AS DateTime), 1, 1, 3)
INSERT [dbo].[Blog] ([Id], [Title], [Text], [Date], [Status], [ModeratorId], [CategoryId]) VALUES (4, N'4 Helping kids Grow up Stronger', N'<p>
                            Etiam at consectetur nisl. Donec rutrum volutpat turpis ac lobortis. Fusce sit amet orci ante.
                            Duis faucibus interdumd. Mauris tempor sem at venenatis sagittis. Fusce vel maximus diam.
                            Praesent ut vehicula eros. Nunc quis egestas turpis. Sed posuere unc at dui tempus maximus.
                            In fringilla dui in eros blandit, ac pulvinar magna dapibus. Nunc in nisi id tellus placerat
                            consectetur ac tincidunt turpis. Pellentesque ut metus lacus. Mauris non velit vulputate
                            lorem scelerisque rutrum non tristique leo. Sed vitae arcu nec nibh egestas ultrices
                        </p>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident aliquid porro a velit doloribus nobis cum sint beatae
                            neque iusto molestias fuga, eaque vero natus maxime quam sunt optio praesentium. Lorem ipsum
                            dolor sit amet, consectetur adipisicing elit. Adipisci maxime beatae aut deleniti sapiente
                            explicabo velit dolorem suscipit nesciunt non.
                        </p>
                        <h4>
                            Lorem Ipsum The Cite
                        </h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus dolorem, non omnis. Beatae quibusdam aperiam modi
                            ut sed perspiciatis, quo doloremque in facilis eveniet porro inventore explicabo obcaecati.
                            Aperiam ad nemo fugit in minima officiis accusantium aspernatur nobis, itaque incidunt ullam,
                            laborum atque est ipsum ab voluptatibus quae inventore placeat voluptatum quo quia cum cumque
                            cupiditate suscipit! Architecto voluptates blanditiis dignissimos fugit mollitia. Deserunt,
                            perferendis.
                        </p>
                        <div class="quote">
                            <i class="fa fa-quote-left" aria-hidden="true"></i>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic deserunt unde ratione odio
                                temporibus officiis, nemo. Aperiam commodi, sapiente cul totam!
                            </p>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia excepturi quae facere voluptate blanditiis, accusantium
                            libero eaque nulla obcaecati quidem, aliquid quam magni perferendis sit hic deserunt incidunt
                            quis accusamus possimus inventore. Animi accusamus perferendis, voluptatem quos ullam ducimus
                            perspiciatis.
                        </p>', CAST(N'2018-02-02 00:00:00.000' AS DateTime), 0, 2, 4)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[BlogImages] ON 

INSERT [dbo].[BlogImages] ([Id], [ImageName], [BlogId]) VALUES (1, N'img-4.jpg', 1)
INSERT [dbo].[BlogImages] ([Id], [ImageName], [BlogId]) VALUES (2, N'img-5.jpg', 3)
INSERT [dbo].[BlogImages] ([Id], [ImageName], [BlogId]) VALUES (6, N'img-6.jpg', 3)
INSERT [dbo].[BlogImages] ([Id], [ImageName], [BlogId]) VALUES (7, N'img-5.jpg', 4)
INSERT [dbo].[BlogImages] ([Id], [ImageName], [BlogId]) VALUES (11, N'220220180315369884Alqayit.jpg', 3)
INSERT [dbo].[BlogImages] ([Id], [ImageName], [BlogId]) VALUES (12, N'220220180315513412Alqayit.jpg', 2)
SET IDENTITY_INSERT [dbo].[BlogImages] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Cause')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Charitable')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Homeless')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Education')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Charity')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Donations')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Volunteers')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Travel')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Events')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'Health')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Medicine')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Causes] ON 

INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (1, N'1 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>" " ', 46005, N'img-1.jpg', CAST(N'2018-02-21 02:28:17.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (2, N'2 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 26625, N'img-4.jpg', CAST(N'2018-01-27 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (3, N'3 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 62516, N'img-6.jpg', CAST(N'2018-01-28 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (4, N'4 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 3256, N'img-5.jpg', CAST(N'2018-01-29 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (5, N'5 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 25165, N'img-4.jpg', CAST(N'2018-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (6, N'6 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 65126, N'img-1.jpg', CAST(N'2018-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (7, N'7 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 5165, N'img-1.jpg', CAST(N'2018-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (8, N'8 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 95265, N'img-4.jpg', CAST(N'2018-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (9, N'9 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 51651, N'img-6.jpg', CAST(N'2018-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (10, N'10 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 22663, N'img-3.jpg', CAST(N'2018-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (11, N'11 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 26515, N'img-4.jpg', CAST(N'2018-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (12, N'12 Stop Chilldern Abuse', N'<p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid error, repellat, voluptatem
                        at iste soluta veritatis aperiam, pariatur sunt odit, ad praesentium! Modi asperiores adipisci
                        optio voluptatibus iste corporis, animi ducimus placeat tenetur reprehenderit impedit quam molestiae
                        suscipit, eaque dignissimos eos quae omnis, quidem.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem odio quasi nobis et aliquam deleniti,
                        facilis corrupti quas, debitis modi? Autem repellat dolorum ipsa delectus adipisci culpa, quaerat
                        quisquam dignissimos nihil tempora iste rem. Cupiditate, odit dolor numquam est non eveniet,
                        perspiciatis dolorem commodi delectus maxime excepturi velit quos inventore?
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius doloribus consequatur ratione, assumenda
                        ipsum, quos itaque inventore ducimus voluptate, quas aliquid commodi sint. Nihil aut dolorem
                        sed temporibus! At, ea dignissimos. Magni id fuga quidem tempora doloremque eaque dicta quia
                        assumenda, odit ullam voluptate modi soluta, corrupti eum possimus. Possimus nesciunt cumque,
                        consequuntur, sint aspernatur illum molestias atque consectetur voluptates quibusdam perspiciatis
                        voluptate ipsa nostrum.
                    </p>', 95265, N'img-1.jpg', CAST(N'2018-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Causes] ([Id], [Title], [Text], [Need], [Image], [Date]) VALUES (19, N'Xocali Soyqirimi', N'<p>26.02.1992 Dehsetli gun</p>
', 321123, N'260220180131425287xocali.jpg', CAST(N'2018-02-26 01:31:24.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Causes] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (1, N'Ismayil', N'ronald@gmail.com', NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque quas cum, culpa eum expedita soluta! Ipsum voluptatibus nesciunt tenetur, est vero culpa ipsam modi officia.', NULL, CAST(N'2018-02-17 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (2, N'Bamed', N'margaret@gmail.com', NULL, N'Bamedin loremi', 1, CAST(N'2018-02-17 12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (3, N'Qasim', N'margaret@gmail.com', NULL, N'Qasimin loremi', 1, CAST(N'2018-01-27 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (4, N'Rasim', N'rasim@gmail.com', NULL, N'Rasimin loremi', NULL, CAST(N'2018-01-25 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (5, N'Xasay', N'xasay@gmail.com', NULL, N'Xasayin loremi', NULL, CAST(N'2018-01-26 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (6, N'Iltifat', N'iltifat@gmail.com', NULL, N'Iltifatim loremi', NULL, CAST(N'2018-02-02 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (12, N'Alxas', N'merhemet24@gmail.com', N'bamed.biz', N'Bamen salam', NULL, CAST(N'2018-02-03 14:46:52.000' AS DateTime), 3)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (13, N'Shohrat', N'shohret550@gmail.com', N'bamed.biz', N'sgfvsvscwtg ty eyvhc ethcethe', NULL, CAST(N'2018-02-03 14:48:29.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (14, N'Shohrat', N'shohret550@gmail.com', N'kjsdbf', N'webfouwebrf', NULL, CAST(N'2018-02-03 14:50:34.000' AS DateTime), 2)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (15, N'Ali', N'Abbasov@hotmail.com', N'abbas.io', N'jbrfw oeu goh p uhtgh oihu', NULL, CAST(N'2018-02-03 14:55:18.000' AS DateTime), 4)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (16, N'Mamed', N'mamed@mamed.com', NULL, N'kjashf lsjabfljs lbvljd fviu ph [ aos fnapoihs  [ aoihs', NULL, CAST(N'2018-02-16 03:25:12.000' AS DateTime), 3)
INSERT [dbo].[Comments] ([Id], [Name], [Email], [Website], [Text], [ReplyComId], [Date], [BlogId]) VALUES (17, N'Alxas', N'merhemet24@gmail.com', NULL, N'date time now it is 17/02/2018 15:07', NULL, CAST(N'2018-02-17 15:06:22.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Doings] ON 

INSERT [dbo].[Doings] ([Id], [Title], [Icon], [Text]) VALUES (1, N'Food Delivering', N'handshake-o', N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam</p>
')
INSERT [dbo].[Doings] ([Id], [Title], [Icon], [Text]) VALUES (2, N'Aids For Health', N'medkit', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam')
INSERT [dbo].[Doings] ([Id], [Title], [Icon], [Text]) VALUES (3, N'Build Education', N'book', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, maiores officia placeat incidunt aperiam')
SET IDENTITY_INSERT [dbo].[Doings] OFF
SET IDENTITY_INSERT [dbo].[Donations] ON 

INSERT [dbo].[Donations] ([Id], [Name], [Email], [Phone], [Amount], [CauseId]) VALUES (1, N'Alxas', N'alxas@alxas.com', N'456321', 26958, 1)
INSERT [dbo].[Donations] ([Id], [Name], [Email], [Phone], [Amount], [CauseId]) VALUES (2, N'Pifaqor', N'alxas@alxas.com', N'231321321', 23658, 2)
INSERT [dbo].[Donations] ([Id], [Name], [Email], [Phone], [Amount], [CauseId]) VALUES (3, N'İrasim', N'alxas@alxas.com', N'32146513', 29365, 3)
INSERT [dbo].[Donations] ([Id], [Name], [Email], [Phone], [Amount], [CauseId]) VALUES (4, N'Polat Ələmdar', N'polat@elemdar.com', N'2132132', 2587, 4)
INSERT [dbo].[Donations] ([Id], [Name], [Email], [Phone], [Amount], [CauseId]) VALUES (5, N'Kim Jan Un', N'onsuzdaasacam@asacam.com', N'666', 12354, 5)
INSERT [dbo].[Donations] ([Id], [Name], [Email], [Phone], [Amount], [CauseId]) VALUES (6, N'Xasay', N'xasay@xasay.com', N'980767453', 12356, 3)
INSERT [dbo].[Donations] ([Id], [Name], [Email], [Phone], [Amount], [CauseId]) VALUES (8, N'Alqayit', N'al@qayit.com', N'321456987', 10321, 5)
SET IDENTITY_INSERT [dbo].[Donations] OFF
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (1, N'img-13.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (2, N'img-14.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (3, N'img-15.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (4, N'img-16.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (5, N'img-17.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (6, N'img-18.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (8, N'g-img-2.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (9, N'g-img-3.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (10, N'g-img-4.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (11, N'g-img-5.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (12, N'g-img-4.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (13, N'g-img-2.jpg', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (14, N'260220180131093978xocali.jpg', CAST(N'2018-02-26 01:30:59.000' AS DateTime))
INSERT [dbo].[Gallery] ([Id], [Image], [Date]) VALUES (15, N'260220180128536950Alqayit.jpg', CAST(N'2018-02-26 01:28:46.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Gallery] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [Name], [Email], [Subject], [Text], [Date]) VALUES (3, N'Shohrat', N'mshohrat.p501@code.edu.az', N'Test', N'This is a test string', CAST(N'2018-02-15 00:00:00.000' AS DateTime))
INSERT [dbo].[Messages] ([Id], [Name], [Email], [Subject], [Text], [Date]) VALUES (4, N'Marhamat', N'merhemet24@gmail.com', N'Test', N'This is my brother''s email', CAST(N'2018-02-15 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[Moderators] ON 

INSERT [dbo].[Moderators] ([Id], [Fullname], [LevelType], [Email], [Password], [About]) VALUES (1, N'Shohrat', 0, N'mshohrat.p501@code.edu.az', N'123321', N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi consequuntur ratione sunt tempora, labore fuga, asperiores exercitationem, accusantium id voluptates soluta</p>
')
INSERT [dbo].[Moderators] ([Id], [Fullname], [LevelType], [Email], [Password], [About]) VALUES (2, N'Shahin', 1, N'shahin3757@gmail.com', N'123123', N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi consequuntur ratione sunt tempora, labore fuga, asperiores exercitationem, accusantium id voluptates soluta</p>
')
SET IDENTITY_INSERT [dbo].[Moderators] OFF
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([Id], [Logo], [Website], [Date]) VALUES (1, N'logo-1.png', N'https://code.edu.az/', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Partners] ([Id], [Logo], [Website], [Date]) VALUES (2, N'logo-2.png', N'https://code.edu.az/', CAST(N'2018-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Partners] ([Id], [Logo], [Website], [Date]) VALUES (7, N'logo-3.png', N'https://code.edu.az/', CAST(N'2018-02-21 00:43:12.000' AS DateTime))
INSERT [dbo].[Partners] ([Id], [Logo], [Website], [Date]) VALUES (8, N'logo-4.png', N'www.google.com', CAST(N'2018-02-21 00:43:21.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Partners] OFF
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([Id], [Logo], [Address], [Phone], [Email]) VALUES (4, N'220220180046543390empty.png', N'<p>Adress no. 29, Some Street, Some Coury</p>', N'<p>+40 712 345 678</p><p>+40 712 345 876</p>', N'<p>spam.gives@mail.com</p><p>spam.gives@mail.com</p>')
SET IDENTITY_INSERT [dbo].[Settings] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([Id], [Title], [Slogan], [Image]) VALUES (2, N'Gives & HUMANITY', N'<p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                            <br>the industry''s standard dummy text ever since the 1500s, when an unknown printer took
                        </p>', N's1.jpg')
INSERT [dbo].[Slider] ([Id], [Title], [Slogan], [Image]) VALUES (3, N'Gives & HUMANITY', N'<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been<br />
the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer</p>
', N's2.jpg')
INSERT [dbo].[Slider] ([Id], [Title], [Slogan], [Image]) VALUES (4, N'Gives & HUMANITY', N'<p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                            <br>the industry''s standard dummy text ever since the 1500s, when an unknown printer took
                        </p>', N's3.jpg')
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[Subscribe] ON 

INSERT [dbo].[Subscribe] ([Id], [Email]) VALUES (3, N'mshohrat.p501@code.edu.az')
INSERT [dbo].[Subscribe] ([Id], [Email]) VALUES (4, N'merhemet24@gmail.com')
INSERT [dbo].[Subscribe] ([Id], [Email]) VALUES (5, N'shohret550@gmail.com')
INSERT [dbo].[Subscribe] ([Id], [Email]) VALUES (6, N'irasim@gmail.com')
SET IDENTITY_INSERT [dbo].[Subscribe] OFF
SET IDENTITY_INSERT [dbo].[Volunteers] ON 

INSERT [dbo].[Volunteers] ([Id], [Name], [Position], [Text], [Image], [Date], [Status]) VALUES (1, N'JONATHAN GRE', N'Cheif Director', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do" ', N'best-volunte-1.jpg', CAST(N'2018-02-22 01:46:39.000' AS DateTime), 1)
INSERT [dbo].[Volunteers] ([Id], [Name], [Position], [Text], [Image], [Date], [Status]) VALUES (2, N'Iltifar', N'CTO', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do', N'best-volunte-2.jpg', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Volunteers] ([Id], [Name], [Position], [Text], [Image], [Date], [Status]) VALUES (3, N'Əlövsət', N'CEO', N'Lorem Jonathan Greg ipsum dolor sit amet, consectetur adipiscing elit, sed Jonathan Greg do', N'best-volunte-3.jpg', CAST(N'2018-02-03 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Volunteers] OFF
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Categories]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Moderators] FOREIGN KEY([ModeratorId])
REFERENCES [dbo].[Moderators] ([Id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Moderators]
GO
ALTER TABLE [dbo].[BlogImages]  WITH CHECK ADD  CONSTRAINT [FK_BlogImages_Blog] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog] ([Id])
GO
ALTER TABLE [dbo].[BlogImages] CHECK CONSTRAINT [FK_BlogImages_Blog]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comments] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Comments]
GO
ALTER TABLE [dbo].[Donations]  WITH CHECK ADD  CONSTRAINT [FK_Donations_Causes] FOREIGN KEY([CauseId])
REFERENCES [dbo].[Causes] ([Id])
GO
ALTER TABLE [dbo].[Donations] CHECK CONSTRAINT [FK_Donations_Causes]
GO
USE [master]
GO
ALTER DATABASE [Gives] SET  READ_WRITE 
GO
