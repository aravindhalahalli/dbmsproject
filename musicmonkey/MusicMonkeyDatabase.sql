--Creation	\c
drop database MusicMonkey;

create database MusicMonkey;

use MusicMonkey;

create table ALBUM (Album_ID int, Album_Name varchar(50), Year_Of_Release int, Artwork_URL varchar(80), Primary Key (Album_ID));

create table ARTIST (Artist_ID int, Artist_Name varchar(40), Date_Of_Birth date, Gender varchar(10), Photo_URL varchar(80), Primary Key (Artist_ID));

create table COMPOSER (Composer_ID int, Composer_Name varchar(40), Date_Of_Birth date, Gender varchar(10), Photo_URL varchar(80), Primary Key (Composer_ID));

create table LYRICIST (Lyricist_ID int, Lyricist_Name varchar(40), Date_Of_Birth date, Gender varchar(10), Photo_URL varchar(80), Primary Key (Lyricist_ID));

create table SONG (Song_ID int, Title varchar(50), Genre varchar(20), Language varchar(20), No_Of_Plays int, Album_ID int, Song_URL varchar(20), Primary Key (Song_ID), Foreign Key (Album_ID) references ALBUM(Album_ID) on delete cascade on update cascade);

create table REVIEWS (Song_ID int, Reviewer_Name varchar(30), Reviewer_Email varchar(50), Rating float, Review varchar(240), Primary Key (Song_ID, Reviewer_Email), Foreign Key (Song_ID) references SONG(Song_ID) on delete cascade on update cascade);

create table TRENDING (Song_ID int, Ranking int, Points float, Primary Key (Ranking), Foreign Key (Song_ID) references SONG(Song_ID) on delete cascade on update cascade);

create table ARTIST_SONGS (Song_ID int, Artist_ID int, Primary Key (Song_ID, Artist_ID), Foreign Key (Song_ID) references SONG(Song_ID) on delete cascade on update cascade, Foreign Key (Artist_ID) references ARTIST(Artist_ID) on delete cascade on update cascade);

create table COMPOSER_ALBUMS (Album_ID int, Composer_ID int, Primary Key (Album_ID, Composer_ID), Foreign Key (Album_ID) references ALBUM(Album_ID) on delete cascade on update cascade, Foreign Key (Composer_ID) references COMPOSER(Composer_ID) on delete cascade on update cascade);

create table LYRICIST_ALBUMS (Album_ID int, Lyricist_ID int, Primary Key (Album_ID, Lyricist_ID), Foreign Key (Album_ID) references ALBUM(Album_ID) on delete cascade on update cascade, Foreign Key (Lyricist_ID) references LYRICIST(Lyricist_ID) on delete cascade on update cascade);


--Insertion in Album	\c

insert into ALBUM values
(10, 'Zindagi Na Milegi Dobara', 2011, '/Images/AlbumArtworks/ZindagiNaMilegiDobara.jpg'),
(9, 'Rock On', 2008, '/Images/AlbumArtworks/RockOn.jpg'),
(1, 'Amar Aponjon', 2017, '/Images/AlbumArtworks/AmarAponjon.jpg'),
(2, 'Ami Je Ke Tomar', 2017, '/Images/AlbumArtworks/AmiJeKeTomar.jpg'),
(8, 'PK', 2014, '/Images/AlbumArtworks/PK.jpg'),
(7, 'Hasee Toh Phasee', 2014, '/Images/AlbumArtworks/HaseeTohPhasee.jpg'),
(3, 'Anand', 1971, '/Images/AlbumArtworks/Anand.jpg'),
(5, 'Caravan', 1971, '/Images/AlbumArtworks/Caravan.jpg'),
(6, 'Fanaa', 2006, '/Images/AlbumArtworks/Fanaa.jpg'),
(4, 'Cabaret', 2017, '/Images/AlbumArtworks/Cabaret.jpg');

--Insertion in Songs	\c

