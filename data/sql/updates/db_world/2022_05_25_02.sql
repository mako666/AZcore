-- DB update 2022_05_25_01 -> 2022_05_25_02
--
DROP TABLE IF EXISTS `creaturedisplayinfoextra_dbc`;
CREATE TABLE `creaturedisplayinfoextra_dbc`
( `ID` INT UNSIGNED NOT NULL DEFAULT '0',
`DisplayRaceID` INT UNSIGNED NOT NULL DEFAULT '0',
`DisplaySexID` INT UNSIGNED NOT NULL DEFAULT '0',
`SkinID` INT UNSIGNED NOT NULL DEFAULT '0',
`FaceID` INT UNSIGNED NOT NULL DEFAULT '0',
`HairStyleID` INT UNSIGNED NOT NULL DEFAULT '0',
`HairColorID` INT UNSIGNED NOT NULL DEFAULT '0',
`FacialHairID` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay1` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay2` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay3` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay4` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay5` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay6` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay7` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay8` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay9` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay10` INT UNSIGNED NOT NULL DEFAULT '0',
`NPCItemDisplay11` INT UNSIGNED NOT NULL DEFAULT '0',
`Flags` INT UNSIGNED NOT NULL DEFAULT '0',
`BakeName` VARCHAR(100) NOT NULL,
PRIMARY KEY (`ID`) )
ENGINE=MYISAM CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; 
