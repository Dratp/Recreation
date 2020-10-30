USE [master]
GO
/****** Object:  Database [Recdit]    Script Date: 10/30/2020 11:37:12 AM ******/
CREATE DATABASE [Recdit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Recdit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Recdit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Recdit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Recdit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Recdit] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Recdit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Recdit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Recdit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Recdit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Recdit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Recdit] SET ARITHABORT OFF 
GO
ALTER DATABASE [Recdit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Recdit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Recdit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Recdit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Recdit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Recdit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Recdit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Recdit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Recdit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Recdit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Recdit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Recdit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Recdit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Recdit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Recdit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Recdit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Recdit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Recdit] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Recdit] SET  MULTI_USER 
GO
ALTER DATABASE [Recdit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Recdit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Recdit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Recdit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Recdit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Recdit] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Recdit] SET QUERY_STORE = OFF
GO
USE [Recdit]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 10/30/2020 11:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RIDBActivity] [int] NOT NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RIDB]    Script Date: 10/30/2020 11:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIDB](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FacilityID] [nvarchar](10) NULL,
	[FacilityName] [nvarchar](100) NULL,
	[FacilityDescription] [nvarchar](max) NULL,
	[FacilityTypeDescription] [nvarchar](25) NULL,
	[FacilityLongitude] [nvarchar](50) NULL,
	[FacilityLatitude] [nvarchar](50) NULL,
	[FacilityPhone] [nvarchar](100) NULL,
	[FacilityEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_RIDB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RIDBAct]    Script Date: 10/30/2020 11:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIDBAct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FacilityID] [nvarchar](10) NULL,
	[Activity] [nvarchar](25) NULL,
 CONSTRAINT [PK_RIDBAct] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RIDBAddress]    Script Date: 10/30/2020 11:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIDBAddress](
	[FacilityID] [nvarchar](10) NULL,
	[Facilityaddress1] [nvarchar](50) NULL,
	[Facilityaddress2] [nvarchar](50) NULL,
	[Facilityaddress3] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[AddressStateCode] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2020 11:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](25) NULL,
	[FirstName] [nvarchar](35) NULL,
	[LastName] [nvarchar](35) NULL,
	[ZIP] [nvarchar](10) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nchar](10) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RIDB] ON 
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (1, N'234526', N'SYLVANIA WILDERNESS BACKCOUNTRY CAMPING', N'<h2>Overview</h2>
<p>The Sylvania Wilderness encompasses 18,327 acres of primitive lands and is part of the National Wilderness Preservation System. Visitors can camp in 50 designated campsites within the Sylvania Wilderness. Visitors enjoy endless canoeing, fishing, hiking and wildlife viewing opportunities.</p>
<h2>Recreation</h2>
Sylvania''s abundant lakes provide plentiful non-motorized boating, canoeing, kayaking and fishing opportunities. Other popular activities include hiking and viewing wildlife.<h2>Facilities</h2>
Sylvania Wilderness Backcountry Camp is not a physical campground located at one location. The 50 individual sites are located along eight lakes within the Sylvania Wilderness. Camping is allowed only at designated sites.   
  
Campsites are primitive, but each is equipped with a campfire ring and a wilderness latrine.<h2>Natural Features</h2>
The old-growth forests and pristine lakes in the region provide habitat for a wide range of animal and plant life, including rare orchids, bald eagles, loons and osprey. The wilderness contains 34 named lakes, some with sandy beaches and others surrounded by record-size red and white pines.
  
The Ottawa National Forest is comprised of nearly 1 million acres and is located in the western reaches of Michigan''s Upper Peninsula. The forest''s rolling, tree covered hills extend from the south shore of Lake Superior to the Wisconsin border. Lakes, rivers and waterfalls are found throughout this beautiful landscape.', N'Campground', N'-89.3105556', N'46.2447222', N'906-358-4724', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (2, N'256367', N'Pictured Rocks National Lakeshore Backcountry Camping Permit', N'<h2>Overview</h2>
<p>Pictured Rocks National Lakeshore hugs the Lake Superior shoreline for more than 40 miles along Michigan''s northern coast. Lake Superior is the largest, deepest, coldest, and most pristine of all the Great Lakes. In addition to boating and kayaking on the lake, the park''s backcountry offers nearly 100 miles of walking and hiking trails and opportunities for solitude, inspiration, physical challenge, renewal, and camping.  Access to Pictured Rocks'' backcountry is primarily along the ''Lakeshore Trail'', a part of the 42-mile long North Country National Scenic Trail  where you can experience forests, dunes, beaches, waterfalls and wonderful panoramic views. </p>
<p><a href="https://www.nps.gov/piro/planyourvisit/backcountry.htm" rel="nofollow">Backcountry Planner</a>   The backcountry campgrounds are accessed by hiking or kayaking only. A backcountry camping <strong>permit is required</strong> year-round for all overnight trips into the Pictured Rocks National Lakeshore backcountry.  Permits are not required for day hiking.   Backcountry Camping   To assist in planning an overnight backcountry trip into Pictured Rocks National Lakeshore, take time to carefully   plan and prepare  for your adventure.   Pictured Rocks offers   fourteen backcountry campgrounds, that are located at two to five mile intervals along the Lakeshore Trail. Shuttle services are available.  </p>
<p>Permit holder must print and retain one copy of the permit when hiking to the campground; permit must be visibly secured to tent at campsite. You will be assigned a campsite number at every backcountry campground. Permit holder may have only one permit reserved at one time. Camp only in designated sites and follow permit itinerary. You must camp within 15 feet of the numbered post at your chosen campsite.  Individual campsites are available for groups of 1-6 people (2 tents or hammocks maximum, or 1 tent and 1 hammock).   Groups of 7-20 people and up to a 10 tent max must camp in designated group sites.   Each campground has a specific capacity; campsites within each backcountry campground are identified by a numbered post.  </p>
<p><a href="https://www.youtube.com/watch?v=JMYTg0lHDG8" rel="nofollow">Leave No Trace Principles</a> <a href="https://www.youtube.com/watch?v=1lTozt-CjBw" rel="nofollow">Leave No Trace Principles with Audio Description</a>  Learn how to Leave No Trace in our beautiful campgrounds.</p>
<h2>Charges &amp; Cancellations</h2>
<p><strong>Cancellation Policy: </strong><br>Prior to printing your permit, you may cancel any time before your reservation date and receive a 50% refund of all backcountry camping permit fees ($5 per person, per night). The $15 reservation fee is non-refundable. If you have printed your permit, there are no refunds. <br><strong>Change Policy:</strong><br>Prior to printing your permit, you may make changes to your permit before your reservation date. Changes may be made to the group size, campground, and the duration of your trip. An additional $15 non-refundable fee will be charged for changes.<br>Changes may be made to the group size through your Recreation.gov account or through the Call Center and may incur additional backcountry camping permit fees or be refunded these fees depending on whether you increase or decrease your group size. If decreasing your numbers, you will receive a full refund of the backcountry camping permit fees for the numbers you are decreasing only. <br>A change to the duration of the trip or campground may only be made through the Call Center. For changes to the duration of the trip, you may incur additional backcountry camping permit fees or be refunded these fees depending on whether you increase or decrease your number of nights. If decreasing your numbers, you will receive a full refund of the backcountry camping permit fees for the numbers you are decreasing only.<br>To change your entry date, you must cancel your permit and reserve a new permit. All fees apply. <br><strong>No Show Policy:</strong><br> If you do not print your permit by 11:59 p.m. on the first day of your scheduled trip, your entire backcountry camping permit will be canceled. No refunds. Please cancel your reservation if you are unable to use it to open space for others.</p>
', N'Campground', N'-86.305125', N'46.5622222', N'906 387 3700 MUNISING FALLS VISITOR CENTER  EMAIL: INFORMATION_PIRO@NPS.GOV', N'piro_information@nps.gov')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (3, N'232458', N'PLATTE RIVER CAMPGROUND', N'<h2>Overview</h2>
Platte River Campground is located in the southern district of Sleeping Bear Dunes National Lakeshore, on the lower peninsula of Michigan. 
This year-round facility is one of the most popular campgrounds in the park. It is within walking distance of the Platte River and a short walk or drive away from the Lake Michigan shore. Hikers can access many of the area''s day use and backpacking trails just north of the campground.
<br/><br/>
Summer temperatures range from the upper 70s to 90s during the day and 50s to 70s at night. Winters are cold, with daytime highs in the 20s to 30s and lows in the 10s and 20s; snow is usually on the ground from late November through March.<h2>Recreation</h2>
Campers can hike, canoe, kayak and fish on the river or the lake. There are canoe rentals at nearby Platte River Point, where the river meets the lake (the point also has beach access for those wishing to drive there). The Platte Plains trail system boasts more than 25 miles of trails, some of which can be accessed a short walk away from the campground. Trails to the primitive White Pine backcountry campground are also close by.<h2>Facilities</h2>
This facility is well-maintained, well-organized and offers a wide variety of sites, including back-in and pull-through sites with electric hookups for RVs, non-electric sites, walk-to sites, group sites (hike-in, tent-only) and a nearby backcountry campground. Each site has a campfire ring and picnic table. Each loop has restrooms with flush toilets and sinks. Hot showers are also available. The group sites allow no more than 25 people per site; pets and RVs are not permitted in them.<h2>Natural Features</h2>
The campground lies in a wooded area within walking distance of the Platte River and less than two miles away from the beaches of Lake Michigan. Although the lakeshore is long and narrow, it has northern hardwood and conifer forests, abandoned farm meadows, wetlands, lakes, streams, bogs and splendid examples of a glacially formed landscape.
<br/><br/>
The most prominent features in the park, and those for which it is named, are the perched sand dunes above Lake Michigan. The overlooks at Sleeping Bear, Empire and Pyramid Point bluffs are about 400 feet above the lake. With 65 miles of Lake Michigan shoreline and numerous inland lakes and streams, the park is wonderfully water-oriented.', N'Campground', N'-86.1177778', N'44.7127778', N'231-326-4700 ', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (4, N'251845', N'NICHOLS LAKE SOUTH CAMPGROUND', N'<h2>Overview</h2>
Located on the south side of Nichols Lake, the campground and surrounding area offer excellent opportunities for fishing, swimming, picnicking, hiking, camping, or just relaxing.<h2>Recreation</h2>
Fishing and boating are popular activities at Nichols Lake.  There is a paved boat launch at the campground.  This site is one of the locations on the National Forest''s for Kids Fishing Day Events for Michigan''s Free Fishing Day in early June.  Ice fishing is also popular in the winter.  Swimming areas are marked with buoys, but there are no lifeguards.  The North Country National Scenic Trail goes through the site near the boat ramp, providing good hiking opportunities.<h2>Facilities</h2>
Nichols Lake has 29 family sites on paved spurs.  Drinking water, flush toilets, and showers are provided.  Each site has a fire pit and picnic table.  A wood ramp and stairs lead down to the lake from the campground.  A short path along the lake provides access for fishing.<h2>Natural Features</h2>
At 160 acres, Nichols Lake offers shore, pier, and boat fishing. Typical fish species available include bass, bluegill, pumpkinseed, black crappie, and northern pike.  There is a swimming beach and accessible fishing pier available.
<br /><br />
Those wishing to enjoy the day at Nichols Lake will find a day use area located on the north side of the lake.
<h2>Nearby Attractions</h2>
The North Country Trail covers 4,600 miles from Crown Point, NY, to Lake Sakakawea State Park, ND.  The segment that includes Nichols Lake has beautiful sections for both the advanced and weekend hikers.   The nearest towns are Woodland, Bitely, and Brohman, about two miles to the south.', N'Campground', N'-85.9025', N'43.7230556', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (5, N'233715', N'SAND LAKE CAMPGROUND', N'<h2>Overview</h2>
Sand Lake Campground is situated on the scenic shores of Sand Lake and provides a selection of sites shaded by a mixed hardwood forest. Just beyond the trees is a well-loved, sandy swimming beach. The campground is located 15 minutes from the Pine National Scenic River and several other lakes.
<br /><br />
The popular campground sits within the Huron-Manistee National Forests, far enough from town to let its natural splendor shine, but close enough for convenient access to gas and groceries.<h2>Recreation</h2>
Power boating, sailing, canoeing, hiking and swimming are some of the most common activities on the lake. Anglers delight in the waters well-stocked with bluegill, perch and smallmouth bass. A picnic area and boat ramp are available for use.<h2>Facilities</h2>
The campground provides conveniences like coin showers, flush toilets and drinking water faucets. Visitors often rave about the nice, private bathrooms with vanities.<h2>Natural Features</h2>
Sand Lake boasts about 50 acres of mostly shallow waters. The campground is nicely wooded; some sites are heavy shaded while others are much more open. Summertime temperatures are generally around 80 degrees.
<br /><br />
The Huron-Manistee National Forests encompass nearly a million acres of public protected land, including nearly 6,000 acres of wetlands that extend over the northern portion of Michigan''s Lower Peninsula.', N'Campground', N'-85.9294444', N'44.1680556', N'231-723-0141', N'comments@AmericanLL.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (6, N'233769', N'GLEASONS LANDING ', N'<h2>Overview</h2>
Gleasons Landing is a very popular campground on the banks of the Pere Marquette River. With a selection of shaded and secluded spots, the campground is perfect for peaceful nature immersion.
<br /><br />
The Pere Marquette River was designated a National Scenic River in 1978, the first in Michigan, and it regularly attracts many canoeing, kayaking and fishing enthusiasts. The 66-mile stretch of river begins east of Baldwin and empties into Lake Michigan at Ludington.<h2>Recreation</h2>
A major draw to the campground is world-class fishing. The free flowing river maintains large populations of resident brown trout, steelhead and salmon. Gleason Landing marks the start of a zone for fly fishing and catch and release only. Reel fishing is available upstream. A boat ramp is located within the campground.
<br /><br />
Canoeing and kayaking is very popular on the river, and boat rentals are available in Baldwin. A permit is required to float the river from Memorial Day weekend through Labor Day weekend.
<br /><br />
Trails along the river provide shore access for anglers and short, scenic nature walks for hikers.<h2>Facilities</h2>
The walk-in campsites promise lovely views of the river. Family sites are each equipped with a picnic table, lantern post and campfire ring. Two group sites can accommodate up to 20 people each. Drinking water is provided but no hookups are available.<h2>Natural Features</h2>
The campground sits on a bluff overlooking the picturesque Pere Marquette River. It is surrounded by a mix of white pine and oak trees.
<br /><br />
The Huron-Manistee National Forests encompass a million acres throughout the northern portion of Michigan''s Lower Peninsula. The forests provide recreation opportunities for visitors, habitat for fish and wildlife and resources for local industry.
<h2>Nearby Attractions</h2>
A trailhead for the North Country National Scenic Trail is a short drive away. The trail extends from New York to North Dakota, spanning 4,600 miles.', N'Campground', N'-85.9202778', N'43.8711111', N'231-745-8760', N'comments@AmericanLL.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (7, N'259242', N'D.H. Day Campground', N'<h2>Overview</h2>
<p>D.H. Day Campground is located in the northern district of Sleeping Bear Dunes National Lakeshore, on the lower peninsula of Michigan. </p>
<p>CLICK HERE TO ACCESS A MAP OF D.H. DAY CAMPGROUND: <a href="https://www.nps.gov/slbe/planyourvisit/dhdaycamp.htm" rel="nofollow">https://www.nps.gov/slbe/planyourvisit/dhdaycamp.htm </a> </p>
<p>This rustic campground is one of the most popular in Northern Michigan and is open (weather permitting) from the first Friday in April through the last Sunday in November. Reservations are required May 1 through October 15. Campsites are within walking distance of the Lake Michigan shoreline and a short drive to many popular features in the park. Summer temperatures range from the upper 70s to 90s during the day, and 50s to 70s at night.</p>
<p>As with all NPS sites Sleeping Bear Dunes National Lakeshore is following all CDC guidelines for cleaning and disinfecting public spaces found at: https://www.cdc.gov/.../pdf/Reopening_America_Guidance.pdf This includes routine cleaning of outside surfaces, showers and restrooms, plus twice a day deep cleaning/disinfecting of showers and restrooms using EPA approved disinfectants against Covid-19. Our campground offices have implemented once a day disinfecting at opening, then all touched surfaces will be disinfected after each group uses the office, barriers have been installed on the desks, our staff wear masks, and only one group will be allowed into the office at a time. For more on how the NPS is responding to Covid-19 you can also go to: https://www.nps.gov/aboutus/news/public-health-update.htm Please call the visitor center at 231-326-4700, ext. 5010 if you have a specific question about one of the park''s safety measures. </p>
<h2>Recreation</h2>
<p>Sleeping Bear Dunes National Lakeshores rustic D.H. Day Campground is beautifully wooded. Campers can swim, canoe, kayak, fish and relax along the shoreline of the campground. The multi-use Sleeping Bear Heritage Trail passses through the campground opening up 20+ miles of biking and hiking. There are canoe and bicycle rentals nearby in the village of Glen Arbor. The historic village of Glen Haven is a short 15 minute walk away. Miltiple hiking trails, the Dune Climb, and the Pierce Stocking Scenic Drive are just a short drive away. D.H. Day Campground is the perfect launching point for a fun-filled stay at Sleeping Bear Dunes National Lakeshore.</p>
<h2>Facilities</h2>
<p>With 81 beautifully wooded campsites, shared water spigots, and vault toilets, D.H. Day provides a more rustic camping experience. Free hot showers are available at Platte River Camground, located 17 miles south along highway M-22. Each campsite has a parking area, large picnic table, fire ring and tent pad. Firewood is also sold in the campgound via a self-serve vending trailer. </p>
<h2>Natural Features</h2>
<p>D.H. Day Campground lies in the middle of Sleeping Bear Dunes National Lakeshore near the historic village of Glen Haven. The spacious wooded campsites are no more than a 5 minute walk to the Lake Michigan beach. Features include northern hardwood and conifer forests, old farm meadows, wetlands, lakes, streams, bogs, and splendid examples of glacially formed landscapes. The beautiful perched sand dunes, for which the parked is named, are just a few minutes drive from the campground.   </p>
<h2>contact_info</h2>
For facility specific information, please call (231) 334-4634.
<h2>Nearby Attractions</h2>
<p>D.H. Day Campground is within minutes of the lakeside Village of Glen Arbor and the Historic Village of Glen Haven. The Dune Climb and Pierce Stocking Scenic Drive are a short drive to the south. The Alligator Hill Trail is less than a mile away. The Crystal River winds its way to Lake Michigan just a few short miles to the north. The harbor town of Leland is approx. 30 minutes away and is the gateway to both North and South Manitou Island. </p>
<h2>Charges &amp; Cancellations</h2>
<p>Campers must notify the campground office at 231-334-4634 if they will not arrive within 24 hours of the check-in time or their reservation will be cancelled; They will be charged the first night''s camping fee plus a $20 no show fee.</p>
', N'Campground', N'-86.02006', N'44.89615', N'231-326-4700 ext 5035', N'sleepingbearinfo@nps.gov')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (8, N'233849', N'PINES POINT CAMPGROUND', N'<h2>Overview</h2>
Pines Point Campground is located on the banks of the White River with several campsites overlooking the river. The family campground includes a loop designed for groups containing five sites with a capacity of 20 guests each. Large groups can reserve the entire loop.<br /><br /> 
Find out how the campground got its name when you tube or kayak the &acirc;??point&acirc;?? and see the majestic white pines standing watch over the river. Fishing is also popular in these waters.<h2>Recreation</h2>
Fish for trout, salmon and sucker, or float in a canoe, kayak or tube around the point, a leisurely 1 hour float. The canoe landing is walk-in.<h2>Facilities</h2>
Five group campsites and 27 family campsites lie along the river. Each site is equipped with a picnic table, fire ring and lantern post. Drinking water and flush toilets are provided. Electric hookups are not available.<h2>Natural Features</h2>
The campground is quiet and secluded, surrounded by towering white pines and rolling hills.
The White River runs for 23.6 miles on the western side of Michigan''s Lower Peninsula. Summer temperatures are generally around 80 degrees Fahrenheit.
<br /><br />
The Huron-Manistee National Forests extend over almost a million acres, including nearly 6,000 acres of wetlands. The forests provide recreation opportunities for visitors, habitat for fish and wildlife and resources for local industry.
<h2>Nearby Attractions</h2>
Hikers can explore the White River Special Area, a primarily non-motorized area surrounded on three sides by the White River.', N'Campground', N'-86.1194444', N'43.5277778', N'231-745-8760', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (9, N'234662', N'WIDEWATERS CAMPGROUND', N'<h2>Overview</h2>
Widewaters Campground is remotely located on Michigan''s upper peninsula in the Hiawatha National Forest. 
<br /><br />
It sits on a stretch of heavily forested land between Lake Superior and Lake Michigan, near a series of smaller lakes and the Indian River, making it an ideal getaway for anglers and explorers alike.<h2>Recreation</h2>
This small, quiet campground is perfect for fishing, canoeing and kayaking. Anglers enjoy catching brook trout in the area.
<br /> <br />
The 9-mile Bruno''s Run Trail, which winds its way past a host of small lakes in the area, passes directly through the campground and is a popular trail for hiking and biking, as well as snowshoeing and cross-country skiing in the winter.<h2>Facilities</h2>
The campground offers multiple well-spaced single-family sites, available for tent and RV camping. Sites vary from being heavily wooded and private, to open with little privacy. A few waterfront sites have access to the river. Some additional sites are available on a first-come, first-served basis. <br /> 
<br />
Each site is equipped with tables and campfire rings and some have access to grills. Accessible vault toilets and drinking water are provided. <br /> <br />
Boat ramps are available at the campground and also at Fish Lake.<h2>Natural Features</h2>
Widewaters is in a beautiful forest of mature hardwoods, sandwiched between Irwin Lake and Indian River.', N'Campground', N'-86.6283333', N'46.2194444', N'', N'bayfurnace@jamadots.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (10, N'244397', N'Nichols Lake North', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157662905795604" title="Nichols Lake"><img alt="Nichols Lake" height="240" src="https://c2.staticflickr.com/2/1489/24747233313_c73760cd95_n.jpg" width="320" /></a></p><p>In addition to being a trailhead for the North Country Trail, Nichols Lake North is also a day use area.&nbsp; Popular for fishing and swimming, the site is located on Nichols Lake,&nbsp;a short distance from Nichols Lake campground.</p><p><strong><a href="http://www.fs.usda.gov/Internet/FSE_DOCUMENTS/stelprd3807297.pdf" target="external">North Country Trail brochure with map</a></strong>:&nbsp; This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller.</p><p><strong><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157662905795604" target="external">Flickr Photo Album</a> </strong></p>', N'Facility', N'-85.910094', N'43.733343', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (11, N'238169', N'Grand Island National Recreation Area', N'<p>Bring the family and check out Grand Island National Recreation Area!</p><p>Grand Island is located in Lake Superior, about one-half mile from the mainland community of Munising, Michigan. Munising is about 43 miles from Marquette and 55 miles from Manistique. Grand Island is the perfect place to spend a day or even just a few hours biking and exploring. The island’s breathtaking overlooks, pristine sandy beaches, fascinating cultural sites, deep hard woods, and inland lakes make it an exciting and secluded destination.</p><p>Visitors can get to the island via passenger ferry or private watercraft. Some campsites are conveniently located for kayakers. The ferry departs from Grand Island Landing on the mainland, located on M-28 about 2.5 miles west of the Munising''s blinking light. Look for the Grand Island National Recreation Area signs.  </p><p>To view the Grand Island Recreation Area Map <a href="http://www.fs.usda.gov/Internet/FSE_DOCUMENTS/stelprdb5136807.pdf">Click Here</a>.</p><p>If you''re interested in the island''s history, check out the Grand Island 25th Anniversary Page (<a href="https://www.fs.usda.gov/detail/hiawatha/specialplaces/?cid=stelprd3836780">archived</a>).</p>', N'Facility', N'-86.664628', N'46.44485', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (12, N'234235', N'MCKEEVER CABIN', N'<h2>Overview</h2>
McKeever Cabin is located in the Hiawatha National Forest in Michigan''s Upper Peninsula, approximately 14 miles south of Munising, Michigan. The Cabin was constructed in 1991 and overlooks the 132-acre McKeever Lake. 
<br/><br/>
While the facility offers little in the way of modern amenities, convenient access to a number of recreational activities, including hunting, fishing, hiking, mountain biking, swimming and cross-country skiing, make this cabin a desirable destination for the outdoors enthusiast.
<br/><br/>
During warmer months, visitors may park their vehicle and access the cabin by foot via a 1,000 ft. trail.  When snow is present, the cabin may be accessed by snowshoe or cross-country skis via a 1-mile trail.<h2>Recreation</h2>
During winter months, visitors can enjoy the McKeever Hills Ski Trail, which offers a quieter, less manicured alternative to highly groomed trails without sacrificing quality. The trail to the cabin connects directly to the ski trail, so visitors can ski right out the cabin door. 
<br/><br/>
The Bruno''s Run Trail offers a 9 mile (14.48 km) loop ideal for hiking and mountain biking in spring, summer and fall and snow shoeing in winter. Although the trail is not groomed for cross-country skiing, it does offer a suitable source for experienced skiers who prefer to break their own way.
<br/><br/>
Seasonal activities also include swimming, canoeing, kayaking and fishing on the lake as well as hunting in designated areas. See the Michigan Department of Natural Resource''s website for information about <a href="http://www.michigan.gov/dnr/0,4570,7-153-10363_14518---,00.html" rel="nofollow">hunting seasons and permits</a>.<h2>Facilities</h2>
The cabin can accommodate up to four people comfortably and a maximum of six people. There are two sets of bunk beds (with 4 mattresses), one table with stools, one counter top, one corner seat and a wood burning stove. There is no longer a loft with a mattress in this cabin.
  
There are no modern bathroom facilities or electricity offered at this cabin. In order to ensure a comfortable stay, visitors must bring several of their own supplies including a camp stove, dishes, cooking utensils, containers for carrying water, toilet paper, lanterns, sleeping bags and pillows.
  
A vault toilet is located just off the trail to the cabin and there is a (summer/winter) hand pump with drinking water located down the trail to the lake. Do not bring firewood from home: firewood will be supplied at the cabin.<h2>Natural Features</h2>
The cabin is situated on a small knoll surrounded by young evergreens and hardwood trees, overlooking the western shores of McKeever Lake. The lake was stocked with northern muskie in 1990, but also supports a good population of northern pike, largemouth bass, smallmouth bass and bluegill.
<br/><br/>
The Big Island Lake Wilderness is located near the cabin and features 23 small lakes ranging in size from 5 to 149 acres. White birch, maple and aspen cover the wooded hills that surround the lakes. Berries, mushrooms and wildflowers grow throughout the area and a wide range of wildlife and waterfowl, including sensitive species, may be carefully observed here.', N'Campground', N'-86.5991667', N'46.2163889', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (13, N'234080', N'BREVOORT LAKE CAMPGROUND', N'<h2>Overview</h2>
Brevoort Lake Campground stretches along the western shore of its namesake in the Hiawatha National Forest. This popular fishing destination is situated on a peninsula that juts into the lake and Beodne Bay. 
  
Visitors to the campground enjoy the easy access to the pristine sandy beaches.<h2>Recreation</h2>
The 4,233-acre Brevoort Lake provides ample opportunities for recreation. Boat access is available from the center of the campground on Boedne Bay. 
<br/> <br/>
In 1985, the Forest Service completed the construction of a walleye spawning reef in Brevoort Lake, providing plentiful fishing in the area. Anglers can also expect healthy populations of pike, bass, perch and a variety of other fish. 
<br/> <br/>
Hiking is also a popular pastime of visitors to the campground. The Ridge, Sand Dunes Cross Country and North Country National Scenic trails pass near the campground. <br/> <br/>
A 10-minute ferry ride to Mackinac Island makes for an interesting day trip. The 3.8-acre island offers hiking, biking, horseback riding and shopping, as well as access to historical sites and museums, among other activities.<h2>Facilities</h2>
The campground offers dozens of reservable single-family campsites for tent and RV camping. Additional sites are available on a first-come, first-served basis. Each site is equipped with tables and campfire rings with grills, and accessible flush toilets, drinking water and a dump station are provided. 
<br/> <br/><h2>Natural Features</h2>
Campsites are somewhat secluded, surrounded by huge pine, hemlock and oak trees and low, shrubby vegetation. Beach grass grows along the lake shore, sometimes buried in light sand.
<h2>Nearby Attractions</h2>
St. Ignace, Michigan, about 20 miles east of the campground, offers historical and tourist attractions as well as grocery and gas services.<h2>Charges &amp; Cancellations</h2>
<p>Please cancel 7 days in advance if you need to cancel your reservation. Reservation sites cannot be traded for walk-up sites.</p>
', N'Campground', N'-84.9722222', N'46.0072222', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (14, N'238168', N'West Zone', N'<p>The West Unit is located in the central of the Upper Peninsula, bordering two of the Great Lakes - Lake Superior and Lake Michigan. The western portion of the Hiawatha extends from the towns of Rapid River and Manistique, along Lake Michigan, to the town of Munising on the Lake Superior shore.  For information about free educational campground programs on these three Ranger Districts, visit the Events page.</p>', N'Facility', N'-86.9741', N'46.0151', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (15, N'233714', N'LAKE MICHIGAN AT MANISTEE', N'<h2>Overview</h2>
Lake Michigan Campground is perched on the shores of Lake Michigan, 15 miles south of Manistee. The area creates an incredible setting with a scenic overlook of the lake and a sandy swimming beach. This family campground provides an array of hiking and biking trails, plus swimming, fishing and kayaking.<h2>Recreation</h2>
A hardwood forest gives way to a beautiful sandy beach at the shores of the lake with a playground for younger campers. Trout fishing in Lake Michigan is another big draw.
<br /><br />
Bird watchers delight in seeing unique species like the piping plover and prairie warbler.
<br /><br />
The Arrowhead Trail, a short loop trail created by Boy Scouts, forms a loop between the campground and the beach. A trailhead for the Nordhouse Dunes Wilderness Area is also within the recreation area.<h2>Facilities</h2>
An amphitheater offers educational programs throughout the peak season. Other amenities include flush and vault toilets, beach access and an overlook deck. Campsites are equipped with picnic tables and pedestal grills. 
<br /><br />
Group campsites can each accommodate a maximum of 50 guests.<h2>Natural Features</h2>
The recreation area sits on the eastern banks of Lake Michigan along Porter Creek, due north of Hamlin Lake. As the second largest of the five Great Lakes, Lake Michigan provides stunning views and limitless options for water recreation. It covers a whopping 22,400 square miles and ranks as the fifth largest lake in the world.
<br /><br />
The Huron-Manistee National Forests encompass nearly a million acres of public protected land. Nearly 6,000 acres is wetlands that extend over the northern portion of Michigan''s Lower Peninsula.
<h2>Nearby Attractions</h2>
The nearby Nordhouse Dunes Wilderness Area has abundant trails for hiking and backpacking.', N'Campground', N'-86.4275', N'44.1191667', N'231-723-0141', N'comments@AmericanLL.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (16, N'244393', N'Bowman Lake Trailhead', N'<p><em><strong>Going North -</strong></em> From Bowman Lake Trailhead to Timber Creek Trailhead, visitors will go through the Bowman Lake Semi-Primitive Nonmotorized Area, travel along the Pere Marquette National Scenic River near Sulak and Upper Branch Bridge river access sites, until crossing US-10 and arriving at the Timber Creek Trailhead.</p><p><em>M-55 to Bowman Lake Trailhead -</em></p><ul><li><em>Bicycles Allowed?:</em> Yes</li><li><em>Miles: </em>41</li></ul><p><em><strong>Going South - </strong></em>From Bowman Lake Trailhead to 76th Street Trailhead, hikers will travel toward and along the Pere Marquette National Scenic River.  As hikers travel south, away from Bowman Lake, the terrain will get progressively less hilly.  Glacial depressions are found in this area and provide homes for many species of wildlife</p><p><em>Bowman Lake Trailhead to Nichols Lake North Trailhead -</em></p><ul><li><em>Bicycles Allowed?:</em> No</li><li><em>Miles: </em>17</li></ul>', N'Facility', N'-85.967719', N'43.891241', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (17, N'233211', N'COOKSON LAKE DISPERSED CAMPSITE', N'<h2>Overview</h2>
Cookson Lake Campsite offers a primitive place to stay in the thick of Michigan''s wilderness. Beautiful forests surround several lakes in the area, providing ample opportunity to enjoy nature in all its forms.<h2>Recreation</h2>
Visitors enjoy swimming and fishing in the 35-acre adjacent lake. Largemouth bass, northern pike, bluegill and bullhead are among the typical catch. Licenses are required for fishing in Michigan waters. 
<br/><br/>
Boating the lake is also a popular pastime, and a boat ramp is located near the campsite.<h2>Facilities</h2>
The campground offers five primitive campsites for tent and RV camping. Each offers tables and campfire rings. A pit toilet is located near one of the sites, but toilet paper is not provided.<h2>Natural Features</h2>
The campsite is located in a large open field on the shores of Cookson Lake. The lake boasts two small islands, and a variety of wildflowers abound in the area during warmer months.
<h2>Nearby Attractions</h2>
Cookson Lake is near the Indian Wild and Scenic rivers and the Big Island Lake Wilderness Area.', N'Campground', N'-86.5615139', N'46.1955972', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (18, N'233174', N'PETES LAKE CAMPGROUND', N'<h2>Overview</h2>
Petes Lake Campground, located in the center of Michigan''s Hiawatha National Forest, is surrounded by several lakes and offers excellent hiking, biking, fishing, boating and more. <br /> 
<br />
Snuggled amongst mixed hardwood trees, the campground offers a swimming beach and day-use picnic area away from the hustle and bustle of city life.
<h2>Recreation</h2>
Visitors enjoy a variety of water-related recreation opportunities. The campground also has fishing pier next to the day-use area. Anglers can expect healthy populations of northern pike, bass, walleye and perch in the lake.<br />
<br />
The nine-mile Bruno''s Run Trail, which winds its way past a host of small lakes in the area, passes directly through the campground and is a popular trail for hiking and biking, as well as snowshoeing and cross-country skiing in the winter.<h2>Facilities</h2>
The campground offers multiple spacious and forested private campsites for tent and RV camping. A few sites overlook the lake.<br /> <br />
Each site is equipped with tables and campfire rings and about half of the sites have access to a grill. Accessible vault toilets and drinking water are provided. <br /> 
<br />
A shaded day-use picnic area at the campground offers multiple tables and benches right on the lake shore. Accessible vault toilets and drinking water are also provided in the picnic area, as well as a fairly large parking area.<h2>Natural Features</h2>
The campground is situated on the upper peninsula of Michigan, on the shores of the 190-acre Petes Lake. It sits amid rolling hills that are forested with a variety of deciduous and conifer trees. Many of the campsites are shaded and private.
<h2>Nearby Attractions</h2>
Big Island, Fish and Straits lakes are all within 25 miles of the campground.
', N'Campground', N'-86.597', N'46.2281889', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (19, N'234655', N'MURRAY BAY GROUP CAMPSITE on GRAND ISLAND', N'<h2>Overview</h2>
Murray Bay Group Campground is located on the southern shores of Grand Island, at the southeastern tip of Lake Superior. The island''s scenic natural beauty and interesting history make it an attractive place for camping and other outdoor activities.
<br /> <br />
The Grand Island National Recreation Area boasts massive 300-foot wave-cut sandstone cliffs, 13,500 acres of lush forest, beaches of fine sand, winter ice caves and historic buildings and artifacts dating back as far as 2000 B.C.<h2>Recreation</h2>
The sandy lake is a popular swimming destination. Boating is also available, however, there is no boat ramp or dock facility at the campground. <br /> <br />
Anglers and hunters frequent the area for its wide variety of fish and game. Licenses are required to participate in either activity. 
<br /> <br />
Visitors also enjoy over 30 miles of hiking and mountain biking trails on the island. A bus tour is also available for those who would like to learn more about the island''s natural and cultural history.<h2>Facilities</h2>
The campground offers a single group campsite that can accommodate up to 25 guests, as well as a day-use picnic area. Both are equipped with tables and campfire rings with grills. 
<br /><br />
Vault toilets and drinking water are also provided. Camping is not allowed at the day-use site. A bear pole and box for food storage are provided at each site.<h2>Natural Features</h2>
Grand Island and the Murray Bay Group Campground are part of the Hiawatha National Forest, near Michigan''s Upper Peninsula. Calm waters and white-sand beaches beckon boaters and swimmers to the area.', N'Campground', N'-86.655175', N'46.4717389', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (20, N'244403', N'M-37: White Cloud to Baldwin', N'<p>This area covers all recreation areas along M-37 between White Cloud and Baldwin.&nbsp; This does not include trailheads for the North Country National Scenic Trail or Hungerford Recreation Area.</p>', N'Facility', N'-85.842778', N'44.032222', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (21, N'244394', N'Freesoil Trailhead', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157660951616613" title="North Country National Scenic Trail"><img alt="North Country National Scenic Trail" height="320" src="https://farm2.staticflickr.com/1629/23866957619_bcbb85a882_z.jpg" width="240" /></a></p><p><em><strong>Going North -</strong></em> Heading north will take you to the Udell Trailhead.&nbsp; The trail from Udell Trailhead&nbsp;to Freesoil&nbsp;Trailhead traverses the Udell Hills.&nbsp; After the trail crosses the Little Manistee River, the terrain changes form mixed hardwoods to wetlands.&nbsp; The trail heading north was formerly a narrow gauge railroad that was elevated above the wetlands in the early 1900&#39;s by lumberjacks.&nbsp; The trail winds through the wetlands and swamp in this section.&nbsp; However, about 3.5 miles north of the trailhead a boardwalk has been put in through the wetland areas.&nbsp; Mountain bikes are allowed going both north and south from this trailhead.</p><p>&nbsp;<em>Going&nbsp;north from Freesoil Trailhead&nbsp;- </em></p><ul><li>Freesoil Trailhead to 3-Mile Rd. - Easy</li><li>3-Mile Rd. to Udell Trailhead - Intermediate</li></ul><p><em><strong>Going South - </strong></em>Heading south will take you to the Timber Creek Trailhead.&nbsp; The trail from Freesoil Trailhead to Timber Creek passes through Ward Hills, past McCarthy Lake and through very steeply hilled terrain.&nbsp; The portion of trail running from Timber Creek Trailhead to the Manistee River is the most advanced riding on this portion of the trail for mountain bikes.</p><p><em>Going&nbsp;south from Freesoil Trailhead -</em></p><ul><li>Freesoil Trailhead to Timber Creek Trailhead - Intermediate</li></ul><p><strong><a href="http://www.fs.usda.gov/Internet/FSE_DOCUMENTS/stelprd3807297.pdf" target="external">Brochure with map</a></strong>:&nbsp; This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller.</p><p><strong><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157660951616613" target="external">Flickr Photo Album</a> </strong></p>', N'Facility', N'-86.029419', N'44.10539', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (22, N'238172', N'Munising Ranger District', N'<p>Munising Ranger District is located on the northern part of the west side of the Hiawatha National Forest. Stop by for up-to-date information and suggestions for your trip.</p>', N'Facility', N'-86.649116', N'46.409211', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (23, N'270656', N'Rapid River/ Manistique Ranger District', N'<p>Rapid River Ranger district is located on the lower half of the west side of  the forest.</p>', N'Facility', N'-86.951992', N'45.926276', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (24, N'232458', N'PLATTE RIVER CAMPGROUND', N'<h2>Overview</h2>
Platte River Campground is located in the southern district of Sleeping Bear Dunes National Lakeshore, on the lower peninsula of Michigan. 
This year-round facility is one of the most popular campgrounds in the park. It is within walking distance of the Platte River and a short walk or drive away from the Lake Michigan shore. Hikers can access many of the area''s day use and backpacking trails just north of the campground.
<br/><br/>
Summer temperatures range from the upper 70s to 90s during the day and 50s to 70s at night. Winters are cold, with daytime highs in the 20s to 30s and lows in the 10s and 20s; snow is usually on the ground from late November through March.<h2>Recreation</h2>
Campers can hike, canoe, kayak and fish on the river or the lake. There are canoe rentals at nearby Platte River Point, where the river meets the lake (the point also has beach access for those wishing to drive there). The Platte Plains trail system boasts more than 25 miles of trails, some of which can be accessed a short walk away from the campground. Trails to the primitive White Pine backcountry campground are also close by.<h2>Facilities</h2>
This facility is well-maintained, well-organized and offers a wide variety of sites, including back-in and pull-through sites with electric hookups for RVs, non-electric sites, walk-to sites, group sites (hike-in, tent-only) and a nearby backcountry campground. Each site has a campfire ring and picnic table. Each loop has restrooms with flush toilets and sinks. Hot showers are also available. The group sites allow no more than 25 people per site; pets and RVs are not permitted in them.<h2>Natural Features</h2>
The campground lies in a wooded area within walking distance of the Platte River and less than two miles away from the beaches of Lake Michigan. Although the lakeshore is long and narrow, it has northern hardwood and conifer forests, abandoned farm meadows, wetlands, lakes, streams, bogs and splendid examples of a glacially formed landscape.
<br/><br/>
The most prominent features in the park, and those for which it is named, are the perched sand dunes above Lake Michigan. The overlooks at Sleeping Bear, Empire and Pyramid Point bluffs are about 400 feet above the lake. With 65 miles of Lake Michigan shoreline and numerous inland lakes and streams, the park is wonderfully water-oriented.', N'Campground', N'-86.1177778', N'44.7127778', N'231-326-4700 ', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (25, N'251845', N'NICHOLS LAKE SOUTH CAMPGROUND', N'<h2>Overview</h2>
Located on the south side of Nichols Lake, the campground and surrounding area offer excellent opportunities for fishing, swimming, picnicking, hiking, camping, or just relaxing.<h2>Recreation</h2>
Fishing and boating are popular activities at Nichols Lake.  There is a paved boat launch at the campground.  This site is one of the locations on the National Forest''s for Kids Fishing Day Events for Michigan''s Free Fishing Day in early June.  Ice fishing is also popular in the winter.  Swimming areas are marked with buoys, but there are no lifeguards.  The North Country National Scenic Trail goes through the site near the boat ramp, providing good hiking opportunities.<h2>Facilities</h2>
Nichols Lake has 29 family sites on paved spurs.  Drinking water, flush toilets, and showers are provided.  Each site has a fire pit and picnic table.  A wood ramp and stairs lead down to the lake from the campground.  A short path along the lake provides access for fishing.<h2>Natural Features</h2>
At 160 acres, Nichols Lake offers shore, pier, and boat fishing. Typical fish species available include bass, bluegill, pumpkinseed, black crappie, and northern pike.  There is a swimming beach and accessible fishing pier available.
<br /><br />
Those wishing to enjoy the day at Nichols Lake will find a day use area located on the north side of the lake.
<h2>Nearby Attractions</h2>
The North Country Trail covers 4,600 miles from Crown Point, NY, to Lake Sakakawea State Park, ND.  The segment that includes Nichols Lake has beautiful sections for both the advanced and weekend hikers.   The nearest towns are Woodland, Bitely, and Brohman, about two miles to the south.', N'Campground', N'-85.9025', N'43.7230556', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (26, N'244395', N'Marilla Trailhead', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157660951616613" title="North Country National Scenic Trail"><img alt="North Country National Scenic Trail" height="320" src="https://farm2.staticflickr.com/1629/23866957619_bcbb85a882_z.jpg" width="240" /></a></p><p>Marilla Trailhead is the northern most access to the trail on the Huron-Manistee National Forests.  For information on trailheads going north visit the National Park Service <a href="http://www.nps.gov/noco/index.htm">website</a>.</p><p>A 23-mile loop trail is formed with the Manistee River Trail along the Manistee River.  The loop trail can be accessed from the Marilla and Upper Branch Trailheads for the North Country National Scenic Trail and the Red Bridge and Seaton Creek accesses for the Manistee River Trail.</p><p><em><strong>Going South -</strong></em> From Marilla to Upper River Trailhead the trail follows the ridge high above the Manistee River, offering hikers scenic views of the river valley. Mountain bikes are permitted from the Dilling Road crossing to the Marilla Trailhead. Mountain bikes are not allowed on the connector or the section of the trail along the Hodenpyl backwaters. The only water source is at Eddington Creek Crossing, 1.5 miles south of Marilla Trailhead.</p><p><em>Difficulty going south from Marilla </em><strong><em>- </em></strong></p><ul><li>Marilla to Red Bridge - Advanced/Difficult</li></ul><p> <em>Marilla Traihead to Dilling Rd.</em></p><ul><li><em>Bicycles Allowed?: </em>Yes</li><li><em>Miles: </em>21</li></ul><p><strong>Brochure with map</strong>:</p><ul><li><a href="https://go.usa.gov/x9h8H" target="external">North Country National Scenic Trail</a></li><li><a href="https://go.usa.gov/x9h8P" target="external">Manistee River Trail</a></li></ul><p>This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.  To print on 8 1/2 x 11 paper set the print area to "shrink to printable area", this will make the text on the page smaller.</p><p> </p><p><strong>Flickr Photo Albums</strong></p><ul><li><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157660951616613" target="external">North Country National Scenic Trail</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157662417865276" target="external">Manistee River Trail</a></li></ul>', N'Facility', N'-85.8395', N'44.37374', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (27, N'244453', N'Au Sable River', N'<p>From Mio Pond to Lake Huron, the Au Sable is primarily managed by the HMNF.&nbsp; The river is managed in two sections, one from Mio Pond to Alcona Dam Pond, the second from Alcona Dam to Lake Huron.</p><p>&nbsp;</p><h2>Au Sable National Wild and Scenic River</h2><p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157659836028984" title="Au Sable National Scenic River"><img alt="Au Sable National Scenic River" height="240" src="https://farm1.staticflickr.com/760/22986653474_5fdfd2aa5d_z.jpg" width="320" /></a></p><p>The Au Sable National Scenic River stretches 23-miles, from Mio to Alcona Pond.</p><p>&nbsp;</p><h2>Au Sable River - Alcona Dam to Lake Huron</h2><p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157667880663884" title="Au Sable River"><img alt="Au Sable River" height="240" src="https://c2.staticflickr.com/8/7331/28130707145_dfe13b8e10_n.jpg" width="320" /></a></p><p>This section provides motorboat opportunities with a lake fishing atmosphere.</p><h3>Highbanks River Trail</h3><p>A short, 7-mile hike along the bluffs of the Au Sable River will provide day hikers with some of the best, and most dramatic, views of the Au Sable River, where hikers or skiers will be able to look over the river valley, with clear views almost to Lake Huron in some spots.</p><h3>Lubmerman&#39;s Monument Visitor Center and Forest Discovery Trial</h3><p>Lumberman&rsquo;s Monument Visitor Center interprets the area&rsquo;s colorful lumbering past. The 14-foot Lumberman&rsquo;s Monument stands on a high bank with the Au Sable River providing a scenic backdrop.</p><h3>River Road National Scenic Byway</h3><p>The twenty-two mile <i>River Road National Scenic Byway</i> extends westward from Lake Huron into the Huron National Forest. It parallels the historic Riviere aux Sable (River of Sand). Lumbermen&rsquo;s Monument Visitor Center sits at the center of the byway.</p><p>&nbsp;</p><h2>Brochures and Maps:</h2><ul><li>Au Sable National Scenic River (<a href="http://go.usa.gov/x9h8F" target="external">pdf</a>)</li><li>River Road National Scenic Byway (<a href="http://go.usa.gov/x9h8j" target="external">pdf</a>) - this brochure shows River Road, the Au Sable River and Lumberman&#39;s Monument</li><li>Highbanks River Trail Map (coming soon)</li><li>Eagle Run Trail Map (coming soon)</li></ul><p><strong>Flickr Photo Albums:</strong></p><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157667880663884" target="external">Au Sable River - Alcona Dam to Lake Huron</a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157661512533399" target="external">Visitor Center</a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157662307594671" target="external">Programs</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157669665916130" target="external">Monument Campground</a></li></ul></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157661473995519" target="external">River Road National Scenic Byway</a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157669379122650">Iargo Springs</a></li></ul></li><li><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157661466674049" target="external">Highbanks River Trail</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157670036127542" target="external">Eagle Run Trail</a></li></ul></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157659836028984" target="external">Au Sable National Scenic River</a></li></ul>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (28, N'233172', N'AuTrain Lake Campground', N'<h2>Overview</h2>
Located at the south end of AuTrain Lake, this campground is favored by anglers and outdoor enthusiasts. 
<br /><br />
The quiet setting is great for family trips, and visitors can enjoy a variety of recreational opportunities year-round, all less than a day''s drive from major urban areas of Michigan and Wisconsin.<h2>Recreation</h2>
The large size of the lake provides miles of prime water skiing, boating, swimming and fishing. Anglers can expect a healthy catch of bass and a variety of perch. Canoeing is also popular on AuTrain Lake and the nearby AuTrain River, which meanders into Lake Superior.<br /> 
<br />
The campground also provides access to the popular two-mile Songbird interpretive trail, which winds through forest and field, along bog and lakeshore, and is popular for birding.
<br /> <br />
A wildlife viewing platform is available at neighboring Buck Bay and Buck Bay Creek.<h2>Facilities</h2>
The campground offers dozens of large, wooded campsites, available for tent and RV camping. Some sites are available on a first-come, first-served basis. Each site is equipped with tables and campfire rings with grills. Accessible vault toilets and drinking water are provided.
<br /> <br />
A boat ramp is available at the parking area of the campground, and the lot offers plenty of space for turning and parking. Boat rentals are available in AuTrain.<h2>Natural Features</h2>
AuTrain Lake is located in the upper peninsula of Michigan, between three of the Great Lakes. It sits amid rolling hills forested with pine and aspen trees, as well as large open and tree-covered wetlands.
<h2>Nearby Attractions</h2>
The city of AuTrain, located on the shores of Lake Superior, is about 5 miles from the campground.', N'Campground', N'-86.8380556', N'46.3916667', N'', N'bayfurnace@jamadots.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (29, N'233210', N'COUNCIL LAKE DISPERSED CAMPSITE', N'<h2>Overview</h2>
Council Lake Campsite sits on the shores of Council Lake in the center of the Hiawatha National Forest. 
  
Its location amid a series of forested lakes provides ample opportunity for visitors to enjoy nature in the scenic surroundings.<h2>Recreation</h2>
Council Lake is a 14-acre lake with yellow perch, rock and largemouth bass, bluegill, black crappie, bullhead and northern pike. Licenses are required to fish in Michigan waters. 
  
Non-motorized boats can be used on the lake, however access at the campground is by land only. A boat ramp can be found at adjoining Red Jack Lake. Canoeing and kayaking are also popular among visitors to the tranquil campsite.<h2>Facilities</h2>
There are four primitive campsites at Council Lake for tent and small RV camping. Each campsite is equipped with a table and a campfire ring. A pit toilet is located near one of the sites, but toilet paper is not provided.
<br/> <br/>
The day-use area is equipped with tables and a campfire ring with a grill. The area is near a beach that is perfect for lounging and swimming. No drinking water is provided at the campsite; water must be brought in and garbage must be carried out.<h2>Natural Features</h2>
The small campground is nestled in a mixed stand of hardwood trees and pines. It is on the southern shores of Council Lake, close to adjoining Red Jack and Scout lakes.', N'Campground', N'-86.647175', N'46.2416333', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (30, N'234734', N'TOM''S LAKE CABIN', N'<h2>Overview</h2>
Tom''s Lake Cabin was built in 1991 and will accommodate up to eight people.  The cabin is situated on a small knoll overlooking Tom''s Lake, a 23 acre lake in the heart of the Hiawatha National Forest.<h2>Recreation</h2>
There are several hiking, biking, and horseback riding trails within a few miles from the cabin, including the Ironjaw semi-primitive area and the Pine Marten Run trail system offering 26 miles of trail.  For the winter enthusiast, snowmobile trails can be found nearby, and the Pine Marten Run trail is frequently used for snowshoeing and cross-country skiing (although the trail is not groomed).
Those trying their hand at fishing on the lake should note that boat access is carry-in only.<h2>Facilities</h2>
The cabin has a wood stove and firewood is provided in addition to the pedestal grill and fire pit outside. The cabin does not have modern bathroom facilities or electricity. There is a hand pump for drinking water just outside the cabin and a pit toilet behind the cabin.  The cabin is furnished with four twin bunk beds with mattresses and seating for eight. You should plan to bring all your own camping equipment including camp stove, dishes, cooking and eating utensils, toilet paper, water containers, lanterns, flashlights, bedding and pillows.
 
There is a gate at the entry road for your use.  You can close it if you wish for privacy, but we ask that you don''t lock it in the event we need to get in for routine maintenance.  We will leave it the way we found it.
During the winter months, the 1/4 mile road into the cabin is not plowed.  One must park in the parking lot provided along Co. Rd. 440 and walk, ski, or snowmobile in.<h2>Natural Features</h2>
Tom''s Lake Cabin is nestled adjacent to Tom''s Lake and is ideal for swimming and fishing. Anglers will enjoy a day on the lake in search of largemouth bass and bluegill.  After a day fishing and swimming, settle in for a wonderful campfire overlooking the lake and relax around the outdoor fire pit lined with a few benches.
The Hiawatha National Forest is rich in wildlife, which includes 312 species that live within the Hiawatha National Forest region including whitetail deer, black bear, grey wolves, coyote, eagles, hawks, and rabbits.  Over 250 species of birds use the Hiawatha, either when migrating through the area, as summer or winter range, or as permanent residents.
<h2>Nearby Attractions</h2>
The cabin is within a short commute of the Big Island Lake Wilderness with its 23 small lakes and portages to challenge the canoeist. The nationally-designated Wild and Scenic Indian River is also nearby, and its 51 miles offer outstanding canoeing and fishing opportunities. <br />
Groceries, gasoline, fishing, camping supplies, boat rentals, ice, MDNR licenses, deli, and restaurants are available on Highway 13.', N'Campground', N'-86.5905556', N'46.1611111', N'906-474-6442 OR 906-387-2512', N'bmadden@fs.fed.us')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (31, N'234658', N'JUNIPER FLATS GROUP CAMPSITE on GRAND ISLAND', N'<h2>Overview</h2>
Juniper Flats Group Campground is one of only a few places to stay on beautiful Grand Island. The island''s scenic natural beauty and interesting history make it a popular place for camping and other outdoor activities.
<br /> <br />
The Grand Island National Recreation Area boasts massive 300-foot wave-cut sandstone cliffs, 13,500 acres of lush forest, beaches of fine sand, winter ice caves and historic buildings and artifacts dating back as far as 2000 B.C.<h2>Recreation</h2>
The island offers more than 30 miles of hiking and mountain biking trails, complete with spectacular scenery. Visitors also enjoy fishing on the island. Anglers will find plentiful salmon, trout, perch, pike, walleye and bass. A variety of wildlife also make its home on the island.
<br /> <br />
Kayaking, canoeing and boating are also popular pastimes. Boats, however, must be anchored offshore because of the rocky lake bottom and heavy surf.<h2>Facilities</h2>
The campground provides one large group tent campsite, equipped with tables and a campfire circle. Vault toilets and drinking water are provided. Bear poles and bear boxes are available for food storage. <br /> <br /><h2>Natural Features</h2>
Juniper Flats Group Campground is located on the west side of Grand Island near the Waterfall and Mather beaches. 
<br /> <br />
The area is heavily forested and primarily shady throughout the day. The campground is situated away from the beach, but the lake is visible from the site.', N'Campground', N'-86.6852778', N'46.4866667', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (32, N'234678', N'HUNGERFORD EQUESTRIAN GROUP CAMPSITE', N'<h2>Overview</h2>
The Hungerford Recreation Area offers access to over 50 miles of trails for horseback riding, hiking and mountain biking. <br/><br/>
The horse trails connect to the group campsite. There are a few small lakes located nearby, including, Hungerford Lake, Toogood Lake and Mud Lake.<h2>Recreation</h2>
Forty-seven plus miles of horseback riding trails and 10 miles of mountain biking trails make the campground an ideal place for both equestrian campers and outdoors enthusiasts. <br/><br/>
Hungerford Lake is located a half mile south of the Hungerford Family Campground and one and a quarter miles south of the Hungerford Equestrian Group Campsite. The area offers fishing and boating opportunities. Horses are not allowed in or around the lake area, but visitors interested in fishing are welcome to cast for bass, pike and pan fish. There is a boat ramp located at the lake.<h2>Facilities</h2>
<p>There are eight individual sites within the group camp area. Each site can accommodate one large horse trailer, two vehicles and eight people. <br><br><br>Picnic tables, lantern posts, fire rings, and picket poles to highline horses are provided at each of the eight sites. A vault toilet, manure disposal area, trash disposal, and large group campfire ring are provided for the campground. Drinking water is available at the Hungerford Campground, located 1.25 miles south of the site.</p>
<p>The group site''s check in and check out time is 12 noon.</p>
<h2>Natural Features</h2>
The campground is perched along lightly rolling hills in the Manistee National Forest. It is about a mile north of Hungerford Lake and the 48 site Hungerford Campground. 
<br/><br/>
The lake spans 30 acres and is a favorite spot to see fall colors. The Manistee National Forest comprises 540,000 acres and meets the eastern shore of Lake Michigan.
<h2>Nearby Attractions</h2>
Visit the city of Big Rapids, Michigan, or the Loda Lake Wildflower Sanctuary. Benton, Indian, Brush, and Shelley lakes are also nearby.', N'Campground', N'-85.6244444', N'43.7166667', N'231-745-4631', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (33, N'233207', N'MARION LAKE GROUP SITE', N'<h2>Overview</h2>
The sparkling Marion Lake offers breathtaking and exciting camping for your next family trip. Live it up on the water with your jet skis or wake board, or tone down the pace with a full day of fishing. The Marion Lake Group Site is an ideal way to spend time with friends and family for all the water activities you can imagine.  
 
Marion Lake is in the Ottawa National Forest, a protected area in the Western Upper Peninsula of Michigan. It stretches from the Lake Superior shoreline to the Wisconsin border, and attracts deer and many types of migrating birds.  <h2>Recreation</h2>
A swim beach is adjacent to the group site.<h2>Facilities</h2>
A convenient path leads to the lake and  boat launch. Water is not available on-site, but is a short walk away.<h2>Natural Features</h2>
The campground is in a large, grassy field surrounded by hemlock and hardwood trees with an opening to Marion Lake. The altitude is 1,627 feet, with lightly rolling hills stretched between the many other lakes in the area.
<h2>Nearby Attractions</h2>
Hiking enthusiasts will find scenic trails throughout the Sylvania Wilderness area, a region to the west with old-growth forests and 34 named lakes. On the way, stop by the Ottawa Visitor Center in Watersmeet for some interesting exhibits.', N'Campground', N'-89.0863889', N'46.2680556', N'906-358-4724', N'mholland@fs.fed.us')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (34, N'234083', N'CARP RIVER CAMPGROUND', N'<h2>Overview</h2>
Nestled in a quiet, rustic setting adjacent to the Carp Wild and Scenic River, Carp River Campground is an ideal place to get away and enjoy the outdoors. 
<br /><br />
The surrounding Hiawatha National Forest provides visitors with countless recreational activities, and the scenery provides a beautiful backdrop for a traditional camping experience. <h2>Recreation</h2>
Divided into two major blocks of land and five districts, the forest is home to Grand Island National Recreation Area, Whitefish Scenic Byway, six lighthouses, five Wildernesses and Clear Lake Education Center. In addition to recreation opportunities, visitors will find a wide array of habitats, including trees like northern hardwoods, jackpine and other conifers, and a variety of inland wetland habitats.
<br /><br />
Fishing is a popular activity in the campground area, and brook, brown and rainbow trout can all be spotted in the Carp River. 
<br /><br />
In addition to the fishing opportunities, hiking canoeing, kayaking, wildlife viewing and more are all available at or around the Carp River Campground.<h2>Facilities</h2>
All campsites are wooded and shaded from the hot summer sun. Each site has a table and a fire ring, and drinking water and vault toilets are conveniently spaced throughout the campground.<h2>Natural Features</h2>
Located in Michigan''s wild and scenic Upper Peninsula, the Hiawatha National Forest is known as &quot;the Great Lakes National Forest.&quot; The forest''s dramatic shorelines lie nestled up to Lakes Superior, Huron and Michigan.
<br /><br />
Outstanding lakeshores, lighthouses, islands and historic sites create a playground and place of respite, all within a day''s drive from major urban and rural areas of Michigan and Wisconsin.
<h2>Nearby Attractions</h2>
Carp River Campground is located just eight miles from St. Ignace, which is known for its fine restaurants, museums and historic sites. <h2>Charges &amp; Cancellations</h2>
<p>Please cancel seven days in advance if you need to cancel your reservation. Reservation sites cannot be traded for walk up sites.</p>
', N'Campground', N'-84.7191667', N'46.0330556', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (35, N'244401', N'M-55: Manistee to Cadillac', N'<p>This section includes all recreation areas along M-55 or a short distance from M-55 located between Cadillac and&nbsp;Manistee, except the Pine and Manistee Rivers.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (36, N'234806', N'Grand Hotel', N'<p>Grand Hotel, built in 1887 and a member of Historic Hotels of America® since 2001, was designated by the U.S. Secretary of the Interior as a National Historic Landmark in 1972.</p><p>Historic Hotels of America is the official program of the National Trust for Historic Preservation® for recognizing and celebrating the finest historic hotels across America.</p>
<p>The all-American Grand Hotel has been an iconic summer resort since it opened in 1887. With a 660-foot-long veranda, the world''s longest, the Victorian-style hotel offers amenities on an equally impressive scale. Seven suites are named for former first ladies Jackie Kennedy, Lady Bird Johnson, Betty Ford, Rosalynn Carter, Nancy Reagan, Barbara Bush, and Laura Bush, all of whom were consulted in the designs. In 2003, Grand Hotel was named as one of America''s Dozen Distinctive Destinations by the National Trust for Historic Preservation. In 2017, Historic Hotels of America honored Grand Hotel''s 130th Anniversary as a steward of history and historical preservation.</p><p>For Price Match Guarantee and Special Offers, please visit <a href="http://www.historichotels.org/hotels-resorts/grand-hotel/?src=180510820">HistoricHotels.org</a>.</p>', N'Facility', N'-84.6248', N'45.851', N'+1 800 678 8946', N'info@historichotels.org')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (37, N'233173', N'BAY FURNACE CAMPGROUND', N'<h2>Overview</h2>
Bay Furnace Campground is located on the south shores of Lake Superior, near Pictured Rocks National Lakeshore. Favorite to many, the campground is centered to various waterfalls, as well as other sightseeing attractions, including boat tours and visits to Grand Island.<h2>Recreation</h2>
Fishing in Lake Superior is best by boat. There is no access to the lake at Bay Furnace, but there is a boat ramp approximately 10 miles west, at AuTrain, and in Munising. Anglers can enjoy a variety of lake trout and salmon fishing.
<br /> <br /> 
Visitors can access the popular Grand Island via a 10-minute ferry ride or by private boat. This scenic island is a favorite for hiking, mountain biking and exploring.
<br /> <br />
Various boat excursions are offered near the campground at an additional cost, providing a great way to explore the crystal clear blue-green waters of Lake Superior and view the stunning natural rock formations.<h2>Facilities</h2>
The campground offers multiple reservable single sites for tent and RV camping. Additional campsites are available on a first-come, first-served basis. Each site is equipped with tables and campfire rings with grills. Accessible vault toilets and drinking water are provided. <br />
<br />
A day-use picnic area is also available at the campground, located near the lake shore. Multiple tables, drinking water and accessible vault toilets are included.<h2>Natural Features</h2>
Visitors can enjoy the scenic views of Lake Superior, with its spectacular sunrises, sunsets and occasional northern lights displays. Amid forests of deciduous trees, some sites overlook the lake while others are near Furnace Creek.
<h2>Nearby Attractions</h2>
Boat ramps are available in Munising, less than 5 miles from the campground, or at AuTrain, which is about 10 miles away.', N'Campground', N'-86.7083333', N'46.4383333', N'', N'bayfurnace@jamadots.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (38, N'233212', N'EWING POINT DISPERSED CAMPSITE', N'<h2>Overview</h2>
Ewing Point is located on the beautiful, 132-acre McKeever Lake in the forests of Michigan. This spacious campground provides a rustic environment in a secluded setting.<h2>Recreation</h2>
Bruno''s Run Hiking Trail weaves throughout the Ewing Point area, offering 9 miles of adventure for hikers. The trail is accessible at various locations, two of which are near the Ewing Point parking area. One section of the trail leads to Grassy Lake, while the other heads along the southeastern portion of McKeever Lake.<br /> 
<br />
McKeever Lake offers great fishing for musky, pike, bass and pan fish, and there is boat access in the parking area. Boats must be carried to the site by hand or through the water. Because the water is quite shallow, large boats are not recommended.<h2>Facilities</h2>
The campsite is equipped with tables and a campfire ring with a grill. A lantern post and pit toilet are also available.<h2>Natural Features</h2>
There is one walk-in campsite on Ewing Point, accessible by a primitive foot trail. The site lies in a grassy area, surrounded by cedar and hemlock.', N'Campground', N'-86.5887389', N'46.2178806', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (39, N'259242', N'D.H. Day Campground', N'<h2>Overview</h2>
<p>D.H. Day Campground is located in the northern district of Sleeping Bear Dunes National Lakeshore, on the lower peninsula of Michigan. </p>
<p>CLICK HERE TO ACCESS A MAP OF D.H. DAY CAMPGROUND: <a href="https://www.nps.gov/slbe/planyourvisit/dhdaycamp.htm" rel="nofollow">https://www.nps.gov/slbe/planyourvisit/dhdaycamp.htm </a> </p>
<p>This rustic campground is one of the most popular in Northern Michigan and is open (weather permitting) from the first Friday in April through the last Sunday in November. Reservations are required May 1 through October 15. Campsites are within walking distance of the Lake Michigan shoreline and a short drive to many popular features in the park. Summer temperatures range from the upper 70s to 90s during the day, and 50s to 70s at night.</p>
<p>As with all NPS sites Sleeping Bear Dunes National Lakeshore is following all CDC guidelines for cleaning and disinfecting public spaces found at: https://www.cdc.gov/.../pdf/Reopening_America_Guidance.pdf This includes routine cleaning of outside surfaces, showers and restrooms, plus twice a day deep cleaning/disinfecting of showers and restrooms using EPA approved disinfectants against Covid-19. Our campground offices have implemented once a day disinfecting at opening, then all touched surfaces will be disinfected after each group uses the office, barriers have been installed on the desks, our staff wear masks, and only one group will be allowed into the office at a time. For more on how the NPS is responding to Covid-19 you can also go to: https://www.nps.gov/aboutus/news/public-health-update.htm Please call the visitor center at 231-326-4700, ext. 5010 if you have a specific question about one of the park''s safety measures. </p>
<h2>Recreation</h2>
<p>Sleeping Bear Dunes National Lakeshores rustic D.H. Day Campground is beautifully wooded. Campers can swim, canoe, kayak, fish and relax along the shoreline of the campground. The multi-use Sleeping Bear Heritage Trail passses through the campground opening up 20+ miles of biking and hiking. There are canoe and bicycle rentals nearby in the village of Glen Arbor. The historic village of Glen Haven is a short 15 minute walk away. Miltiple hiking trails, the Dune Climb, and the Pierce Stocking Scenic Drive are just a short drive away. D.H. Day Campground is the perfect launching point for a fun-filled stay at Sleeping Bear Dunes National Lakeshore.</p>
<h2>Facilities</h2>
<p>With 81 beautifully wooded campsites, shared water spigots, and vault toilets, D.H. Day provides a more rustic camping experience. Free hot showers are available at Platte River Camground, located 17 miles south along highway M-22. Each campsite has a parking area, large picnic table, fire ring and tent pad. Firewood is also sold in the campgound via a self-serve vending trailer. </p>
<h2>Natural Features</h2>
<p>D.H. Day Campground lies in the middle of Sleeping Bear Dunes National Lakeshore near the historic village of Glen Haven. The spacious wooded campsites are no more than a 5 minute walk to the Lake Michigan beach. Features include northern hardwood and conifer forests, old farm meadows, wetlands, lakes, streams, bogs, and splendid examples of glacially formed landscapes. The beautiful perched sand dunes, for which the parked is named, are just a few minutes drive from the campground.   </p>
<h2>contact_info</h2>
For facility specific information, please call (231) 334-4634.
<h2>Nearby Attractions</h2>
<p>D.H. Day Campground is within minutes of the lakeside Village of Glen Arbor and the Historic Village of Glen Haven. The Dune Climb and Pierce Stocking Scenic Drive are a short drive to the south. The Alligator Hill Trail is less than a mile away. The Crystal River winds its way to Lake Michigan just a few short miles to the north. The harbor town of Leland is approx. 30 minutes away and is the gateway to both North and South Manitou Island. </p>
<h2>Charges &amp; Cancellations</h2>
<p>Campers must notify the campground office at 231-334-4634 if they will not arrive within 24 hours of the check-in time or their reservation will be cancelled; They will be charged the first night''s camping fee plus a $20 no show fee.</p>
', N'Campground', N'-86.02006', N'44.89615', N'231-326-4700 ext 5035', N'sleepingbearinfo@nps.gov')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (40, N'251536', N'ISLAND LAKE', N'<h2>Overview</h2>
Island Lake Campground is a small and quiet campground nestled in a mostly pine forest. Island Lake offers great fishing for anglers with small boats or canoes.<h2>Recreation</h2>
Island Lake offers excellent fishing and canoeing or kayaking. Anglers fish for largemouth bass, blue gill and perch. The campground offers fishing from shore. Island Lake Campground features a boat slip for small carry-in boats or canoes. Other popular activities include hiking, biking and ATV trails.<h2>Facilities</h2>
This small campground offers a group site and single-family sites that can be doubled-up to occupy two families. Note: Each family has to pay a site fee if doubled up on one site.<h2>Natural Features</h2>
Although there are a few mixed hardwood trees in the area, this campground is favored by those individuals who like to camp in a classic pine forest setting.
<h2>Nearby Attractions</h2>
There are many waterfalls to see in the area, as well as the popular Pictured Rocks National Lakeshore and Grand Island, located just 15 miles away at Lake Superior.', N'Campground', N'-86.6513889', N'46.2708333', N'', N'dave@camprrm.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (41, N'233849', N'PINES POINT CAMPGROUND', N'<h2>Overview</h2>
Pines Point Campground is located on the banks of the White River with several campsites overlooking the river. The family campground includes a loop designed for groups containing five sites with a capacity of 20 guests each. Large groups can reserve the entire loop.<br /><br /> 
Find out how the campground got its name when you tube or kayak the &acirc;??point&acirc;?? and see the majestic white pines standing watch over the river. Fishing is also popular in these waters.<h2>Recreation</h2>
Fish for trout, salmon and sucker, or float in a canoe, kayak or tube around the point, a leisurely 1 hour float. The canoe landing is walk-in.<h2>Facilities</h2>
Five group campsites and 27 family campsites lie along the river. Each site is equipped with a picnic table, fire ring and lantern post. Drinking water and flush toilets are provided. Electric hookups are not available.<h2>Natural Features</h2>
The campground is quiet and secluded, surrounded by towering white pines and rolling hills.
The White River runs for 23.6 miles on the western side of Michigan''s Lower Peninsula. Summer temperatures are generally around 80 degrees Fahrenheit.
<br /><br />
The Huron-Manistee National Forests extend over almost a million acres, including nearly 6,000 acres of wetlands. The forests provide recreation opportunities for visitors, habitat for fish and wildlife and resources for local industry.
<h2>Nearby Attractions</h2>
Hikers can explore the White River Special Area, a primarily non-motorized area surrounded on three sides by the White River.', N'Campground', N'-86.1194444', N'43.5277778', N'231-745-8760', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (42, N'234662', N'WIDEWATERS CAMPGROUND', N'<h2>Overview</h2>
Widewaters Campground is remotely located on Michigan''s upper peninsula in the Hiawatha National Forest. 
<br /><br />
It sits on a stretch of heavily forested land between Lake Superior and Lake Michigan, near a series of smaller lakes and the Indian River, making it an ideal getaway for anglers and explorers alike.<h2>Recreation</h2>
This small, quiet campground is perfect for fishing, canoeing and kayaking. Anglers enjoy catching brook trout in the area.
<br /> <br />
The 9-mile Bruno''s Run Trail, which winds its way past a host of small lakes in the area, passes directly through the campground and is a popular trail for hiking and biking, as well as snowshoeing and cross-country skiing in the winter.<h2>Facilities</h2>
The campground offers multiple well-spaced single-family sites, available for tent and RV camping. Sites vary from being heavily wooded and private, to open with little privacy. A few waterfront sites have access to the river. Some additional sites are available on a first-come, first-served basis. <br /> 
<br />
Each site is equipped with tables and campfire rings and some have access to grills. Accessible vault toilets and drinking water are provided. <br /> <br />
Boat ramps are available at the campground and also at Fish Lake.<h2>Natural Features</h2>
Widewaters is in a beautiful forest of mature hardwoods, sandwiched between Irwin Lake and Indian River.', N'Campground', N'-86.6283333', N'46.2194444', N'', N'bayfurnace@jamadots.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (43, N'244397', N'Nichols Lake North', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157662905795604" title="Nichols Lake"><img alt="Nichols Lake" height="240" src="https://c2.staticflickr.com/2/1489/24747233313_c73760cd95_n.jpg" width="320" /></a></p><p>In addition to being a trailhead for the North Country Trail, Nichols Lake North is also a day use area.&nbsp; Popular for fishing and swimming, the site is located on Nichols Lake,&nbsp;a short distance from Nichols Lake campground.</p><p><strong><a href="http://www.fs.usda.gov/Internet/FSE_DOCUMENTS/stelprd3807297.pdf" target="external">North Country Trail brochure with map</a></strong>:&nbsp; This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller.</p><p><strong><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157662905795604" target="external">Flickr Photo Album</a> </strong></p>', N'Facility', N'-85.910094', N'43.733343', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (44, N'10076131', N'Carr Lake Campsites', N'<p>Campers will typically find seclusion and privacy at this small, 16 acre lake. The campsite is fairly roomy (70 ft. by 40 ft), grassy, and suitable for 2 families. Access to the lake is by carry-in only and a boat slide has been constructed for small boats or canoes. Limited parking is available. Carr Lake is provides fishing for largemouth bass, yellow perch, northern pike and an occasional brook or brown trout. Carr Creek, both upstream and downstream from the lake, offers a good fishery for brook and brown trout The lake does not have good swimming.</p>', N'Facility', N'-86.508973', N'46.077228', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (45, N'234235', N'MCKEEVER CABIN', N'<h2>Overview</h2>
McKeever Cabin is located in the Hiawatha National Forest in Michigan''s Upper Peninsula, approximately 14 miles south of Munising, Michigan. The Cabin was constructed in 1991 and overlooks the 132-acre McKeever Lake. 
<br/><br/>
While the facility offers little in the way of modern amenities, convenient access to a number of recreational activities, including hunting, fishing, hiking, mountain biking, swimming and cross-country skiing, make this cabin a desirable destination for the outdoors enthusiast.
<br/><br/>
During warmer months, visitors may park their vehicle and access the cabin by foot via a 1,000 ft. trail.  When snow is present, the cabin may be accessed by snowshoe or cross-country skis via a 1-mile trail.<h2>Recreation</h2>
During winter months, visitors can enjoy the McKeever Hills Ski Trail, which offers a quieter, less manicured alternative to highly groomed trails without sacrificing quality. The trail to the cabin connects directly to the ski trail, so visitors can ski right out the cabin door. 
<br/><br/>
The Bruno''s Run Trail offers a 9 mile (14.48 km) loop ideal for hiking and mountain biking in spring, summer and fall and snow shoeing in winter. Although the trail is not groomed for cross-country skiing, it does offer a suitable source for experienced skiers who prefer to break their own way.
<br/><br/>
Seasonal activities also include swimming, canoeing, kayaking and fishing on the lake as well as hunting in designated areas. See the Michigan Department of Natural Resource''s website for information about <a href="http://www.michigan.gov/dnr/0,4570,7-153-10363_14518---,00.html" rel="nofollow">hunting seasons and permits</a>.<h2>Facilities</h2>
The cabin can accommodate up to four people comfortably and a maximum of six people. There are two sets of bunk beds (with 4 mattresses), one table with stools, one counter top, one corner seat and a wood burning stove. There is no longer a loft with a mattress in this cabin.
  
There are no modern bathroom facilities or electricity offered at this cabin. In order to ensure a comfortable stay, visitors must bring several of their own supplies including a camp stove, dishes, cooking utensils, containers for carrying water, toilet paper, lanterns, sleeping bags and pillows.
  
A vault toilet is located just off the trail to the cabin and there is a (summer/winter) hand pump with drinking water located down the trail to the lake. Do not bring firewood from home: firewood will be supplied at the cabin.<h2>Natural Features</h2>
The cabin is situated on a small knoll surrounded by young evergreens and hardwood trees, overlooking the western shores of McKeever Lake. The lake was stocked with northern muskie in 1990, but also supports a good population of northern pike, largemouth bass, smallmouth bass and bluegill.
<br/><br/>
The Big Island Lake Wilderness is located near the cabin and features 23 small lakes ranging in size from 5 to 149 acres. White birch, maple and aspen cover the wooded hills that surround the lakes. Berries, mushrooms and wildflowers grow throughout the area and a wide range of wildlife and waterfowl, including sensitive species, may be carefully observed here.', N'Campground', N'-86.5991667', N'46.2163889', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (46, N'234080', N'BREVOORT LAKE CAMPGROUND', N'<h2>Overview</h2>
Brevoort Lake Campground stretches along the western shore of its namesake in the Hiawatha National Forest. This popular fishing destination is situated on a peninsula that juts into the lake and Beodne Bay. 
  
Visitors to the campground enjoy the easy access to the pristine sandy beaches.<h2>Recreation</h2>
The 4,233-acre Brevoort Lake provides ample opportunities for recreation. Boat access is available from the center of the campground on Boedne Bay. 
<br/> <br/>
In 1985, the Forest Service completed the construction of a walleye spawning reef in Brevoort Lake, providing plentiful fishing in the area. Anglers can also expect healthy populations of pike, bass, perch and a variety of other fish. 
<br/> <br/>
Hiking is also a popular pastime of visitors to the campground. The Ridge, Sand Dunes Cross Country and North Country National Scenic trails pass near the campground. <br/> <br/>
A 10-minute ferry ride to Mackinac Island makes for an interesting day trip. The 3.8-acre island offers hiking, biking, horseback riding and shopping, as well as access to historical sites and museums, among other activities.<h2>Facilities</h2>
The campground offers dozens of reservable single-family campsites for tent and RV camping. Additional sites are available on a first-come, first-served basis. Each site is equipped with tables and campfire rings with grills, and accessible flush toilets, drinking water and a dump station are provided. 
<br/> <br/><h2>Natural Features</h2>
Campsites are somewhat secluded, surrounded by huge pine, hemlock and oak trees and low, shrubby vegetation. Beach grass grows along the lake shore, sometimes buried in light sand.
<h2>Nearby Attractions</h2>
St. Ignace, Michigan, about 20 miles east of the campground, offers historical and tourist attractions as well as grocery and gas services.<h2>Charges &amp; Cancellations</h2>
<p>Please cancel 7 days in advance if you need to cancel your reservation. Reservation sites cannot be traded for walk-up sites.</p>
', N'Campground', N'-84.9722222', N'46.0072222', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (47, N'238168', N'West Zone', N'<p>The West Unit is located in the central of the Upper Peninsula, bordering two of the Great Lakes - Lake Superior and Lake Michigan. The western portion of the Hiawatha extends from the towns of Rapid River and Manistique, along Lake Michigan, to the town of Munising on the Lake Superior shore.  For information about free educational campground programs on these three Ranger Districts, visit the Events page.</p>', N'Facility', N'-86.9741', N'46.0151', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (48, N'232318', N'CAMP SEVEN LAKE CAMPGROUND', N'<h2>Overview</h2>
Camp Seven Lake Campground neighbors the 60-acre Camp Seven Lake, which offers visitors a place to swim, boat and fish. The excellent location, beautiful setting and many available activities make the campground a perfect place to spend a day, the weekend or longer vacation.<h2>Recreation</h2>
Boating is popular among visitors to the Camp Seven Lake area, and anglers looking to find that perfect spot on the lake. Smallmouth bass, bluegills and perch make up the most popular catches.<br /> <br />
The 2-mile Van Winkle Lake loop trail leads hikers to a spectacular paper birch stand overlooking quiet Van Winkle Lake. A variety of waterfowl and wetland wildlife can be spotted along the trail. For a more relaxing stroll, the beach at Camp Seven Lake boasts a paved walking trail.<h2>Facilities</h2>
The campground offers multiple accessible single-family campsites, available for tent and RV camping. For the most part, each site is shaded and private and some are right on the lake. A few sites are available on a first-come, first-served basis. <br /> <br />
Each site is equipped with tables and campfire rings; only a few have grills. Accessible vault toilets and drinking water are provided. A group picnic area can accommodate up to 25 people and offers tables, a campfire circle and a grill.<h2>Natural Features</h2>
The campground is adjacent to Camp Seven Lake, which is situated in the lower third of the Hiawatha National Forest, in Michigan''s Upper Peninsula. The area is home to many bodies of water and plentiful mixed hardwood forests.
<h2>Nearby Attractions</h2>
The town of Garden Corners is about 20 miles from the campground, on the shores of Lake Michigan.', N'Campground', N'-86.5497222', N'46.0577778', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (49, N'238260', N'Moosehead Lake Campground', N'<p>Located in Gogebic County 10 miles southeast of the town of Marenisco, MI, on the Bessemer Ranger District in the southern half of the Ottawa National Forest. Moosehead Lake Campground consists of one camping loop with 13 campsites. All sites are spaced with natural vegetation for screening.  Providing an excellent chance for privacy. This campground provides drive-in sites that can accommodate tents, trailers and motor homes. Each site offers a tent pad, accessible wood table, fire ring and parking spur. Two vault toilets are located in the camping loop, drinking water is provided at a centrally located pressurized faucet. Adjacent to the campground is a boat landing, which provides fishing opportunity''s for a variety of game fish.</p>', N'Campground', N'-89.60451', N'46.241575', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (50, N'233714', N'LAKE MICHIGAN AT MANISTEE', N'<h2>Overview</h2>
Lake Michigan Campground is perched on the shores of Lake Michigan, 15 miles south of Manistee. The area creates an incredible setting with a scenic overlook of the lake and a sandy swimming beach. This family campground provides an array of hiking and biking trails, plus swimming, fishing and kayaking.<h2>Recreation</h2>
A hardwood forest gives way to a beautiful sandy beach at the shores of the lake with a playground for younger campers. Trout fishing in Lake Michigan is another big draw.
<br /><br />
Bird watchers delight in seeing unique species like the piping plover and prairie warbler.
<br /><br />
The Arrowhead Trail, a short loop trail created by Boy Scouts, forms a loop between the campground and the beach. A trailhead for the Nordhouse Dunes Wilderness Area is also within the recreation area.<h2>Facilities</h2>
An amphitheater offers educational programs throughout the peak season. Other amenities include flush and vault toilets, beach access and an overlook deck. Campsites are equipped with picnic tables and pedestal grills. 
<br /><br />
Group campsites can each accommodate a maximum of 50 guests.<h2>Natural Features</h2>
The recreation area sits on the eastern banks of Lake Michigan along Porter Creek, due north of Hamlin Lake. As the second largest of the five Great Lakes, Lake Michigan provides stunning views and limitless options for water recreation. It covers a whopping 22,400 square miles and ranks as the fifth largest lake in the world.
<br /><br />
The Huron-Manistee National Forests encompass nearly a million acres of public protected land. Nearly 6,000 acres is wetlands that extend over the northern portion of Michigan''s Lower Peninsula.
<h2>Nearby Attractions</h2>
The nearby Nordhouse Dunes Wilderness Area has abundant trails for hiking and backpacking.', N'Campground', N'-86.4275', N'44.1191667', N'231-723-0141', N'comments@AmericanLL.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (51, N'234617', N'MONOCLE LAKE', N'<h2>Overview</h2>
Monocle Lake Campground offers a a relaxing place to fish, swim and hike along the shores of scenic Monocle Lake just off Lake Superior. It is located in Michigan''s Upper Peninsula in the northeastern corner of the Hiawatha National Forest.
<br /><br />
The campground is centrally located among many recreational opportunities in the Sault Ste. Marie area, including the Whitefish Bay National Scenic Byway and Tahquamenon Falls.<h2>Recreation</h2>
Monocle Lake is populated with walleye, smallmouth bass, pike and perch. Two man-made reefs lie just off the eastern shore next to the campground, where anglers typically have good luck.
<br /><br />
Swimming and boating are popular activities in the area. Visitors also enjoy hiking the 14.5-mile Monocle Lake Trail. Two miles of the trail have interpretive displays, and the first 1100 feet of the trail are along an elevated, accessible boardwalk. Additional trails are found in the surrounding area.<h2>Facilities</h2>
The campground offers heavily shaded single-family sites for tent and RV camping. Some sites are available on a first-come, first-served basis. Each site is equipped with a table and campfire ring with grill. Accessible vault toilets and drinking water are provided. Hookups are not available.
<br /><br />
A day-use picnic area, adjacent to a fairly large parking area at the campground, provides easy access to a swimming beach. The picnic area is equipped with tables, grills and drinking water, as well as accessible vault toilets. 
A paved boat launch with a parking lot big enough to accommodate vehicles and trailers provides easy access to the beautiful all sports lake.<h2>Natural Features</h2>
The campground surrounds the south end of 172-acre Monocle Lake, and is less than two miles from the historic Point Iroquois Lighthouse. It is nestled in a mixed hardwood forest of aspen, maple, birch and pine trees, providing scenic lake and forest views from anywhere in the campground. Private residences also surround the inland lake.
<h2>Nearby Attractions</h2>
The nearest town is Bay Mills, which is about 6 miles from Monocle Lake. The United States-Canada border, at Sault Ste. Marie, is about 25 miles from the campground. <br />
<br />
Tahquamenon Falls, a series of beautifully brown-colored waterfalls on the Tahquamenon River, is located about 35 miles from Monocle Lake.<h2>Charges &amp; Cancellations</h2>
<p>Please cancel 7 days in advance if you need to cancel your reservation. Reservation sites cannot be traded for walk-in sites.</p>
', N'Campground', N'-84.6391667', N'46.4725', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (52, N'234526', N'SYLVANIA WILDERNESS BACKCOUNTRY CAMPING', N'<h2>Overview</h2>
<p>The Sylvania Wilderness encompasses 18,327 acres of primitive lands and is part of the National Wilderness Preservation System. Visitors can camp in 50 designated campsites within the Sylvania Wilderness. Visitors enjoy endless canoeing, fishing, hiking and wildlife viewing opportunities.</p>
<h2>Recreation</h2>
Sylvania''s abundant lakes provide plentiful non-motorized boating, canoeing, kayaking and fishing opportunities. Other popular activities include hiking and viewing wildlife.<h2>Facilities</h2>
Sylvania Wilderness Backcountry Camp is not a physical campground located at one location. The 50 individual sites are located along eight lakes within the Sylvania Wilderness. Camping is allowed only at designated sites.   
  
Campsites are primitive, but each is equipped with a campfire ring and a wilderness latrine.<h2>Natural Features</h2>
The old-growth forests and pristine lakes in the region provide habitat for a wide range of animal and plant life, including rare orchids, bald eagles, loons and osprey. The wilderness contains 34 named lakes, some with sandy beaches and others surrounded by record-size red and white pines.
  
The Ottawa National Forest is comprised of nearly 1 million acres and is located in the western reaches of Michigan''s Upper Peninsula. The forest''s rolling, tree covered hills extend from the south shore of Lake Superior to the Wisconsin border. Lakes, rivers and waterfalls are found throughout this beautiful landscape.', N'Campground', N'-89.3105556', N'46.2447222', N'906-358-4724', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (53, N'244379', N'Peterson Bridge North Day Use and Boat Launch Area', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157659843405453" title="Pine National Scenic River"><img alt="Pine National Scenic River" height="240" src="https://farm1.staticflickr.com/749/23245515439_f9752b3d7b_z.jpg" width="320" /></a></p><p>Peterson Bridge is the last take-out before Low Bridge. This large landing area sits just before a sharp bend in the river that will take paddlers underneath the M-37 Bridge. A pond area at the site is home to many species of wildflowers and turtles. The picnic shelter was built in the early 1930&#39;s by Civilian Conservation Corps. This site was reconstructed in 2010 and has had many updates and improvements.</p><p><strong><a href="https://go.usa.gov/x9h9C" target="external">Brochure and Map</a>: </strong>This brochure is set to print on&nbsp;11 x&nbsp;17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller.</p><p><strong><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157659843405453" target="external">Flickr Photo Album</a></strong></p>', N'Facility', N'-85.79827', N'44.203284', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (54, N'238177', N'Little Bass Lake Campsites', N'<p>Little Bass Lake, which is an 84 acre lake, offers camping, fishing, and boating in a serene wooded setting. <a href="http://www.fs.usda.gov/Internet/FSE_MEDIA/stelprdb5107723.jpg">Link to Campground Map.</a></p>', N'Campground', N'-86.449685', N'46.164031', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (55, N'233211', N'COOKSON LAKE DISPERSED CAMPSITE', N'<h2>Overview</h2>
Cookson Lake Campsite offers a primitive place to stay in the thick of Michigan''s wilderness. Beautiful forests surround several lakes in the area, providing ample opportunity to enjoy nature in all its forms.<h2>Recreation</h2>
Visitors enjoy swimming and fishing in the 35-acre adjacent lake. Largemouth bass, northern pike, bluegill and bullhead are among the typical catch. Licenses are required for fishing in Michigan waters. 
<br/><br/>
Boating the lake is also a popular pastime, and a boat ramp is located near the campsite.<h2>Facilities</h2>
The campground offers five primitive campsites for tent and RV camping. Each offers tables and campfire rings. A pit toilet is located near one of the sites, but toilet paper is not provided.<h2>Natural Features</h2>
The campsite is located in a large open field on the shores of Cookson Lake. The lake boasts two small islands, and a variety of wildflowers abound in the area during warmer months.
<h2>Nearby Attractions</h2>
Cookson Lake is near the Indian Wild and Scenic rivers and the Big Island Lake Wilderness Area.', N'Campground', N'-86.5615139', N'46.1955972', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (56, N'233174', N'PETES LAKE CAMPGROUND', N'<h2>Overview</h2>
Petes Lake Campground, located in the center of Michigan''s Hiawatha National Forest, is surrounded by several lakes and offers excellent hiking, biking, fishing, boating and more. <br /> 
<br />
Snuggled amongst mixed hardwood trees, the campground offers a swimming beach and day-use picnic area away from the hustle and bustle of city life.
<h2>Recreation</h2>
Visitors enjoy a variety of water-related recreation opportunities. The campground also has fishing pier next to the day-use area. Anglers can expect healthy populations of northern pike, bass, walleye and perch in the lake.<br />
<br />
The nine-mile Bruno''s Run Trail, which winds its way past a host of small lakes in the area, passes directly through the campground and is a popular trail for hiking and biking, as well as snowshoeing and cross-country skiing in the winter.<h2>Facilities</h2>
The campground offers multiple spacious and forested private campsites for tent and RV camping. A few sites overlook the lake.<br /> <br />
Each site is equipped with tables and campfire rings and about half of the sites have access to a grill. Accessible vault toilets and drinking water are provided. <br /> 
<br />
A shaded day-use picnic area at the campground offers multiple tables and benches right on the lake shore. Accessible vault toilets and drinking water are also provided in the picnic area, as well as a fairly large parking area.<h2>Natural Features</h2>
The campground is situated on the upper peninsula of Michigan, on the shores of the 190-acre Petes Lake. It sits amid rolling hills that are forested with a variety of deciduous and conifer trees. Many of the campsites are shaded and private.
<h2>Nearby Attractions</h2>
Big Island, Fish and Straits lakes are all within 25 miles of the campground.
', N'Campground', N'-86.597', N'46.2281889', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (57, N'234655', N'MURRAY BAY GROUP CAMPSITE on GRAND ISLAND', N'<h2>Overview</h2>
Murray Bay Group Campground is located on the southern shores of Grand Island, at the southeastern tip of Lake Superior. The island''s scenic natural beauty and interesting history make it an attractive place for camping and other outdoor activities.
<br /> <br />
The Grand Island National Recreation Area boasts massive 300-foot wave-cut sandstone cliffs, 13,500 acres of lush forest, beaches of fine sand, winter ice caves and historic buildings and artifacts dating back as far as 2000 B.C.<h2>Recreation</h2>
The sandy lake is a popular swimming destination. Boating is also available, however, there is no boat ramp or dock facility at the campground. <br /> <br />
Anglers and hunters frequent the area for its wide variety of fish and game. Licenses are required to participate in either activity. 
<br /> <br />
Visitors also enjoy over 30 miles of hiking and mountain biking trails on the island. A bus tour is also available for those who would like to learn more about the island''s natural and cultural history.<h2>Facilities</h2>
The campground offers a single group campsite that can accommodate up to 25 guests, as well as a day-use picnic area. Both are equipped with tables and campfire rings with grills. 
<br /><br />
Vault toilets and drinking water are also provided. Camping is not allowed at the day-use site. A bear pole and box for food storage are provided at each site.<h2>Natural Features</h2>
Grand Island and the Murray Bay Group Campground are part of the Hiawatha National Forest, near Michigan''s Upper Peninsula. Calm waters and white-sand beaches beckon boaters and swimmers to the area.', N'Campground', N'-86.655175', N'46.4717389', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (58, N'234612', N'SOLDIER LAKE', N'<h2>Overview</h2>
A quiet, relaxing campground with campsites nestled in the pines surrounding Soldier Lake in Michigan''s Upper Peninsula. The campground provides a feeling of remoteness but is still close to roads that lead to some of the best sightseeing the area has to offer.<h2>Recreation</h2>
Non-motorized boating is allowed on Soldier Lake. Swimming is also a popular activity. Two sandy beaches are found within the campground and day use areas.
  
The North Country National Scenic Trail, which winds through several northern states, can be accessed from the day use area.<h2>Facilities</h2>
The rustic campground offers shaded single-family sites for tent and RV camping. Each site is equipped with a table and a campfire ring. Vault toilets and drinking water are provided. No hookups are available.
  
The campground also has two large day-use picnic areas with tables and grills. A sheltered picnic area is equipped with a fireplace. The picnic area has vault toilets and drinking water.<h2>Natural Features</h2>
The campground surrounds 15-acre Soldier Lake. A scenic forest of pine, aspen and maple trees covers the area.
<h2>Nearby Attractions</h2>
The closest town is Strongs, 7 miles west. Services available include a fuel station, restaurants, and a general store.<h2>Charges &amp; Cancellations</h2>
<p>Please cancel 7 days in advance for reservation sites. Reservation sites cannot be transferred to walk-in sites.</p>
', N'Campground', N'-84.8683333', N'46.3505556', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (59, N'238259', N'Henry Lake Campground', N'<p>Located in Gogebic County 9 miles southwest of the town of Marenisco, Mi., on the Bessemer Ranger District in the southern half of the Ottawa National Forest. Henry Lake Campground is a single loop campground with 11 campsites that are spaced with natural vegetation for screening. Henry Lake Campground provides drive-in sites that can accommodate tents, trailers, and motor homes. Each site offers an accessible wood table, fire ring and parking spur. Two single vault toilets are located near the fee station, while water is provided in the camping loop.  Located adjacent to the campground is a boat landing, an accessible toilet, and a trail to an accessible fishing pier providing access to a variety of game fish.</p>', N'Campground', N'-89.791163', N'46.330935', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (60, N'203869', N'Pendills Creek National Fish Hatchery', N'You will want to make Pendills Creek National Fish Hatchery a top destination during your trip through the scenic Hiawatha National Forest in Michigan’s Upper Peninsula. The hatchery is located just a stone''s throw away from the breathtaking Lake Superior shoreline with ample parking at the hatchery maintained access. Pendills Creek National Fish Hatchery has produced lake trout for stocking into the Great Lakes since 1951 and continues to support restoration efforts for this species. Feel free to explore the hatchery on a self-guided tour or call ahead and bring a group to experience seasonal hatchery operations and to see what a million tiny lake trout look like in their temporary homes called raceways. 
', N'Facility', N'-84.82050323', N'46.43999863', N'(906) 437-5231', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (61, N'244403', N'M-37: White Cloud to Baldwin', N'<p>This area covers all recreation areas along M-37 between White Cloud and Baldwin.&nbsp; This does not include trailheads for the North Country National Scenic Trail or Hungerford Recreation Area.</p>', N'Facility', N'-85.842778', N'44.032222', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (62, N'238167', N'East Zone', N'<p>The East Unit is located in the east side of the Upper Peninsula, bordering three of the Great Lakes - Lake Superior, Lake Michigan and Lake Huron. The eastern portion stretches north from the town of St. Ignace, which lies along Lakes Michigan and Huron, to the shore of Lake Superior west of the city of Sault Ste. Marie.</p>', N'Facility', N'-84.831519', N'45.877577', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (63, N'238172', N'Munising Ranger District', N'<p>Munising Ranger District is located on the northern part of the west side of the Hiawatha National Forest. Stop by for up-to-date information and suggestions for your trip.</p>', N'Facility', N'-86.649116', N'46.409211', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (64, N'244322', N'Manistee River Area', N'<p>Portions of the North Country National Scenic Trail run through this area, as well as it being a popular area for hunting and fishing. Aspen is a managed tree in this area, creating good grouse habitat throughout.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (65, N'232001', N'FLOWING WELL CAMPGROUND', N'<h2>Overview</h2>
Flowing Well Campground is situated along the western banks of the Sturgeon River, among large trees and a variety of wildflowers. Camping, fishing, picnicking and canoeing can be enjoyed in a serene setting.<h2>Recreation</h2>
The area is most popular for canoeing and other non-motorized boating, as the Sturgeon River Canoe Trail runs right through the campground. The trail weaves with the river through a 41-mile portion of the heavily wooded Hiawatha National Forest. There are various access points along the river. 
<br /> <br />
Fishing is also popular, with brook trout, steelhead and salmon found in the river.<h2>Facilities</h2>
The campground offers less than a dozen spacious sites for tent and RV camping. Some sites are situated along the bank, overlooking the slow-moving river. <br /> <br />
Each site is equipped with tables and campfire rings, and most come equipped with grills as well. Accessible vault toilets and drinking water are provided. The water from the well has a heavy iron and sulfur content, which is an acquired taste, but is safe to consume. <br /> <br />
A group picnic area is also equipped with tables and campfire rings with grills. It is adjacent to a good-sized parking area. Vault toilets and drinking water are also available.<h2>Natural Features</h2>
The campground is sandwiched between Forest Highway 13 and the Sturgeon River, in the lower portion of Michigan''s Upper Peninsula. It is about 10 miles from the northern shores of Lake Michigan. The region is dotted with wildflowers and mature trees.', N'Campground', N'-86.7070889', N'45.9374667', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (66, N'10072262', N'Loon Lake Day Use Area', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157670091357386" title="Loon Lake Picnic Area"><img alt="Loon Lake Picnic Area" height="240" src="https://c4.staticflickr.com/8/7112/27266026243_2813323100_c.jpg" width="320" /></a></p><p>Loon Lake Day use is a popular picnicking area and swimming beach on a peaceful lake.  The 90-acre lake is mostly surrounded by National Forest System lands. The surrounding landscape is a reminder of the glacial heritage of Michigan. The landscape was deposited and sculpted during the last glacial retreat.</p><p>There is a short nature walk from the parking area that leads to Island Lake Campground. The terrain along the trail is steep.</p><p><strong><a href="http://go.usa.gov/x9h8D" target="external">Brochure and Map</a>: </strong>This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.  To print on 8 1/2 x 11 paper set the print area to "shrink to printable area", this will make the text on the page smaller.</p><p><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157670091357386" target="external"><strong>Flickr Photo Album</strong></a></p>', N'Facility', N'-84.137833', N'44.514587', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (67, N'270656', N'Rapid River/ Manistique Ranger District', N'<p>Rapid River Ranger district is located on the lower half of the west side of  the forest.</p>', N'Facility', N'-86.951992', N'45.926276', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (68, N'234790', N'GRAND ISLAND CABINS', N'<h2>Overview</h2>
Grand Island Cabins are remotely located on forested Grand Island, surrounded by Lake Superior, 1/2 mile off the mainland community of Munising, Michigan.  The cabins are placed in individual settings providing an excellent base for hiking, biking, and other outdoor activities.<h2>Recreation</h2>
Recreation opportunities include: kayaking, biking, hiking, fishing, swimming, beachcombing, and hunting.<h2>Facilities</h2>
Each cabin is 14'' x 16'' with an attached 8'' x 14'' screened in porch and offers four full size beds, bunk bed style.  Maximum sleeping capacity is eight people per cabin.  Picnic table and campfire ring with cooking grate are located just outside each cabin.<h2>Natural Features</h2>
The cabins sit amidst a forest of old-growth trees within walking distance of Lake Superior.  Grand Island''s scenic natural beauty and interesting history make it an attractive place to spend your vacation.  The island''s miles of trails provide ample opportunity to view wildlife, picturesque sunsets, and enjoy pristine beaches.
<h2>Nearby Attractions</h2>
Lake Superior is the largest body of fresh water in the world.  It is the coldest, cleanest, and deepest of the five Great Lakes.    The lakes&rsquo; clear water enables viewing of several shipwrecks from in a boat.', N'Campground', N'-86.6852778', N'46.4866667', N'906-202-1778', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (69, N'244320', N'Bowman Lake Area', N'<p>This area not only has the Pere Marquette River running through it, but also contains a portion of the North Country National Scenic Trail and habitat for the federally endangered Karner blue butterfly.</p><p>The Bowman Lake area is located in Lake and Sweetwater Townships in Lake County. A total of 1,145 acres of NFS lands and 368 acres of private lands are within the boundary of the Bowman Lake area.</p><p>The terrain is characterized by rolling hills, glacial depressions and leatherleaf bogs. A 3-acre lake is located within the area. The area tends to be densely forested with a mix of hardwoods, red and white pine and aspen. Wildlife species that commonly inhabit this area include white-tailed deer, bobcat, coyote, red fox, raccoon, porcupine, squirrels, pileated woodpecker, ruffed grouse, wild turkey and various songbirds.</p><p>Visitor recreation activities include camping, fishing, mushroom gathering, bird-watching, hunting, hiking and canoeing. Mountain biking and horseback riding are also common uses on the area trails. Although trails are not groomed in the winter, the area is popular for snowshoeing and cross-country skiing.</p><p> </p><p>The Bowman Lake Trailhead serves as a main entry point onto the North Country National Scenic Trail (NCT). A 3-mile segment of the NCT is located within this area and mountain biking is allowed on this section of trail. In addition, a small trailhead is located on NFS Road 6267, giving access to the Bowman Lake Campground Trail, which is approximately 7.5 miles of loop trail designed for nonmotorized recreation.</p><p>This trail system can also be used by mountain bikers and horseback riders. Four improved campsites are located on Bowman Lake. Segments of the State of Michigan snowmobile trail system and Michigan Cycle Conservation Club Trail (MCCCT) system are located immediately south of the area.</p>', N'Facility', N'-85.94', N'43.889444', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (70, N'238258', N'Bobcat Lake Campground', N'<p>Located in Gogebic County just 3 miles southeast of Marenisco, Mi., on the Bessemer Ranger District in the southern half of the Ottawa National Forest. Bobcat Lake campground features one loop with 11 campsites. Campsites are bordered by vegetation providing privacy between sites. These drive in sites offer a tent pad, wood table, fire ring, lantern post and gravel parking spur. Two accessible vault toilets are located in the campground and water is provided by a centrally located hand pump in the loop. A sandy beach and day use area, complete with vault toilets, tables, grills and changing house is located 1/2 mile east of the campground.  Also adjacent to the campground is a boat ramp which provides access to a variety of game fish.</p>', N'Campground', N'-89.672941', N'46.35924', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (71, N'232458', N'PLATTE RIVER CAMPGROUND', N'<h2>Overview</h2>
Platte River Campground is located in the southern district of Sleeping Bear Dunes National Lakeshore, on the lower peninsula of Michigan. 
This year-round facility is one of the most popular campgrounds in the park. It is within walking distance of the Platte River and a short walk or drive away from the Lake Michigan shore. Hikers can access many of the area''s day use and backpacking trails just north of the campground.
<br/><br/>
Summer temperatures range from the upper 70s to 90s during the day and 50s to 70s at night. Winters are cold, with daytime highs in the 20s to 30s and lows in the 10s and 20s; snow is usually on the ground from late November through March.<h2>Recreation</h2>
Campers can hike, canoe, kayak and fish on the river or the lake. There are canoe rentals at nearby Platte River Point, where the river meets the lake (the point also has beach access for those wishing to drive there). The Platte Plains trail system boasts more than 25 miles of trails, some of which can be accessed a short walk away from the campground. Trails to the primitive White Pine backcountry campground are also close by.<h2>Facilities</h2>
This facility is well-maintained, well-organized and offers a wide variety of sites, including back-in and pull-through sites with electric hookups for RVs, non-electric sites, walk-to sites, group sites (hike-in, tent-only) and a nearby backcountry campground. Each site has a campfire ring and picnic table. Each loop has restrooms with flush toilets and sinks. Hot showers are also available. The group sites allow no more than 25 people per site; pets and RVs are not permitted in them.<h2>Natural Features</h2>
The campground lies in a wooded area within walking distance of the Platte River and less than two miles away from the beaches of Lake Michigan. Although the lakeshore is long and narrow, it has northern hardwood and conifer forests, abandoned farm meadows, wetlands, lakes, streams, bogs and splendid examples of a glacially formed landscape.
<br/><br/>
The most prominent features in the park, and those for which it is named, are the perched sand dunes above Lake Michigan. The overlooks at Sleeping Bear, Empire and Pyramid Point bluffs are about 400 feet above the lake. With 65 miles of Lake Michigan shoreline and numerous inland lakes and streams, the park is wonderfully water-oriented.', N'Campground', N'-86.1177778', N'44.7127778', N'231-326-4700 ', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (72, N'251845', N'NICHOLS LAKE SOUTH CAMPGROUND', N'<h2>Overview</h2>
Located on the south side of Nichols Lake, the campground and surrounding area offer excellent opportunities for fishing, swimming, picnicking, hiking, camping, or just relaxing.<h2>Recreation</h2>
Fishing and boating are popular activities at Nichols Lake.  There is a paved boat launch at the campground.  This site is one of the locations on the National Forest''s for Kids Fishing Day Events for Michigan''s Free Fishing Day in early June.  Ice fishing is also popular in the winter.  Swimming areas are marked with buoys, but there are no lifeguards.  The North Country National Scenic Trail goes through the site near the boat ramp, providing good hiking opportunities.<h2>Facilities</h2>
Nichols Lake has 29 family sites on paved spurs.  Drinking water, flush toilets, and showers are provided.  Each site has a fire pit and picnic table.  A wood ramp and stairs lead down to the lake from the campground.  A short path along the lake provides access for fishing.<h2>Natural Features</h2>
At 160 acres, Nichols Lake offers shore, pier, and boat fishing. Typical fish species available include bass, bluegill, pumpkinseed, black crappie, and northern pike.  There is a swimming beach and accessible fishing pier available.
<br /><br />
Those wishing to enjoy the day at Nichols Lake will find a day use area located on the north side of the lake.
<h2>Nearby Attractions</h2>
The North Country Trail covers 4,600 miles from Crown Point, NY, to Lake Sakakawea State Park, ND.  The segment that includes Nichols Lake has beautiful sections for both the advanced and weekend hikers.   The nearest towns are Woodland, Bitely, and Brohman, about two miles to the south.', N'Campground', N'-85.9025', N'43.7230556', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (73, N'233255', N'ROLLWAYS CAMPGROUND', N'<h2>Overview</h2>
Rollways Campground is located 7 miles from Hale, Michigan along the beautiful AuSable River. The site was built in 1909 as one of the first campgrounds established in Huron National Forest. The space is small and secluded and features an observation area, picnic grounds and log shelter.. 
<br /><br />
The facility is located just off the River Road National Scenic Byway in northeast Lower Michigan. The byway showcases incredible views of the AuSable River Valley.<h2>Recreation</h2>
Hike on the accessible trail that connects the campground and picnic area to Westgate Scenic Overlook. Bring binoculars and a camera to take advantage of the epic view. 
<br /><br />
The same hiking path passes a stairway leading down to the river where visitors can fish and wade.<h2>Facilities</h2>
The campground offers 19 pull-through campsites with picnic tables, a lantern post, grills, tent pads and campfire rings. At the picnic area, a log shelter, picnic tables and grills are available.
<br /><br />
Vault toilets and drinking water spigots are dispersed throughout the campground and all roads and camping spurs are paved.<h2>Natural Features</h2>
Rollways is perched on a high bluff overlooking Loud Dam Pond on the AuSable River. The river flows from west to east for 138 miles until it reaches the great Lake Huron.
<h2>Nearby Attractions</h2>
Follow the length of the 22-mile River Road National Scenic Byway, which parallels the AuSable River.', N'Campground', N'-83.7736111', N'44.4594444', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (74, N'244315', N'Au Sable Area', N'<p>Along the Au Sable River is the Au Sable Special Area, a 10,628 acre area characterized by flat to gently rolling hills with some steep banks along the Au Sable River. This area is located in Iosco and Alcona counties. The Au Sable Special Area stretches the southern end of Alcona Dam Pond (Bamfield Road) to just before Cook Pond on either side of the river.</p><p>The area is densely forested and inhabited by bald eagles, deer, bear, bobcat, porcupine and various songbirds. Campers and day-use visitors enjoy boating, tubing, rafting, canoeing and fishing on the Au Sable River. Other popular recreation activities include viewing the river and wildlife, hiking, swimming, picnicking, horseback riding, hunting, trapping and berry and mushroom gathering. The Forest Service requires camping permits from May 15 through September 30 at the 19 <a href="http://www.fs.usda.gov/recarea/hmnf/recarea/?recid=18570">designated primitive campsites</a> along the river in this area.</p><p>Two developed campgrounds are located in this area, <a href="http://www.fs.usda.gov/recarea/hmnf/recarea/?recid=18750">South Branch Trail Camp </a>and <a href="http://www.fs.usda.gov/recarea/hmnf/recarea/?recid=18998">Rollways Campground</a>.</p>', N'Facility', N'-83.782222', N'44.5625', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (75, N'244453', N'Au Sable River', N'<p>From Mio Pond to Lake Huron, the Au Sable is primarily managed by the HMNF.&nbsp; The river is managed in two sections, one from Mio Pond to Alcona Dam Pond, the second from Alcona Dam to Lake Huron.</p><p>&nbsp;</p><h2>Au Sable National Wild and Scenic River</h2><p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157659836028984" title="Au Sable National Scenic River"><img alt="Au Sable National Scenic River" height="240" src="https://farm1.staticflickr.com/760/22986653474_5fdfd2aa5d_z.jpg" width="320" /></a></p><p>The Au Sable National Scenic River stretches 23-miles, from Mio to Alcona Pond.</p><p>&nbsp;</p><h2>Au Sable River - Alcona Dam to Lake Huron</h2><p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157667880663884" title="Au Sable River"><img alt="Au Sable River" height="240" src="https://c2.staticflickr.com/8/7331/28130707145_dfe13b8e10_n.jpg" width="320" /></a></p><p>This section provides motorboat opportunities with a lake fishing atmosphere.</p><h3>Highbanks River Trail</h3><p>A short, 7-mile hike along the bluffs of the Au Sable River will provide day hikers with some of the best, and most dramatic, views of the Au Sable River, where hikers or skiers will be able to look over the river valley, with clear views almost to Lake Huron in some spots.</p><h3>Lubmerman&#39;s Monument Visitor Center and Forest Discovery Trial</h3><p>Lumberman&rsquo;s Monument Visitor Center interprets the area&rsquo;s colorful lumbering past. The 14-foot Lumberman&rsquo;s Monument stands on a high bank with the Au Sable River providing a scenic backdrop.</p><h3>River Road National Scenic Byway</h3><p>The twenty-two mile <i>River Road National Scenic Byway</i> extends westward from Lake Huron into the Huron National Forest. It parallels the historic Riviere aux Sable (River of Sand). Lumbermen&rsquo;s Monument Visitor Center sits at the center of the byway.</p><p>&nbsp;</p><h2>Brochures and Maps:</h2><ul><li>Au Sable National Scenic River (<a href="http://go.usa.gov/x9h8F" target="external">pdf</a>)</li><li>River Road National Scenic Byway (<a href="http://go.usa.gov/x9h8j" target="external">pdf</a>) - this brochure shows River Road, the Au Sable River and Lumberman&#39;s Monument</li><li>Highbanks River Trail Map (coming soon)</li><li>Eagle Run Trail Map (coming soon)</li></ul><p><strong>Flickr Photo Albums:</strong></p><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157667880663884" target="external">Au Sable River - Alcona Dam to Lake Huron</a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157661512533399" target="external">Visitor Center</a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157662307594671" target="external">Programs</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157669665916130" target="external">Monument Campground</a></li></ul></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157661473995519" target="external">River Road National Scenic Byway</a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157669379122650">Iargo Springs</a></li></ul></li><li><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157661466674049" target="external">Highbanks River Trail</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157670036127542" target="external">Eagle Run Trail</a></li></ul></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157659836028984" target="external">Au Sable National Scenic River</a></li></ul>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (76, N'233172', N'AuTrain Lake Campground', N'<h2>Overview</h2>
Located at the south end of AuTrain Lake, this campground is favored by anglers and outdoor enthusiasts. 
<br /><br />
The quiet setting is great for family trips, and visitors can enjoy a variety of recreational opportunities year-round, all less than a day''s drive from major urban areas of Michigan and Wisconsin.<h2>Recreation</h2>
The large size of the lake provides miles of prime water skiing, boating, swimming and fishing. Anglers can expect a healthy catch of bass and a variety of perch. Canoeing is also popular on AuTrain Lake and the nearby AuTrain River, which meanders into Lake Superior.<br /> 
<br />
The campground also provides access to the popular two-mile Songbird interpretive trail, which winds through forest and field, along bog and lakeshore, and is popular for birding.
<br /> <br />
A wildlife viewing platform is available at neighboring Buck Bay and Buck Bay Creek.<h2>Facilities</h2>
The campground offers dozens of large, wooded campsites, available for tent and RV camping. Some sites are available on a first-come, first-served basis. Each site is equipped with tables and campfire rings with grills. Accessible vault toilets and drinking water are provided.
<br /> <br />
A boat ramp is available at the parking area of the campground, and the lot offers plenty of space for turning and parking. Boat rentals are available in AuTrain.<h2>Natural Features</h2>
AuTrain Lake is located in the upper peninsula of Michigan, between three of the Great Lakes. It sits amid rolling hills forested with pine and aspen trees, as well as large open and tree-covered wetlands.
<h2>Nearby Attractions</h2>
The city of AuTrain, located on the shores of Lake Superior, is about 5 miles from the campground.', N'Campground', N'-86.8380556', N'46.3916667', N'', N'bayfurnace@jamadots.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (77, N'238175', N'Corner Lake Campground', N'<p>Corner Lake is a 100 acre lake that offers camping, fishing, boating, and a small swimming area for young children. <a href="http://www.fs.usda.gov/Internet/FSE_MEDIA/stelprdb5106219.jpg">Link to Campground Map</a></p>', N'Campground', N'-86.609665', N'46.151623', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (78, N'233715', N'SAND LAKE CAMPGROUND', N'<h2>Overview</h2>
Sand Lake Campground is situated on the scenic shores of Sand Lake and provides a selection of sites shaded by a mixed hardwood forest. Just beyond the trees is a well-loved, sandy swimming beach. The campground is located 15 minutes from the Pine National Scenic River and several other lakes.
<br /><br />
The popular campground sits within the Huron-Manistee National Forests, far enough from town to let its natural splendor shine, but close enough for convenient access to gas and groceries.<h2>Recreation</h2>
Power boating, sailing, canoeing, hiking and swimming are some of the most common activities on the lake. Anglers delight in the waters well-stocked with bluegill, perch and smallmouth bass. A picnic area and boat ramp are available for use.<h2>Facilities</h2>
The campground provides conveniences like coin showers, flush toilets and drinking water faucets. Visitors often rave about the nice, private bathrooms with vanities.<h2>Natural Features</h2>
Sand Lake boasts about 50 acres of mostly shallow waters. The campground is nicely wooded; some sites are heavy shaded while others are much more open. Summertime temperatures are generally around 80 degrees.
<br /><br />
The Huron-Manistee National Forests encompass nearly a million acres of public protected land, including nearly 6,000 acres of wetlands that extend over the northern portion of Michigan''s Lower Peninsula.', N'Campground', N'-85.9294444', N'44.1680556', N'231-723-0141', N'comments@AmericanLL.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (79, N'234734', N'TOM''S LAKE CABIN', N'<h2>Overview</h2>
Tom''s Lake Cabin was built in 1991 and will accommodate up to eight people.  The cabin is situated on a small knoll overlooking Tom''s Lake, a 23 acre lake in the heart of the Hiawatha National Forest.<h2>Recreation</h2>
There are several hiking, biking, and horseback riding trails within a few miles from the cabin, including the Ironjaw semi-primitive area and the Pine Marten Run trail system offering 26 miles of trail.  For the winter enthusiast, snowmobile trails can be found nearby, and the Pine Marten Run trail is frequently used for snowshoeing and cross-country skiing (although the trail is not groomed).
Those trying their hand at fishing on the lake should note that boat access is carry-in only.<h2>Facilities</h2>
The cabin has a wood stove and firewood is provided in addition to the pedestal grill and fire pit outside. The cabin does not have modern bathroom facilities or electricity. There is a hand pump for drinking water just outside the cabin and a pit toilet behind the cabin.  The cabin is furnished with four twin bunk beds with mattresses and seating for eight. You should plan to bring all your own camping equipment including camp stove, dishes, cooking and eating utensils, toilet paper, water containers, lanterns, flashlights, bedding and pillows.
 
There is a gate at the entry road for your use.  You can close it if you wish for privacy, but we ask that you don''t lock it in the event we need to get in for routine maintenance.  We will leave it the way we found it.
During the winter months, the 1/4 mile road into the cabin is not plowed.  One must park in the parking lot provided along Co. Rd. 440 and walk, ski, or snowmobile in.<h2>Natural Features</h2>
Tom''s Lake Cabin is nestled adjacent to Tom''s Lake and is ideal for swimming and fishing. Anglers will enjoy a day on the lake in search of largemouth bass and bluegill.  After a day fishing and swimming, settle in for a wonderful campfire overlooking the lake and relax around the outdoor fire pit lined with a few benches.
The Hiawatha National Forest is rich in wildlife, which includes 312 species that live within the Hiawatha National Forest region including whitetail deer, black bear, grey wolves, coyote, eagles, hawks, and rabbits.  Over 250 species of birds use the Hiawatha, either when migrating through the area, as summer or winter range, or as permanent residents.
<h2>Nearby Attractions</h2>
The cabin is within a short commute of the Big Island Lake Wilderness with its 23 small lakes and portages to challenge the canoeist. The nationally-designated Wild and Scenic Indian River is also nearby, and its 51 miles offer outstanding canoeing and fishing opportunities. <br />
Groceries, gasoline, fishing, camping supplies, boat rentals, ice, MDNR licenses, deli, and restaurants are available on Highway 13.', N'Campground', N'-86.5905556', N'46.1611111', N'906-474-6442 OR 906-387-2512', N'bmadden@fs.fed.us')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (80, N'234658', N'JUNIPER FLATS GROUP CAMPSITE on GRAND ISLAND', N'<h2>Overview</h2>
Juniper Flats Group Campground is one of only a few places to stay on beautiful Grand Island. The island''s scenic natural beauty and interesting history make it a popular place for camping and other outdoor activities.
<br /> <br />
The Grand Island National Recreation Area boasts massive 300-foot wave-cut sandstone cliffs, 13,500 acres of lush forest, beaches of fine sand, winter ice caves and historic buildings and artifacts dating back as far as 2000 B.C.<h2>Recreation</h2>
The island offers more than 30 miles of hiking and mountain biking trails, complete with spectacular scenery. Visitors also enjoy fishing on the island. Anglers will find plentiful salmon, trout, perch, pike, walleye and bass. A variety of wildlife also make its home on the island.
<br /> <br />
Kayaking, canoeing and boating are also popular pastimes. Boats, however, must be anchored offshore because of the rocky lake bottom and heavy surf.<h2>Facilities</h2>
The campground provides one large group tent campsite, equipped with tables and a campfire circle. Vault toilets and drinking water are provided. Bear poles and bear boxes are available for food storage. <br /> <br /><h2>Natural Features</h2>
Juniper Flats Group Campground is located on the west side of Grand Island near the Waterfall and Mather beaches. 
<br /> <br />
The area is heavily forested and primarily shady throughout the day. The campground is situated away from the beach, but the lake is visible from the site.', N'Campground', N'-86.6852778', N'46.4866667', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (81, N'244404', N'Wakeley Lake Area', N'<p>Recreation areas near the Wakeley Lake Area.&nbsp; This is the section of the Huron National Forest furthest west, and most sites are located along or north of M-72.&nbsp;</p>', N'Facility', N'-84.509175', N'44.633085', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (82, N'244402', N'Manistee River', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157664674562850" title="Manistee National Recreation River"><img alt="Manistee National Recreation River" height="240" src="https://farm2.staticflickr.com/1445/25375562445_1e0dc3a721.jpg" width="320" /></a>The Manistee River, from Tippy Dam to the M-55 Bridge, is a designated National Recreation River.&nbsp; There are several river access sites, day use areas and campgrounds located along this section of river.&nbsp; During the summer the river is popular with canoers and kayakers, while during the fall salmon season, sites such as Suicide Bend and Sawdust Hole are popular with anglers.</p><p>The section north of Tippy Dam, up to Hodenpyl Dam Pond, is bordered on either side by the Manistee River Trail and the North Country National Scenic Trail.&nbsp; This area is also within the Manistee River Semi-Primitive Nonmotorized Area, a 7,900 acre area of the Forest.</p><p>&nbsp;</p><p><strong>Brochure with map</strong>:</p><ul><li><a href="https://go.usa.gov/x9h9c" target="external">Manistee River</a></li><li><a href="https://go.usa.gov/x9h8P" target="external">Manistee River Trail</a></li><li><a href="http://go.usa.gov/x9h9Y" target="external">Disc Golf Course Map</a></li></ul><p>This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller.</p><p>&nbsp;</p><p><strong>Flickr Photo Albums</strong></p><ul><li><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157664674562850" target="external">Manistee River</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157662417865276" target="external">Manistee River Trail</a></li></ul>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (83, N'234620', N'THREE LAKES', N'<h2>Overview</h2>
Three Lakes Campground is a peaceful facility tucked away from the busy highway. It is nestled between Whitmarsh, Brown and Walker Lakes, giving visitors ample opportunity to enjoy and explore nature at its best.<h2>Recreation</h2>
The three lakes are open to non-motorized boating. A carry-down boat ramp is located at the campground''s picnic area. Fishing is a popular activity. Rainbow trout, perch and catfish are found in the lakes. Although there is no designated swimming beach, sandy areas are located along the shores of the three lakes. 
<br/><br/>
Hikers enjoy the serene atmosphere of the campground. The Walker Loop Trail begins within the campground, near the picnic area, and leads hikers around the perimeter of Walker Lake. The trail is easy hiking and traverses about 1.15 miles.<h2>Facilities</h2>
Three Lakes Campground is a rustic campground with single-family sites for tent and RV camping. Each is equipped with a table and campfire ring. Vault toilets and drinking water are provided. A day-use picnic area is also available.<h2>Natural Features</h2>
The campground is set among a variety of pine, spruce and maple trees on land sandwiched between Lake Superior and Lake Michigan. Whitmarsh, Brown and Walker Lakes dot the landscape to the north, south, and west of the campground.
<h2>Nearby Attractions</h2>
The nearest town is Strongs, just 2.5 miles from the campground.', N'Campground', N'-84.9788889', N'46.3191667', N'(906) 643-7900', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (84, N'233769', N'GLEASONS LANDING ', N'<h2>Overview</h2>
Gleasons Landing is a very popular campground on the banks of the Pere Marquette River. With a selection of shaded and secluded spots, the campground is perfect for peaceful nature immersion.
<br /><br />
The Pere Marquette River was designated a National Scenic River in 1978, the first in Michigan, and it regularly attracts many canoeing, kayaking and fishing enthusiasts. The 66-mile stretch of river begins east of Baldwin and empties into Lake Michigan at Ludington.<h2>Recreation</h2>
A major draw to the campground is world-class fishing. The free flowing river maintains large populations of resident brown trout, steelhead and salmon. Gleason Landing marks the start of a zone for fly fishing and catch and release only. Reel fishing is available upstream. A boat ramp is located within the campground.
<br /><br />
Canoeing and kayaking is very popular on the river, and boat rentals are available in Baldwin. A permit is required to float the river from Memorial Day weekend through Labor Day weekend.
<br /><br />
Trails along the river provide shore access for anglers and short, scenic nature walks for hikers.<h2>Facilities</h2>
The walk-in campsites promise lovely views of the river. Family sites are each equipped with a picnic table, lantern post and campfire ring. Two group sites can accommodate up to 20 people each. Drinking water is provided but no hookups are available.<h2>Natural Features</h2>
The campground sits on a bluff overlooking the picturesque Pere Marquette River. It is surrounded by a mix of white pine and oak trees.
<br /><br />
The Huron-Manistee National Forests encompass a million acres throughout the northern portion of Michigan''s Lower Peninsula. The forests provide recreation opportunities for visitors, habitat for fish and wildlife and resources for local industry.
<h2>Nearby Attractions</h2>
A trailhead for the North Country National Scenic Trail is a short drive away. The trail extends from New York to North Dakota, spanning 4,600 miles.', N'Campground', N'-85.9202778', N'43.8711111', N'231-745-8760', N'comments@AmericanLL.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (85, N'244316', N'Cooke Area', N'<p>The 2,419 acre Cooke area is located in Oscoda Township in Iosco County, Michigan</p><p>The terrain is mostly lowlands. Much of the area is densely forested with a mix of conifers including cedar, fir and red and white pine. Pockets of aspen and open areas also occur in the area. Wildlife species that commonly inhabit this area include white-tailed deer, bald eagles, swans, raccoon, porcupine, squirrel, pileated woodpecker and various songbirds.</p><p>Dispersed camping is a popular activity at the eight <a href="http://www.fs.usda.gov/recarea/hmnf/recarea/?recid=18570">designated campsites </a>along the southern boundary of the area. From May 15 through September 30, permits are required to camp at these sites. Boating and fishing on the Au Sable River are very popular in this area. Other recreation activities include deer and small-game hunting, berry picking and bird watching.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (86, N'234130', N'AUSABLE RIVER CAMPING', N'<h2>Overview</h2>
AuSable River Dispersed Camping is a unique series of 102 individually designated single-family campsites on a 55-mile stretch of the lovely AuSable River. All campsites are within Alcona and Iosco Counties in Michigan. 
<br /><br />
These rustic sites are divided into sections near Alcona Pond, the AuSable Semi-Primitive Non-Motorized Area, Loud Pond, Five Channels Pond, Cooke Pond, Foote Pond and Lower Ausable. Each are ideal for family camping, with opportunities for fly fishing, swimming, canoeing and bird watching.<h2>Recreation</h2>
Both river and lake fishing are available for perch, bass and pike walleye. One recommended spot is the Whirlpool Angler access point. All sites are also near the River Road National Scenic Byway, which offers wonderful views of the river valley.
<br /><br />
The campground has boat-in camping, and canoe rentals are available in Glennie, Hale, Mio and Oscoda.<h2>Facilities</h2>
All sites are primitive with no drinking water, toilets or trash removal. Campers are expected to bring plenty of water, portable toilets and garbage bags. Parking aprons are dirt or gravel.<h2>Natural Features</h2>
Campsites sit on bluffs that range from five to 300 feet above the waterline of the lower AuSable River. Depending on the site, access to the river may be difficult due to steep or eroding slopes.<br /><br />
The AuSable River meanders across 138 miles of Michigan and flows into the great lake, Lake Huron.', N'Campground', N'-83.6238889', N'44.4352778', N'989-362-8961', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (87, N'238200', N'Hovey Lake Campsites', N'<p>This isolated, quiet, family type camping area is located on the east side of Hovey Lake. It is a good place for canoeing, bird watching, or just enjoying nature¿s surroundings. There are 4 campsites, each with a table and fire ring. Toilets and drinking water are available. Swimming conditions in this lake are not good due to shallow water and the mucky bottom. Some northern pike, black bass, and panfish can be caught here. The 99 acre Hovey Lake is the headwaters of the Indian Wild and Scenic River and offers good trout fishing. There is a carry-in boat access near the entrance of the campground.</p>', N'Campground', N'-86.698681', N'46.288597', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (88, N'234763', N'ROUND LAKE', N'<h2>Overview</h2>
Round Lake Campground offers a scenic, rustic, wooded camping area offering a wide variety of recreation opportunities in the Huron-Manistee National Forest in Michigan.<h2>Recreation</h2>
There is a wide variety of recreational opportunities located in and around the campground.  Anglers can fish for sunfish, bass and pike while campers can relax at the sandy beach. The campground has a gravel boat ramp.<h2>Facilities</h2>
Round Lake Campground has 33 sites in two camping loops.  Approximately a quarter of the sites in this campground have access to water. Amenities at the campground include vault toilets and garbage service along with picnic tables and campfire rings at each campsite.<h2>Natural Features</h2>
Round Lake''s 91-acres is mostly surrounded by private land.  Round Lake Campground provides the only public access to the lake.<br /><br />
Nearby Sand Lake Picnic and Swimming Area are located on the 248-acre Sand Lake. The beach and picnic area provide the only public access to Sand Lake.
<h2>Nearby Attractions</h2>
The campground is located in the village of Sand Lake, MI and groceries and fuel are nearby. Lumberman''s Monument Visitor''s Center is less than 15 miles from the campground.  There are hiking trails nearby, a picnic day use area on nearby Sand Lake, bird watching, and hunting opportunities.', N'Campground', N'-83.6644444', N'44.3427778', N'989-739-0728', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (89, N'244451', N'Wagner Lake Area', N'<p>This section contains information on the sites located in the southern section of the Huron National Forest.&nbsp;</p>', N'Facility', N'-84.147089', N'44.553715', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (90, N'238236', N'Kenton  Ranger District', N'<p>The Kenton Ranger District is the largest and oldest district on the Ottawa, dating back to 1931, when the forest had only one district. The recreation program includes a wide variety of dispersed activities including hunting, fishing, remote camping and hiking including two wildernesses, snowmobiling on numerous maintained trails, recreational driving with a variety of potential destinations including lakes, waterfalls and other scenic attractions. Developed recreation includes 7 campgrounds (3 on rivers, 4 on lakes), 2 waysides on M-28 and a CCC era organizational camp, which is used seasonally by a wide variety of organizations for outdoor education and other purposes.</p><p>The McCormick Wilderness and The Sturgeon Gorge Wilderness are located on the District.<br />The district is a premium spot for the outdoorsman. Whitetail deer are numerous. Black bear are common and getting more numerous. Upland game birds include ruffed grouse and woodcock. There is some local Canada geese and ducks in addition to migrants, which concentrate on local farm fields and Michigan DNR wildlife projects. Wild turkey hunting is also available with a two-hour drive. Fishing includes brook, rainbow and German brown trout, Chinook and Coho salmon, walleye, large and small mouth bass, northern pike, musky and numerous species of pan fish. The area is also home to a wide variety of other wildlife including moose, gray (timber) wolves, fisher, pine marten, bald eagles, osprey, loons, river otter, bobcat, mink, beaver and many more. Sightings of bald eagle are common occurrences with local population being among the highest in the Midwest along with numerous nesting sites. In general, it is a good place if you enjoy clean air, water, outdoor experiences and nature.<br />&nbsp;</p>', N'Facility', N'-88.8915', N'46.4861', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (91, N'233207', N'MARION LAKE GROUP SITE', N'<h2>Overview</h2>
The sparkling Marion Lake offers breathtaking and exciting camping for your next family trip. Live it up on the water with your jet skis or wake board, or tone down the pace with a full day of fishing. The Marion Lake Group Site is an ideal way to spend time with friends and family for all the water activities you can imagine.  
 
Marion Lake is in the Ottawa National Forest, a protected area in the Western Upper Peninsula of Michigan. It stretches from the Lake Superior shoreline to the Wisconsin border, and attracts deer and many types of migrating birds.  <h2>Recreation</h2>
A swim beach is adjacent to the group site.<h2>Facilities</h2>
A convenient path leads to the lake and  boat launch. Water is not available on-site, but is a short walk away.<h2>Natural Features</h2>
The campground is in a large, grassy field surrounded by hemlock and hardwood trees with an opening to Marion Lake. The altitude is 1,627 feet, with lightly rolling hills stretched between the many other lakes in the area.
<h2>Nearby Attractions</h2>
Hiking enthusiasts will find scenic trails throughout the Sylvania Wilderness area, a region to the west with old-growth forests and 34 named lakes. On the way, stop by the Ottawa Visitor Center in Watersmeet for some interesting exhibits.', N'Campground', N'-89.0863889', N'46.2680556', N'906-358-4724', N'mholland@fs.fed.us')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (92, N'234083', N'CARP RIVER CAMPGROUND', N'<h2>Overview</h2>
Nestled in a quiet, rustic setting adjacent to the Carp Wild and Scenic River, Carp River Campground is an ideal place to get away and enjoy the outdoors. 
<br /><br />
The surrounding Hiawatha National Forest provides visitors with countless recreational activities, and the scenery provides a beautiful backdrop for a traditional camping experience. <h2>Recreation</h2>
Divided into two major blocks of land and five districts, the forest is home to Grand Island National Recreation Area, Whitefish Scenic Byway, six lighthouses, five Wildernesses and Clear Lake Education Center. In addition to recreation opportunities, visitors will find a wide array of habitats, including trees like northern hardwoods, jackpine and other conifers, and a variety of inland wetland habitats.
<br /><br />
Fishing is a popular activity in the campground area, and brook, brown and rainbow trout can all be spotted in the Carp River. 
<br /><br />
In addition to the fishing opportunities, hiking canoeing, kayaking, wildlife viewing and more are all available at or around the Carp River Campground.<h2>Facilities</h2>
All campsites are wooded and shaded from the hot summer sun. Each site has a table and a fire ring, and drinking water and vault toilets are conveniently spaced throughout the campground.<h2>Natural Features</h2>
Located in Michigan''s wild and scenic Upper Peninsula, the Hiawatha National Forest is known as &quot;the Great Lakes National Forest.&quot; The forest''s dramatic shorelines lie nestled up to Lakes Superior, Huron and Michigan.
<br /><br />
Outstanding lakeshores, lighthouses, islands and historic sites create a playground and place of respite, all within a day''s drive from major urban and rural areas of Michigan and Wisconsin.
<h2>Nearby Attractions</h2>
Carp River Campground is located just eight miles from St. Ignace, which is known for its fine restaurants, museums and historic sites. <h2>Charges &amp; Cancellations</h2>
<p>Please cancel seven days in advance if you need to cancel your reservation. Reservation sites cannot be traded for walk up sites.</p>
', N'Campground', N'-84.7191667', N'46.0330556', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (93, N'238235', N'Iron River Ranger District', N'<p>Iron River is located in Iron County, in the western portion of Michigan''s Upper Peninsula, just seven miles from the Wisconsin border. The border is shared with the Nicolet National forest. The Iron River Ranger District is 138,000 acres in size.  Recreation opportunities include two camping for fee campgrounds and two rustic campgrounds. Three wilderness areas are located on adjacent districts. The area''s climate is truly unique for each season of the year. The weather is summarized as follows: 31 inches of average annual precipitation, 68 inches of snowfall, an average of 62 frost-free days, 59 degree F. average temperature May through September, and long cold winters.<br />Four-season recreation is Iron County''s claim to fame. 2,175 lakes and 902 miles of streams offer unlimited challenges for both warm and cold-water fishing. Three rivers on the district have recently been designated as recreational rivers under the Wild and Scenic rivers Act. Northern hardwoods, pine, balsam fir, and spruce cover 80% of the county. More whitetail deer Boone and Crockett entries have been taken from the forests of Iron County than any other Michigan county. Add to this, the title of woodcock capital of the world and one cannot find any better small and big game hunting anywhere in the Midwest.<br />When winter arrives, it''s no time to rest. 212 miles of snowmobile trails connect to a vast system of trails throughout upper Michigan and northern Wisconsin. The Iron River District, in cooperation with Covenant Point Bible Camp, grooms and maintains a Nordic ski trail, and Ski Brule, a major ski resort, is just minutes from town.</p><p><br />&nbsp;</p>', N'Facility', N'-89.1751', N'46.262', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (94, N'232319', N'COLWELL LAKE CAMPGROUND', N'<h2>Overview</h2>
Colwell Lake Campground is situated on Colwell Lake in the center of Michigan''s Hiawatha National Forest. Guests of all ages can enjoy nature and the outdoors in this picturesque setting. <br /><br />
The campground has much to offer in terms of recreation, such as swimming, fishing, boating and picnicking, and can accommodate families, individuals, small groups, RV and tent campers with several amenities.<h2>Recreation</h2>
With an excellent swimming beach, boat access and an accessible fishing pier, Colwell Lake has plenty to offer families and anglers. <br /><br />
Largemouth bass, northern pike, crappie, pumpkinseed sunfish, perch and bluegill are all available in the lake. The facility also provides a leisurely 2 mile hiking and snowshoeing trail.<h2>Facilities</h2>
The campground consists of many individual family sites, as well as a group site that can hold 24 people and two tent-only sites along the lake shore. Sites are equipped with campfire rings, lantern posts and tent pads, with vault toilets and drinking water located throughout the facility.
<br /><br />
A picnic area sits adjacent to the sandy swimming beach. Pedestal grills and tables for individual families or small groups are provided.
<br /><br />
Boaters will find a boat ramp and launching pier near the campground entrance. There is adequate space for parking and a trailer turn-around.<h2>Natural Features</h2>
The campground is situated on Michigan''s Upper Peninsula, on the eastern shore of the 145-acre Colwell Lake. The area is forested with a variety of deciduous and conifer trees, and some campsites overlook the water.
<h2>Nearby Attractions</h2>
Big Island, Fish and Straits lakes are all within 25 miles of the campground.', N'Campground', N'-86.4375', N'46.2216667', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (95, N'238174', N'St. Ignace Ranger District', N'<p>St. Ignace Ranger district is located on the lower half of the east side of the forest. </p>', N'Facility', N'-84.831519', N'45.877577', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (96, N'238257', N'Bessemer Ranger District', N'<p>Bessemer Ranger District has a variety of traditional lands, fisheries, and timber programs with new challenges in wildlife partnerships, in recreation (Region 9''s only Harbor) and with management of our Wild and Scenic Rivers, and Scenic Byway. The district has an excellent reputation for being team participants at both the district and Forest levels.</p><p>There is something for everyone with 32 waterfalls; 1200 miles of rivers and streams; over 1,100 lakes; and 30 miles of Lake Superior shoreline just 15 minutes north on County Road 513.&nbsp;</p><p>It''s a perfect spot for fishing, picnicking, swimming, boating, canoeing, hiking, camping and hunting for grouse, black bear, and white tailed deer. BESSEMER''S Fourth of July celebration and Pumpkinfest are among the finest in the Midwest, and involves the whole community. A Lake Superior fishing derby on Labor Day ushers in the fall color and salmon run for the Black River Harbor area.</p><p>The Black River Harbor Recreational Area is a popular destination for many when visiting the Bessemer Ranger District.&nbsp; This recreational area provides a marina/harbor, campground, watersfalls, access to the North Country Trail.&nbsp; </p><p>BESSEMER is in the heart of Big Snow country where fresh powder graces four ski resorts with novice to expert trails atop three mountain ranges; kilometers of groomed cross-country trail;&nbsp; The almost one million acre Ottawa National Forest is located throughout the western half of the Upper Peninsula. The forest has five ranger districts and a nursery that serves the Great Lakes area. The Eastern Time zone cuts across the heart of the Forest.</p><p>&nbsp;</p>', N'Facility', N'-89.721', N'46.395', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (97, N'244401', N'M-55: Manistee to Cadillac', N'<p>This section includes all recreation areas along M-55 or a short distance from M-55 located between Cadillac and&nbsp;Manistee, except the Pine and Manistee Rivers.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (98, N'244350', N'Sawmill Point Boat Launch', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157667880663884" title="Au Sable River"><img alt="Au Sable River" height="240" src="https://c2.staticflickr.com/8/7331/28130707145_dfe13b8e10_n.jpg" width="320" /></a>This site is adjacent to primitive campsites on Cook Pond. The boat ramp is gravel. This is a small site that gets full quickly on summer weekends.&nbsp; Other Cooke Pond launches are located at Pine Acres and at Cooke Dam.</p><p><strong>Brochure with map</strong>:</p><ul><li>River Road National Scenic Byway (<a href="http://go.usa.gov/x9h8j" target="external">pdf</a>) - this brochure shows River Road, the Au Sable River and Lumberman&#39;s Monument</li><li>Highbanks River Trail Map (coming soon)</li><li>Eagle Run Trail Map (coming soon)</li></ul><p>The brochure is set to print on 11 x 17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller. The trail maps are set to printon 8.5x11 paper.</p><p><strong>Flickr Photo Albums:</strong></p><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157667880663884" target="external">Au Sable River - Alcona Dam to Lake Huron</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157661512533399" target="external">Visitor Center and Grounds </a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157662307594671" target="external">Programs</a></li></ul></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157661473995519" target="external">River Road National Scenic Byway</a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157669379122650">Iargo Springs</a></li></ul></li><li><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157661466674049" target="external">Highbanks River Trail</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157670036127542" target="external">Eagle Run Trail</a></li></ul>', N'Facility', N'-83.607978', N'44.457699', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (99, N'238262', N'Langford Lake Campground', N'<p>This rustic campground is located 11 miles to the southeast of Marenisco, Mi., on the Bessemer Ranger District. Langford Lake Campground features a single loop with 11 campsites.  The campsites are spaced with natural vegetation for screening.  Each site offers an accessible wood table, fire ring, and a parking spur.  Two vault toilets are located in the camping loop and drinking water is provided at a centrally located hand pump.  Adjacent to the campground is the boat landing and parking area.</p>', N'Campground', N'-89.492941', N'46.272173', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (100, N'233173', N'BAY FURNACE CAMPGROUND', N'<h2>Overview</h2>
Bay Furnace Campground is located on the south shores of Lake Superior, near Pictured Rocks National Lakeshore. Favorite to many, the campground is centered to various waterfalls, as well as other sightseeing attractions, including boat tours and visits to Grand Island.<h2>Recreation</h2>
Fishing in Lake Superior is best by boat. There is no access to the lake at Bay Furnace, but there is a boat ramp approximately 10 miles west, at AuTrain, and in Munising. Anglers can enjoy a variety of lake trout and salmon fishing.
<br /> <br /> 
Visitors can access the popular Grand Island via a 10-minute ferry ride or by private boat. This scenic island is a favorite for hiking, mountain biking and exploring.
<br /> <br />
Various boat excursions are offered near the campground at an additional cost, providing a great way to explore the crystal clear blue-green waters of Lake Superior and view the stunning natural rock formations.<h2>Facilities</h2>
The campground offers multiple reservable single sites for tent and RV camping. Additional campsites are available on a first-come, first-served basis. Each site is equipped with tables and campfire rings with grills. Accessible vault toilets and drinking water are provided. <br />
<br />
A day-use picnic area is also available at the campground, located near the lake shore. Multiple tables, drinking water and accessible vault toilets are included.<h2>Natural Features</h2>
Visitors can enjoy the scenic views of Lake Superior, with its spectacular sunrises, sunsets and occasional northern lights displays. Amid forests of deciduous trees, some sites overlook the lake while others are near Furnace Creek.
<h2>Nearby Attractions</h2>
Boat ramps are available in Munising, less than 5 miles from the campground, or at AuTrain, which is about 10 miles away.', N'Campground', N'-86.7083333', N'46.4383333', N'', N'bayfurnace@jamadots.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (101, N'259242', N'D.H. Day Campground', N'<h2>Overview</h2>
<p>D.H. Day Campground is located in the northern district of Sleeping Bear Dunes National Lakeshore, on the lower peninsula of Michigan. </p>
<p>CLICK HERE TO ACCESS A MAP OF D.H. DAY CAMPGROUND: <a href="https://www.nps.gov/slbe/planyourvisit/dhdaycamp.htm" rel="nofollow">https://www.nps.gov/slbe/planyourvisit/dhdaycamp.htm </a> </p>
<p>This rustic campground is one of the most popular in Northern Michigan and is open (weather permitting) from the first Friday in April through the last Sunday in November. Reservations are required May 1 through October 15. Campsites are within walking distance of the Lake Michigan shoreline and a short drive to many popular features in the park. Summer temperatures range from the upper 70s to 90s during the day, and 50s to 70s at night.</p>
<p>As with all NPS sites Sleeping Bear Dunes National Lakeshore is following all CDC guidelines for cleaning and disinfecting public spaces found at: https://www.cdc.gov/.../pdf/Reopening_America_Guidance.pdf This includes routine cleaning of outside surfaces, showers and restrooms, plus twice a day deep cleaning/disinfecting of showers and restrooms using EPA approved disinfectants against Covid-19. Our campground offices have implemented once a day disinfecting at opening, then all touched surfaces will be disinfected after each group uses the office, barriers have been installed on the desks, our staff wear masks, and only one group will be allowed into the office at a time. For more on how the NPS is responding to Covid-19 you can also go to: https://www.nps.gov/aboutus/news/public-health-update.htm Please call the visitor center at 231-326-4700, ext. 5010 if you have a specific question about one of the park''s safety measures. </p>
<h2>Recreation</h2>
<p>Sleeping Bear Dunes National Lakeshores rustic D.H. Day Campground is beautifully wooded. Campers can swim, canoe, kayak, fish and relax along the shoreline of the campground. The multi-use Sleeping Bear Heritage Trail passses through the campground opening up 20+ miles of biking and hiking. There are canoe and bicycle rentals nearby in the village of Glen Arbor. The historic village of Glen Haven is a short 15 minute walk away. Miltiple hiking trails, the Dune Climb, and the Pierce Stocking Scenic Drive are just a short drive away. D.H. Day Campground is the perfect launching point for a fun-filled stay at Sleeping Bear Dunes National Lakeshore.</p>
<h2>Facilities</h2>
<p>With 81 beautifully wooded campsites, shared water spigots, and vault toilets, D.H. Day provides a more rustic camping experience. Free hot showers are available at Platte River Camground, located 17 miles south along highway M-22. Each campsite has a parking area, large picnic table, fire ring and tent pad. Firewood is also sold in the campgound via a self-serve vending trailer. </p>
<h2>Natural Features</h2>
<p>D.H. Day Campground lies in the middle of Sleeping Bear Dunes National Lakeshore near the historic village of Glen Haven. The spacious wooded campsites are no more than a 5 minute walk to the Lake Michigan beach. Features include northern hardwood and conifer forests, old farm meadows, wetlands, lakes, streams, bogs, and splendid examples of glacially formed landscapes. The beautiful perched sand dunes, for which the parked is named, are just a few minutes drive from the campground.   </p>
<h2>contact_info</h2>
For facility specific information, please call (231) 334-4634.
<h2>Nearby Attractions</h2>
<p>D.H. Day Campground is within minutes of the lakeside Village of Glen Arbor and the Historic Village of Glen Haven. The Dune Climb and Pierce Stocking Scenic Drive are a short drive to the south. The Alligator Hill Trail is less than a mile away. The Crystal River winds its way to Lake Michigan just a few short miles to the north. The harbor town of Leland is approx. 30 minutes away and is the gateway to both North and South Manitou Island. </p>
<h2>Charges &amp; Cancellations</h2>
<p>Campers must notify the campground office at 231-334-4634 if they will not arrive within 24 hours of the check-in time or their reservation will be cancelled; They will be charged the first night''s camping fee plus a $20 no show fee.</p>
', N'Campground', N'-86.02006', N'44.89615', N'231-326-4700 ext 5035', N'sleepingbearinfo@nps.gov')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (102, N'251536', N'ISLAND LAKE', N'<h2>Overview</h2>
Island Lake Campground is a small and quiet campground nestled in a mostly pine forest. Island Lake offers great fishing for anglers with small boats or canoes.<h2>Recreation</h2>
Island Lake offers excellent fishing and canoeing or kayaking. Anglers fish for largemouth bass, blue gill and perch. The campground offers fishing from shore. Island Lake Campground features a boat slip for small carry-in boats or canoes. Other popular activities include hiking, biking and ATV trails.<h2>Facilities</h2>
This small campground offers a group site and single-family sites that can be doubled-up to occupy two families. Note: Each family has to pay a site fee if doubled up on one site.<h2>Natural Features</h2>
Although there are a few mixed hardwood trees in the area, this campground is favored by those individuals who like to camp in a classic pine forest setting.
<h2>Nearby Attractions</h2>
There are many waterfalls to see in the area, as well as the popular Pictured Rocks National Lakeshore and Grand Island, located just 15 miles away at Lake Superior.', N'Campground', N'-86.6513889', N'46.2708333', N'', N'dave@camprrm.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (103, N'271385', N'Hoist/Reid Lake Areas', N'<p>Recreation areas located near Hoist and Reid Lakes, north of the Au Sable River in the northeast corner of the Huron National Forest.</p>', N'Facility', N'-83.837975', N'44.655249', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (104, N'238173', N'Sault Sainte Marie Ranger District', N'<p>Sault Ste Marie Ranger district is located on the upper half of the east side of the forest.</p>', N'Facility', N'-84.831519', N'45.877577', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (105, N'244411', N'Sprinkler Lake Access Site', N'<p>This is a small fishing access with a short path to the 60-acre Sprinkler Lake. </p>', N'Facility', N'-83.60506', N'44.601719', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (106, N'233717', N'BOWMAN BRIDGE', N'<h2>Overview</h2>
Bowman Bridge Campground is perfect for true nature immersion. Campers come here for easy access to the Pere Marquette National Scenic River and for the delightful views of the great outdoors.<h2>Recreation</h2>
The top three activities for campers at Bowman Bridge are canoeing, fishing and hiking. Anglers cast for brown trout, salmon, steelhead and rainbow trout.
<br /><br />
Watercraft rentals are available at two nearby liveries in Baldwin. A permit is required to float the river from the Friday of Memorial Day weekend through Monday of Labor Day weekend. Watercraft hours during the permit season are 9 a.m. to 6 p.m.
<br /><br />
Hikers can head up the campground''s connector trail to the North Country National Scenic Trail. This &quot;north country&quot; trail weaves through many scenic, historic and cultural areas across seven states, measuring 4,600 miles end-to-end.<h2>Facilities</h2>
Campsites are in a wooded setting, but due to a tornado that passed through in 2005, tall trees and shade are less dense than in neighboring campgrounds.
<br /><br />
The campground has a single loop 16 paved family campsites. There are also 4 walk-in family campsites and 4 tent-only group sites that can accommodate up to 20 people each.<h2>Natural Features</h2>
The campground is situated along the Pere Marquette National Scenic River, a 66-mile stretch of clear, unspoiled waters within the Huron-Manistee National Forests in Michigan. Large blocks of public land offering opportunities for hiking, birdwatching, photography, and hunting can be found in the surrounding area.
<h2>Nearby Attractions</h2>
Visitors enjoy exploring the extent of the Pere Marquette National Scenic River. Other nearby attractions include the Bowman Lake Foot Travel Area and the historic community of Idlewild.', N'Campground', N'-85.9422222', N'43.8883333', N'231-745-8760', N'comments@AmericanLL.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (107, N'238199', N'Triangle Lake Campsite', N'<p>Located in the heart of the Ironjaw Semi-Primitive Area, Triangle Lake is managed for both motorized and non-motorized uses and our management efforts seek to provide for quiet, peaceful recreation opportunities in a semi-primitive setting. Both campsites on Triangle Lake (169 acres) are located on the non-motorized Pine Marten Run Trail, which is open to hiking, mountain biking and horse back riding. There is no drinking water at these campsites. A boat access and parking area for day use is located at Site #1. This access is very sandy and turn-around space is limited. Carry-in access is recommended. There is no boat access at site #2. Triangle Lake is a good fishing lake with a nice population of northern pike, small mouth bass, bluegills, crappie and perch.</p>', N'Campground', N'-86.490225', N'46.168151', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (108, N'232002', N'Little Bay de Noc', N'<h2>Overview</h2>
Little Bay Campground provides a quiet respite from more developed campgrounds in the area. It has long been a favorite for visitors seeking solitude. Beautiful sunsets can be seen over the glistening water of the Little Bay de Noc, and campers enjoy water activities on the lake.<h2>Recreation</h2>
The bay is widely recognized as one of the finest walleye fisheries in the country. The Hunter''s Point paved boat ramp is located less than a mile from the entrance of the campground.
<br /> <br /> 
Other than fishing, visitors enjoy non-motorized boating and swimming, or simply enjoying the beach. A variety of hiking trails are also within a couple miles of the campground.<h2>Facilities</h2>
The campground offers multiple single-family sites and two large group sites, available for tent and RV camping. Each site is equipped with tables and campfire rings with grills. Accessible vault toilets and drinking water are also provided.
 <br /> <br />
A day-use picnic area is equipped with tables and grills. An adjacent open grassy area is available for large recreational gatherings. The picnic area is also adjacent to the swimming beach and boat ramp.<h2>Natural Features</h2>
The campground sits on the shore of Little Bay de Noc, on the north end of Lake Michigan. A group camping area is separated from the other sites with oak, hemlock and hardwood trees, providing a relatively private camping experience.', N'Campground', N'-86.9830556', N'45.8416667', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (109, N'233253', N'MONUMENT CAMPGROUND', N'<h2>Overview</h2>
Monument Campground was established in 1909 as one of the first campgrounds built in the Huron National Forest. The campground is a fully accessible camping area within a red pine plantation. <br/><br/>
Families love this conveniently located campsite, just 15 minutes from Lake Huron off the River Road National Scenic Byway.<h2>Recreation</h2>
Campers can access the Highbanks Hiking Trail from the campground or explore the 22-mile River Road National Scenic Byway that overlooks the lovely AuSable River valley. 
<br/><br/>
Beside the campground is the Lumberman''s Monument Visitor Center, replete with information about the area''s rich lumbering history. Here, visitors can climb through a log jam, use a peavey, cut a wooden cookie with a cross-cut saw, and learn about the life of a lumberjack through video and displays.<h2>Facilities</h2>
<p>Pressurized drinking water, vault toilets, trash collection and grills are among the amenities offered at the campground. A host is onsite to answer questions. <br><br><br>In the nearby visitor center, campers can partake in educational programs and browse through the gift shop.</p>
<h2>Natural Features</h2>
Each site is secluded and shaded with large oak and red pine near the AuSable River. The river flows from west to east for 138 miles until it reaches the great lake, Lake Huron.
<h2>Nearby Attractions</h2>
Explore the many trails of the Huron-Manistee National Forests and spend time at Lake Huron.', N'Campground', N'-83.6183333', N'44.4336111', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (110, N'244321', N'Condon Lakes West', N'<p>This area is very popular for mushroom and berry picking, as well as hunting, fishing and camping.</p>', N'Facility', N'-85.900061', N'43.757958', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (111, N'233849', N'PINES POINT CAMPGROUND', N'<h2>Overview</h2>
Pines Point Campground is located on the banks of the White River with several campsites overlooking the river. The family campground includes a loop designed for groups containing five sites with a capacity of 20 guests each. Large groups can reserve the entire loop.<br /><br /> 
Find out how the campground got its name when you tube or kayak the &acirc;??point&acirc;?? and see the majestic white pines standing watch over the river. Fishing is also popular in these waters.<h2>Recreation</h2>
Fish for trout, salmon and sucker, or float in a canoe, kayak or tube around the point, a leisurely 1 hour float. The canoe landing is walk-in.<h2>Facilities</h2>
Five group campsites and 27 family campsites lie along the river. Each site is equipped with a picnic table, fire ring and lantern post. Drinking water and flush toilets are provided. Electric hookups are not available.<h2>Natural Features</h2>
The campground is quiet and secluded, surrounded by towering white pines and rolling hills.
The White River runs for 23.6 miles on the western side of Michigan''s Lower Peninsula. Summer temperatures are generally around 80 degrees Fahrenheit.
<br /><br />
The Huron-Manistee National Forests extend over almost a million acres, including nearly 6,000 acres of wetlands. The forests provide recreation opportunities for visitors, habitat for fish and wildlife and resources for local industry.
<h2>Nearby Attractions</h2>
Hikers can explore the White River Special Area, a primarily non-motorized area surrounded on three sides by the White River.', N'Campground', N'-86.1194444', N'43.5277778', N'231-745-8760', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (112, N'234662', N'WIDEWATERS CAMPGROUND', N'<h2>Overview</h2>
Widewaters Campground is remotely located on Michigan''s upper peninsula in the Hiawatha National Forest. 
<br /><br />
It sits on a stretch of heavily forested land between Lake Superior and Lake Michigan, near a series of smaller lakes and the Indian River, making it an ideal getaway for anglers and explorers alike.<h2>Recreation</h2>
This small, quiet campground is perfect for fishing, canoeing and kayaking. Anglers enjoy catching brook trout in the area.
<br /> <br />
The 9-mile Bruno''s Run Trail, which winds its way past a host of small lakes in the area, passes directly through the campground and is a popular trail for hiking and biking, as well as snowshoeing and cross-country skiing in the winter.<h2>Facilities</h2>
The campground offers multiple well-spaced single-family sites, available for tent and RV camping. Sites vary from being heavily wooded and private, to open with little privacy. A few waterfront sites have access to the river. Some additional sites are available on a first-come, first-served basis. <br /> 
<br />
Each site is equipped with tables and campfire rings and some have access to grills. Accessible vault toilets and drinking water are provided. <br /> <br />
Boat ramps are available at the campground and also at Fish Lake.<h2>Natural Features</h2>
Widewaters is in a beautiful forest of mature hardwoods, sandwiched between Irwin Lake and Indian River.', N'Campground', N'-86.6283333', N'46.2194444', N'', N'bayfurnace@jamadots.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (113, N'238256', N'Ontonagon Ranger District', N'<p><span style="color: windowtext"><font size="3"><font face="Times New Roman">Ontonagon Ranger District is on the shores of Lake Superior, largest of the Great Lakes, and the mouth of the Ontonagon River. There are numerous outdoor recreational opportunities. Hunting, fishing, swimming, hiking, boating, and ATV riding are available in the summer and fall months. In the winter downhill, cross-country skiing, snowmobiling and snowshoeing are available. <o:p/></font></font></span></p>', N'Facility', N'-89.3122', N'46.8576', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (114, N'233163', N'BLACK RIVER HARBOR PAVILION', N'<h2>Overview</h2>
The Black River Harbor Pavilion is located within the Black Harbor Recreation Area on Lake Superior in Michigans Upper Peninsula. The historic stone and wood pavilion was constructed by the Civilian Conservation Corps in the 1930s.<h2>Recreation</h2>
Lake Superior offers great opportunities for boating, fishing, and swimming.  The North Country National Scenic Trail, which traverses through the recreation area, offers access to all five waterfalls and a scenic 12 mile hike to the Porcupine Mountain Wilderness State Park in Michigan.
<br /><br />
The Black River Harbor Boating Club sponsors an annual fishing derby over Labor Day weekend.<h2>Facilities</h2>
The recreation area offers an enclosed pavilion with a fireplace and flush toilet facilities. A campground with first-come, first-served sites is also available. Facilities include vault toilets and a pressurized water system. A sandy beach is located on-site.<h2>Natural Features</h2>
Visitors enjoy boating, fishing, hiking, swimming, and viewing waterfalls. The Black River Harbor Recreation Area has docking and fuel services for day and transient boaters, a boat launch,  a large picnic area with a swing set, a campground with 39 campsites, beach access to Lake Superior, and five scenic waterfalls along the wild and scenic Black River. The day-use picnic area has a suspension bridge over the Black River with a hiking trail to a beautiful sand and pebble beach on Lake Superior.  The campground is situated among hemlock and pine trees at an elevation of 840 feet, on a bluff overlooking Lake Superior and offers a scenic overlook of Lake Superior''s Apostle Islands. 
<br /><br />
The Ottawa National Forest encompasses nearly one million acres on the west side of Michigan''s Upper Peninsula. The forest extends from the south shore of Lake Superior to the Wisconsin border. It is distinguished by rolling hills dotted with lakes, rivers and waterfalls.
<h2>Nearby Attractions</h2>
For a panoramic view of the area, visit Copper Peak International Ski Flying Hill, a 17-story steel ski jump. Visitors can take an elevator up to the top. The attraction is a short drive from the campground. The Porcupine Mountain Wilderness State Park in Michigan can be seen in the distance from the beach and is less than a one-hour drive from the Harbor.', N'Campground', N'-90.0497222', N'46.6702778', N'906-932-1330', N'mdsimpson@fs.fed.us')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (115, N'244397', N'Nichols Lake North', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157662905795604" title="Nichols Lake"><img alt="Nichols Lake" height="240" src="https://c2.staticflickr.com/2/1489/24747233313_c73760cd95_n.jpg" width="320" /></a></p><p>In addition to being a trailhead for the North Country Trail, Nichols Lake North is also a day use area.&nbsp; Popular for fishing and swimming, the site is located on Nichols Lake,&nbsp;a short distance from Nichols Lake campground.</p><p><strong><a href="http://www.fs.usda.gov/Internet/FSE_DOCUMENTS/stelprd3807297.pdf" target="external">North Country Trail brochure with map</a></strong>:&nbsp; This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller.</p><p><strong><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157662905795604" target="external">Flickr Photo Album</a> </strong></p>', N'Facility', N'-85.910094', N'43.733343', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (116, N'238169', N'Grand Island National Recreation Area', N'<p>Bring the family and check out Grand Island National Recreation Area!</p><p>Grand Island is located in Lake Superior, about one-half mile from the mainland community of Munising, Michigan. Munising is about 43 miles from Marquette and 55 miles from Manistique. Grand Island is the perfect place to spend a day or even just a few hours biking and exploring. The island’s breathtaking overlooks, pristine sandy beaches, fascinating cultural sites, deep hard woods, and inland lakes make it an exciting and secluded destination.</p><p>Visitors can get to the island via passenger ferry or private watercraft. Some campsites are conveniently located for kayakers. The ferry departs from Grand Island Landing on the mainland, located on M-28 about 2.5 miles west of the Munising''s blinking light. Look for the Grand Island National Recreation Area signs.  </p><p>To view the Grand Island Recreation Area Map <a href="http://www.fs.usda.gov/Internet/FSE_DOCUMENTS/stelprdb5136807.pdf">Click Here</a>.</p><p>If you''re interested in the island''s history, check out the Grand Island 25th Anniversary Page (<a href="https://www.fs.usda.gov/detail/hiawatha/specialplaces/?cid=stelprd3836780">archived</a>).</p>', N'Facility', N'-86.664628', N'46.44485', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (117, N'244392', N'76th St. Trailhead', N'<p><em><strong>Going North - </strong></em>From 76th Street Trailhead to Bowman Lake Trailhead, hikers will travel toward and along the Pere Marquette National Scenic River. As hikers travel north the terrain will get progressively hilly as the trail heads to Bowman Bridge Campground and River Access.</p><p><em><strong>Going South - </strong></em>From 76th Street Trailhead to Nichols Lake North Trailhead, visitors will find themselves in a heavily wooded red pine area with several stream crossings.&nbsp; Hikers will travel through Sterling Marsh, the trail here has been raised to avoid the marsh areas.&nbsp; The trail also passes through Stiles Swamp and towards Nichols Lake North.</p><p><em><strong>Bowman Lake Trailhead to Nichols Lake North Trailhead -</strong></em></p><ul><li>Bicycles Allowed?: No</li><li>Miles: 17</li></ul>', N'Facility', N'-85.901768', N'43.850864', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (118, N'238285', N'Little Falls', N'<p>Located on the southern portion of Bond Falls Flowage in the Watersmeet Ranger District.</p>', N'Facility', N'-89.109422', N'46.36905', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (119, N'234080', N'BREVOORT LAKE CAMPGROUND', N'<h2>Overview</h2>
Brevoort Lake Campground stretches along the western shore of its namesake in the Hiawatha National Forest. This popular fishing destination is situated on a peninsula that juts into the lake and Beodne Bay. 
  
Visitors to the campground enjoy the easy access to the pristine sandy beaches.<h2>Recreation</h2>
The 4,233-acre Brevoort Lake provides ample opportunities for recreation. Boat access is available from the center of the campground on Boedne Bay. 
<br/> <br/>
In 1985, the Forest Service completed the construction of a walleye spawning reef in Brevoort Lake, providing plentiful fishing in the area. Anglers can also expect healthy populations of pike, bass, perch and a variety of other fish. 
<br/> <br/>
Hiking is also a popular pastime of visitors to the campground. The Ridge, Sand Dunes Cross Country and North Country National Scenic trails pass near the campground. <br/> <br/>
A 10-minute ferry ride to Mackinac Island makes for an interesting day trip. The 3.8-acre island offers hiking, biking, horseback riding and shopping, as well as access to historical sites and museums, among other activities.<h2>Facilities</h2>
The campground offers dozens of reservable single-family campsites for tent and RV camping. Additional sites are available on a first-come, first-served basis. Each site is equipped with tables and campfire rings with grills, and accessible flush toilets, drinking water and a dump station are provided. 
<br/> <br/><h2>Natural Features</h2>
Campsites are somewhat secluded, surrounded by huge pine, hemlock and oak trees and low, shrubby vegetation. Beach grass grows along the lake shore, sometimes buried in light sand.
<h2>Nearby Attractions</h2>
St. Ignace, Michigan, about 20 miles east of the campground, offers historical and tourist attractions as well as grocery and gas services.<h2>Charges &amp; Cancellations</h2>
<p>Please cancel 7 days in advance if you need to cancel your reservation. Reservation sites cannot be traded for walk-up sites.</p>
', N'Campground', N'-84.9722222', N'46.0072222', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (120, N'238168', N'West Zone', N'<p>The West Unit is located in the central of the Upper Peninsula, bordering two of the Great Lakes - Lake Superior and Lake Michigan. The western portion of the Hiawatha extends from the towns of Rapid River and Manistique, along Lake Michigan, to the town of Munising on the Lake Superior shore.  For information about free educational campground programs on these three Ranger Districts, visit the Events page.</p>', N'Facility', N'-86.9741', N'46.0151', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (121, N'233714', N'LAKE MICHIGAN AT MANISTEE', N'<h2>Overview</h2>
Lake Michigan Campground is perched on the shores of Lake Michigan, 15 miles south of Manistee. The area creates an incredible setting with a scenic overlook of the lake and a sandy swimming beach. This family campground provides an array of hiking and biking trails, plus swimming, fishing and kayaking.<h2>Recreation</h2>
A hardwood forest gives way to a beautiful sandy beach at the shores of the lake with a playground for younger campers. Trout fishing in Lake Michigan is another big draw.
<br /><br />
Bird watchers delight in seeing unique species like the piping plover and prairie warbler.
<br /><br />
The Arrowhead Trail, a short loop trail created by Boy Scouts, forms a loop between the campground and the beach. A trailhead for the Nordhouse Dunes Wilderness Area is also within the recreation area.<h2>Facilities</h2>
An amphitheater offers educational programs throughout the peak season. Other amenities include flush and vault toilets, beach access and an overlook deck. Campsites are equipped with picnic tables and pedestal grills. 
<br /><br />
Group campsites can each accommodate a maximum of 50 guests.<h2>Natural Features</h2>
The recreation area sits on the eastern banks of Lake Michigan along Porter Creek, due north of Hamlin Lake. As the second largest of the five Great Lakes, Lake Michigan provides stunning views and limitless options for water recreation. It covers a whopping 22,400 square miles and ranks as the fifth largest lake in the world.
<br /><br />
The Huron-Manistee National Forests encompass nearly a million acres of public protected land. Nearly 6,000 acres is wetlands that extend over the northern portion of Michigan''s Lower Peninsula.
<h2>Nearby Attractions</h2>
The nearby Nordhouse Dunes Wilderness Area has abundant trails for hiking and backpacking.', N'Campground', N'-86.4275', N'44.1191667', N'231-723-0141', N'comments@AmericanLL.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (122, N'244387', N'Little Manistee River, National Scenic Study River', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157670398754445" title="Little Manistee River"><img alt="Little Manistee River" height="240" src="https://c4.staticflickr.com/8/7268/27905610891_86ae027ce3_n.jpg" width="320" /></a></p><p>The Little Manistee River offers many opportunities for steelhead and trout fishing. The river banks are covered with lowland brush, swamp conifers, white pine and a variety of oak. The river has many bends and large logs. Water levels can become fairly shallow during dry summer months. There are a number of dispersed fishing access sites along the river, some of which allow camping.</p><p>&nbsp;</p><p><a href="http://go.usa.gov/x9h9q" target="external"><strong>Map:</strong></a> This brochure is set to print on 8.5x11 paper, landscape (wide) orientation.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (123, N'234617', N'MONOCLE LAKE', N'<h2>Overview</h2>
Monocle Lake Campground offers a a relaxing place to fish, swim and hike along the shores of scenic Monocle Lake just off Lake Superior. It is located in Michigan''s Upper Peninsula in the northeastern corner of the Hiawatha National Forest.
<br /><br />
The campground is centrally located among many recreational opportunities in the Sault Ste. Marie area, including the Whitefish Bay National Scenic Byway and Tahquamenon Falls.<h2>Recreation</h2>
Monocle Lake is populated with walleye, smallmouth bass, pike and perch. Two man-made reefs lie just off the eastern shore next to the campground, where anglers typically have good luck.
<br /><br />
Swimming and boating are popular activities in the area. Visitors also enjoy hiking the 14.5-mile Monocle Lake Trail. Two miles of the trail have interpretive displays, and the first 1100 feet of the trail are along an elevated, accessible boardwalk. Additional trails are found in the surrounding area.<h2>Facilities</h2>
The campground offers heavily shaded single-family sites for tent and RV camping. Some sites are available on a first-come, first-served basis. Each site is equipped with a table and campfire ring with grill. Accessible vault toilets and drinking water are provided. Hookups are not available.
<br /><br />
A day-use picnic area, adjacent to a fairly large parking area at the campground, provides easy access to a swimming beach. The picnic area is equipped with tables, grills and drinking water, as well as accessible vault toilets. 
A paved boat launch with a parking lot big enough to accommodate vehicles and trailers provides easy access to the beautiful all sports lake.<h2>Natural Features</h2>
The campground surrounds the south end of 172-acre Monocle Lake, and is less than two miles from the historic Point Iroquois Lighthouse. It is nestled in a mixed hardwood forest of aspen, maple, birch and pine trees, providing scenic lake and forest views from anywhere in the campground. Private residences also surround the inland lake.
<h2>Nearby Attractions</h2>
The nearest town is Bay Mills, which is about 6 miles from Monocle Lake. The United States-Canada border, at Sault Ste. Marie, is about 25 miles from the campground. <br />
<br />
Tahquamenon Falls, a series of beautifully brown-colored waterfalls on the Tahquamenon River, is located about 35 miles from Monocle Lake.<h2>Charges &amp; Cancellations</h2>
<p>Please cancel 7 days in advance if you need to cancel your reservation. Reservation sites cannot be traded for walk-in sites.</p>
', N'Campground', N'-84.6391667', N'46.4725', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (124, N'234526', N'SYLVANIA WILDERNESS BACKCOUNTRY CAMPING', N'<h2>Overview</h2>
<p>The Sylvania Wilderness encompasses 18,327 acres of primitive lands and is part of the National Wilderness Preservation System. Visitors can camp in 50 designated campsites within the Sylvania Wilderness. Visitors enjoy endless canoeing, fishing, hiking and wildlife viewing opportunities.</p>
<h2>Recreation</h2>
Sylvania''s abundant lakes provide plentiful non-motorized boating, canoeing, kayaking and fishing opportunities. Other popular activities include hiking and viewing wildlife.<h2>Facilities</h2>
Sylvania Wilderness Backcountry Camp is not a physical campground located at one location. The 50 individual sites are located along eight lakes within the Sylvania Wilderness. Camping is allowed only at designated sites.   
  
Campsites are primitive, but each is equipped with a campfire ring and a wilderness latrine.<h2>Natural Features</h2>
The old-growth forests and pristine lakes in the region provide habitat for a wide range of animal and plant life, including rare orchids, bald eagles, loons and osprey. The wilderness contains 34 named lakes, some with sandy beaches and others surrounded by record-size red and white pines.
  
The Ottawa National Forest is comprised of nearly 1 million acres and is located in the western reaches of Michigan''s Upper Peninsula. The forest''s rolling, tree covered hills extend from the south shore of Lake Superior to the Wisconsin border. Lakes, rivers and waterfalls are found throughout this beautiful landscape.', N'Campground', N'-89.3105556', N'46.2447222', N'906-358-4724', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (125, N'244393', N'Bowman Lake Trailhead', N'<p><em><strong>Going North -</strong></em> From Bowman Lake Trailhead to Timber Creek Trailhead, visitors will go through the Bowman Lake Semi-Primitive Nonmotorized Area, travel along the Pere Marquette National Scenic River near Sulak and Upper Branch Bridge river access sites, until crossing US-10 and arriving at the Timber Creek Trailhead.</p><p><em>M-55 to Bowman Lake Trailhead -</em></p><ul><li><em>Bicycles Allowed?:</em> Yes</li><li><em>Miles: </em>41</li></ul><p><em><strong>Going South - </strong></em>From Bowman Lake Trailhead to 76th Street Trailhead, hikers will travel toward and along the Pere Marquette National Scenic River.  As hikers travel south, away from Bowman Lake, the terrain will get progressively less hilly.  Glacial depressions are found in this area and provide homes for many species of wildlife</p><p><em>Bowman Lake Trailhead to Nichols Lake North Trailhead -</em></p><ul><li><em>Bicycles Allowed?:</em> No</li><li><em>Miles: </em>17</li></ul>', N'Facility', N'-85.967719', N'43.891241', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (126, N'233174', N'PETES LAKE CAMPGROUND', N'<h2>Overview</h2>
Petes Lake Campground, located in the center of Michigan''s Hiawatha National Forest, is surrounded by several lakes and offers excellent hiking, biking, fishing, boating and more. <br /> 
<br />
Snuggled amongst mixed hardwood trees, the campground offers a swimming beach and day-use picnic area away from the hustle and bustle of city life.
<h2>Recreation</h2>
Visitors enjoy a variety of water-related recreation opportunities. The campground also has fishing pier next to the day-use area. Anglers can expect healthy populations of northern pike, bass, walleye and perch in the lake.<br />
<br />
The nine-mile Bruno''s Run Trail, which winds its way past a host of small lakes in the area, passes directly through the campground and is a popular trail for hiking and biking, as well as snowshoeing and cross-country skiing in the winter.<h2>Facilities</h2>
The campground offers multiple spacious and forested private campsites for tent and RV camping. A few sites overlook the lake.<br /> <br />
Each site is equipped with tables and campfire rings and about half of the sites have access to a grill. Accessible vault toilets and drinking water are provided. <br /> 
<br />
A shaded day-use picnic area at the campground offers multiple tables and benches right on the lake shore. Accessible vault toilets and drinking water are also provided in the picnic area, as well as a fairly large parking area.<h2>Natural Features</h2>
The campground is situated on the upper peninsula of Michigan, on the shores of the 190-acre Petes Lake. It sits amid rolling hills that are forested with a variety of deciduous and conifer trees. Many of the campsites are shaded and private.
<h2>Nearby Attractions</h2>
Big Island, Fish and Straits lakes are all within 25 miles of the campground.
', N'Campground', N'-86.597', N'46.2281889', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (127, N'234081', N'LAKE MICHIGAN AT ST. IGNACE', N'<h2>Overview</h2>
Lake Michigan Campground at St. Ignace provides great views and unlimited access to Lake Michigan. The area has excellent trails, winding hikers through ancient sand dunes, windswept foundations and a variety of vegetation.<h2>Recreation</h2>
The campsites are located between 20- to 30-foot high sand dunes and are just steps away from great body-surfing waves, that crash onto the lake''s sandy beaches during commonly high winds.
  
Lake Michigan does offer fishing, but anglers tend to prefer Brevort Lake better, for its catches of walleye, pike, bass, perch and crappie.
  
Campers at Lake Michigan have access to the popular Sand Dunes Cross-Country Ski Trail, as well as the North Country National Scenic Trail, which connects a host of natural areas, from valleys to hilltops, prairies to forests and everything in between. Both trails offer miles of terrain, keeping hikers busy for as long as they choose.<h2>Facilities</h2>
The campground offers many shaded and open sites for tent and RV camping. Some sites are available on a first-come, first-served basis. Picnic tables and campfire rings with grills are provided.
<br/><br/>
Accessible vault toilets are available, as well as drinking water. Hookups are not provided. Parking spurs are comprised of grass and dirt. A trash collection bin is available at the campground and a dump station can be found at Brevort Lake.<h2>Natural Features</h2>
The campground stretches along a bluff between the highway and the lake. Dunes, waves, sand and wind are the primary environmental factors present. Visitors enjoy watching shorebirds, like the Spotted Sandpiper, which can often be seen running up and down the beaches throughout the day.
<h2>Nearby Attractions</h2>
Brevort Lake is about five miles from the campground. St. Ignace is about 18 miles from the campground and is the closest town.<h2>Charges &amp; Cancellations</h2>
<p>Please cancel 7 days in advance if you need to cancel your reservation. Reservation sites cannot be traded for walk up sites.</p>
', N'Campground', N'-84.9716667', N'45.9858333', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (128, N'234655', N'MURRAY BAY GROUP CAMPSITE on GRAND ISLAND', N'<h2>Overview</h2>
Murray Bay Group Campground is located on the southern shores of Grand Island, at the southeastern tip of Lake Superior. The island''s scenic natural beauty and interesting history make it an attractive place for camping and other outdoor activities.
<br /> <br />
The Grand Island National Recreation Area boasts massive 300-foot wave-cut sandstone cliffs, 13,500 acres of lush forest, beaches of fine sand, winter ice caves and historic buildings and artifacts dating back as far as 2000 B.C.<h2>Recreation</h2>
The sandy lake is a popular swimming destination. Boating is also available, however, there is no boat ramp or dock facility at the campground. <br /> <br />
Anglers and hunters frequent the area for its wide variety of fish and game. Licenses are required to participate in either activity. 
<br /> <br />
Visitors also enjoy over 30 miles of hiking and mountain biking trails on the island. A bus tour is also available for those who would like to learn more about the island''s natural and cultural history.<h2>Facilities</h2>
The campground offers a single group campsite that can accommodate up to 25 guests, as well as a day-use picnic area. Both are equipped with tables and campfire rings with grills. 
<br /><br />
Vault toilets and drinking water are also provided. Camping is not allowed at the day-use site. A bear pole and box for food storage are provided at each site.<h2>Natural Features</h2>
Grand Island and the Murray Bay Group Campground are part of the Hiawatha National Forest, near Michigan''s Upper Peninsula. Calm waters and white-sand beaches beckon boaters and swimmers to the area.', N'Campground', N'-86.655175', N'46.4717389', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (129, N'234612', N'SOLDIER LAKE', N'<h2>Overview</h2>
A quiet, relaxing campground with campsites nestled in the pines surrounding Soldier Lake in Michigan''s Upper Peninsula. The campground provides a feeling of remoteness but is still close to roads that lead to some of the best sightseeing the area has to offer.<h2>Recreation</h2>
Non-motorized boating is allowed on Soldier Lake. Swimming is also a popular activity. Two sandy beaches are found within the campground and day use areas.
  
The North Country National Scenic Trail, which winds through several northern states, can be accessed from the day use area.<h2>Facilities</h2>
The rustic campground offers shaded single-family sites for tent and RV camping. Each site is equipped with a table and a campfire ring. Vault toilets and drinking water are provided. No hookups are available.
  
The campground also has two large day-use picnic areas with tables and grills. A sheltered picnic area is equipped with a fireplace. The picnic area has vault toilets and drinking water.<h2>Natural Features</h2>
The campground surrounds 15-acre Soldier Lake. A scenic forest of pine, aspen and maple trees covers the area.
<h2>Nearby Attractions</h2>
The closest town is Strongs, 7 miles west. Services available include a fuel station, restaurants, and a general store.<h2>Charges &amp; Cancellations</h2>
<p>Please cancel 7 days in advance for reservation sites. Reservation sites cannot be transferred to walk-in sites.</p>
', N'Campground', N'-84.8683333', N'46.3505556', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (130, N'244403', N'M-37: White Cloud to Baldwin', N'<p>This area covers all recreation areas along M-37 between White Cloud and Baldwin.&nbsp; This does not include trailheads for the North Country National Scenic Trail or Hungerford Recreation Area.</p>', N'Facility', N'-85.842778', N'44.032222', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (131, N'244394', N'Freesoil Trailhead', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157660951616613" title="North Country National Scenic Trail"><img alt="North Country National Scenic Trail" height="320" src="https://farm2.staticflickr.com/1629/23866957619_bcbb85a882_z.jpg" width="240" /></a></p><p><em><strong>Going North -</strong></em> Heading north will take you to the Udell Trailhead.&nbsp; The trail from Udell Trailhead&nbsp;to Freesoil&nbsp;Trailhead traverses the Udell Hills.&nbsp; After the trail crosses the Little Manistee River, the terrain changes form mixed hardwoods to wetlands.&nbsp; The trail heading north was formerly a narrow gauge railroad that was elevated above the wetlands in the early 1900&#39;s by lumberjacks.&nbsp; The trail winds through the wetlands and swamp in this section.&nbsp; However, about 3.5 miles north of the trailhead a boardwalk has been put in through the wetland areas.&nbsp; Mountain bikes are allowed going both north and south from this trailhead.</p><p>&nbsp;<em>Going&nbsp;north from Freesoil Trailhead&nbsp;- </em></p><ul><li>Freesoil Trailhead to 3-Mile Rd. - Easy</li><li>3-Mile Rd. to Udell Trailhead - Intermediate</li></ul><p><em><strong>Going South - </strong></em>Heading south will take you to the Timber Creek Trailhead.&nbsp; The trail from Freesoil Trailhead to Timber Creek passes through Ward Hills, past McCarthy Lake and through very steeply hilled terrain.&nbsp; The portion of trail running from Timber Creek Trailhead to the Manistee River is the most advanced riding on this portion of the trail for mountain bikes.</p><p><em>Going&nbsp;south from Freesoil Trailhead -</em></p><ul><li>Freesoil Trailhead to Timber Creek Trailhead - Intermediate</li></ul><p><strong><a href="http://www.fs.usda.gov/Internet/FSE_DOCUMENTS/stelprd3807297.pdf" target="external">Brochure with map</a></strong>:&nbsp; This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller.</p><p><strong><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157660951616613" target="external">Flickr Photo Album</a> </strong></p>', N'Facility', N'-86.029419', N'44.10539', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (132, N'247602', N'Twelvemile Beach Campground', N'<h2>Overview</h2>
<p>Twelvemile Beach Campground is a beautiful campground along Lake Superior located within the Pictured Rocks National Lakeshore, just 15 miles west of Grand Marais. There are 36 sites total, including 2 handicap accessible sites. Twelvemile Beach has water, pit toilets, picnic tables, fire rings, and an interpretive amphitheater. The campground has access to the North Country Trail and the two mile long self-guided White Birch Interpretive Trail. The turning radius and some of the parking at sites are limited, so the Park recommends that camper, or vehicle/trailer length should NOT exceed 42 feet. </p>
<h2>Recreation</h2>
<p>There are three sets of stairs to the beach as well as a day-use picnic area and parking. The two-mile long White Birch Trail begins and ends at the campground. The North Country Trail treks through the campground. The entrance road winds through a picturesque stand of white birch.</p>
<h2>Facilities</h2>
<p>Pictured Rocks National Lakeshore drive-in campsites are rustic and do not have electric, water, or sewer hookups. Campsites provide a picnic table, fire ring with grill grate, and tent pad. The campgrounds have vault toilets and well water. Typically there is no cell phone reception.</p>
<h2>Natural Features</h2>
<p>Sandstone cliffs, beaches, sand dunes, waterfalls, inland lakes, deep forest, and wild shoreline beckon you to visit Pictured Rocks National Lakeshore. The power of Lake Superior shapes the park''s coastal features and affects every ecosystem, creating a unique landscape to explore. Hiking, camping, sightseeing, and four-season outdoor opportunities abound.</p>
<h2>Nearby Attractions</h2>
<p>Guided kayaking and other boat tours within the national lakeshore are offered by authorized private companies. Pontoon boat and other rentals for use on Lake Superior are available in nearby communities.</p>
', N'Campground', N'-86.2177639001555', N'46.6391459995757', N'906-387-3700', N'piro_information@nps.gov')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (133, N'238167', N'East Zone', N'<p>The East Unit is located in the east side of the Upper Peninsula, bordering three of the Great Lakes - Lake Superior, Lake Michigan and Lake Huron. The eastern portion stretches north from the town of St. Ignace, which lies along Lakes Michigan and Huron, to the shore of Lake Superior west of the city of Sault Ste. Marie.</p>', N'Facility', N'-84.831519', N'45.877577', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (134, N'238172', N'Munising Ranger District', N'<p>Munising Ranger District is located on the northern part of the west side of the Hiawatha National Forest. Stop by for up-to-date information and suggestions for your trip.</p>', N'Facility', N'-86.649116', N'46.409211', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (135, N'244322', N'Manistee River Area', N'<p>Portions of the North Country National Scenic Trail run through this area, as well as it being a popular area for hunting and fishing. Aspen is a managed tree in this area, creating good grouse habitat throughout.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (136, N'256367', N'Pictured Rocks National Lakeshore Backcountry Camping Permit', N'<h2>Overview</h2>
<p>Pictured Rocks National Lakeshore hugs the Lake Superior shoreline for more than 40 miles along Michigan''s northern coast. Lake Superior is the largest, deepest, coldest, and most pristine of all the Great Lakes. In addition to boating and kayaking on the lake, the park''s backcountry offers nearly 100 miles of walking and hiking trails and opportunities for solitude, inspiration, physical challenge, renewal, and camping.  Access to Pictured Rocks'' backcountry is primarily along the ''Lakeshore Trail'', a part of the 42-mile long North Country National Scenic Trail  where you can experience forests, dunes, beaches, waterfalls and wonderful panoramic views. </p>
<p><a href="https://www.nps.gov/piro/planyourvisit/backcountry.htm" rel="nofollow">Backcountry Planner</a>   The backcountry campgrounds are accessed by hiking or kayaking only. A backcountry camping <strong>permit is required</strong> year-round for all overnight trips into the Pictured Rocks National Lakeshore backcountry.  Permits are not required for day hiking.   Backcountry Camping   To assist in planning an overnight backcountry trip into Pictured Rocks National Lakeshore, take time to carefully   plan and prepare  for your adventure.   Pictured Rocks offers   fourteen backcountry campgrounds, that are located at two to five mile intervals along the Lakeshore Trail. Shuttle services are available.  </p>
<p>Permit holder must print and retain one copy of the permit when hiking to the campground; permit must be visibly secured to tent at campsite. You will be assigned a campsite number at every backcountry campground. Permit holder may have only one permit reserved at one time. Camp only in designated sites and follow permit itinerary. You must camp within 15 feet of the numbered post at your chosen campsite.  Individual campsites are available for groups of 1-6 people (2 tents or hammocks maximum, or 1 tent and 1 hammock).   Groups of 7-20 people and up to a 10 tent max must camp in designated group sites.   Each campground has a specific capacity; campsites within each backcountry campground are identified by a numbered post.  </p>
<p><a href="https://www.youtube.com/watch?v=JMYTg0lHDG8" rel="nofollow">Leave No Trace Principles</a> <a href="https://www.youtube.com/watch?v=1lTozt-CjBw" rel="nofollow">Leave No Trace Principles with Audio Description</a>  Learn how to Leave No Trace in our beautiful campgrounds.</p>
<h2>Charges &amp; Cancellations</h2>
<p><strong>Cancellation Policy: </strong><br>Prior to printing your permit, you may cancel any time before your reservation date and receive a 50% refund of all backcountry camping permit fees ($5 per person, per night). The $15 reservation fee is non-refundable. If you have printed your permit, there are no refunds. <br><strong>Change Policy:</strong><br>Prior to printing your permit, you may make changes to your permit before your reservation date. Changes may be made to the group size, campground, and the duration of your trip. An additional $15 non-refundable fee will be charged for changes.<br>Changes may be made to the group size through your Recreation.gov account or through the Call Center and may incur additional backcountry camping permit fees or be refunded these fees depending on whether you increase or decrease your group size. If decreasing your numbers, you will receive a full refund of the backcountry camping permit fees for the numbers you are decreasing only. <br>A change to the duration of the trip or campground may only be made through the Call Center. For changes to the duration of the trip, you may incur additional backcountry camping permit fees or be refunded these fees depending on whether you increase or decrease your number of nights. If decreasing your numbers, you will receive a full refund of the backcountry camping permit fees for the numbers you are decreasing only.<br>To change your entry date, you must cancel your permit and reserve a new permit. All fees apply. <br><strong>No Show Policy:</strong><br> If you do not print your permit by 11:59 p.m. on the first day of your scheduled trip, your entire backcountry camping permit will be canceled. No refunds. Please cancel your reservation if you are unable to use it to open space for others.</p>
', N'Campground', N'-86.305125', N'46.5622222', N'906 387 3700 MUNISING FALLS VISITOR CENTER  EMAIL: INFORMATION_PIRO@NPS.GOV', N'piro_information@nps.gov')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (137, N'10072262', N'Loon Lake Day Use Area', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157670091357386" title="Loon Lake Picnic Area"><img alt="Loon Lake Picnic Area" height="240" src="https://c4.staticflickr.com/8/7112/27266026243_2813323100_c.jpg" width="320" /></a></p><p>Loon Lake Day use is a popular picnicking area and swimming beach on a peaceful lake.  The 90-acre lake is mostly surrounded by National Forest System lands. The surrounding landscape is a reminder of the glacial heritage of Michigan. The landscape was deposited and sculpted during the last glacial retreat.</p><p>There is a short nature walk from the parking area that leads to Island Lake Campground. The terrain along the trail is steep.</p><p><strong><a href="http://go.usa.gov/x9h8D" target="external">Brochure and Map</a>: </strong>This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.  To print on 8 1/2 x 11 paper set the print area to "shrink to printable area", this will make the text on the page smaller.</p><p><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157670091357386" target="external"><strong>Flickr Photo Album</strong></a></p>', N'Facility', N'-84.137833', N'44.514587', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (138, N'234613', N'BAY VIEW', N'<h2>Overview</h2>
Located just off the Whitefish Bay Scenic Byway in Michigan''s Upper Peninsula, Bay View Campground provides a rustic opportunity to camp along the shores of Lake Superior.   
The campground is a perfect stop amidst many recreational opportunities available in the Sault Ste. Marie area. Visitors also enjoy exploring the Whitefish Bay National Scenic Byway all the way to the beautiful Tahquamenon Falls.<h2>Recreation</h2>
Miles of sandy beaches and beautiful sunsets stretch across Lake Superior, the greatest single body of fresh water in the world. Birding and sightseeing are popular pastimes, and visitors enjoy long walks along Superior''s beaches.<h2>Facilities</h2>
The rustic campground offers multiple single-family campsites for tent and RV camping. Each site is equipped with a picnic table and campfire rings with grills. 
<br/> <br/>
Vault toilets and hand-pumped drinking water are available at several locations within the campground. Most of the sites are heavily shaded. A campground host lives at the campground and can be available to answer any questions.<h2>Natural Features</h2>
The campground is located in Lake Superior''s famous Whitefish Bay, the site of numerous historically preserved shipwrecks and lighthouse stations. The area is also a natural corridor for migratory birds.
<h2>Nearby Attractions</h2>
Tahquamenon Falls, a series of beautifully brown-colored waterfalls on the Tahquamenon River, are located just 30 miles away.  The Great Lakes Shipwreck Museum and Whitefish Point Lighthouse are 39 miles to the north and west while the Point Iroquois Lighthouse lies about 8 miles east.<h2>Charges &amp; Cancellations</h2>
<p>Please cancel 7 days in advance if you need to cancel your reservation. Reserve sites cannot be transferred to walk up sites.</p>
', N'Campground', N'-84.7794444', N'46.46', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (139, N'270656', N'Rapid River/ Manistique Ranger District', N'<p>Rapid River Ranger district is located on the lower half of the west side of  the forest.</p>', N'Facility', N'-86.951992', N'45.926276', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (140, N'244320', N'Bowman Lake Area', N'<p>This area not only has the Pere Marquette River running through it, but also contains a portion of the North Country National Scenic Trail and habitat for the federally endangered Karner blue butterfly.</p><p>The Bowman Lake area is located in Lake and Sweetwater Townships in Lake County. A total of 1,145 acres of NFS lands and 368 acres of private lands are within the boundary of the Bowman Lake area.</p><p>The terrain is characterized by rolling hills, glacial depressions and leatherleaf bogs. A 3-acre lake is located within the area. The area tends to be densely forested with a mix of hardwoods, red and white pine and aspen. Wildlife species that commonly inhabit this area include white-tailed deer, bobcat, coyote, red fox, raccoon, porcupine, squirrels, pileated woodpecker, ruffed grouse, wild turkey and various songbirds.</p><p>Visitor recreation activities include camping, fishing, mushroom gathering, bird-watching, hunting, hiking and canoeing. Mountain biking and horseback riding are also common uses on the area trails. Although trails are not groomed in the winter, the area is popular for snowshoeing and cross-country skiing.</p><p> </p><p>The Bowman Lake Trailhead serves as a main entry point onto the North Country National Scenic Trail (NCT). A 3-mile segment of the NCT is located within this area and mountain biking is allowed on this section of trail. In addition, a small trailhead is located on NFS Road 6267, giving access to the Bowman Lake Campground Trail, which is approximately 7.5 miles of loop trail designed for nonmotorized recreation.</p><p>This trail system can also be used by mountain bikers and horseback riders. Four improved campsites are located on Bowman Lake. Segments of the State of Michigan snowmobile trail system and Michigan Cycle Conservation Club Trail (MCCCT) system are located immediately south of the area.</p>', N'Facility', N'-85.94', N'43.889444', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (141, N'244398', N'Udell Trailhead', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157660951616613" title="North Country National Scenic Trail"><img alt="North Country National Scenic Trail" height="240" src="https://farm2.staticflickr.com/1629/23866957619_bcbb85a882_z.jpg" width="320" /></a></p><p><em><strong>Going North -</strong></em> From Udell Trailhead to Upper River Road Trailhead, particularly in the Dilling Road area, visitors will traverse many hills.&nbsp; After crossing Coates Highway, visitors will climb up a hill to a flat, forested area.&nbsp;</p><p><em>Difficulty going north from Udell - </em></p><ul><li>Udell Trailhead to Highbridge River Access - Easy</li><li>Highbridge River Access&nbsp;to Dilling Rd. - Easy</li><li>Dilling Rd. to Upper Branch Trailhead/Red Bridge River Access&nbsp;- Difficult</li></ul><p><em>Dilling Road </em><em>to Udell Trailhead</em> -</p><ul><li><em>Bicycles Allowed?:</em> No</li><li><em>Miles: </em>10</li></ul><p><strong><em>Going South -</em></strong> Heading south will take you to the Freesoil Trailhead.&nbsp; The trail from Udell Trailhead to Freesoil Trailhead traverses the Udell Hills.&nbsp; After the trail crosses the Little Manistee River the terrain changes form mixed hardwoods to wetlands.&nbsp; The trail heading north was formerly a narrow gauge railroad that was elevated above the wetlands in the early 1900&#39;s by lumberjacks.&nbsp; The trail winds through the wetlands and swamp in this section.&nbsp; However, about 3.5 miles north of the trailhead a boardwalk has been put in through the wetland areas.&nbsp; Mountain bikes are allowed going south from this trailhead. There is no connector to the Big &quot;M&quot; Cross-Country Ski Trail, however the two trails do cross at several points.</p><p><em>Difficulty going&nbsp;south from Udell - </em></p><ul><li>Udell Trailhead to 6-Mile Rd. - Intermediate</li><li>6-Mile Rd. to 3-Mile Rd. - Easy</li><li>3-Mile Rd. to Freesoil Trailhead - Easy</li></ul><p><em>Udell Trailhead to M-55 -</em></p><ul><li><em>Bicycles Allowed?: </em>No</li><li><em>Miles: </em>10</li></ul><p><em>M-55 to Bowman Lake Trailhead -</em></p><ul><li><em>Bicycles Allowed?:</em> Yes</li><li><em>Miles: </em>41</li></ul><p><strong><a href="http://www.fs.usda.gov/Internet/FSE_DOCUMENTS/stelprd3807297.pdf" target="external">Brochure with map</a></strong>:&nbsp; This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller.</p><p><strong><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157660951616613" target="external">Flickr Photo Album</a> </strong></p>', N'Facility', N'-86.076379', N'44.232245', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (142, N'232458', N'PLATTE RIVER CAMPGROUND', N'<h2>Overview</h2>
Platte River Campground is located in the southern district of Sleeping Bear Dunes National Lakeshore, on the lower peninsula of Michigan. 
This year-round facility is one of the most popular campgrounds in the park. It is within walking distance of the Platte River and a short walk or drive away from the Lake Michigan shore. Hikers can access many of the area''s day use and backpacking trails just north of the campground.
<br/><br/>
Summer temperatures range from the upper 70s to 90s during the day and 50s to 70s at night. Winters are cold, with daytime highs in the 20s to 30s and lows in the 10s and 20s; snow is usually on the ground from late November through March.<h2>Recreation</h2>
Campers can hike, canoe, kayak and fish on the river or the lake. There are canoe rentals at nearby Platte River Point, where the river meets the lake (the point also has beach access for those wishing to drive there). The Platte Plains trail system boasts more than 25 miles of trails, some of which can be accessed a short walk away from the campground. Trails to the primitive White Pine backcountry campground are also close by.<h2>Facilities</h2>
This facility is well-maintained, well-organized and offers a wide variety of sites, including back-in and pull-through sites with electric hookups for RVs, non-electric sites, walk-to sites, group sites (hike-in, tent-only) and a nearby backcountry campground. Each site has a campfire ring and picnic table. Each loop has restrooms with flush toilets and sinks. Hot showers are also available. The group sites allow no more than 25 people per site; pets and RVs are not permitted in them.<h2>Natural Features</h2>
The campground lies in a wooded area within walking distance of the Platte River and less than two miles away from the beaches of Lake Michigan. Although the lakeshore is long and narrow, it has northern hardwood and conifer forests, abandoned farm meadows, wetlands, lakes, streams, bogs and splendid examples of a glacially formed landscape.
<br/><br/>
The most prominent features in the park, and those for which it is named, are the perched sand dunes above Lake Michigan. The overlooks at Sleeping Bear, Empire and Pyramid Point bluffs are about 400 feet above the lake. With 65 miles of Lake Michigan shoreline and numerous inland lakes and streams, the park is wonderfully water-oriented.', N'Campground', N'-86.1177778', N'44.7127778', N'231-326-4700 ', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (143, N'251845', N'NICHOLS LAKE SOUTH CAMPGROUND', N'<h2>Overview</h2>
Located on the south side of Nichols Lake, the campground and surrounding area offer excellent opportunities for fishing, swimming, picnicking, hiking, camping, or just relaxing.<h2>Recreation</h2>
Fishing and boating are popular activities at Nichols Lake.  There is a paved boat launch at the campground.  This site is one of the locations on the National Forest''s for Kids Fishing Day Events for Michigan''s Free Fishing Day in early June.  Ice fishing is also popular in the winter.  Swimming areas are marked with buoys, but there are no lifeguards.  The North Country National Scenic Trail goes through the site near the boat ramp, providing good hiking opportunities.<h2>Facilities</h2>
Nichols Lake has 29 family sites on paved spurs.  Drinking water, flush toilets, and showers are provided.  Each site has a fire pit and picnic table.  A wood ramp and stairs lead down to the lake from the campground.  A short path along the lake provides access for fishing.<h2>Natural Features</h2>
At 160 acres, Nichols Lake offers shore, pier, and boat fishing. Typical fish species available include bass, bluegill, pumpkinseed, black crappie, and northern pike.  There is a swimming beach and accessible fishing pier available.
<br /><br />
Those wishing to enjoy the day at Nichols Lake will find a day use area located on the north side of the lake.
<h2>Nearby Attractions</h2>
The North Country Trail covers 4,600 miles from Crown Point, NY, to Lake Sakakawea State Park, ND.  The segment that includes Nichols Lake has beautiful sections for both the advanced and weekend hikers.   The nearest towns are Woodland, Bitely, and Brohman, about two miles to the south.', N'Campground', N'-85.9025', N'43.7230556', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (144, N'233255', N'ROLLWAYS CAMPGROUND', N'<h2>Overview</h2>
Rollways Campground is located 7 miles from Hale, Michigan along the beautiful AuSable River. The site was built in 1909 as one of the first campgrounds established in Huron National Forest. The space is small and secluded and features an observation area, picnic grounds and log shelter.. 
<br /><br />
The facility is located just off the River Road National Scenic Byway in northeast Lower Michigan. The byway showcases incredible views of the AuSable River Valley.<h2>Recreation</h2>
Hike on the accessible trail that connects the campground and picnic area to Westgate Scenic Overlook. Bring binoculars and a camera to take advantage of the epic view. 
<br /><br />
The same hiking path passes a stairway leading down to the river where visitors can fish and wade.<h2>Facilities</h2>
The campground offers 19 pull-through campsites with picnic tables, a lantern post, grills, tent pads and campfire rings. At the picnic area, a log shelter, picnic tables and grills are available.
<br /><br />
Vault toilets and drinking water spigots are dispersed throughout the campground and all roads and camping spurs are paved.<h2>Natural Features</h2>
Rollways is perched on a high bluff overlooking Loud Dam Pond on the AuSable River. The river flows from west to east for 138 miles until it reaches the great Lake Huron.
<h2>Nearby Attractions</h2>
Follow the length of the 22-mile River Road National Scenic Byway, which parallels the AuSable River.', N'Campground', N'-83.7736111', N'44.4594444', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (145, N'273343', N'BLACK RIVER HARBOR CAMPGROUND', N'<h2>Overview</h2>
Black River Campground is adjacent to the Black River Harbor Recreation Area. The recreation area includes a pavilion, harbor and a large picnic area. The area provides for many opportunities for fishing, boating, backpacking, hiking, bird watching, photography and beautiful scenery for relaxation in the outdoors.<h2>Recreation</h2>
The campground is adjacent to the Black River Harbor Recreation Area. The Harbor offers one of the area''s few access points to Lake Superior, with boating and fishing being a major summer time activity. Fishing charters are available at the harbor dock area. The boat ramp can accommodate almost any craft trailered in. There is no launching fee. Parking for trucks and boat trailers is ample. The area has many trails that follow the Black River leading you to the many waterfalls along the river. The recreation area has a large grassy area for picnics.<h2>Facilities</h2>
The Black River Campground has 38 available campsites that can accommodate RVs, campers or tents. There are two concrete vault toilet buildings at either end of the campground. There are 10 pressurized water spigots spaced throughout the camping areas for easy water access. All campsites are wooded with partial shade and have a generous area to spread out in. There are five campsites that are within a few hundred feet of Lake Superior.<h2>Natural Features</h2>
Known for its spectacular waterfalls, idyllic beaches, scenic hiking trails and tranquil campground, the Black River Harbor Recreation Area is a popular destination throughout the year. Originating in Wisconsin, the Black River flows through forested areas of large pine, hemlock and hardwood trees. The River has a series of scenic waterfalls as it drops in elevation to meet Lake Superior. Tannin (tannic acids) from hemlock trees is what gives it its unique color.
<h2>Nearby Attractions</h2>
A historic pavilion built by the Civilian Conservation Corps is located in the recreation area next to the campground. The recreation area includes a large picnic area and Black River Harbor that has fishing charters available and in itself is a scenic area to explore.  Trails run adjacent to the Black River and lead to several waterfalls. A foot bridge and short walk will take you across the Black River to Lake Superior and the sand beach swimming areas.', N'Campground', N'-90.0497194', N'46.6702806', N'906-932-1330', N'aclarc56@yahoo.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (146, N'244315', N'Au Sable Area', N'<p>Along the Au Sable River is the Au Sable Special Area, a 10,628 acre area characterized by flat to gently rolling hills with some steep banks along the Au Sable River. This area is located in Iosco and Alcona counties. The Au Sable Special Area stretches the southern end of Alcona Dam Pond (Bamfield Road) to just before Cook Pond on either side of the river.</p><p>The area is densely forested and inhabited by bald eagles, deer, bear, bobcat, porcupine and various songbirds. Campers and day-use visitors enjoy boating, tubing, rafting, canoeing and fishing on the Au Sable River. Other popular recreation activities include viewing the river and wildlife, hiking, swimming, picnicking, horseback riding, hunting, trapping and berry and mushroom gathering. The Forest Service requires camping permits from May 15 through September 30 at the 19 <a href="http://www.fs.usda.gov/recarea/hmnf/recarea/?recid=18570">designated primitive campsites</a> along the river in this area.</p><p>Two developed campgrounds are located in this area, <a href="http://www.fs.usda.gov/recarea/hmnf/recarea/?recid=18750">South Branch Trail Camp </a>and <a href="http://www.fs.usda.gov/recarea/hmnf/recarea/?recid=18998">Rollways Campground</a>.</p>', N'Facility', N'-83.782222', N'44.5625', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (147, N'244395', N'Marilla Trailhead', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157660951616613" title="North Country National Scenic Trail"><img alt="North Country National Scenic Trail" height="320" src="https://farm2.staticflickr.com/1629/23866957619_bcbb85a882_z.jpg" width="240" /></a></p><p>Marilla Trailhead is the northern most access to the trail on the Huron-Manistee National Forests.  For information on trailheads going north visit the National Park Service <a href="http://www.nps.gov/noco/index.htm">website</a>.</p><p>A 23-mile loop trail is formed with the Manistee River Trail along the Manistee River.  The loop trail can be accessed from the Marilla and Upper Branch Trailheads for the North Country National Scenic Trail and the Red Bridge and Seaton Creek accesses for the Manistee River Trail.</p><p><em><strong>Going South -</strong></em> From Marilla to Upper River Trailhead the trail follows the ridge high above the Manistee River, offering hikers scenic views of the river valley. Mountain bikes are permitted from the Dilling Road crossing to the Marilla Trailhead. Mountain bikes are not allowed on the connector or the section of the trail along the Hodenpyl backwaters. The only water source is at Eddington Creek Crossing, 1.5 miles south of Marilla Trailhead.</p><p><em>Difficulty going south from Marilla </em><strong><em>- </em></strong></p><ul><li>Marilla to Red Bridge - Advanced/Difficult</li></ul><p> <em>Marilla Traihead to Dilling Rd.</em></p><ul><li><em>Bicycles Allowed?: </em>Yes</li><li><em>Miles: </em>21</li></ul><p><strong>Brochure with map</strong>:</p><ul><li><a href="https://go.usa.gov/x9h8H" target="external">North Country National Scenic Trail</a></li><li><a href="https://go.usa.gov/x9h8P" target="external">Manistee River Trail</a></li></ul><p>This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.  To print on 8 1/2 x 11 paper set the print area to "shrink to printable area", this will make the text on the page smaller.</p><p> </p><p><strong>Flickr Photo Albums</strong></p><ul><li><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157660951616613" target="external">North Country National Scenic Trail</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157662417865276" target="external">Manistee River Trail</a></li></ul>', N'Facility', N'-85.8395', N'44.37374', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (148, N'244317', N'South Branch Au Sable Area', N'<p>This area is superb for hunting and fishing.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (149, N'244453', N'Au Sable River', N'<p>From Mio Pond to Lake Huron, the Au Sable is primarily managed by the HMNF.&nbsp; The river is managed in two sections, one from Mio Pond to Alcona Dam Pond, the second from Alcona Dam to Lake Huron.</p><p>&nbsp;</p><h2>Au Sable National Wild and Scenic River</h2><p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157659836028984" title="Au Sable National Scenic River"><img alt="Au Sable National Scenic River" height="240" src="https://farm1.staticflickr.com/760/22986653474_5fdfd2aa5d_z.jpg" width="320" /></a></p><p>The Au Sable National Scenic River stretches 23-miles, from Mio to Alcona Pond.</p><p>&nbsp;</p><h2>Au Sable River - Alcona Dam to Lake Huron</h2><p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157667880663884" title="Au Sable River"><img alt="Au Sable River" height="240" src="https://c2.staticflickr.com/8/7331/28130707145_dfe13b8e10_n.jpg" width="320" /></a></p><p>This section provides motorboat opportunities with a lake fishing atmosphere.</p><h3>Highbanks River Trail</h3><p>A short, 7-mile hike along the bluffs of the Au Sable River will provide day hikers with some of the best, and most dramatic, views of the Au Sable River, where hikers or skiers will be able to look over the river valley, with clear views almost to Lake Huron in some spots.</p><h3>Lubmerman&#39;s Monument Visitor Center and Forest Discovery Trial</h3><p>Lumberman&rsquo;s Monument Visitor Center interprets the area&rsquo;s colorful lumbering past. The 14-foot Lumberman&rsquo;s Monument stands on a high bank with the Au Sable River providing a scenic backdrop.</p><h3>River Road National Scenic Byway</h3><p>The twenty-two mile <i>River Road National Scenic Byway</i> extends westward from Lake Huron into the Huron National Forest. It parallels the historic Riviere aux Sable (River of Sand). Lumbermen&rsquo;s Monument Visitor Center sits at the center of the byway.</p><p>&nbsp;</p><h2>Brochures and Maps:</h2><ul><li>Au Sable National Scenic River (<a href="http://go.usa.gov/x9h8F" target="external">pdf</a>)</li><li>River Road National Scenic Byway (<a href="http://go.usa.gov/x9h8j" target="external">pdf</a>) - this brochure shows River Road, the Au Sable River and Lumberman&#39;s Monument</li><li>Highbanks River Trail Map (coming soon)</li><li>Eagle Run Trail Map (coming soon)</li></ul><p><strong>Flickr Photo Albums:</strong></p><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157667880663884" target="external">Au Sable River - Alcona Dam to Lake Huron</a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157661512533399" target="external">Visitor Center</a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157662307594671" target="external">Programs</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157669665916130" target="external">Monument Campground</a></li></ul></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157661473995519" target="external">River Road National Scenic Byway</a><ul><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157669379122650">Iargo Springs</a></li></ul></li><li><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157661466674049" target="external">Highbanks River Trail</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157670036127542" target="external">Eagle Run Trail</a></li></ul></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157659836028984" target="external">Au Sable National Scenic River</a></li></ul>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (150, N'233172', N'AuTrain Lake Campground', N'<h2>Overview</h2>
Located at the south end of AuTrain Lake, this campground is favored by anglers and outdoor enthusiasts. 
<br /><br />
The quiet setting is great for family trips, and visitors can enjoy a variety of recreational opportunities year-round, all less than a day''s drive from major urban areas of Michigan and Wisconsin.<h2>Recreation</h2>
The large size of the lake provides miles of prime water skiing, boating, swimming and fishing. Anglers can expect a healthy catch of bass and a variety of perch. Canoeing is also popular on AuTrain Lake and the nearby AuTrain River, which meanders into Lake Superior.<br /> 
<br />
The campground also provides access to the popular two-mile Songbird interpretive trail, which winds through forest and field, along bog and lakeshore, and is popular for birding.
<br /> <br />
A wildlife viewing platform is available at neighboring Buck Bay and Buck Bay Creek.<h2>Facilities</h2>
The campground offers dozens of large, wooded campsites, available for tent and RV camping. Some sites are available on a first-come, first-served basis. Each site is equipped with tables and campfire rings with grills. Accessible vault toilets and drinking water are provided.
<br /> <br />
A boat ramp is available at the parking area of the campground, and the lot offers plenty of space for turning and parking. Boat rentals are available in AuTrain.<h2>Natural Features</h2>
AuTrain Lake is located in the upper peninsula of Michigan, between three of the Great Lakes. It sits amid rolling hills forested with pine and aspen trees, as well as large open and tree-covered wetlands.
<h2>Nearby Attractions</h2>
The city of AuTrain, located on the shores of Lake Superior, is about 5 miles from the campground.', N'Campground', N'-86.8380556', N'46.3916667', N'', N'bayfurnace@jamadots.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (151, N'238271', N'Bond Falls Watefalls', N'<p>Although not part of the Ottawa National Forest, this beautiful waterfalls is surrounded by the Ottawa National Forest. One of the most popular Upper Peninsula waterfalls. Managed by the U.P. Power Company, a developed trail is maintained with steps and bridges across the river at the base of the falls. This is one fall that is beautiful yearlong, and a variety of plants can be viewed throughout the summer.</p>', N'Facility', N'-89.128797', N'46.406733', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (152, N'238265', N'Yondota Falls', N'<p>Yondota Falls, located just 3 1/2 miles north of Marenisco Mi., on the Bessemer Ranger District, is a series of falls, so be sure you walk far enough to see them all. The trail is not long, but does drop in elevation along the river, so the uphill return hike may make this a moderately difficult trail.</p>', N'Facility', N'-89.681566', N'46.429405', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (153, N'233715', N'SAND LAKE CAMPGROUND', N'<h2>Overview</h2>
Sand Lake Campground is situated on the scenic shores of Sand Lake and provides a selection of sites shaded by a mixed hardwood forest. Just beyond the trees is a well-loved, sandy swimming beach. The campground is located 15 minutes from the Pine National Scenic River and several other lakes.
<br /><br />
The popular campground sits within the Huron-Manistee National Forests, far enough from town to let its natural splendor shine, but close enough for convenient access to gas and groceries.<h2>Recreation</h2>
Power boating, sailing, canoeing, hiking and swimming are some of the most common activities on the lake. Anglers delight in the waters well-stocked with bluegill, perch and smallmouth bass. A picnic area and boat ramp are available for use.<h2>Facilities</h2>
The campground provides conveniences like coin showers, flush toilets and drinking water faucets. Visitors often rave about the nice, private bathrooms with vanities.<h2>Natural Features</h2>
Sand Lake boasts about 50 acres of mostly shallow waters. The campground is nicely wooded; some sites are heavy shaded while others are much more open. Summertime temperatures are generally around 80 degrees.
<br /><br />
The Huron-Manistee National Forests encompass nearly a million acres of public protected land, including nearly 6,000 acres of wetlands that extend over the northern portion of Michigan''s Lower Peninsula.', N'Campground', N'-85.9294444', N'44.1680556', N'231-723-0141', N'comments@AmericanLL.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (154, N'234679', N'SOUTH BRANCH TRAIL CAMP GROUP SITE', N'<h2>Overview</h2>
South Branch Trail Campground Group Site is ideal for equestrian camping. The group area impresses with its beautiful scenery and convenient access to horseback riding and hiking along the 240-mile Michigan Shore-to-Shore Horseback Riding and Hiking Trail. Priority will be given to campers with horses, however everyone is welcome. The spacious site holds up to 250 campers and features a day-use horse parking area.<h2>Recreation</h2>
Hike or horseback ride on the Michigan Shore-To-Shore Riding and Hiking Trail. The trail begins in the town of Empire near Lake Michigan, on the west side of Michigan and ends near Oscoda, Michigan on the Lake Huron eastern side of the state. The eastern part of the trail follows the historic AuSable River to its end in AuSable, just south of Oscoda.<h2>Facilities</h2>
Facilities include at the South Branch Trail Campground Group Site include three sets of vault toilets, an electric water pump - which requires campers to furnish a 5,000 watt generator, one garbage bin and picket posts. Parking allows for up to 65 vehicles.<h2>Natural Features</h2>
Campsites are situated in a stand of oak and pine at an elevation of 880 feet. The campground is adjacent to the South Branch River and is also not too far from the AuSable River. The magnificent Lake Huron is only a short drive east of the campground.', N'Campground', N'-83.7961111', N'44.4869444', N'', N'ssokolak@fs.fed.us')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (155, N'234734', N'TOM''S LAKE CABIN', N'<h2>Overview</h2>
Tom''s Lake Cabin was built in 1991 and will accommodate up to eight people.  The cabin is situated on a small knoll overlooking Tom''s Lake, a 23 acre lake in the heart of the Hiawatha National Forest.<h2>Recreation</h2>
There are several hiking, biking, and horseback riding trails within a few miles from the cabin, including the Ironjaw semi-primitive area and the Pine Marten Run trail system offering 26 miles of trail.  For the winter enthusiast, snowmobile trails can be found nearby, and the Pine Marten Run trail is frequently used for snowshoeing and cross-country skiing (although the trail is not groomed).
Those trying their hand at fishing on the lake should note that boat access is carry-in only.<h2>Facilities</h2>
The cabin has a wood stove and firewood is provided in addition to the pedestal grill and fire pit outside. The cabin does not have modern bathroom facilities or electricity. There is a hand pump for drinking water just outside the cabin and a pit toilet behind the cabin.  The cabin is furnished with four twin bunk beds with mattresses and seating for eight. You should plan to bring all your own camping equipment including camp stove, dishes, cooking and eating utensils, toilet paper, water containers, lanterns, flashlights, bedding and pillows.
 
There is a gate at the entry road for your use.  You can close it if you wish for privacy, but we ask that you don''t lock it in the event we need to get in for routine maintenance.  We will leave it the way we found it.
During the winter months, the 1/4 mile road into the cabin is not plowed.  One must park in the parking lot provided along Co. Rd. 440 and walk, ski, or snowmobile in.<h2>Natural Features</h2>
Tom''s Lake Cabin is nestled adjacent to Tom''s Lake and is ideal for swimming and fishing. Anglers will enjoy a day on the lake in search of largemouth bass and bluegill.  After a day fishing and swimming, settle in for a wonderful campfire overlooking the lake and relax around the outdoor fire pit lined with a few benches.
The Hiawatha National Forest is rich in wildlife, which includes 312 species that live within the Hiawatha National Forest region including whitetail deer, black bear, grey wolves, coyote, eagles, hawks, and rabbits.  Over 250 species of birds use the Hiawatha, either when migrating through the area, as summer or winter range, or as permanent residents.
<h2>Nearby Attractions</h2>
The cabin is within a short commute of the Big Island Lake Wilderness with its 23 small lakes and portages to challenge the canoeist. The nationally-designated Wild and Scenic Indian River is also nearby, and its 51 miles offer outstanding canoeing and fishing opportunities. <br />
Groceries, gasoline, fishing, camping supplies, boat rentals, ice, MDNR licenses, deli, and restaurants are available on Highway 13.', N'Campground', N'-86.5905556', N'46.1611111', N'906-474-6442 OR 906-387-2512', N'bmadden@fs.fed.us')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (156, N'234658', N'JUNIPER FLATS GROUP CAMPSITE on GRAND ISLAND', N'<h2>Overview</h2>
Juniper Flats Group Campground is one of only a few places to stay on beautiful Grand Island. The island''s scenic natural beauty and interesting history make it a popular place for camping and other outdoor activities.
<br /> <br />
The Grand Island National Recreation Area boasts massive 300-foot wave-cut sandstone cliffs, 13,500 acres of lush forest, beaches of fine sand, winter ice caves and historic buildings and artifacts dating back as far as 2000 B.C.<h2>Recreation</h2>
The island offers more than 30 miles of hiking and mountain biking trails, complete with spectacular scenery. Visitors also enjoy fishing on the island. Anglers will find plentiful salmon, trout, perch, pike, walleye and bass. A variety of wildlife also make its home on the island.
<br /> <br />
Kayaking, canoeing and boating are also popular pastimes. Boats, however, must be anchored offshore because of the rocky lake bottom and heavy surf.<h2>Facilities</h2>
The campground provides one large group tent campsite, equipped with tables and a campfire circle. Vault toilets and drinking water are provided. Bear poles and bear boxes are available for food storage. <br /> <br /><h2>Natural Features</h2>
Juniper Flats Group Campground is located on the west side of Grand Island near the Waterfall and Mather beaches. 
<br /> <br />
The area is heavily forested and primarily shady throughout the day. The campground is situated away from the beach, but the lake is visible from the site.', N'Campground', N'-86.6852778', N'46.4866667', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (157, N'244404', N'Wakeley Lake Area', N'<p>Recreation areas near the Wakeley Lake Area.&nbsp; This is the section of the Huron National Forest furthest west, and most sites are located along or north of M-72.&nbsp;</p>', N'Facility', N'-84.509175', N'44.633085', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (158, N'244448', N'Kirtland''s Warbler and Jack Pine Wildlife Tours', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157662370250922" title="Kirtlands Warbler"><img alt="Kirtlands Warbler" height="240" src="https://farm6.staticflickr.com/5800/22987579624_5eba676ec8.jpg" width="320" /></a></p><h2>Self-Guided Jack Pine Wildlife Viewing Tour</h2><p>The Jack Pine Wildlife Viewing Tour is a self-guided, 58-mile auto-tour through jack pine ecosystems that are home to a variety of wildlife, including the endangered Kirtland''s warbler. The tour is marked with signs that display an image of the Kirtland''s warbler and the watchable wildlife symbol.  Along the route are also opportunities to stop at one of the many recreation sites available to access the Au Sable River.</p><p>Along the route there are many examples of wildlife habitat. Interpretive signs discuss specific management methods at the five stops. Occupied Kirtland''s warbler habitat is closed to public entry during nesting seasons to protect the birds.  Closed areas will be posted with signs.</p><p>Maps are available at the <a href="http://www.fs.usda.gov/detail/hmnf/?cid=FSM8_046857">Mio Ranger Station</a>.</p><h2>Guided Kirtland''s Warbler Tours</h2><p>Kirtland’s warbler tours will be offered daily from May 15 through May 31, 7 days a week at the Mio Ranger District of the Huron National Forest.</p><p>Guided Kirtland’s warbler tours are the best opportunity to view this endangered songbird, as Kirtland’s warbler nesting areas are closed and posted against public entry during the nesting season.  Kirtland’s warblers are rarely seen in Michigan outside of their nesting habitat.</p><p>The Kirtland’s warbler tour begins at 7:30 am at the Mio Ranger District office at 107 McKinley Road.  Please arrive at 7:15 am to check in and pay before the tour begins.  The tour begins with a short video that highlights the natural history and management of the Kirtland’s warbler.  The tour participants then follow the tour guide in their own vehicle to a field site.  At the field site, participants have an excellent chance of seeing a Kirtland’s warbler, as well as other birds that live in the jack pine habitat.  The tour participants visit a cowbird trap and learn about the jack pine ecosystem.  The entire tour lasts approximately three hours.</p><p>Tour participants are encouraged to bring binoculars.  Tape recorders, pets, and smoking are not allowed on the tour.  Reservations are not required, but are recommended for groups of four or larger.  The Kirtland’s warbler tour costs $10 per adult and is free for children.  Funds from the tours help cover costs associated with the tours.  For more information, call the Mio Ranger District office at (989) 826-3252.   Interested community groups and teachers can arrange for a free tour by contacting Kim Piccolo, (989) 826-3252 ext. 3334 or <a href="mailto:miokwtours@fs.fed.us?subject=Kirtland''s%20Warbler%20Guided%20Tour">email</a><a href="mailto:kwtours@fs.fed.us?subject=Kirtland%20Warbler%20Guided%20Tours">.</a></p><p>Tours will be available at Hartwick Pines State Park in Grayling through the Michigan Audubon Society. For more information on Grayling tours, contact <a href="mailto:events@michiganaudubon.org?subject=Kirtlands%20Warbler%20Guided%20Tour">events@michiganaudubon.org</a>  or 517-580-7364.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (159, N'244402', N'Manistee River', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157664674562850" title="Manistee National Recreation River"><img alt="Manistee National Recreation River" height="240" src="https://farm2.staticflickr.com/1445/25375562445_1e0dc3a721.jpg" width="320" /></a>The Manistee River, from Tippy Dam to the M-55 Bridge, is a designated National Recreation River.&nbsp; There are several river access sites, day use areas and campgrounds located along this section of river.&nbsp; During the summer the river is popular with canoers and kayakers, while during the fall salmon season, sites such as Suicide Bend and Sawdust Hole are popular with anglers.</p><p>The section north of Tippy Dam, up to Hodenpyl Dam Pond, is bordered on either side by the Manistee River Trail and the North Country National Scenic Trail.&nbsp; This area is also within the Manistee River Semi-Primitive Nonmotorized Area, a 7,900 acre area of the Forest.</p><p>&nbsp;</p><p><strong>Brochure with map</strong>:</p><ul><li><a href="https://go.usa.gov/x9h9c" target="external">Manistee River</a></li><li><a href="https://go.usa.gov/x9h8P" target="external">Manistee River Trail</a></li><li><a href="http://go.usa.gov/x9h9Y" target="external">Disc Golf Course Map</a></li></ul><p>This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller.</p><p>&nbsp;</p><p><strong>Flickr Photo Albums</strong></p><ul><li><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157664674562850" target="external">Manistee River</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157662417865276" target="external">Manistee River Trail</a></li></ul>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (160, N'234678', N'HUNGERFORD EQUESTRIAN GROUP CAMPSITE', N'<h2>Overview</h2>
The Hungerford Recreation Area offers access to over 50 miles of trails for horseback riding, hiking and mountain biking. <br/><br/>
The horse trails connect to the group campsite. There are a few small lakes located nearby, including, Hungerford Lake, Toogood Lake and Mud Lake.<h2>Recreation</h2>
Forty-seven plus miles of horseback riding trails and 10 miles of mountain biking trails make the campground an ideal place for both equestrian campers and outdoors enthusiasts. <br/><br/>
Hungerford Lake is located a half mile south of the Hungerford Family Campground and one and a quarter miles south of the Hungerford Equestrian Group Campsite. The area offers fishing and boating opportunities. Horses are not allowed in or around the lake area, but visitors interested in fishing are welcome to cast for bass, pike and pan fish. There is a boat ramp located at the lake.<h2>Facilities</h2>
<p>There are eight individual sites within the group camp area. Each site can accommodate one large horse trailer, two vehicles and eight people. <br><br><br>Picnic tables, lantern posts, fire rings, and picket poles to highline horses are provided at each of the eight sites. A vault toilet, manure disposal area, trash disposal, and large group campfire ring are provided for the campground. Drinking water is available at the Hungerford Campground, located 1.25 miles south of the site.</p>
<p>The group site''s check in and check out time is 12 noon.</p>
<h2>Natural Features</h2>
The campground is perched along lightly rolling hills in the Manistee National Forest. It is about a mile north of Hungerford Lake and the 48 site Hungerford Campground. 
<br/><br/>
The lake spans 30 acres and is a favorite spot to see fall colors. The Manistee National Forest comprises 540,000 acres and meets the eastern shore of Lake Michigan.
<h2>Nearby Attractions</h2>
Visit the city of Big Rapids, Michigan, or the Loda Lake Wildflower Sanctuary. Benton, Indian, Brush, and Shelley lakes are also nearby.', N'Campground', N'-85.6244444', N'43.7166667', N'231-745-4631', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (161, N'234620', N'THREE LAKES', N'<h2>Overview</h2>
Three Lakes Campground is a peaceful facility tucked away from the busy highway. It is nestled between Whitmarsh, Brown and Walker Lakes, giving visitors ample opportunity to enjoy and explore nature at its best.<h2>Recreation</h2>
The three lakes are open to non-motorized boating. A carry-down boat ramp is located at the campground''s picnic area. Fishing is a popular activity. Rainbow trout, perch and catfish are found in the lakes. Although there is no designated swimming beach, sandy areas are located along the shores of the three lakes. 
<br/><br/>
Hikers enjoy the serene atmosphere of the campground. The Walker Loop Trail begins within the campground, near the picnic area, and leads hikers around the perimeter of Walker Lake. The trail is easy hiking and traverses about 1.15 miles.<h2>Facilities</h2>
Three Lakes Campground is a rustic campground with single-family sites for tent and RV camping. Each is equipped with a table and campfire ring. Vault toilets and drinking water are provided. A day-use picnic area is also available.<h2>Natural Features</h2>
The campground is set among a variety of pine, spruce and maple trees on land sandwiched between Lake Superior and Lake Michigan. Whitmarsh, Brown and Walker Lakes dot the landscape to the north, south, and west of the campground.
<h2>Nearby Attractions</h2>
The nearest town is Strongs, just 2.5 miles from the campground.', N'Campground', N'-84.9788889', N'46.3191667', N'(906) 643-7900', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (162, N'232456', N'SOUTH MANITOU GROUP', N'<h2>Overview</h2>
South Manitou Group Campground is a tent-only backcountry facility on South Manitou Island in Sleeping Bear Dunes National Lakeshore on Lake Michigan. Campers must take a 1.5-hour ferry or boat ride to reach it, and must backpack their gear into the campground from the dock.
<br /><br />
This facility is comprised of three reservable group sites at Bay Campground and three others at Weather Station Campground. Each site is open to groups of nine to 20 people only. Smaller parties must plan to occupy multiple first-come, first-served individual sites at Popple, Bay or Weather Station Campgrounds on the island. Bay is the closest campground to the dock (less than a mile) and a short walk from the beach. Weather Station overlooks Lake Michigan from the bluffs on the south side of the island; the hike from the ferry is about 1.3 miles. 
<br /><br />
If group sites are full, your group may be able to split up into multiple individual campsites. Be sure to make reservations for the ferry (231-256-9061) for transportation to the island. For more information, call 231-326-4700 ext 5010
<br /><br />
Summer temperatures range from the upper 70s to 90s during the day and drop about 20 degrees at night. Winters are cold, with daytime highs in the 20s to 30s and lows in the 10s and 20s; snow is usually on the ground from late November through March.<h2>Recreation</h2>
There is no shortage of activities on South Manitou Island. Visitors can hike around the 10-mile perimeter of the island via pebble beaches, take a tour of the South Manitou Island Lighthouse during summer months, view the 1960 shipwreck of the Francisco Morazanon or go on a motorized tour to learn the history of the island.<br /><br />
Visitors can also hike day-long excursions to unique sand dune formations and old growth cedar forests. Both campgrounds have beach access where campers can beachcomb and swim; group sites are closer to the beach at Bay Campground than at Weather Station.<h2>Facilities</h2>
Water is only available in the Village area. Group campsites are secluded and set apart from one another. Each site has a fire pit for open fires (firewood must be purchased or collected in the park). Wooden pit toilets are provided, however campers must bring their own toilet paper.<h2>Natural Features</h2>
South Manitou Island is part of an island chain in Lake Michigan that extends north to the Straits of Mackinac. The island consists of a ridge of tilted layers of limestone, buried under a blanket of glacial debris. It features unique sand dune formations, 10 miles of pebble beaches and a grove of old growth white cedars that date back over 500 years. The campgrounds lie on sandy soils among younger forests.', N'Campground', N'-86.0947', N'45.0124639', N'231-326-4700 ', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (163, N'244316', N'Cooke Area', N'<p>The 2,419 acre Cooke area is located in Oscoda Township in Iosco County, Michigan</p><p>The terrain is mostly lowlands. Much of the area is densely forested with a mix of conifers including cedar, fir and red and white pine. Pockets of aspen and open areas also occur in the area. Wildlife species that commonly inhabit this area include white-tailed deer, bald eagles, swans, raccoon, porcupine, squirrel, pileated woodpecker and various songbirds.</p><p>Dispersed camping is a popular activity at the eight <a href="http://www.fs.usda.gov/recarea/hmnf/recarea/?recid=18570">designated campsites </a>along the southern boundary of the area. From May 15 through September 30, permits are required to camp at these sites. Boating and fishing on the Au Sable River are very popular in this area. Other recreation activities include deer and small-game hunting, berry picking and bird watching.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (164, N'238200', N'Hovey Lake Campsites', N'<p>This isolated, quiet, family type camping area is located on the east side of Hovey Lake. It is a good place for canoeing, bird watching, or just enjoying nature¿s surroundings. There are 4 campsites, each with a table and fire ring. Toilets and drinking water are available. Swimming conditions in this lake are not good due to shallow water and the mucky bottom. Some northern pike, black bass, and panfish can be caught here. The 99 acre Hovey Lake is the headwaters of the Indian Wild and Scenic River and offers good trout fishing. There is a carry-in boat access near the entrance of the campground.</p>', N'Campground', N'-86.698681', N'46.288597', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (165, N'234763', N'ROUND LAKE', N'<h2>Overview</h2>
Round Lake Campground offers a scenic, rustic, wooded camping area offering a wide variety of recreation opportunities in the Huron-Manistee National Forest in Michigan.<h2>Recreation</h2>
There is a wide variety of recreational opportunities located in and around the campground.  Anglers can fish for sunfish, bass and pike while campers can relax at the sandy beach. The campground has a gravel boat ramp.<h2>Facilities</h2>
Round Lake Campground has 33 sites in two camping loops.  Approximately a quarter of the sites in this campground have access to water. Amenities at the campground include vault toilets and garbage service along with picnic tables and campfire rings at each campsite.<h2>Natural Features</h2>
Round Lake''s 91-acres is mostly surrounded by private land.  Round Lake Campground provides the only public access to the lake.<br /><br />
Nearby Sand Lake Picnic and Swimming Area are located on the 248-acre Sand Lake. The beach and picnic area provide the only public access to Sand Lake.
<h2>Nearby Attractions</h2>
The campground is located in the village of Sand Lake, MI and groceries and fuel are nearby. Lumberman''s Monument Visitor''s Center is less than 15 miles from the campground.  There are hiking trails nearby, a picnic day use area on nearby Sand Lake, bird watching, and hunting opportunities.', N'Campground', N'-83.6644444', N'44.3427778', N'989-739-0728', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (166, N'244451', N'Wagner Lake Area', N'<p>This section contains information on the sites located in the southern section of the Huron National Forest.&nbsp;</p>', N'Facility', N'-84.147089', N'44.553715', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (167, N'238236', N'Kenton  Ranger District', N'<p>The Kenton Ranger District is the largest and oldest district on the Ottawa, dating back to 1931, when the forest had only one district. The recreation program includes a wide variety of dispersed activities including hunting, fishing, remote camping and hiking including two wildernesses, snowmobiling on numerous maintained trails, recreational driving with a variety of potential destinations including lakes, waterfalls and other scenic attractions. Developed recreation includes 7 campgrounds (3 on rivers, 4 on lakes), 2 waysides on M-28 and a CCC era organizational camp, which is used seasonally by a wide variety of organizations for outdoor education and other purposes.</p><p>The McCormick Wilderness and The Sturgeon Gorge Wilderness are located on the District.<br />The district is a premium spot for the outdoorsman. Whitetail deer are numerous. Black bear are common and getting more numerous. Upland game birds include ruffed grouse and woodcock. There is some local Canada geese and ducks in addition to migrants, which concentrate on local farm fields and Michigan DNR wildlife projects. Wild turkey hunting is also available with a two-hour drive. Fishing includes brook, rainbow and German brown trout, Chinook and Coho salmon, walleye, large and small mouth bass, northern pike, musky and numerous species of pan fish. The area is also home to a wide variety of other wildlife including moose, gray (timber) wolves, fisher, pine marten, bald eagles, osprey, loons, river otter, bobcat, mink, beaver and many more. Sightings of bald eagle are common occurrences with local population being among the highest in the Midwest along with numerous nesting sites. In general, it is a good place if you enjoy clean air, water, outdoor experiences and nature.<br />&nbsp;</p>', N'Facility', N'-88.8915', N'46.4861', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (168, N'233207', N'MARION LAKE GROUP SITE', N'<h2>Overview</h2>
The sparkling Marion Lake offers breathtaking and exciting camping for your next family trip. Live it up on the water with your jet skis or wake board, or tone down the pace with a full day of fishing. The Marion Lake Group Site is an ideal way to spend time with friends and family for all the water activities you can imagine.  
 
Marion Lake is in the Ottawa National Forest, a protected area in the Western Upper Peninsula of Michigan. It stretches from the Lake Superior shoreline to the Wisconsin border, and attracts deer and many types of migrating birds.  <h2>Recreation</h2>
A swim beach is adjacent to the group site.<h2>Facilities</h2>
A convenient path leads to the lake and  boat launch. Water is not available on-site, but is a short walk away.<h2>Natural Features</h2>
The campground is in a large, grassy field surrounded by hemlock and hardwood trees with an opening to Marion Lake. The altitude is 1,627 feet, with lightly rolling hills stretched between the many other lakes in the area.
<h2>Nearby Attractions</h2>
Hiking enthusiasts will find scenic trails throughout the Sylvania Wilderness area, a region to the west with old-growth forests and 34 named lakes. On the way, stop by the Ottawa Visitor Center in Watersmeet for some interesting exhibits.', N'Campground', N'-89.0863889', N'46.2680556', N'906-358-4724', N'mholland@fs.fed.us')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (169, N'234083', N'CARP RIVER CAMPGROUND', N'<h2>Overview</h2>
Nestled in a quiet, rustic setting adjacent to the Carp Wild and Scenic River, Carp River Campground is an ideal place to get away and enjoy the outdoors. 
<br /><br />
The surrounding Hiawatha National Forest provides visitors with countless recreational activities, and the scenery provides a beautiful backdrop for a traditional camping experience. <h2>Recreation</h2>
Divided into two major blocks of land and five districts, the forest is home to Grand Island National Recreation Area, Whitefish Scenic Byway, six lighthouses, five Wildernesses and Clear Lake Education Center. In addition to recreation opportunities, visitors will find a wide array of habitats, including trees like northern hardwoods, jackpine and other conifers, and a variety of inland wetland habitats.
<br /><br />
Fishing is a popular activity in the campground area, and brook, brown and rainbow trout can all be spotted in the Carp River. 
<br /><br />
In addition to the fishing opportunities, hiking canoeing, kayaking, wildlife viewing and more are all available at or around the Carp River Campground.<h2>Facilities</h2>
All campsites are wooded and shaded from the hot summer sun. Each site has a table and a fire ring, and drinking water and vault toilets are conveniently spaced throughout the campground.<h2>Natural Features</h2>
Located in Michigan''s wild and scenic Upper Peninsula, the Hiawatha National Forest is known as &quot;the Great Lakes National Forest.&quot; The forest''s dramatic shorelines lie nestled up to Lakes Superior, Huron and Michigan.
<br /><br />
Outstanding lakeshores, lighthouses, islands and historic sites create a playground and place of respite, all within a day''s drive from major urban and rural areas of Michigan and Wisconsin.
<h2>Nearby Attractions</h2>
Carp River Campground is located just eight miles from St. Ignace, which is known for its fine restaurants, museums and historic sites. <h2>Charges &amp; Cancellations</h2>
<p>Please cancel seven days in advance if you need to cancel your reservation. Reservation sites cannot be traded for walk up sites.</p>
', N'Campground', N'-84.7191667', N'46.0330556', N'906-203-9872', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (170, N'238235', N'Iron River Ranger District', N'<p>Iron River is located in Iron County, in the western portion of Michigan''s Upper Peninsula, just seven miles from the Wisconsin border. The border is shared with the Nicolet National forest. The Iron River Ranger District is 138,000 acres in size.  Recreation opportunities include two camping for fee campgrounds and two rustic campgrounds. Three wilderness areas are located on adjacent districts. The area''s climate is truly unique for each season of the year. The weather is summarized as follows: 31 inches of average annual precipitation, 68 inches of snowfall, an average of 62 frost-free days, 59 degree F. average temperature May through September, and long cold winters.<br />Four-season recreation is Iron County''s claim to fame. 2,175 lakes and 902 miles of streams offer unlimited challenges for both warm and cold-water fishing. Three rivers on the district have recently been designated as recreational rivers under the Wild and Scenic rivers Act. Northern hardwoods, pine, balsam fir, and spruce cover 80% of the county. More whitetail deer Boone and Crockett entries have been taken from the forests of Iron County than any other Michigan county. Add to this, the title of woodcock capital of the world and one cannot find any better small and big game hunting anywhere in the Midwest.<br />When winter arrives, it''s no time to rest. 212 miles of snowmobile trails connect to a vast system of trails throughout upper Michigan and northern Wisconsin. The Iron River District, in cooperation with Covenant Point Bible Camp, grooms and maintains a Nordic ski trail, and Ski Brule, a major ski resort, is just minutes from town.</p><p><br />&nbsp;</p>', N'Facility', N'-89.1751', N'46.262', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (171, N'232319', N'COLWELL LAKE CAMPGROUND', N'<h2>Overview</h2>
Colwell Lake Campground is situated on Colwell Lake in the center of Michigan''s Hiawatha National Forest. Guests of all ages can enjoy nature and the outdoors in this picturesque setting. <br /><br />
The campground has much to offer in terms of recreation, such as swimming, fishing, boating and picnicking, and can accommodate families, individuals, small groups, RV and tent campers with several amenities.<h2>Recreation</h2>
With an excellent swimming beach, boat access and an accessible fishing pier, Colwell Lake has plenty to offer families and anglers. <br /><br />
Largemouth bass, northern pike, crappie, pumpkinseed sunfish, perch and bluegill are all available in the lake. The facility also provides a leisurely 2 mile hiking and snowshoeing trail.<h2>Facilities</h2>
The campground consists of many individual family sites, as well as a group site that can hold 24 people and two tent-only sites along the lake shore. Sites are equipped with campfire rings, lantern posts and tent pads, with vault toilets and drinking water located throughout the facility.
<br /><br />
A picnic area sits adjacent to the sandy swimming beach. Pedestal grills and tables for individual families or small groups are provided.
<br /><br />
Boaters will find a boat ramp and launching pier near the campground entrance. There is adequate space for parking and a trailer turn-around.<h2>Natural Features</h2>
The campground is situated on Michigan''s Upper Peninsula, on the eastern shore of the 145-acre Colwell Lake. The area is forested with a variety of deciduous and conifer trees, and some campsites overlook the water.
<h2>Nearby Attractions</h2>
Big Island, Fish and Straits lakes are all within 25 miles of the campground.', N'Campground', N'-86.4375', N'46.2216667', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (172, N'238174', N'St. Ignace Ranger District', N'<p>St. Ignace Ranger district is located on the lower half of the east side of the forest. </p>', N'Facility', N'-84.831519', N'45.877577', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (173, N'238257', N'Bessemer Ranger District', N'<p>Bessemer Ranger District has a variety of traditional lands, fisheries, and timber programs with new challenges in wildlife partnerships, in recreation (Region 9''s only Harbor) and with management of our Wild and Scenic Rivers, and Scenic Byway. The district has an excellent reputation for being team participants at both the district and Forest levels.</p><p>There is something for everyone with 32 waterfalls; 1200 miles of rivers and streams; over 1,100 lakes; and 30 miles of Lake Superior shoreline just 15 minutes north on County Road 513.&nbsp;</p><p>It''s a perfect spot for fishing, picnicking, swimming, boating, canoeing, hiking, camping and hunting for grouse, black bear, and white tailed deer. BESSEMER''S Fourth of July celebration and Pumpkinfest are among the finest in the Midwest, and involves the whole community. A Lake Superior fishing derby on Labor Day ushers in the fall color and salmon run for the Black River Harbor area.</p><p>The Black River Harbor Recreational Area is a popular destination for many when visiting the Bessemer Ranger District.&nbsp; This recreational area provides a marina/harbor, campground, watersfalls, access to the North Country Trail.&nbsp; </p><p>BESSEMER is in the heart of Big Snow country where fresh powder graces four ski resorts with novice to expert trails atop three mountain ranges; kilometers of groomed cross-country trail;&nbsp; The almost one million acre Ottawa National Forest is located throughout the western half of the Upper Peninsula. The forest has five ranger districts and a nursery that serves the Great Lakes area. The Eastern Time zone cuts across the heart of the Forest.</p><p>&nbsp;</p>', N'Facility', N'-89.721', N'46.395', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (174, N'203870', N'Jordan River National Fish Hatchery', N'Overview
The Jordan River National Fish Hatchery is set in the beautiful Jordan River Valley directly adjacent to the naturally wild and scenic Jordan River. The hatchery has produced lake trout for stocking into the Great Lakes since 1965. On your trip (depending upon the season) you may dine in the picnic pavilion, hike the scenic trails, enjoy the pollinator garden, or ride in on your snowmobile for a break and a hot chocolate. These are but of few of the possibilities that await you at Jordan River National Fish Hatchery. Oh...not to mention seeing the millions of lake trout, brook trout and cisco that call this hatchery home. You may even witness their hatch or see them boarding a hatchery truck headed to their new home in one of our Great Lakes. ', N'Facility', N'-84.96320343', N'45.02679825', N'(231) 584-2461', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (175, N'244401', N'M-55: Manistee to Cadillac', N'<p>This section includes all recreation areas along M-55 or a short distance from M-55 located between Cadillac and&nbsp;Manistee, except the Pine and Manistee Rivers.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (176, N'238204', N'Lighthouses', N'<p>Six historic lighthouses stand on Hiawatha’s Great Lakes shorelines, five of which are owned entirely or in part by the Forest Service. “Lighthouse lookers” eagerly seek out views and interaction with Pt. Iroquois, Peninsula Point, Round Island, East Channel (Grand Island), and Christmas Rear Range Light.   The area’s unique maritime history, and the personal accounts of those who ran the lighthouses are interpreted at Pt. Iroquois Lighthouse and museum.</p><p>Automated aids to navigation replaced most of these facilities in the mid 1900’s, leaving these unique pieces of our cultural heritage available for other uses. The Hiawatha seeks to increase access to these treasures, while ensuring they are properly cared for.</p><ul><li><a href="https://www.fs.usda.gov/recarea/hiawatha/recarea/?recid=18198">Christmas/Grand Island West Channel Front and Rear Range Lights</a></li><li><a href="https://www.fs.usda.gov/recarea/hiawatha/recarea/?recid=18178">Grand Island East Channel Lighthouse</a></li><li><a href="https://www.fs.usda.gov/recarea/hiawatha/recarea/?recid=25819">Grand Island North Lighthouse</a></li><li><a href="https://www.fs.usda.gov/recarea/hiawatha/recarea/?recid=13320">Peninsula Point Lighthouse</a></li><li><a href="https://www.fs.usda.gov/recarea/hiawatha/recarea/?recid=13342">Point Iroquois Lighthouse</a></li><li><a href="https://www.fs.usda.gov/recarea/hiawatha/recarea/?recid=18196">Round Island Lighthouse</a></li></ul>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (177, N'234806', N'Grand Hotel', N'<p>Grand Hotel, built in 1887 and a member of Historic Hotels of America® since 2001, was designated by the U.S. Secretary of the Interior as a National Historic Landmark in 1972.</p><p>Historic Hotels of America is the official program of the National Trust for Historic Preservation® for recognizing and celebrating the finest historic hotels across America.</p>
<p>The all-American Grand Hotel has been an iconic summer resort since it opened in 1887. With a 660-foot-long veranda, the world''s longest, the Victorian-style hotel offers amenities on an equally impressive scale. Seven suites are named for former first ladies Jackie Kennedy, Lady Bird Johnson, Betty Ford, Rosalynn Carter, Nancy Reagan, Barbara Bush, and Laura Bush, all of whom were consulted in the designs. In 2003, Grand Hotel was named as one of America''s Dozen Distinctive Destinations by the National Trust for Historic Preservation. In 2017, Historic Hotels of America honored Grand Hotel''s 130th Anniversary as a steward of history and historical preservation.</p><p>For Price Match Guarantee and Special Offers, please visit <a href="http://www.historichotels.org/hotels-resorts/grand-hotel/?src=180510820">HistoricHotels.org</a>.</p>', N'Facility', N'-84.6248', N'45.851', N'+1 800 678 8946', N'info@historichotels.org')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (178, N'233173', N'BAY FURNACE CAMPGROUND', N'<h2>Overview</h2>
Bay Furnace Campground is located on the south shores of Lake Superior, near Pictured Rocks National Lakeshore. Favorite to many, the campground is centered to various waterfalls, as well as other sightseeing attractions, including boat tours and visits to Grand Island.<h2>Recreation</h2>
Fishing in Lake Superior is best by boat. There is no access to the lake at Bay Furnace, but there is a boat ramp approximately 10 miles west, at AuTrain, and in Munising. Anglers can enjoy a variety of lake trout and salmon fishing.
<br /> <br /> 
Visitors can access the popular Grand Island via a 10-minute ferry ride or by private boat. This scenic island is a favorite for hiking, mountain biking and exploring.
<br /> <br />
Various boat excursions are offered near the campground at an additional cost, providing a great way to explore the crystal clear blue-green waters of Lake Superior and view the stunning natural rock formations.<h2>Facilities</h2>
The campground offers multiple reservable single sites for tent and RV camping. Additional campsites are available on a first-come, first-served basis. Each site is equipped with tables and campfire rings with grills. Accessible vault toilets and drinking water are provided. <br />
<br />
A day-use picnic area is also available at the campground, located near the lake shore. Multiple tables, drinking water and accessible vault toilets are included.<h2>Natural Features</h2>
Visitors can enjoy the scenic views of Lake Superior, with its spectacular sunrises, sunsets and occasional northern lights displays. Amid forests of deciduous trees, some sites overlook the lake while others are near Furnace Creek.
<h2>Nearby Attractions</h2>
Boat ramps are available in Munising, less than 5 miles from the campground, or at AuTrain, which is about 10 miles away.', N'Campground', N'-86.7083333', N'46.4383333', N'', N'bayfurnace@jamadots.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (179, N'233212', N'EWING POINT DISPERSED CAMPSITE', N'<h2>Overview</h2>
Ewing Point is located on the beautiful, 132-acre McKeever Lake in the forests of Michigan. This spacious campground provides a rustic environment in a secluded setting.<h2>Recreation</h2>
Bruno''s Run Hiking Trail weaves throughout the Ewing Point area, offering 9 miles of adventure for hikers. The trail is accessible at various locations, two of which are near the Ewing Point parking area. One section of the trail leads to Grassy Lake, while the other heads along the southeastern portion of McKeever Lake.<br /> 
<br />
McKeever Lake offers great fishing for musky, pike, bass and pan fish, and there is boat access in the parking area. Boats must be carried to the site by hand or through the water. Because the water is quite shallow, large boats are not recommended.<h2>Facilities</h2>
The campsite is equipped with tables and a campfire ring with a grill. A lantern post and pit toilet are also available.<h2>Natural Features</h2>
There is one walk-in campsite on Ewing Point, accessible by a primitive foot trail. The site lies in a grassy area, surrounded by cedar and hemlock.', N'Campground', N'-86.5887389', N'46.2178806', N'906-387-2512', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (180, N'259242', N'D.H. Day Campground', N'<h2>Overview</h2>
<p>D.H. Day Campground is located in the northern district of Sleeping Bear Dunes National Lakeshore, on the lower peninsula of Michigan. </p>
<p>CLICK HERE TO ACCESS A MAP OF D.H. DAY CAMPGROUND: <a href="https://www.nps.gov/slbe/planyourvisit/dhdaycamp.htm" rel="nofollow">https://www.nps.gov/slbe/planyourvisit/dhdaycamp.htm </a> </p>
<p>This rustic campground is one of the most popular in Northern Michigan and is open (weather permitting) from the first Friday in April through the last Sunday in November. Reservations are required May 1 through October 15. Campsites are within walking distance of the Lake Michigan shoreline and a short drive to many popular features in the park. Summer temperatures range from the upper 70s to 90s during the day, and 50s to 70s at night.</p>
<p>As with all NPS sites Sleeping Bear Dunes National Lakeshore is following all CDC guidelines for cleaning and disinfecting public spaces found at: https://www.cdc.gov/.../pdf/Reopening_America_Guidance.pdf This includes routine cleaning of outside surfaces, showers and restrooms, plus twice a day deep cleaning/disinfecting of showers and restrooms using EPA approved disinfectants against Covid-19. Our campground offices have implemented once a day disinfecting at opening, then all touched surfaces will be disinfected after each group uses the office, barriers have been installed on the desks, our staff wear masks, and only one group will be allowed into the office at a time. For more on how the NPS is responding to Covid-19 you can also go to: https://www.nps.gov/aboutus/news/public-health-update.htm Please call the visitor center at 231-326-4700, ext. 5010 if you have a specific question about one of the park''s safety measures. </p>
<h2>Recreation</h2>
<p>Sleeping Bear Dunes National Lakeshores rustic D.H. Day Campground is beautifully wooded. Campers can swim, canoe, kayak, fish and relax along the shoreline of the campground. The multi-use Sleeping Bear Heritage Trail passses through the campground opening up 20+ miles of biking and hiking. There are canoe and bicycle rentals nearby in the village of Glen Arbor. The historic village of Glen Haven is a short 15 minute walk away. Miltiple hiking trails, the Dune Climb, and the Pierce Stocking Scenic Drive are just a short drive away. D.H. Day Campground is the perfect launching point for a fun-filled stay at Sleeping Bear Dunes National Lakeshore.</p>
<h2>Facilities</h2>
<p>With 81 beautifully wooded campsites, shared water spigots, and vault toilets, D.H. Day provides a more rustic camping experience. Free hot showers are available at Platte River Camground, located 17 miles south along highway M-22. Each campsite has a parking area, large picnic table, fire ring and tent pad. Firewood is also sold in the campgound via a self-serve vending trailer. </p>
<h2>Natural Features</h2>
<p>D.H. Day Campground lies in the middle of Sleeping Bear Dunes National Lakeshore near the historic village of Glen Haven. The spacious wooded campsites are no more than a 5 minute walk to the Lake Michigan beach. Features include northern hardwood and conifer forests, old farm meadows, wetlands, lakes, streams, bogs, and splendid examples of glacially formed landscapes. The beautiful perched sand dunes, for which the parked is named, are just a few minutes drive from the campground.   </p>
<h2>contact_info</h2>
For facility specific information, please call (231) 334-4634.
<h2>Nearby Attractions</h2>
<p>D.H. Day Campground is within minutes of the lakeside Village of Glen Arbor and the Historic Village of Glen Haven. The Dune Climb and Pierce Stocking Scenic Drive are a short drive to the south. The Alligator Hill Trail is less than a mile away. The Crystal River winds its way to Lake Michigan just a few short miles to the north. The harbor town of Leland is approx. 30 minutes away and is the gateway to both North and South Manitou Island. </p>
<h2>Charges &amp; Cancellations</h2>
<p>Campers must notify the campground office at 231-334-4634 if they will not arrive within 24 hours of the check-in time or their reservation will be cancelled; They will be charged the first night''s camping fee plus a $20 no show fee.</p>
', N'Campground', N'-86.02006', N'44.89615', N'231-326-4700 ext 5035', N'sleepingbearinfo@nps.gov')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (181, N'244381', N'White River', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157670185184305" title="White River"><img alt="White River" height="240" src="https://c6.staticflickr.com/8/7656/27266511773_fda254659b_z.jpg" width="350" /></a></p><p>Three sections of the White River are currently being study for inclusion as a National Scenic River. Currently the White River is designated Scenic by the State of Michigan.</p><p>The White River is characterized by a primarily sand bottom with deep pockets of water and small sections of gravel bottom.&nbsp; Paddlers find the river to be a steady and moderate float, with a meandering course.</p><p>The forest on either side of the river is primarily stands of oak, maple and aspen hardwoods mixed with red and white pine.</p><p>Wildlife abounds and fishing is a popular activity.&nbsp; A large portion of the river flows through the White River Semi-Primitive Nonmotorized Area.</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (182, N'251536', N'ISLAND LAKE', N'<h2>Overview</h2>
Island Lake Campground is a small and quiet campground nestled in a mostly pine forest. Island Lake offers great fishing for anglers with small boats or canoes.<h2>Recreation</h2>
Island Lake offers excellent fishing and canoeing or kayaking. Anglers fish for largemouth bass, blue gill and perch. The campground offers fishing from shore. Island Lake Campground features a boat slip for small carry-in boats or canoes. Other popular activities include hiking, biking and ATV trails.<h2>Facilities</h2>
This small campground offers a group site and single-family sites that can be doubled-up to occupy two families. Note: Each family has to pay a site fee if doubled up on one site.<h2>Natural Features</h2>
Although there are a few mixed hardwood trees in the area, this campground is favored by those individuals who like to camp in a classic pine forest setting.
<h2>Nearby Attractions</h2>
There are many waterfalls to see in the area, as well as the popular Pictured Rocks National Lakeshore and Grand Island, located just 15 miles away at Lake Superior.', N'Campground', N'-86.6513889', N'46.2708333', N'', N'dave@camprrm.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (183, N'271385', N'Hoist/Reid Lake Areas', N'<p>Recreation areas located near Hoist and Reid Lakes, north of the Au Sable River in the northeast corner of the Huron National Forest.</p>', N'Facility', N'-83.837975', N'44.655249', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (184, N'238242', N'Sturgeon River Gorge Wilderness', N'<p>The Wild and Scenic Sturgeon River rushes out of the northern portion of this wilderness, over the 20 foot volcanic outcroppings of Sturgeon Falls, and through a gorge that reaches 350 feet in depth and a mile in width. Throughout this rugged, steep Wilderness, the Sturgeon and Little Silver Rivers and their tributaries have carved falls, rapids, ponds, oxbows, and terraces. Stunning views are possible from the eastern rim of the gorge. Except for a few naturally bare slopes, most of the land is forested with pine, hemlock, aspen, sugar maple, birch, and basswood. When the leaves of the hardwoods change color in the fall, they form a vivid tapestry. There are few established trails in Sturgeon River Gorge Wilderness, and the few overgrown logging roads are hard to find and follow. The North Country National Scenic Trail parallels the northern and eastern boundaries for about eight miles. Sturgeon River Campground offers seven sites on the southeastern boundary. In spring and during peak runoff, kayaking and white water canoeing are challenging, and only recommended for advanced paddlers.</p><p>Sturgeon River Gorge Wilderness <a href="http://go.usa.gov/xNkdf">Map</a></p>', N'Facility', N'-88.698634', N'46.618118', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (185, N'238173', N'Sault Sainte Marie Ranger District', N'<p>Sault Ste Marie Ranger district is located on the upper half of the east side of the forest.</p>', N'Facility', N'-84.831519', N'45.877577', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (186, N'244318', N'White Water Creek Area', N'<p>This area is located near Wakeley Lake.&nbsp; Both White Water Creek and Midland to Mackinaw Trail wander through the area. To the north the White Water Semi-Primitive Nonmotorized Area is bordered by the Au Sable River and to the east it is bordered by the Mack Lake Motorized Trail System, MCCCT and a snowmobile trail.&nbsp;</p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (187, N'238266', N'Kakabika Falls', N'<p>Kakabika Falls, located approximately 12 miles northeast of Marenisco Mi., on the Bessemer Ranger District.  This falls is actually a series of "S" turns as the river drops in elevation. The trail is not a long trail and not too difficult. There is some good berry picking near here as well as great fishing.</p>', N'Facility', N'-89.453005', N'46.336666', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (188, N'238199', N'Triangle Lake Campsite', N'<p>Located in the heart of the Ironjaw Semi-Primitive Area, Triangle Lake is managed for both motorized and non-motorized uses and our management efforts seek to provide for quiet, peaceful recreation opportunities in a semi-primitive setting. Both campsites on Triangle Lake (169 acres) are located on the non-motorized Pine Marten Run Trail, which is open to hiking, mountain biking and horse back riding. There is no drinking water at these campsites. A boat access and parking area for day use is located at Site #1. This access is very sandy and turn-around space is limited. Carry-in access is recommended. There is no boat access at site #2. Triangle Lake is a good fishing lake with a nice population of northern pike, small mouth bass, bluegills, crappie and perch.</p>', N'Campground', N'-86.490225', N'46.168151', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (189, N'244324', N'White River Area', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157670185184305" title="White River"><img alt="White River" height="240" src="https://c6.staticflickr.com/8/7656/27266511773_fda254659b_n.jpg" width="320" /></a></p><p>The White River runs through this area and there are several campgrounds and boat launches associated with the river.</p><p>The White River Semi-Primitive Nonmotorized Area has several acres of habitat for the federally endangered Karner blue butterfly. </p>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (190, N'233253', N'MONUMENT CAMPGROUND', N'<h2>Overview</h2>
Monument Campground was established in 1909 as one of the first campgrounds built in the Huron National Forest. The campground is a fully accessible camping area within a red pine plantation. <br/><br/>
Families love this conveniently located campsite, just 15 minutes from Lake Huron off the River Road National Scenic Byway.<h2>Recreation</h2>
Campers can access the Highbanks Hiking Trail from the campground or explore the 22-mile River Road National Scenic Byway that overlooks the lovely AuSable River valley. 
<br/><br/>
Beside the campground is the Lumberman''s Monument Visitor Center, replete with information about the area''s rich lumbering history. Here, visitors can climb through a log jam, use a peavey, cut a wooden cookie with a cross-cut saw, and learn about the life of a lumberjack through video and displays.<h2>Facilities</h2>
<p>Pressurized drinking water, vault toilets, trash collection and grills are among the amenities offered at the campground. A host is onsite to answer questions. <br><br><br>In the nearby visitor center, campers can partake in educational programs and browse through the gift shop.</p>
<h2>Natural Features</h2>
Each site is secluded and shaded with large oak and red pine near the AuSable River. The river flows from west to east for 138 miles until it reaches the great lake, Lake Huron.
<h2>Nearby Attractions</h2>
Explore the many trails of the Huron-Manistee National Forests and spend time at Lake Huron.', N'Campground', N'-83.6183333', N'44.4336111', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (191, N'244321', N'Condon Lakes West', N'<p>This area is very popular for mushroom and berry picking, as well as hunting, fishing and camping.</p>', N'Facility', N'-85.900061', N'43.757958', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (192, N'244353', N'Manistee National Recreation River', N'<p><a data-flickr-embed="true" href="https://www.flickr.com/photos/usfs-hmnf/albums/72157664674562850" title="Manistee National Recreation River"><img alt="Manistee National Recreation River" height="240" src="https://farm2.staticflickr.com/1445/25375562445_1e0dc3a721.jpg" width="320" /></a></p><p>The Manistee River between Tippy Dam and the M-55 Bridge&nbsp;was designated as a National Recreational River in 1996. The river is wide and characterized by steep banks and sharp bends, with a swift current and mostly slow, wide bends.</p><p>The river corridor supports a wide variety of recreational activities throughout the year, including hiking on the North Country National Scenic Trail and Manistee River Trail.</p><p>In the fall, hunters come from all over to take advantage of the abundant white-tailed deer, waterfowl and small game hunting&nbsp;available along the river.</p><p>Anglers are lured by the annual salmon and steelhead runs, as well as brown trout, smallmouth bass and walleye.&nbsp; However, salmon season is particularly busy on the river.</p><p>Backwater bayous, extensive riparian areas and mature forest communities provide habitat for a diverse number of wildlife species.&nbsp; The lower Manistee River is considered to be the most extensive and least disturbed remnant of true red-shouldered hawk habitat in the state.</p><p><strong>Brochure with map</strong>:</p><ul><li><a href="https://go.usa.gov/x9h9c" target="external">Manistee River</a></li><li><a href="https://go.usa.gov/x9h8P" target="external">Manistee River Trail</a></li><li><a href="http://go.usa.gov/x9h9Y" target="external">Disc Golf Course Map</a></li></ul><p>This brochure is set to print on 11 x 17 paper, landscape (wide) orientation.&nbsp; To print on 8 1/2 x 11 paper set the print area to &quot;shrink to printable area&quot;, this will make the text on the page smaller.</p><p>&nbsp;</p><p><strong>Flickr Photo Albums</strong></p><ul><li><a href="https://www.flickr.com/photos/usfs-hmnf/albums/72157664674562850" target="external">Manistee River</a></li><li><a href="http://www.flickr.com/photos/usfs-hmnf/albums/72157662417865276" target="external">Manistee River Trail</a></li></ul>', N'Facility', N'0', N'0', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (193, N'233849', N'PINES POINT CAMPGROUND', N'<h2>Overview</h2>
Pines Point Campground is located on the banks of the White River with several campsites overlooking the river. The family campground includes a loop designed for groups containing five sites with a capacity of 20 guests each. Large groups can reserve the entire loop.<br /><br /> 
Find out how the campground got its name when you tube or kayak the &acirc;??point&acirc;?? and see the majestic white pines standing watch over the river. Fishing is also popular in these waters.<h2>Recreation</h2>
Fish for trout, salmon and sucker, or float in a canoe, kayak or tube around the point, a leisurely 1 hour float. The canoe landing is walk-in.<h2>Facilities</h2>
Five group campsites and 27 family campsites lie along the river. Each site is equipped with a picnic table, fire ring and lantern post. Drinking water and flush toilets are provided. Electric hookups are not available.<h2>Natural Features</h2>
The campground is quiet and secluded, surrounded by towering white pines and rolling hills.
The White River runs for 23.6 miles on the western side of Michigan''s Lower Peninsula. Summer temperatures are generally around 80 degrees Fahrenheit.
<br /><br />
The Huron-Manistee National Forests extend over almost a million acres, including nearly 6,000 acres of wetlands. The forests provide recreation opportunities for visitors, habitat for fish and wildlife and resources for local industry.
<h2>Nearby Attractions</h2>
Hikers can explore the White River Special Area, a primarily non-motorized area surrounded on three sides by the White River.', N'Campground', N'-86.1194444', N'43.5277778', N'231-745-8760', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (194, N'234662', N'WIDEWATERS CAMPGROUND', N'<h2>Overview</h2>
Widewaters Campground is remotely located on Michigan''s upper peninsula in the Hiawatha National Forest. 
<br /><br />
It sits on a stretch of heavily forested land between Lake Superior and Lake Michigan, near a series of smaller lakes and the Indian River, making it an ideal getaway for anglers and explorers alike.<h2>Recreation</h2>
This small, quiet campground is perfect for fishing, canoeing and kayaking. Anglers enjoy catching brook trout in the area.
<br /> <br />
The 9-mile Bruno''s Run Trail, which winds its way past a host of small lakes in the area, passes directly through the campground and is a popular trail for hiking and biking, as well as snowshoeing and cross-country skiing in the winter.<h2>Facilities</h2>
The campground offers multiple well-spaced single-family sites, available for tent and RV camping. Sites vary from being heavily wooded and private, to open with little privacy. A few waterfront sites have access to the river. Some additional sites are available on a first-come, first-served basis. <br /> 
<br />
Each site is equipped with tables and campfire rings and some have access to grills. Accessible vault toilets and drinking water are provided. <br /> <br />
Boat ramps are available at the campground and also at Fish Lake.<h2>Natural Features</h2>
Widewaters is in a beautiful forest of mature hardwoods, sandwiched between Irwin Lake and Indian River.', N'Campground', N'-86.6283333', N'46.2194444', N'', N'bayfurnace@jamadots.com')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (195, N'238256', N'Ontonagon Ranger District', N'<p><span style="color: windowtext"><font size="3"><font face="Times New Roman">Ontonagon Ranger District is on the shores of Lake Superior, largest of the Great Lakes, and the mouth of the Ontonagon River. There are numerous outdoor recreational opportunities. Hunting, fishing, swimming, hiking, boating, and ATV riding are available in the summer and fall months. In the winter downhill, cross-country skiing, snowmobiling and snowshoeing are available. <o:p/></font></font></span></p>', N'Facility', N'-89.3122', N'46.8576', N'', N'')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (196, N'233163', N'BLACK RIVER HARBOR PAVILION', N'<h2>Overview</h2>
The Black River Harbor Pavilion is located within the Black Harbor Recreation Area on Lake Superior in Michigans Upper Peninsula. The historic stone and wood pavilion was constructed by the Civilian Conservation Corps in the 1930s.<h2>Recreation</h2>
Lake Superior offers great opportunities for boating, fishing, and swimming.  The North Country National Scenic Trail, which traverses through the recreation area, offers access to all five waterfalls and a scenic 12 mile hike to the Porcupine Mountain Wilderness State Park in Michigan.
<br /><br />
The Black River Harbor Boating Club sponsors an annual fishing derby over Labor Day weekend.<h2>Facilities</h2>
The recreation area offers an enclosed pavilion with a fireplace and flush toilet facilities. A campground with first-come, first-served sites is also available. Facilities include vault toilets and a pressurized water system. A sandy beach is located on-site.<h2>Natural Features</h2>
Visitors enjoy boating, fishing, hiking, swimming, and viewing waterfalls. The Black River Harbor Recreation Area has docking and fuel services for day and transient boaters, a boat launch,  a large picnic area with a swing set, a campground with 39 campsites, beach access to Lake Superior, and five scenic waterfalls along the wild and scenic Black River. The day-use picnic area has a suspension bridge over the Black River with a hiking trail to a beautiful sand and pebble beach on Lake Superior.  The campground is situated among hemlock and pine trees at an elevation of 840 feet, on a bluff overlooking Lake Superior and offers a scenic overlook of Lake Superior''s Apostle Islands. 
<br /><br />
The Ottawa National Forest encompasses nearly one million acres on the west side of Michigan''s Upper Peninsula. The forest extends from the south shore of Lake Superior to the Wisconsin border. It is distinguished by rolling hills dotted with lakes, rivers and waterfalls.
<h2>Nearby Attractions</h2>
For a panoramic view of the area, visit Copper Peak International Ski Flying Hill, a 17-story steel ski jump. Visitors can take an elevator up to the top. The attraction is a short drive from the campground. The Porcupine Mountain Wilderness State Park in Michigan can be seen in the distance from the beach and is less than a one-hour drive from the Harbor.', N'Campground', N'-90.0497222', N'46.6702778', N'906-932-1330', N'mdsimpson@fs.fed.us')
GO
INSERT [dbo].[RIDB] ([id], [FacilityID], [FacilityName], [FacilityDescription], [FacilityTypeDescription], [FacilityLongitude], [FacilityLatitude], [FacilityPhone], [FacilityEmail]) VALUES (197, N'244396', N'South Branch Pine River', N'<p>This river is not navigable for canoeing or boating, however it is an excellent river for cold-water fishing.</p>', N'Facility', N'0', N'0', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[RIDB] OFF
GO
SET IDENTITY_INSERT [dbo].[RIDBAct] ON 
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (1, N'234526', N'Canoeing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (2, N'256367', N'Canoeing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (3, N'232458', N'Canoeing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (4, N'251845', N'Canoeing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (5, N'233715', N'Canoeing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (6, N'233769', N'Canoeing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (7, N'259242', N'Canoeing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (8, N'233849', N'Canoeing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (9, N'234662', N'Canoeing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (10, N'244397', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (11, N'238169', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (12, N'234235', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (13, N'234080', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (14, N'238168', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (15, N'233714', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (16, N'244393', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (17, N'233211', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (18, N'233174', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (19, N'234655', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (20, N'244403', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (21, N'244394', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (22, N'238172', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (23, N'270656', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (24, N'232458', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (25, N'251845', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (26, N'244395', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (27, N'244453', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (28, N'233172', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (29, N'233210', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (30, N'234734', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (31, N'234658', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (32, N'234678', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (33, N'233207', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (34, N'234083', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (35, N'244401', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (36, N'234806', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (37, N'233173', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (38, N'233212', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (39, N'259242', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (40, N'251536', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (41, N'233849', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (42, N'234662', N'Biking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (43, N'244397', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (44, N'10076131', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (45, N'234235', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (46, N'234080', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (47, N'238168', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (48, N'232318', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (49, N'238260', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (50, N'233714', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (51, N'234617', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (52, N'234526', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (53, N'244379', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (54, N'238177', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (55, N'233211', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (56, N'233174', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (57, N'234655', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (58, N'234612', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (59, N'238259', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (60, N'203869', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (61, N'244403', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (62, N'238167', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (63, N'238172', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (64, N'244322', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (65, N'232001', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (66, N'10072262', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (67, N'270656', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (68, N'234790', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (69, N'244320', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (70, N'238258', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (71, N'232458', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (72, N'251845', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (73, N'233255', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (74, N'244315', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (75, N'244453', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (76, N'233172', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (77, N'238175', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (78, N'233715', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (79, N'234734', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (80, N'234658', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (81, N'244404', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (82, N'244402', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (83, N'234620', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (84, N'233769', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (85, N'244316', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (86, N'234130', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (87, N'238200', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (88, N'234763', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (89, N'244451', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (90, N'238236', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (91, N'233207', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (92, N'234083', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (93, N'238235', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (94, N'232319', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (95, N'238174', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (96, N'238257', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (97, N'244401', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (98, N'244350', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (99, N'238262', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (100, N'233173', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (101, N'259242', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (102, N'251536', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (103, N'271385', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (104, N'238173', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (105, N'244411', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (106, N'233717', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (107, N'238199', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (108, N'232002', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (109, N'233253', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (110, N'244321', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (111, N'233849', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (112, N'234662', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (113, N'238256', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (114, N'233163', N'Fishing')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (115, N'244397', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (116, N'238169', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (117, N'244392', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (118, N'238285', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (119, N'234080', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (120, N'238168', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (121, N'233714', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (122, N'244387', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (123, N'234617', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (124, N'234526', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (125, N'244393', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (126, N'233174', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (127, N'234081', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (128, N'234655', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (129, N'234612', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (130, N'244403', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (131, N'244394', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (132, N'247602', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (133, N'238167', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (134, N'238172', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (135, N'244322', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (136, N'256367', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (137, N'10072262', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (138, N'234613', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (139, N'270656', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (140, N'244320', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (141, N'244398', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (142, N'232458', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (143, N'251845', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (144, N'233255', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (145, N'273343', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (146, N'244315', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (147, N'244395', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (148, N'244317', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (149, N'244453', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (150, N'233172', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (151, N'238271', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (152, N'238265', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (153, N'233715', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (154, N'234679', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (155, N'234734', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (156, N'234658', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (157, N'244404', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (158, N'244448', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (159, N'244402', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (160, N'234678', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (161, N'234620', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (162, N'232456', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (163, N'244316', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (164, N'238200', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (165, N'234763', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (166, N'244451', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (167, N'238236', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (168, N'233207', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (169, N'234083', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (170, N'238235', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (171, N'232319', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (172, N'238174', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (173, N'238257', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (174, N'203870', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (175, N'244401', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (176, N'238204', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (177, N'234806', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (178, N'233173', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (179, N'233212', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (180, N'259242', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (181, N'244381', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (182, N'251536', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (183, N'271385', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (184, N'238242', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (185, N'238173', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (186, N'244318', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (187, N'238266', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (188, N'238199', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (189, N'244324', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (190, N'233253', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (191, N'244321', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (192, N'244353', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (193, N'233849', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (194, N'234662', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (195, N'238256', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (196, N'233163', N'Hiking')
GO
INSERT [dbo].[RIDBAct] ([id], [FacilityID], [Activity]) VALUES (197, N'244396', N'Hiking')
GO
SET IDENTITY_INSERT [dbo].[RIDBAct] OFF
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [RIDBids] FOREIGN KEY([RIDBActivity])
REFERENCES [dbo].[RIDBAct] ([id])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [RIDBids]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [UserIDs] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [UserIDs]
GO
USE [master]
GO
ALTER DATABASE [Recdit] SET  READ_WRITE 
GO