insert into SONG values
(1, 'Dil Dhadakne Do', 'Bollywood', 'Hindi', 0, 10, 'WuMWwPHTSoY'),
(2, 'Ik Junoon - Paint It Red', 'Bollywood', 'Hindi', 0, 10, '5PbWtDGOL8A'),
(3, 'Khaabon Ke Parinday', 'Bollywood', 'Hindi', 0, 10, 'R0XjwtP_iTY'),
(4, 'Senorita', 'Bollywood', 'Hindi', 0, 10, 'YdVPHlpMpsw'),
(5, 'Der Lagi Lekin', 'Bollywood', 'Hindi', 0, 10, 'TSOpvMfAmns'),
(6, 'Sooraj Ki Baahon Mein', 'Bollywood', 'Hindi', 0, 10, 'Isb7WV4d17I'),

(7, 'Rock On', 'Bollywood', 'Hindi', 0, 9, 'EOyyVT31cCM'),
(8, 'Phir Dekhiye', 'Bollywood', 'Hindi', 0, 9, '19k4nsdF3Do'),
(9, 'Pichle Saat Dino Mein', 'Bollywood', 'Hindi', 0, 9, '6SncLwWFrJ0'),
(10, 'Sinbad The Sailor', 'Bollywood', 'Hindi', 0, 9, 'eY62RfeviuE'),
(11, 'Socha Hai', 'Bollywood', 'Hindi', 0, 9, 'F3O3akbY8UU'),
(12, 'Tum Ho Toh', 'Bollywood', 'Hindi', 0, 9, 'I3rQkFFqCiI'),
(13, 'Yeh Tumhari Meri Baatein', 'Bollywood', 'Hindi', 0, 9, 'LpmGCHYAj1E'),
(14, 'Zehreelay', 'Bollywood', 'Hindi', 0, 9, '8HrYH5w6oOc'),

(15, 'Tharki Chokro', 'Bollywood', 'Hindi', 0, 8, 'nd4wsdUMorY'),
(16, 'Love Is A Waste Of Time', 'Bollywood', 'Hindi', 0, 8, 'jAmzBv3oq8M'),
(17, 'Chaar Kadam', 'Bollywood', 'Hindi', 0, 8, 'WKbwopSXLWU'),
(18, 'Nanga Punga Dost', 'Bollywood', 'Hindi', 0, 8, 'm2a3WlRyWGM'),
(19, 'Bhagwan Hai Kahan Re Tu', 'Bollywood', 'Hindi', 0, 8, 'G6SutyLlzws'),
(20, 'Dil Darbadar', 'Bollywood', 'Hindi', 0, 8, 'f3KYlEYq3IM'),

(21, 'Drama Queen', 'Bollywood', 'Hindi', 0, 7, '0Qs-Suk42dY'),
(22, 'Ishq Bulaava', 'Bollywood', 'Hindi', 0, 7, 'c2gSzYLJ8sY'),
(23, 'Manchala', 'Bollywood', 'Hindi', 0, 7, 'NobzfIebbrE'),
(24, 'Punjabi Wedding Song', 'Bollywood', 'Hindi', 0, 7, 'NuTx6Q4151s'),
(25, 'Shake It Like Shammi', 'Bollywood', 'Hindi', 0, 7, 'JOQTyJBP0T4'),
(26, 'Zehnaseeb', 'Bollywood', 'Hindi', 0, 7, 'KLYwt0YmQw8'),

(27, 'Chanda Chamke', 'Bollywood', 'Hindi', 0, 6, '1JCszwP5tl8'),
(28, 'Chand Sifarish', 'Bollywood', 'Hindi', 0, 6, 'zWEOx7TSM6I'),
(29, 'Dekho Na', 'Bollywood', 'Hindi', 0, 6, 'v4h5iPlxj0c'),
(30, 'Des Rangila', 'Bollywood', 'Hindi', 0, 6, 'drlfr5Rtb1o'),
(31, 'Mere Haath Mein', 'Bollywood', 'Hindi', 0, 6, 'qtz5mpvgAM0'),

(32, 'Piya Tu Ab Toh Aaja', 'Bollywood', 'Hindi', 0, 5, 'yULawzPhBEI'),
(33, 'Kitna Pyara Wada Hai', 'Bollywood', 'Hindi', 0, 5, '3eVo5JT7IZs'),
(34, 'Dilbar Dil Se Pyare', 'Bollywood', 'Hindi', 0, 5, 'EjvBbz2tIgA'),
(35, 'Chadhti Jawani Meri Chaal Mastani', 'Bollywood', 'Hindi', 0, 5, '090DB4zbtmM'),
(36, 'Goriyan Kahan Tere Des Re', 'Bollywood', 'Hindi', 0, 5, 'OmLF3vNEH74'),
(37, 'Hum Toh Hai Rahi Dil Ke', 'Bollywood', 'Hindi', 0, 5, 'EcwOrttLd_U'),
(38, 'Daiya Ye Main Kahan Phasi', 'Bollywood', 'Hindi', 0, 5, 'CSlPi3pnPIc'),
(39, 'Ab Jo Mile Hain Toh', 'Bollywood', 'Hindi', 0, 5, 'n3KpURKCENg'),

(40, 'Paani Paani', 'Bollywood', 'Hindi', 0, 4, 'MCsaJH_CRcw'),
(41, 'Phir Teri Bahon Mein', 'Bollywood', 'Hindi', 0, 4, 'N3pCMJSrGQk'),
(42, 'Do Anjaane', 'Bollywood', 'Hindi', 0, 4, 'HWrV3PJca48'),
(43, 'Mohe Aaye Na Jag Se Laaj', 'Bollywood', 'Hindi', 0, 4, 'H2QP0ATNHm8'),
(44, 'Aakhri Shaam', 'Bollywood', 'Hindi', 0, 4, 'wxa9r11JsyQ'),
(45, 'Bibi Sanam', 'Bollywood', 'Hindi', 0, 4, 'I5-XI2HB-WY'),

(46, 'Kahin Door Jab Din Dhal Jaye', 'Bollywood', 'Hindi', 0, 3, '9XxxQhta-eg'),
(47, 'Maine Tere Liye Hi Saat Rang Ke Sapne', 'Bollywood', 'Hindi', 0, 3, 'hN_N1APBSz4'),
(48, 'Na Jiyaa Lage Na', 'Bollywood', 'Hindi', 0, 3, 'IO3D-JfItCU'),
(49, 'Zindagi Kaisi Hai Paheli', 'Bollywood', 'Hindi', 0, 3, 'hw46YMgFmBY'),

(50, 'Ami Je Ke Tomar', 'Bollywood', 'Bengali', 0, 2, 'vQvA3Rwae-c'),
(51, 'Bhalobeshe Felechi', 'Bollywood', 'Bengali', 0, 2, '8tv6p57X6QQ'),
(52, 'Eshe Gechi Kachakachi', 'Bollywood', 'Bengali', 0, 2, 'c97b7RoH5n8'),

(53, 'Amar Ja Kichu Kotha', 'Bollywood', 'Bengali', 0, 1, 'Wmyf_gKCWqU'),
(54, 'Chol Khunji', 'Bollywood', 'Bengali', 0, 1, 'O8nj2mv3LFE'),
(55, 'Ele Chupi Chupi', 'Bollywood', 'Bengali', 0, 1, 'NECyiGdH1wY');

--Insertion in Artists	\c

insert into ARTIST values
(1, 'Anwesshaa', '1993-12-15', 'Female', '/Images/ArtistPics/Anwesshaa.jpg'),
(2, 'Nachiketa Chokraborty', '1965-09-01', 'Male', '/Images/ArtistPics/NachiketaChokraborty.jpg'),
(3, 'Armaan Malik', '1995-07-22', 'Male', '/Images/ArtistPics/ArmaanMalik.jpg'),
(4, 'Antara Mitra', '1987-07-10', 'Female', '/Images/ArtistPics/AntaraMitra.jpg'),
(5, 'Ash King', '1984-08-03', 'Male', '/Images/ArtistPics/AshKing.jpg'),
(6, 'Jonita Gandhi', '1989-10-23', 'Female', '/Images/ArtistPics/JonitaGandhi.jpg'),
(7, 'Arijit Singh', '1987-04-25', 'Male', '/Images/ArtistPics/ArijitSingh.jpg'),
(8, 'Aditi Paul', '1993-00-00', 'Female', '/Images/ArtistPics/AditiPaul.jpg'),
(9, 'Mukesh', '1923-07-22', 'Male', '/Images/ArtistPics/Mukesh.jpg'),
(10, 'Lata Mangeshkar', '1929-09-28', 'Female', '/Images/ArtistPics/LataMangeshkar.jpg'),
(11, 'Manna Dey', '1919-05-01', 'Male', '/Images/ArtistPics/MannaDey.jpg'),
(12, 'Sunidhi Chauhan', '1983-08-14', 'Female', '/Images/ArtistPics/SunidhiChauhan.jpg'),
(13, 'Sonu Kakkar', '1986-10-20', 'Female', '/Images/ArtistPics/SonuKakkar.jpg'),
(14, 'Roop Kumar Rathod', '1973-06-10', 'Male', '/Images/ArtistPics/RoopKumarRathod.jpg'),
(15, 'Neeti Mohan', '1979-11-18', 'Female', '/Images/ArtistPics/NeetiMohan.jpg'),
(16, 'Bhoomi Trivedi', '1989-12-12', 'Female', '/Images/ArtistPics/BhoomiTrivedi.jpg'),
(17, 'Usha Uthup', '1947-11-07', 'Female', '/Images/ArtistPics/UshaUthup.jpg'),
(18, 'Vishal Dadlani', '1973-06-28', 'Male', '/Images/ArtistPics/VishalDadlani.jpg'),
(19, 'Shreya Ghoshal', '1984-03-12', 'Female', '/Images/ArtistPics/ShreyaGhoshal.jpg'),
(20, 'Sanam Puri', '1992-06-30', 'Male', '/Images/ArtistPics/SanamPuri.jpg'),
(21, 'Shipra Goyal', '1991-09-25', 'Female', '/Images/ArtistPics/ShipraGoyal.jpg'),
(22, 'Shafqat Amanat Ali', '1965-02-26', 'Male', '/Images/ArtistPics/ShafqatAmanatAli.jpg'),
(23, 'Nupur Pant', '1993-00-00', 'Female', '/Images/ArtistPics/NupurPant.jpg'),
(24, 'Benny Dayal', '1984-05-13', 'Male', '/Images/ArtistPics/BennyDayal.jpg'),
(25, 'Chinmayi Sripada', '1984-09-10', 'Female', '/Images/ArtistPics/ChinmayiSripada.jpg'),
(26, 'Shekhar Ravjiani', '1978-11-29', 'Male', '/Images/ArtistPics/ShekharRavjiani.jpg'),
(27, 'Swaroop Khan', '1991-08-06', 'Male', '/Images/ArtistPics/SwaroopKhan.jpg'),
(28, 'Sonu Nigam', '1973-07-30', 'Male', '/Images/ArtistPics/SonuNigam.jpg'),
(29, 'Shaan', '1972-09-30', 'Male', '/Images/ArtistPics/Shaan.jpg'),
(30, 'Caralisa Monteiro', '1923-00-00', 'Female', '/Images/ArtistPics/CaralisaMonteiro.jpg'),
(31, 'Ankit Tiwari', '1986-03-06', 'Male', '/Images/ArtistPics/AnkitTiwari.jpg'),
(32, 'Farhan Akhtar', '1974-01-09', 'Male', '/Images/ArtistPics/FarhanAkhtar.jpg'),
(33, 'Raman Mahadevan', '1923-00-00', 'Male', '/Images/ArtistPics/RamanMahadevan.jpg'),
(34, 'Suraj Jagan', '1967-05-11', 'Male', '/Images/ArtistPics/SurajJagan.jpg'),
(35, 'Dominique Cerejo', '1923-00-00', 'Male', '/Images/ArtistPics/DominiqueCerejo.jpg'),
(36, 'Clinton Cerejo', '1923-00-00', 'Male', '/Images/ArtistPics/ClintonCerejo.jpg'),
(37, 'Loy Mendonsa', '1923-00-00', 'Male', '/Images/ArtistPics/LoyMendonsa.jpg'),
(38, 'Shankar Mahadevan', '1967-03-03', 'Male', '/Images/ArtistPics/ShankarMahadevan.jpg'),
(39, 'Alyssa Mendonsa', '1990-04-13', 'Female', '/Images/ArtistPics/AlyssaMendonsa.jpg'),
(40, 'Mohit Chauhan', '1966-03-11', 'Male', '/Images/ArtistPics/MohitChauhan.jpg'),
(41, 'Ehsaan Noorani', '1963-10-12', 'Male', '/Images/ArtistPics/EhsaanNoorani.jpg'),
(42, 'Gulraj Singh', '1923-00-00', 'Male', '/Images/ArtistPics/GulrajSingh.jpg'),
(43, 'Joi Barua', '1923-00-00', 'Male', '/Images/ArtistPics/JoiBarua.jpg'),
(44, 'Mahalakshmi Iyer', '1988-00-00', 'Female', '/Images/ArtistPics/MahalakshmiIyer.jpg'),
(45, 'Kailash Kher', '1973-07-07', 'Male', '/Images/ArtistPics/KailashKher.jpg'),
(46, 'Babul Supriyo', '1970-12-15', 'Male', '/Images/ArtistPics/BabulSupriyo.jpg'),
(47, 'Asha Bhosle', '1933-09-08', 'Female', '/Images/ArtistPics/AshaBhosle.jpg'),
(48, 'R. D. Burman', '1939-06-27', 'Male', '/Images/ArtistPics/RDBurman.jpg'),
(49, 'Mohammed Rafi', '1924-10-24', 'Male', '/Images/ArtistPics/MohammedRafi.jpg'),
(50, 'Kishore Kumar', '1929-08-04', 'Male', '/Images/ArtistPics/KishoreKumar.jpg');


--Insertion in Composers	\c

insert into COMPOSER values
(41, 'Ehsaan Noorani', '1963-10-12', 'Male', '/Images/ComposerPics/EhsaanNoorani.jpg'),
(37, 'Loy Mendonsa', '1923-00-00', 'Male', '/Images/ComposerPics/LoyMendonsa.jpg'),
(38, 'Shankar Mahadevan', '1967-03-03', 'Male', '/Images/ComposerPics/ShankarMahadevan.jpg'),
(18, 'Vishal Dadlani', '1973-06-28', 'Male', '/Images/ComposerPics/VishalDadlani.jpg'),
(26, 'Shekhar Ravjiani', '1978-11-29', 'Male', '/Images/ComposerPics/ShekharRavjiani.jpg'),
(51, 'Salil Chowdhury', '1922-11-19', 'Male', '/Images/ComposerPics/SalilChowdhury.jpg'),
(52, 'Indraadip Dasgupta', '1973-01-17', 'Male', '/Images/ComposerPics/IndraadipDasgupta.jpg'),
(53, 'Dabbu', '1979-06-25', 'Male', '/Images/ComposerPics/Dabbu.jpg'),
(54, 'Kaustav Narayan Niyogi', '1979-00-00', 'Male', '/Images/ComposerPics/KaustavNarayanNiyogi.jpg'),
(55, 'Lalit Pandit', '1979-00-00', 'Male', '/Images/ComposerPics/LalitPandit.jpg'),
(56, 'Jatin Pandit', '1979-00-00', 'Male', '/Images/ComposerPics/JatinPandit.jpg'),
(57, 'Shantanu Moitra', '1968-01-22', 'Male', '/Images/ComposerPics/ShantanuMoitra.jpg'),
(58, 'Ajay Ashok Gogavale', '1976-08-21', 'Male', '/Images/ComposerPics/AjayAshokGogavale.jpg'),
(59, 'Atul Ashok Gogavale', '1974-09-11', 'Male', '/Images/ComposerPics/AtulAshokGogavale.jpg'),
(31, 'Ankit Tiwari', '1986-03-06', 'Male', '/Images/ComposerPics/AnkitTiwari.jpg'),
(48, 'R. D. Burman', '1939-06-27', 'Male', '/Images/ComposerPics/RDBurman.jpg'),
(74, 'Tony Kakkar', '1984-04-10', 'Male', '/Images/ComposerPics/TonyKakkar.jpg'),
(72, 'Munish Makhija', '1968-10-07', 'Male', '/Images/ComposerPics/ManishMakhija.jpg');

--Insertion in Lyricists	\c

insert into LYRICIST values
(60, 'Raja Chanda', '1974-00-00', 'Male', '/Images/LyricistPics/RajaChanda.jpg'),
(61, 'Prosen', '1974-00-00', 'Male', '/Images/LyricistPics/Prosen.jpg'),
(62, 'Gulzar', '1934-08-18', 'Male', '/Images/LyricistPics/Gulzar.jpg'),
(63, 'Yogesh', '1974-00-00', 'Male', '/Images/LyricistPics/Yogesh.jpg'),
(64, 'Majrooh Sultanpuri', '1919-10-01', 'Male', '/Images/LyricistPics/MajroohSultanpuri.jpg'),
(65, 'Prasoon Joshi', '1971-09-16', 'Male', '/Images/LyricistPics/PrasoonJoshi.jpg'),
(66, 'Amitabh Bhattacharya', '1974-00-00', 'Male', '/Images/LyricistPics/AmitabhBhattacharya.jpg'),
(67, 'Kumaar', '1974-00-00', 'Male', '/Images/LyricistPics/Kumaar.jpg'),
(68, 'Swanand Kirkire', '1974-00-00', 'Male', '/Images/LyricistPics/SwanandKirkire.jpg'),
(69, 'Amitabh Varma', '1974-09-11', 'Male', '/Images/LyricistPics/AmitabhVarma.jpg'),
(70, 'Manoj Muntashir', '1976-02-27', 'Male', '/Images/LyricistPics/ManojMuntashir.jpg'),
(71, 'Javed Akhtar', '1945-01-17', 'Male', '/Images/LyricistPics/JavedAkhtar.jpg'),
(73, 'Qateel Shifai', '1919-10-24', 'Male', '/Images/LyricistPics/QateelShifai.jpg'),
(74, 'Tony Kakkar', '1984-04-10', 'Male', '/Images/LyricistPics/TonyKakkar.jpg'),
(54, 'Kaustav Narayan Niyogi', '1979-00-00', 'Male', '/Images/LyricistPics/KaustavNarayanNiyogi.jpg');


--Insrtion in Artist Songs	\c

insert into ARTIST_SONGS values
(1, 34),
(1, 38),
(1, 43),

(2, 38),
(2, 18),
(2, 41),
(2, 42),
(2, 39),

(3, 39),
(3, 40),

(4, 39),
(4, 38),
(4, 32),

(5, 38),

(6, 35),
(6, 36),
(6, 37),

(7, 32),

(8, 30),

(9, 32),

(10, 32),
(10, 33),

(11, 32),

(12, 32),

(13, 35),

(14, 34),

(15, 27),

(16, 28),
(16, 19),

(17, 29),
(17, 19),

(18, 19),

(19, 18),

(20, 31),

(21, 18),
(21, 19),

(22, 20),
(22, 21),

(23, 22),
(23, 23),

(24, 12),
(24, 24),

(25, 18),
(25, 24),

(26, 25),
(26, 26),

(27, 44),
(27, 46),

(28, 45),
(28, 29),

(29, 28),
(29, 12),

(30, 44),

(31, 28),
(31, 12),

(32, 47),
(32, 48),

(33, 10),
(33, 49),

(34, 10),

(35, 10),
(35, 49),

(36, 49),
(36, 47),

(37, 50),

(38, 47),

(39, 47),

(40, 12),

(41, 13),

(42, 14),

(43, 15),

(44, 16),

(45, 17),

(46, 9),

(47, 9),

(48, 10),

(49, 11),

(50, 3),

(51, 5),
(51, 6),

(52, 7),
(52, 8),
(52, 4),

(53, 1),

(54, 2),

(55, 3),
(55, 4);


--Insrtion in Composer Albums	\c

insert into COMPOSER_ALBUMS values
(10, 38),
(10, 41),
(10, 37),

(9, 38),
(9, 41),
(9, 37),

(1, 53),

(2, 52),

(8, 57),
(8, 58),
(8, 59),
(8, 31),

(7, 18),
(7, 26),

(3, 51),

(5, 48),

(6, 56),
(6, 55),

(4, 54),
(4, 72);


--Insrtion in Lyricist Albums	\c

insert into LYRICIST_ALBUMS values
(10, 71),

(9, 71),

(1, 61),
(1, 60),

(2, 61),

(8, 68),
(8, 69),
(8, 70),

(7, 66),
(7, 67),

(3, 62),
(3, 63),

(5, 64),

(6, 65),

(4, 54),
(4, 73),
(4, 74);



create trigger check_rating BEFORE insert on REVIEWS for each row set NEW.Rating = if(NEW.Rating > 10.0, 10, if(NEW.Rating < 1.0, 1, NEW.Rating));


insert into REVIEWS values
(55, 'Achintya', 'achi1997@gmail.com', 0.6, 'AMAZING!!!');

insert into TRENDING values
(NULL, 1, 0),
(NULL, 2, 0),
(NULL, 3, 0),
(NULL, 4, 0),
(NULL, 5, 0),
(NULL, 6, 0),
(NULL, 7, 0),
(NULL, 8, 0),
(NULL, 9, 0),
(NULL, 10, 0);


delimiter //


create procedure allotDefaultRank()
	begin
		declare done int default 0;
		declare r int;
		declare s_id int;
		declare cur cursor for select distinct(Song_ID) from SONG order by rand() limit 10;
		declare CONTINUE HANDLER for not FOUND set done = 1;
		open cur;
		set r = 1;
		rank_loop: loop
			fetch cur into s_id;
			if done = 1 then
				leave rank_loop;
			end if;
			update TRENDING set Song_ID = s_id where Ranking = r;
			set r = r + 1;
		end loop rank_loop;
		close cur;
	end//

create procedure updateRank()
	begin
		declare done int default 0;
		declare r int;
		declare s_id int;
		declare cur cursor for select Song_ID from TRENDING order by Points desc, Ranking;
		declare CONTINUE HANDLER for not FOUND set done = 1;
		open cur;
		set r = 11;
		rank_loop: loop
			fetch cur into s_id;
			if done = 1 then
				leave rank_loop;
			end if;
			update TRENDING set Ranking = r where Song_ID = s_id;
			set r = r + 1;
		end loop rank_loop;
		close cur;
		update TRENDING set Ranking = Ranking - 10;
	end//


create procedure calculateRank(in songID int)
	begin
		declare s_id int;
		declare song_points float;
		declare pts float;
		declare loop_i int;
		declare avg_rating float;
		declare plays int;
		declare check_flag int default 0;
		declare cur1 cursor for select round(avg(Rating), 2), No_Of_Plays from SONG S, REVIEWS R where R.Song_ID = S.Song_ID and S.Song_ID = songID;
		declare cur2 cursor for select Song_ID, Points from TRENDING order by Ranking;
		open cur1;
		fetch cur1 into avg_rating, plays;
		close cur1;
		if avg_rating is null then
			set avg_rating = 0;
		end if;
		set song_points = (avg_rating * 0.8) + (plays * 0.2);
		set loop_i = 1;
		open cur2;
		check_loop: loop
			fetch cur2 into s_id, pts;
			if song_points > pts then
				begin
					set check_flag = 1;
				end;
			end if;
			if s_id = songID then
				begin
					update TRENDING set Points = song_points where Song_ID = s_id;
					call updateRank();
					set check_flag = 0;
					leave check_loop;
				end;
			end if;
			set loop_i = loop_i + 1;
			if loop_i > 10 then
				leave check_loop;
			end if;
		end loop check_loop;
		close cur2;
		if check_flag = 1 then
			update TRENDING set Song_ID = songID, Points = song_points where Ranking = 10;
			call updateRank();
		end if;
	end//


create procedure incrementNumberOfPlays(in songID int)
	begin
		declare plays int;
		declare cur cursor for select No_Of_Plays from SONG where Song_ID = songID;
		open cur;
		fetch cur into plays;
		set plays = plays + 1;
		update SONG set No_Of_Plays = plays where Song_ID = songID;
		close cur;
		call calculateRank(songID);
	end//

delimiter ;

