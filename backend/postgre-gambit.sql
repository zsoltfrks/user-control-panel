--
-- Adatbázis: "gambit"
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "accounts"
--

DROP TABLE IF EXISTS "accounts" CASCADE;
CREATE TABLE "accounts" (
  "accountId" SERIAL,
  "username" varchar(32) NOT NULL,
  "password" varchar(128) NOT NULL,
  "suspended" INTEGER NOT NULL DEFAULT 0,
  "serial" varchar(32) NOT NULL,
  "email" varchar(128) NOT NULL,
  "maxCharacters" INTEGER NOT NULL DEFAULT 1,
  "adminLevel" INTEGER NOT NULL DEFAULT 0,
  "adminNick" varchar(32) NOT NULL DEFAULT 'Admin',
  "helperLevel" INTEGER NOT NULL DEFAULT 0,
  "premiumPoints" INTEGER NOT NULL DEFAULT 0,
  "osvenyPiro" INTEGER NOT NULL DEFAULT 0,
  "osvenyPrioExperie" INTEGER NOT NULL DEFAULT 0,
  "2fa" varchar(24) DEFAULT NULL,
  "2fastate" INTEGER NOT NULL DEFAULT 0,
  "discordId" BIGINT DEFAULT NULL,
  "discordAuth" varchar(24) DEFAULT NULL,
  "discordName" varchar(124) DEFAULT NULL,
  "adminJailType" INTEGER DEFAULT NULL,
  "adminJailBy" varchar(16) DEFAULT NULL,
  "adminJailTime" INTEGER DEFAULT NULL,
  "adminJailReason" varchar(32) DEFAULT NULL
);

--
-- A tábla adatainak kiíratása "accounts"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "adminstats"
--

DROP TABLE IF EXISTS "adminstats" CASCADE;
CREATE TABLE "adminstats" (
  "characterIdentity" INTEGER NOT NULL,
  "adminName" varchar(256) DEFAULT NULL,
  "dutyTime" INTEGER NOT NULL DEFAULT 0,
  "reportStat" TEXT  DEFAULT NULL,
  "vehicleFixes" TEXT  DEFAULT NULL,
  "playerFixes" TEXT  DEFAULT NULL,
  "armorChange" TEXT  DEFAULT NULL,
  "healthChange" TEXT  DEFAULT NULL,
  "resettedVehicles" TEXT  DEFAULT NULL,
  "adminJail" TEXT  DEFAULT NULL,
  "playerKick" TEXT  DEFAULT NULL,
  "playerBan" TEXT  DEFAULT NULL,
  "playerUnjail" TEXT  DEFAULT NULL
);

--
-- A tábla adatainak kiíratása "adminstats"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "animals"
--

DROP TABLE IF EXISTS "animals" CASCADE;
CREATE TABLE "animals" (
  "animalId" SERIAL,
  "ownerId" INTEGER NOT NULL,
  "type" TEXT CHECK ("type" IN ('Husky','Rottweiler','Doberman','Bull Terrier','Boxer','Francia Bulldog','Kecske','Diszno')) NOT NULL,
  "name" varchar(32) NOT NULL,
  "health" REAL NOT NULL DEFAULT 100,
  "hunger" REAL NOT NULL DEFAULT 100,
  "love" REAL NOT NULL DEFAULT 100
);

--
-- A tábla adatainak kiíratása "animals"
--



-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "armors"
--

DROP TABLE IF EXISTS "armors" CASCADE;
CREATE TABLE "armors" (
  "armorId" SERIAL,
  "health" INTEGER NOT NULL DEFAULT 100,
  "characterId" INTEGER NOT NULL,
  "model" varchar(64) NOT NULL
);

--
-- A tábla adatainak kiíratása "armors"
--



-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "characters"
--

DROP TABLE IF EXISTS "characters" CASCADE;
CREATE TABLE "characters" (
  "characterId" SERIAL,
  "accountId" INTEGER NOT NULL,
  "name" varchar(128) NOT NULL,
  "skin" INTEGER NOT NULL,
  "permGroupSkin" varchar(16) NOT NULL DEFAULT 'N',
  "creationStage" INTEGER NOT NULL DEFAULT 5,
  "canSkipCreation" INTEGER NOT NULL DEFAULT 0,
  "x" DOUBLE PRECISION NOT NULL DEFAULT 1682.7392578125,
  "y" DOUBLE PRECISION NOT NULL DEFAULT -2328.7177734375,
  "z" DOUBLE PRECISION NOT NULL DEFAULT 13.546875,
  "r" DOUBLE PRECISION NOT NULL DEFAULT 0,
  "interior" INTEGER NOT NULL DEFAULT 0,
  "dimension" INTEGER NOT NULL DEFAULT 0,
  "money" INTEGER NOT NULL DEFAULT 50000,
  "bankMoney" INTEGER NOT NULL DEFAULT 0,
  "playedMinutes" INTEGER NOT NULL DEFAULT 0,
  "inDeath" INTEGER NOT NULL DEFAULT 0,
  "coins" INTEGER NOT NULL DEFAULT 0,
  "boughtClothes" TEXT NOT NULL DEFAULT '[[]]',
  "clothesPos" TEXT NOT NULL DEFAULT '''[[]]''',
  "clothesLimit" INTEGER NOT NULL DEFAULT 2,
  "health" INTEGER NOT NULL DEFAULT 100,
  "armor" INTEGER NOT NULL DEFAULT 0,
  "hunger" INTEGER NOT NULL DEFAULT 100,
  "thirst" INTEGER NOT NULL DEFAULT 100,
  "lastOnline" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  "actionBarItems" TEXT NOT NULL,
  "skills" TEXT NOT NULL DEFAULT '[[]]',
  "weaponPos" TEXT NOT NULL DEFAULT '[[]]',
  "armors" TEXT NOT NULL DEFAULT '[[]]',
  "inDuty" text NOT NULL DEFAULT '""',
  "online" INTEGER NOT NULL DEFAULT 0,
  "vehiclesSlot" INTEGER NOT NULL DEFAULT 2,
  "interiorsSlot" INTEGER NOT NULL DEFAULT 2,
  "facePaint" INTEGER NOT NULL DEFAULT 0,
  "playerRecipes" TEXT  NOT NULL ,
  "radioFreq" TEXT  NOT NULL DEFAULT '[[0, 0]]' ,
  "jail" INTEGER NOT NULL DEFAULT 0,
  "jailTime" INTEGER NOT NULL DEFAULT 0,
  "jailReason" varchar(124) DEFAULT NULL,
  "jailCell" INTEGER NOT NULL DEFAULT 0
);

--
-- A tábla adatainak kiíratása "characters"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "companies"
--

DROP TABLE IF EXISTS "companies" CASCADE;
CREATE TABLE "companies" (
  "companyId" SERIAL,
  "companyName" text NOT NULL,
  "taxNumber" text NOT NULL,
  "taxAmount" INTEGER NOT NULL,
  "ownerCharacterId" INTEGER NOT NULL,
  "activity" text NOT NULL,
  "postfix" text NOT NULL,
  "createdBy" text NOT NULL,
  "books" text NOT NULL,
  "prefix" text NOT NULL,
  "created" BIGINT NOT NULL
);

--
-- A tábla adatainak kiíratása "companies"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "coupons"
--

DROP TABLE IF EXISTS "coupons" CASCADE;
CREATE TABLE "coupons" (
  "dbID" SERIAL,
  "couponName" text NOT NULL,
  "couponType" TEXT CHECK ("couponType" IN ('pp','money','item')) NOT NULL,
  "couponUsage" INTEGER NOT NULL,
  "couponValue" INTEGER NOT NULL,
  "couponUsed" text  NOT NULL,
  "couponItem" INTEGER NOT NULL DEFAULT 0
);

--
-- A tábla adatainak kiíratása "coupons"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "discordcodes"
--

DROP TABLE IF EXISTS "discordcodes" CASCADE;
CREATE TABLE "discordcodes" (
  "dbId" SERIAL,
  "discordUID" TEXT DEFAULT NULL,
  "serial" varchar(32) NOT NULL,
  "code" varchar(8) NOT NULL
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "farms"
--

DROP TABLE IF EXISTS "farms" CASCADE;
CREATE TABLE "farms" (
  "id" SERIAL,
  "pos" INTEGER NOT NULL DEFAULT 0,
  "rentedBy" INTEGER NOT NULL DEFAULT 0,
  "tableText" varchar(255) NOT NULL,
  "exteriorId" varchar(255) NOT NULL,
  "renterName" varchar(255) NOT NULL,
  "locked" INTEGER NOT NULL,
  "fork" INTEGER NOT NULL,
  "hoe" INTEGER NOT NULL,
  "loadpos" varchar(255) NOT NULL,
  "miniHoe" INTEGER NOT NULL,
  "size" INTEGER NOT NULL,
  "ownerId" INTEGER NOT NULL,
  "type" INTEGER NOT NULL,
  "animalDatas" TEXT NOT NULL DEFAULT '[[]]',
  "farmId" INTEGER NOT NULL,
  "landDatas" TEXT NOT NULL DEFAULT '[[]]',
  "permissions" varchar(255) NOT NULL DEFAULT '[[]]',
  "expire" INTEGER NOT NULL DEFAULT 0
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "garages"
--

DROP TABLE IF EXISTS "garages" CASCADE;
CREATE TABLE "garages" (
  "dbID" SERIAL,
  "interiorId" INTEGER NOT NULL,
  "sizeX" INTEGER NOT NULL DEFAULT 1,
  "sizeY" INTEGER NOT NULL DEFAULT 1,
  "furnishing" INTEGER NOT NULL DEFAULT 1,
  "kruton" INTEGER NOT NULL DEFAULT 0,
  "workbench" INTEGER NOT NULL DEFAULT 0,
  "door" INTEGER NOT NULL DEFAULT 1,
  "toolbox" INTEGER NOT NULL DEFAULT 1,
  "wall" INTEGER NOT NULL DEFAULT 1,
  "ceiling" INTEGER NOT NULL DEFAULT 1,
  "floor" INTEGER NOT NULL DEFAULT 1,
  "lift1" INTEGER NOT NULL DEFAULT 0,
  "lift2" INTEGER NOT NULL DEFAULT 0,
  "lift3" INTEGER NOT NULL DEFAULT 0,
  "lift4" INTEGER NOT NULL DEFAULT 0,
  "lift5" INTEGER NOT NULL DEFAULT 0,
  "lift1Z" REAL NOT NULL DEFAULT 0,
  "lift2Z" REAL NOT NULL DEFAULT 0,
  "lift3Z" REAL NOT NULL DEFAULT 0,
  "lift4Z" REAL NOT NULL DEFAULT 0,
  "lift5Z" REAL NOT NULL DEFAULT 0
);

--
-- A tábla adatainak kiíratása "garages"
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "groupmembers"
--

DROP TABLE IF EXISTS "groupmembers" CASCADE;
CREATE TABLE "groupmembers" (
  "dbId" SERIAL,
  "characterId" INTEGER NOT NULL,
  "groupPrefix" varchar(32) NOT NULL,
  "rank" INTEGER NOT NULL DEFAULT 1,
  "isLeader" INTEGER NOT NULL DEFAULT 0,
  "added" BIGINT NOT NULL DEFAULT 0,
  "promoted" BIGINT NOT NULL DEFAULT 0,
  "lastOnline" BIGINT NOT NULL DEFAULT 0
);

--
-- A tábla adatainak kiíratása "groupmembers"
--

INSERT INTO "groupmembers" ("dbId", "characterId", "groupPrefix", "rank", "isLeader", "added", "promoted", "lastOnline") VALUES
(1, 7, 'OV', 1, 1, 1722968340, 1722968340, 0),
(9, 8, 'LM', 1, 0, 1722981321, 1722981321, 0),
(10, 10, 'RING', 1, 0, 1723039453, 1723039453, 0),
(12, 5, 'RING', 1, 1, 1723061714, 1723061714, 0),
(13, 10, 'BMS', 1, 0, 1723298756, 1723298756, 0),
(15, 13, 'OV', 1, 0, 1723722035, 1723722035, 0),
(18, 16, 'NNI', 1, 1, 1728392697, 1728392697, 0),
(21, 14, 'PD', 1, 1, 1728415113, 1730051661, 0),
(24, 17, 'PD', 3, 1, 1728922495, 1731778067, 0),
(25, 17, 'SG', 11, 1, 1728930264, 1734168240, 0),
(26, 17, 'OV', 3, 1, 1729092331, 1729092334, 0),
(29, 18, 'PD', 1, 0, 1729429524, 1729429524, 0),
(30, 17, 'OMSZ', 1, 0, 1729682585, 1729682585, 0),
(34, 1, 'SG', 11, 0, 1729881183, 1734168237, 0),
(35, 20, 'RING', 1, 1, 1729887218, 1729887218, 0),
(41, 20, 'PD', 5, 1, 1729888862, 1729888924, 0),
(42, 1, 'PD', 1, 0, 1729890274, 1729890274, 0),
(43, 1, 'NAV', 1, 1, 1729894892, 1729894892, 0),
(45, 17, 'NDR', 1, 1, 1730667122, 1730667122, 0),
(47, 1, 'OMSZ', 1, 0, 1730757320, 1730757320, 0),
(48, 18, 'OV', 3, 1, 1730910237, 1731079965, 0),
(49, 14, 'SOD', 1, 1, 1732044721, 1732044721, 0),
(50, 14, 'TAXI', 1, 1, 1732213840, 1732213840, 0),
(52, 17, 'APMS', 1, 1, 1734114629, 1734114629, 0),
(54, 28, 'PD', 1, 1, 1734167847, 1734167847, 0),
(55, 28, 'OPSZ', 1, 1, 1734167850, 1734167850, 0),
(56, 28, 'SG', 10, 1, 1734168133, 1734168234, 0),
(57, 15, 'SG', 12, 1, 1734168262, 1734168264, 0),
(61, 15, 'PD', 1, 0, 1734267822, 1734267822, 0),
(62, 17, 'PF', 1, 0, 1734704562, 1734704562, 0),
(63, 17, 'BMS', 1, 1, 1734705380, 1734705380, 0),
(64, 18, 'BMS', 1, 0, 1734952654, 1734952654, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "groups"
--

DROP TABLE IF EXISTS "groups" CASCADE;
CREATE TABLE "groups" (
  "dbId" SERIAL,
  "groupPrefix" varchar(32) NOT NULL,
  "rankNames" TEXT  NOT NULL DEFAULT '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]',
  "rankColors" TEXT  NOT NULL DEFAULT '[ [ "green", "green", "green" ] ]',
  "rankSalaries" TEXT  NOT NULL DEFAULT '[ [ 0, 0, 0 ] ]' ,
  "rankPermissions" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "rankSkins" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "rankItems" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "vehicleMembers" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "interiorMembers" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "motd" text NOT NULL DEFAULT 'Leírás',
  "balance" BIGINT NOT NULL DEFAULT 0,
  "aid" INTEGER NOT NULL DEFAULT 0,
  "tax" INTEGER NOT NULL DEFAULT 0
);

--
-- A tábla adatainak kiíratása "groups"
--

INSERT INTO "groups" ("dbId", "groupPrefix", "rankNames", "rankColors", "rankSalaries", "rankPermissions", "rankSkins", "rankItems", "vehicleMembers", "interiorMembers", "motd", "balance", "aid", "tax") VALUES
(1, 'NNI', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 100000, 0, 0 ] ]', '[ [ { "promoteDemote": true, "alnev": true, "goldrobMute": true, "rbs": true, "departmentRadio": true, "manageKeysVehicle": true, "medic": true, "manageKeysInterior": true, "borderControl": true, "packerTow": true, "graffitiClean": true, "hireFire": true, "mdcrevoke": true, "mdc": true, "editInteriors": true, "badge": true, "departmentBlip": true, "goldrobLock": true, "goldrobDestroy": true, "applyBag": true, "squad": true, "nion": true, "spike": true, "manageKeysGate": true, "manageGroupBalance": true, "goldrobRepairGarage": true, "editPed": true, "traffi": true, "gov": true, "jail": true, "megaphone": true, "lenyomoz": true, "interiorLock": true, "mdcdelwar": true }, { "jail": false, "promoteDemote": false, "alnev": false, "traffi": false, "goldrobMute": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "goldrobLock": false, "medic": false, "squad": false, "editPed": false, "manageGroupBalance": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "departmentBlip": false, "mdcrevoke": false, "mdcdelwar": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "interiorLock": false, "editInteriors": false, "manageKeysInterior": false, "lenyomoz": false, "megaphone": false, "nion": false, "spike": false, "borderControl": false }, { "jail": false, "promoteDemote": false, "alnev": false, "traffi": false, "goldrobMute": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "goldrobLock": false, "medic": false, "squad": false, "editPed": false, "manageGroupBalance": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "departmentBlip": false, "mdcrevoke": false, "mdcdelwar": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "interiorLock": false, "editInteriors": false, "manageKeysInterior": false, "lenyomoz": false, "megaphone": false, "nion": false, "spike": false, "borderControl": false } ] ]', '[ [ [ true, true, true, true, true, true, true ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ { "480": true, "292": true, "483": true, "486": true, "77": true, "93": true, "533": true, "493": true, "94": true, "155": true, "372": true, "612": true, "500": true, "314": true, "561": true, "507": true, "575": true, "83": true, "115": true, "520": true, "100": true, "528": true, "556": true, "534": true, "536": true, "86": true, "540": true, "118": true, "512": true, "505": true, "291": true, "119": true, "69": true, "88": true, "471": true, "537": true, "542": true, "562": true, "541": true, "613": true, "127": true, "592": true, "427": true }, { "480": false, "292": false, "483": false, "486": false, "592": false, "427": false, "533": false, "537": false, "94": false, "541": false, "372": false, "612": false, "127": false, "314": false, "505": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "69": false, "561": false, "534": false, "536": false, "86": false, "540": false, "542": false, "528": false, "512": false, "500": false, "613": false, "77": false, "88": false, "556": false, "291": false, "471": false, "562": false, "118": false, "93": false, "155": false, "119": false, "493": false }, { "480": false, "292": false, "483": false, "486": false, "592": false, "427": false, "533": false, "537": false, "94": false, "541": false, "372": false, "612": false, "127": false, "314": false, "505": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "69": false, "561": false, "534": false, "536": false, "86": false, "540": false, "542": false, "528": false, "512": false, "500": false, "613": false, "77": false, "88": false, "556": false, "291": false, "471": false, "562": false, "118": false, "93": false, "155": false, "119": false, "493": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 1000000000, 0, 0),
(2, 'TEK', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "traffi": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "editPed": false, "mdcrevoke": false, "manageKeysInterior": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "manageGroupBalance": false, "editInteriors": false, "departmentBlip": false, "mdcdelwar": false, "megaphone": false, "goldrobLock": false, "goldrobMute": false, "jail": false }, { "promoteDemote": false, "traffi": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "editPed": false, "mdcrevoke": false, "manageKeysInterior": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "manageGroupBalance": false, "editInteriors": false, "departmentBlip": false, "mdcdelwar": false, "megaphone": false, "goldrobLock": false, "goldrobMute": false, "jail": false }, { "promoteDemote": false, "traffi": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "editPed": false, "mdcrevoke": false, "manageKeysInterior": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "manageGroupBalance": false, "editInteriors": false, "departmentBlip": false, "mdcdelwar": false, "megaphone": false, "goldrobLock": false, "goldrobMute": false, "jail": false } ] ]', '[ [ [ false, false, false, false, false ], [ false, false, false, false, false ], [ false, false, false, false, false ] ] ]', '[ [ { "480": false, "292": false, "483": false, "486": false, "592": false, "93": false, "533": false, "493": false, "94": false, "155": false, "372": false, "612": false, "500": false, "314": false, "561": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "528": false, "534": false, "536": false, "86": false, "540": false, "118": false, "556": false, "512": false, "505": false, "119": false, "291": false, "88": false, "471": false, "69": false, "542": false, "562": false, "537": false, "541": false, "77": false, "127": false, "613": false }, { "480": false, "292": false, "483": false, "486": false, "592": false, "93": false, "533": false, "493": false, "94": false, "155": false, "372": false, "612": false, "500": false, "314": false, "561": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "528": false, "534": false, "536": false, "86": false, "540": false, "118": false, "556": false, "512": false, "505": false, "119": false, "291": false, "88": false, "471": false, "69": false, "542": false, "562": false, "537": false, "541": false, "77": false, "127": false, "613": false }, { "480": false, "292": false, "483": false, "486": false, "592": false, "93": false, "533": false, "493": false, "94": false, "155": false, "372": false, "612": false, "500": false, "314": false, "561": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "528": false, "534": false, "536": false, "86": false, "540": false, "118": false, "556": false, "512": false, "505": false, "119": false, "291": false, "88": false, "471": false, "69": false, "542": false, "562": false, "537": false, "541": false, "77": false, "127": false, "613": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(3, 'APMS', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false } ] ]', '[ [ [ false, false, false, false ], [ false, false, false, false ], [ false, false, false, false ] ] ]', '[ [ { "127": false, "440": false, "287": false }, { "127": false, "440": false, "287": false }, { "127": false, "440": false, "287": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(4, 'NAV', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "alnev": false, "goldrobMute": false, "rbs": false, "departmentRadio": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "borderControl": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "mdcrevoke": false, "mdc": false, "editInteriors": false, "departmentBlip": false, "goldrobLock": false, "goldrobDestroy": false, "applyBag": false, "manageInvoiceBooks": false, "squad": false, "spike": false, "editCompany": false, "editPed": false, "manageKeysGate": false, "manageGroupBalance": false, "goldrobRepairGarage": false, "manageCompanyTax": false, "traffi": false, "medic": false, "jail": false, "megaphone": false, "interiorLock": false, "createCompany": false, "mdcdelwar": false }, { "promoteDemote": false, "alnev": false, "goldrobMute": false, "rbs": false, "departmentRadio": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "borderControl": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "mdcrevoke": false, "mdc": false, "editInteriors": false, "departmentBlip": false, "goldrobLock": false, "goldrobDestroy": false, "applyBag": false, "manageInvoiceBooks": false, "squad": false, "spike": false, "editCompany": false, "editPed": false, "manageKeysGate": false, "manageGroupBalance": false, "goldrobRepairGarage": false, "manageCompanyTax": false, "traffi": false, "medic": false, "jail": false, "megaphone": false, "interiorLock": false, "createCompany": false, "mdcdelwar": false }, { "promoteDemote": false, "alnev": false, "goldrobMute": false, "rbs": false, "departmentRadio": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "borderControl": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "mdcrevoke": false, "mdc": false, "editInteriors": false, "departmentBlip": false, "goldrobLock": false, "goldrobDestroy": false, "applyBag": false, "manageInvoiceBooks": false, "squad": false, "spike": false, "editCompany": false, "editPed": false, "manageKeysGate": false, "manageGroupBalance": false, "goldrobRepairGarage": false, "manageCompanyTax": false, "traffi": false, "medic": false, "jail": false, "megaphone": false, "interiorLock": false, "createCompany": false, "mdcdelwar": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ { "480": false, "292": false, "483": false, "486": false, "77": false, "93": false, "533": false, "493": false, "94": false, "155": false, "372": false, "612": false, "500": false, "314": false, "561": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "528": false, "556": false, "534": false, "536": false, "86": false, "540": false, "118": false, "512": false, "505": false, "291": false, "119": false, "69": false, "88": false, "471": false, "537": false, "542": false, "562": false, "541": false, "613": false, "592": false, "427": false, "127": false }, { "480": false, "292": false, "483": false, "486": false, "77": false, "93": false, "533": false, "493": false, "94": false, "155": false, "372": false, "612": false, "500": false, "314": false, "561": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "528": false, "556": false, "534": false, "536": false, "86": false, "540": false, "118": false, "512": false, "505": false, "291": false, "119": false, "69": false, "88": false, "471": false, "537": false, "542": false, "562": false, "541": false, "613": false, "592": false, "427": false, "127": false }, { "480": false, "292": false, "483": false, "486": false, "77": false, "93": false, "533": false, "493": false, "94": false, "155": false, "372": false, "612": false, "500": false, "314": false, "561": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "528": false, "556": false, "534": false, "536": false, "86": false, "540": false, "118": false, "512": false, "505": false, "291": false, "119": false, "69": false, "88": false, "471": false, "537": false, "542": false, "562": false, "541": false, "613": false, "592": false, "427": false, "127": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(5, 'ROB', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(6, 'OKF', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "departmentBlip": false, "hireFire": false, "rbs": false, "departmentRadio": false, "editInteriors": false, "medic": false, "manageKeysVehicle": false, "manageKeysGate": false, "interiorLock": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "departmentBlip": false, "hireFire": false, "rbs": false, "departmentRadio": false, "editInteriors": false, "medic": false, "manageKeysVehicle": false, "manageKeysGate": false, "interiorLock": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "departmentBlip": false, "hireFire": false, "rbs": false, "departmentRadio": false, "editInteriors": false, "medic": false, "manageKeysVehicle": false, "manageKeysGate": false, "interiorLock": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ { "127": false, "98": false, "427": false, "100": false }, { "127": false, "98": false, "427": false, "100": false }, { "127": false, "98": false, "427": false, "100": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(7, 'ARMY', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "traffi": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "editPed": false, "mdcrevoke": false, "manageKeysInterior": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "manageGroupBalance": false, "editInteriors": false, "departmentBlip": false, "mdcdelwar": false, "megaphone": false, "goldrobLock": false, "goldrobMute": false, "jail": false }, { "promoteDemote": false, "traffi": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "editPed": false, "mdcrevoke": false, "manageKeysInterior": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "manageGroupBalance": false, "editInteriors": false, "departmentBlip": false, "mdcdelwar": false, "megaphone": false, "goldrobLock": false, "goldrobMute": false, "jail": false }, { "promoteDemote": false, "traffi": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "editPed": false, "mdcrevoke": false, "manageKeysInterior": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "manageGroupBalance": false, "editInteriors": false, "departmentBlip": false, "mdcdelwar": false, "megaphone": false, "goldrobLock": false, "goldrobMute": false, "jail": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ { "480": false, "292": false, "483": false, "486": false, "592": false, "93": false, "533": false, "493": false, "94": false, "155": false, "372": false, "612": false, "500": false, "314": false, "561": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "528": false, "534": false, "536": false, "86": false, "540": false, "118": false, "556": false, "512": false, "505": false, "119": false, "291": false, "88": false, "471": false, "69": false, "542": false, "562": false, "537": false, "541": false, "77": false, "613": false, "107": false }, { "480": false, "292": false, "483": false, "486": false, "592": false, "93": false, "533": false, "493": false, "94": false, "155": false, "372": false, "612": false, "500": false, "314": false, "561": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "528": false, "534": false, "536": false, "86": false, "540": false, "118": false, "556": false, "512": false, "505": false, "119": false, "291": false, "88": false, "471": false, "69": false, "542": false, "562": false, "537": false, "541": false, "77": false, "613": false, "107": false }, { "480": false, "292": false, "483": false, "486": false, "592": false, "93": false, "533": false, "493": false, "94": false, "155": false, "372": false, "612": false, "500": false, "314": false, "561": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "528": false, "534": false, "536": false, "86": false, "540": false, "118": false, "556": false, "512": false, "505": false, "119": false, "291": false, "88": false, "471": false, "69": false, "542": false, "562": false, "537": false, "541": false, "77": false, "613": false, "107": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(8, 'FIX', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false } ] ]', '[ [ [ false, false, false, false, false ], [ false, false, false, false, false ], [ false, false, false, false, false ] ] ]', '[ [ { "127": false, "440": false, "287": false }, { "127": false, "440": false, "287": false }, { "127": false, "440": false, "287": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(9, 'TOW', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "manageKeysGate": false, "manageKeysVehicle": false, "hireFire": false, "editInteriors": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "manageKeysGate": false, "manageKeysVehicle": false, "hireFire": false, "editInteriors": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "manageKeysGate": false, "manageKeysVehicle": false, "hireFire": false, "editInteriors": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false } ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ { "127": false }, { "127": false }, { "127": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(10, 'CLUB', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "fishradio": false, "manageKeysGate": false, "clubradio": false, "manageKeysVehicle": false, "hireFire": false, "editInteriors": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "pavilionradio": false }, { "promoteDemote": false, "fishradio": false, "manageKeysGate": false, "clubradio": false, "manageKeysVehicle": false, "hireFire": false, "editInteriors": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "pavilionradio": false }, { "promoteDemote": false, "fishradio": false, "manageKeysGate": false, "clubradio": false, "manageKeysVehicle": false, "hireFire": false, "editInteriors": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "pavilionradio": false } ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(11, 'OPSZ', '[ [ "OOC\\/Admin", "Inaktív", "Polgárőr", "Polgárőr-vezető" ] ]', '[ [ "blue", "red", "yellow", "orange-second" ] ]', '[ [ 0, 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "traffi": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "jail": false, "mdcrevoke": false, "goldrobMute": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "goldrobLock": false, "editInteriors": false, "departmentBlip": false, "mdcdelwar": false, "megaphone": false, "manageGroupBalance": false, "manageKeysInterior": false, "editPed": false }, { "promoteDemote": false, "traffi": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "editPed": false, "mdcrevoke": false, "manageKeysInterior": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "manageGroupBalance": false, "editInteriors": false, "departmentBlip": false, "mdcdelwar": false, "megaphone": false, "goldrobLock": false, "goldrobMute": false, "jail": false }, { "promoteDemote": false, "traffi": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "jail": false, "mdcrevoke": false, "goldrobMute": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "goldrobLock": false, "editInteriors": false, "departmentBlip": false, "mdcdelwar": false, "megaphone": false, "manageGroupBalance": false, "manageKeysInterior": false, "editPed": false }, { "promoteDemote": false, "traffi": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "editPed": false, "mdcrevoke": false, "manageKeysInterior": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "manageGroupBalance": false, "editInteriors": false, "departmentBlip": false, "mdcdelwar": false, "megaphone": false, "goldrobLock": false, "goldrobMute": false, "jail": false } ] ]', '[ [ [ ], [ ], [ ], [ ] ] ]', '[ [ { "118": false, "119": false, "127": false, "532": false, "534": false, "314": false, "527": false, "574": false, "561": false }, { "118": false, "119": false, "127": false, "532": false, "534": false, "314": false, "527": false, "574": false, "561": false }, { "118": false, "119": false, "127": false, "532": false, "534": false, "314": false, "527": false, "574": false, "561": false }, { "118": false, "119": false, "127": false, "532": false, "534": false, "314": false, "527": false, "574": false, "561": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(12, 'TAXI', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "hireFire": false, "manageKeysGate": false, "manageKeysVehicle": false, "promoteDemote": false, "editInteriors": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "taximeter": false }, { "hireFire": false, "manageKeysGate": false, "manageKeysVehicle": false, "promoteDemote": false, "editInteriors": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "taximeter": false }, { "hireFire": false, "manageKeysGate": false, "manageKeysVehicle": false, "promoteDemote": false, "editInteriors": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "taximeter": false } ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ { "127": false, "316": false, "317": false }, { "127": false, "316": false, "317": false }, { "127": false, "316": false, "317": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0);
INSERT INTO "groups" ("dbId", "groupPrefix", "rankNames", "rankColors", "rankSalaries", "rankPermissions", "rankSkins", "rankItems", "vehicleMembers", "interiorMembers", "motd", "balance", "aid", "tax") VALUES
(13, 'SG', '[ [ "Inaktív", "Minimum alatti", "Normál teljesítményű", "Normál feletti", "Adminsegéd", "Adminisztrátor", "FőAdmin", "SzuperAdmin", "Director", "Contributor", "Fejlesztő", "Tulajdonos" ] ]', '[ [ "red", "blue", "green", "yellow", "purple-second", "green", "yellow", "orange", "orange-second", "green", "blue", "red" ] ]', '[ [ 0, 0, 0, 0, 35000, 70000, 100000, 0, 0, 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "graffiti": false, "borderControl": false, "packerTow": false, "department": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "traffi": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "craft:431": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "jail": false, "interiorLock": false, "mechanicCheckout": false, "casetteOpen": false, "megaphone": false, "departmentBlip": false, "atmRob": false, "applyBag": false, "manageInvoiceBooks": false, "craft:85": false, "craft:444": false, "squad": false, "nion": false, "manageGroupBalance": false, "pavilionradio": false, "goldrobRepairGarage": false, "alnev": false, "craft:76": false, "unimpoundPolice": false, "craft:18": false, "manageKeysGate": false, "departmentRadio": false, "clubradio": false, "medic": false, "taximeter": false, "gov": false, "lenyomoz": false, "createCompany": false, "craft:82": false, "manageCompanyTax": false, "editPed": false }, { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "graffiti": false, "borderControl": false, "packerTow": false, "department": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "traffi": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "craft:431": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "jail": false, "interiorLock": false, "mechanicCheckout": false, "casetteOpen": false, "megaphone": false, "departmentBlip": false, "atmRob": false, "applyBag": false, "manageInvoiceBooks": false, "craft:85": false, "craft:444": false, "squad": false, "nion": false, "manageGroupBalance": false, "pavilionradio": false, "goldrobRepairGarage": false, "alnev": false, "craft:76": false, "unimpoundPolice": false, "craft:18": false, "manageKeysGate": false, "departmentRadio": false, "clubradio": false, "medic": false, "taximeter": false, "gov": false, "lenyomoz": false, "createCompany": false, "craft:82": false, "manageCompanyTax": false, "editPed": false }, { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "graffiti": false, "borderControl": false, "packerTow": false, "department": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "traffi": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "craft:431": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "jail": false, "interiorLock": false, "mechanicCheckout": false, "casetteOpen": false, "megaphone": false, "departmentBlip": false, "atmRob": false, "applyBag": false, "manageInvoiceBooks": false, "craft:85": false, "craft:444": false, "squad": false, "nion": false, "manageGroupBalance": false, "pavilionradio": false, "goldrobRepairGarage": false, "alnev": false, "craft:76": false, "unimpoundPolice": false, "craft:18": false, "manageKeysGate": false, "departmentRadio": false, "clubradio": false, "medic": false, "taximeter": false, "gov": false, "lenyomoz": false, "createCompany": false, "craft:82": false, "manageCompanyTax": false, "editPed": false }, { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "graffiti": false, "borderControl": false, "packerTow": false, "department": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "traffi": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "craft:431": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "jail": false, "interiorLock": false, "mechanicCheckout": false, "casetteOpen": false, "megaphone": false, "departmentBlip": false, "atmRob": false, "applyBag": false, "manageInvoiceBooks": false, "craft:85": false, "craft:444": false, "squad": false, "nion": false, "manageGroupBalance": false, "pavilionradio": false, "goldrobRepairGarage": false, "alnev": false, "craft:76": false, "unimpoundPolice": false, "craft:18": false, "manageKeysGate": false, "departmentRadio": false, "clubradio": false, "medic": false, "taximeter": false, "gov": false, "lenyomoz": false, "createCompany": false, "craft:82": false, "manageCompanyTax": false, "editPed": false }, { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "casetteOpen": false, "borderControl": false, "packerTow": false, "department": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "traffi": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "craft:431": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "jail": false, "interiorLock": false, "mechanicCheckout": false, "departmentBlip": false, "megaphone": false, "atmRob": false, "craft:85": false, "applyBag": false, "manageInvoiceBooks": false, "craft:444": false, "medic": false, "squad": false, "nion": false, "manageGroupBalance": false, "pavilionradio": false, "goldrobRepairGarage": false, "alnev": false, "craft:76": false, "unimpoundPolice": false, "craft:18": false, "manageKeysGate": false, "departmentRadio": false, "clubradio": false, "graffiti": false, "taximeter": false, "gov": false, "lenyomoz": false, "createCompany": false, "craft:82": false, "manageCompanyTax": false, "editPed": false }, { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "casetteOpen": false, "craft:444": false, "packerTow": false, "craft:85": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "departmentBlip": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "alnev": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "editPed": false, "manageCompanyTax": false, "mechanicCheckout": false, "craft:82": false, "createCompany": false, "manageGroupBalance": false, "department": false, "applyBag": false, "manageInvoiceBooks": false, "borderControl": false, "medic": false, "squad": false, "nion": false, "atmRob": false, "pavilionradio": false, "clubradio": false, "departmentRadio": false, "manageKeysGate": false, "unimpoundPolice": false, "craft:18": false, "craft:76": false, "craft:431": false, "goldrobRepairGarage": false, "graffiti": false, "taximeter": false, "gov": false, "lenyomoz": false, "megaphone": false, "traffi": false, "interiorLock": false, "jail": false }, { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "casetteOpen": false, "borderControl": false, "packerTow": false, "department": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "traffi": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "craft:431": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "jail": false, "interiorLock": false, "mechanicCheckout": false, "departmentBlip": false, "megaphone": false, "atmRob": false, "craft:85": false, "applyBag": false, "manageInvoiceBooks": false, "craft:444": false, "medic": false, "squad": false, "nion": false, "manageGroupBalance": false, "pavilionradio": false, "goldrobRepairGarage": false, "alnev": false, "craft:76": false, "unimpoundPolice": false, "craft:18": false, "manageKeysGate": false, "departmentRadio": false, "clubradio": false, "graffiti": false, "taximeter": false, "gov": false, "lenyomoz": false, "createCompany": false, "craft:82": false, "manageCompanyTax": false, "editPed": false }, { "promoteDemote": false, "goldrobMute": true, "rbs": false, "nixorder": false, "impoundBikes": true, "medic": false, "borderControl": false, "packerTow": false, "department": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "departmentBlip": false, "goldrobLock": true, "goldrobDestroy": true, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": true, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "alnev": false, "departmentRadio": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "jail": true, "interiorLock": false, "mechanicCheckout": false, "traffi": false, "megaphone": false, "atmRob": true, "craft:85": false, "applyBag": false, "manageInvoiceBooks": false, "craft:444": false, "graffiti": false, "squad": false, "nion": false, "manageGroupBalance": false, "pavilionradio": false, "goldrobRepairGarage": false, "craft:431": false, "craft:76": false, "unimpoundPolice": false, "craft:18": false, "manageKeysGate": false, "crateOpen": false, "clubradio": false, "casetteOpen": true, "taximeter": false, "gov": false, "lenyomoz": false, "createCompany": false, "craft:82": false, "manageCompanyTax": false, "editPed": false }, { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "medic": false, "borderControl": false, "packerTow": false, "craft:85": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "traffi": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "useD": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "craft:431": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "editPed": false, "craft:82": false, "mechanicCheckout": false, "manageCompanyTax": false, "createCompany": false, "manageGroupBalance": false, "department": false, "applyBag": false, "manageInvoiceBooks": false, "graffiti": false, "departmentBlip": false, "squad": false, "nion": false, "atmRob": false, "pavilionradio": false, "clubradio": false, "departmentRadio": false, "manageKeysGate": false, "unimpoundPolice": false, "craft:18": false, "craft:76": false, "alnev": false, "goldrobRepairGarage": false, "craft:444": false, "taximeter": false, "gov": false, "lenyomoz": false, "megaphone": false, "casetteOpen": false, "interiorLock": false, "jail": false }, { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "graffiti": false, "borderControl": false, "packerTow": false, "department": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "traffi": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "craft:431": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "jail": false, "interiorLock": false, "mechanicCheckout": false, "casetteOpen": false, "megaphone": false, "departmentBlip": false, "atmRob": false, "applyBag": false, "manageInvoiceBooks": false, "craft:85": false, "craft:444": false, "squad": false, "nion": false, "manageGroupBalance": false, "pavilionradio": false, "goldrobRepairGarage": false, "alnev": false, "craft:76": false, "unimpoundPolice": false, "craft:18": false, "manageKeysGate": false, "departmentRadio": false, "clubradio": false, "medic": false, "taximeter": false, "gov": false, "lenyomoz": false, "createCompany": false, "craft:82": false, "manageCompanyTax": false, "editPed": false }, { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "casetteOpen": false, "craft:444": false, "packerTow": false, "craft:85": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "departmentBlip": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "alnev": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "editPed": false, "manageCompanyTax": false, "mechanicCheckout": false, "craft:82": false, "createCompany": false, "manageGroupBalance": false, "department": false, "applyBag": false, "manageInvoiceBooks": false, "borderControl": false, "medic": false, "squad": false, "nion": false, "atmRob": false, "pavilionradio": false, "clubradio": false, "departmentRadio": false, "manageKeysGate": false, "unimpoundPolice": false, "craft:18": false, "craft:76": false, "craft:431": false, "goldrobRepairGarage": false, "graffiti": false, "taximeter": false, "gov": false, "lenyomoz": false, "megaphone": false, "traffi": false, "interiorLock": false, "jail": false }, { "promoteDemote": false, "goldrobMute": false, "rbs": false, "nixorder": false, "impoundBikes": false, "graffiti": false, "borderControl": false, "packerTow": false, "department": false, "hireFire": false, "craft:17": false, "editInteriors": false, "craft:65": false, "badge": false, "engineKey": false, "traffi": false, "goldrobLock": false, "goldrobDestroy": false, "mechanicCheckStock": false, "craft:79": false, "craft:561": false, "spike": false, "robGoldBank": false, "fishradio": false, "editCompany": false, "craft:233": false, "weaponHide": false, "mechanicStats": false, "mdcdelwar": false, "craft:445": false, "craft:431": false, "crateOpen": false, "manageKeysVehicle": false, "listCompanies": false, "manageKeysInterior": false, "craft:87": false, "graffitiClean": false, "mdcrevoke": false, "vehicleExam": false, "mdc": false, "packerImpound": false, "craft:16": false, "craft:70": false, "craft:84": false, "jail": false, "interiorLock": false, "mechanicCheckout": false, "casetteOpen": false, "megaphone": false, "departmentBlip": false, "atmRob": false, "applyBag": false, "manageInvoiceBooks": false, "craft:85": false, "craft:444": false, "squad": false, "nion": false, "manageGroupBalance": false, "pavilionradio": false, "goldrobRepairGarage": false, "alnev": false, "craft:76": false, "unimpoundPolice": false, "craft:18": false, "manageKeysGate": false, "departmentRadio": false, "clubradio": false, "medic": false, "taximeter": false, "gov": false, "lenyomoz": false, "createCompany": false, "craft:82": false, "manageCompanyTax": false, "editPed": false } ] ]', '[ [ [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ], [ true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true ], [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false ] ] ]', '[ [ [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [ ] ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 35000000, 0, 0),
(14, 'NDR', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(15, 'OMSZ', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "departmentBlip": false, "manageKeysInterior": false, "rbs": false, "departmentRadio": false, "editInteriors": false, "hireFire": false, "manageKeysVehicle": false, "manageKeysGate": false, "medic": false, "megaphone": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "departmentBlip": false, "manageKeysInterior": false, "rbs": false, "departmentRadio": false, "editInteriors": false, "hireFire": false, "manageKeysVehicle": false, "manageKeysGate": false, "medic": false, "megaphone": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "departmentBlip": false, "manageKeysInterior": false, "rbs": false, "departmentRadio": false, "editInteriors": false, "hireFire": false, "manageKeysVehicle": false, "manageKeysGate": false, "medic": false, "megaphone": false, "editPed": false, "manageGroupBalance": false, "packerTow": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ { "127": false, "314": false, "100": false, "612": false, "592": false }, { "127": false, "314": false, "100": false, "612": false, "592": false }, { "127": false, "314": false, "100": false, "612": false, "592": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(16, 'OV', '[ [ "Rang 1", "Rang 2", "Scripteri" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 400 ] ]', '[ [ { "craft:84": true, "promoteDemote": true, "craft:431": true, "craft:18": true, "nion": true, "craft:70": true, "crateOpen": true, "craft:82": true, "applyBag": true, "manageKeysVehicle": true, "graffiti": true, "casetteOpen": true, "craft:79": true, "editPed": true, "manageGroupBalance": true, "robGoldBank": true, "craft:85": true, "hireFire": true, "craft:17": true, "craft:444": true, "craft:233": true, "manageKeysGate": true, "craft:561": true, "weaponHide": true, "craft:87": true, "editInteriors": true, "craft:76": true, "craft:16": true, "craft:445": true, "manageKeysInterior": true, "craft:65": true, "atmRob": true }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "craft:79": false, "craft:70": false, "crateOpen": false, "editPed": false, "applyBag": false, "manageKeysVehicle": false, "atmRob": false, "casetteOpen": false, "manageKeysInterior": false, "nion": false, "manageGroupBalance": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "craft:444": false, "craft:233": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:87": false, "editInteriors": false, "manageKeysGate": false, "craft:16": false, "craft:445": false, "graffiti": false, "craft:65": false, "craft:82": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": true, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": true, "craft:79": false, "craft:87": false, "atmRob": true, "robGoldBank": true, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false } ] ]', '[ [ [ true, true, true, true, true, true, true ], [ false, false, false, false, false, false, false ], [ false, false, false, false, true, true, true ] ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 1010000, 0, 0),
(17, 'PD', '[ [ "TULAJDONOS", "Rang 2", "Rang 5", "Rang 6", "Rang 7", "Rang 8", "Rang 9" ] ]', '[ [ "blue-second", "green", "green", "green", "green", "green", "green" ] ]', '[ [ 0, 0, 0, 0, 0, 0, 0 ] ]', '[ [ { "promoteDemote": true, "goldrobMute": true, "rbs": true, "departmentRadio": true, "manageKeysVehicle": true, "medic": true, "manageKeysInterior": true, "editPed": true, "packerTow": true, "graffitiClean": true, "hireFire": true, "mdcrevoke": true, "mdc": true, "packerImpound": true, "editInteriors": true, "badge": true, "departmentBlip": true, "goldrobLock": true, "goldrobDestroy": true, "applyBag": true, "squad": true, "spike": true, "unimpoundPolice": true, "manageKeysGate": true, "goldrobRepairGarage": true, "mdcdelwar": true, "manageGroupBalance": true, "gov": true, "interiorLock": true, "megaphone": true, "traffi": true, "borderControl": true, "jail": true }, { "promoteDemote": false, "goldrobMute": false, "traffi": false, "rbs": false, "goldrobLock": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "mdcrevoke": false, "medic": false, "squad": false, "editPed": false, "manageGroupBalance": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "interiorLock": false, "unimpoundPolice": false, "jail": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "packerImpound": false, "editInteriors": false, "manageKeysInterior": false, "mdcdelwar": false, "megaphone": false, "departmentBlip": false, "spike": false, "borderControl": false }, { "promoteDemote": false, "editPed": false, "traffi": false, "unimpoundPolice": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "manageGroupBalance": false, "medic": false, "squad": false, "borderControl": false, "spike": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "departmentBlip": false, "mdcrevoke": false, "manageKeysInterior": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "packerImpound": false, "editInteriors": false, "interiorLock": false, "mdcdelwar": false, "megaphone": false, "goldrobLock": false, "goldrobMute": false, "jail": false }, { "promoteDemote": false, "borderControl": false, "traffi": false, "spike": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "departmentBlip": false, "medic": false, "squad": false, "editPed": false, "manageGroupBalance": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "interiorLock": false, "mdcrevoke": false, "jail": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "packerImpound": false, "editInteriors": false, "manageKeysInterior": false, "mdcdelwar": false, "megaphone": false, "unimpoundPolice": false, "goldrobLock": false, "goldrobMute": false }, { "promoteDemote": false, "borderControl": false, "traffi": false, "spike": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "departmentBlip": false, "medic": false, "squad": false, "editPed": false, "manageGroupBalance": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "interiorLock": false, "mdcrevoke": false, "jail": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "packerImpound": false, "editInteriors": false, "manageKeysInterior": false, "mdcdelwar": false, "megaphone": false, "unimpoundPolice": false, "goldrobLock": false, "goldrobMute": false }, { "promoteDemote": false, "borderControl": false, "traffi": false, "spike": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "departmentBlip": false, "medic": false, "squad": false, "editPed": false, "manageGroupBalance": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "interiorLock": false, "mdcrevoke": false, "jail": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "packerImpound": false, "editInteriors": false, "manageKeysInterior": false, "mdcdelwar": false, "megaphone": false, "unimpoundPolice": false, "goldrobLock": false, "goldrobMute": false }, { "promoteDemote": false, "borderControl": false, "traffi": false, "spike": false, "rbs": false, "departmentRadio": false, "goldrobDestroy": false, "applyBag": false, "manageKeysVehicle": false, "departmentBlip": false, "medic": false, "squad": false, "editPed": false, "manageGroupBalance": false, "packerTow": false, "graffitiClean": false, "hireFire": false, "interiorLock": false, "mdcrevoke": false, "jail": false, "manageKeysGate": false, "mdc": false, "goldrobRepairGarage": false, "packerImpound": false, "editInteriors": false, "manageKeysInterior": false, "mdcdelwar": false, "megaphone": false, "unimpoundPolice": false, "goldrobLock": false, "goldrobMute": false } ] ]', '[ [ [ true, true, true, true, true, true, true ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ { "480": true, "292": true, "483": true, "486": true, "592": true, "427": true, "533": true, "537": true, "94": true, "541": true, "372": true, "612": true, "127": true, "314": true, "505": true, "507": true, "575": true, "83": true, "115": true, "520": true, "100": true, "69": true, "561": true, "534": true, "536": true, "86": true, "540": true, "542": true, "528": true, "512": true, "500": true, "613": true, "77": true, "88": true, "556": true, "291": true, "471": true, "562": true, "118": true, "93": true, "155": true, "119": true, "493": true }, { "480": false, "292": false, "483": false, "486": false, "592": false, "427": false, "533": false, "537": false, "94": false, "155": false, "372": false, "612": false, "127": false, "314": false, "505": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "69": false, "561": false, "534": false, "536": false, "86": false, "540": false, "542": false, "528": false, "541": false, "500": false, "613": false, "77": false, "88": false, "471": false, "291": false, "118": false, "562": false, "556": false, "93": false, "512": false, "119": false, "493": false }, { "480": false, "292": false, "483": false, "486": false, "77": false, "93": false, "533": false, "493": false, "94": false, "155": false, "372": false, "612": false, "500": false, "314": false, "561": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "528": false, "556": false, "534": false, "536": false, "86": false, "540": false, "118": false, "512": false, "505": false, "291": false, "119": false, "69": false, "88": false, "471": false, "537": false, "542": false, "562": false, "541": false, "613": false, "592": false, "127": false, "427": false }, { "480": false, "292": false, "483": false, "486": false, "592": false, "427": false, "533": false, "537": false, "94": false, "155": false, "372": false, "612": false, "127": false, "314": false, "505": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "69": false, "561": false, "534": false, "536": false, "86": false, "540": false, "542": false, "528": false, "541": false, "500": false, "613": false, "77": false, "88": false, "471": false, "291": false, "118": false, "562": false, "556": false, "93": false, "512": false, "119": false, "493": false }, { "480": false, "292": false, "483": false, "486": false, "592": false, "427": false, "533": false, "537": false, "94": false, "155": false, "372": false, "612": false, "127": false, "314": false, "505": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "69": false, "561": false, "534": false, "536": false, "86": false, "540": false, "542": false, "528": false, "541": false, "500": false, "613": false, "77": false, "88": false, "471": false, "291": false, "118": false, "562": false, "556": false, "93": false, "512": false, "119": false, "493": false }, { "480": false, "292": false, "483": false, "486": false, "592": false, "427": false, "533": false, "537": false, "94": false, "155": false, "372": false, "612": false, "127": false, "314": false, "505": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "69": false, "561": false, "534": false, "536": false, "86": false, "540": false, "542": false, "528": false, "541": false, "500": false, "613": false, "77": false, "88": false, "471": false, "291": false, "118": false, "562": false, "556": false, "93": false, "512": false, "119": false, "493": false }, { "480": false, "292": false, "483": false, "486": false, "592": false, "427": false, "533": false, "537": false, "94": false, "155": false, "372": false, "612": false, "127": false, "314": false, "505": false, "507": false, "575": false, "83": false, "115": false, "520": false, "100": false, "69": false, "561": false, "534": false, "536": false, "86": false, "540": false, "542": false, "528": false, "541": false, "500": false, "613": false, "77": false, "88": false, "471": false, "291": false, "118": false, "562": false, "556": false, "93": false, "512": false, "119": false, "493": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'pej dej', 40000, 40000, 0),
(18, 'NSM', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(19, 'CNC', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(20, 'DV', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0);
INSERT INTO "groups" ("dbId", "groupPrefix", "rankNames", "rankColors", "rankSalaries", "rankPermissions", "rankSkins", "rankItems", "vehicleMembers", "interiorMembers", "motd", "balance", "aid", "tax") VALUES
(21, 'LM', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": false, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": false, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(22, 'SOD', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "editPed": false, "craft:233": false, "crateOpen": true, "manageGroupBalance": false, "applyBag": false, "manageKeysVehicle": false, "manageKeysGate": false, "casetteOpen": false, "craft:79": false, "craft:87": false, "atmRob": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "manageKeysInterior": false, "graffiti": true, "craft:17": false, "craft:76": false, "craft:561": false, "weaponHide": false, "craft:65": false, "editInteriors": false, "craft:444": false, "craft:16": false, "craft:445": false, "craft:82": false, "craft:70": false, "nion": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "atmRob": false, "craft:65": false, "crateOpen": false, "manageKeysInterior": false, "applyBag": false, "manageKeysVehicle": false, "casetteOpen": false, "graffiti": false, "craft:82": false, "nion": false, "manageGroupBalance": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "craft:444": false, "craft:76": false, "craft:17": false, "manageKeysGate": false, "craft:561": false, "weaponHide": false, "craft:87": false, "editInteriors": false, "craft:233": false, "craft:16": false, "craft:445": false, "editPed": false, "craft:70": false, "craft:79": false }, { "craft:84": false, "promoteDemote": false, "craft:431": false, "craft:18": false, "atmRob": false, "craft:65": false, "crateOpen": false, "manageKeysInterior": false, "applyBag": false, "manageKeysVehicle": false, "casetteOpen": false, "graffiti": false, "craft:82": false, "nion": false, "manageGroupBalance": false, "robGoldBank": false, "craft:85": false, "hireFire": false, "craft:444": false, "craft:76": false, "craft:17": false, "manageKeysGate": false, "craft:561": false, "weaponHide": false, "craft:87": false, "editInteriors": false, "craft:233": false, "craft:16": false, "craft:445": false, "editPed": false, "craft:70": false, "craft:79": false } ] ]', '[ [ [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ], [ false, false, false, false, false, false, false ] ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(23, 'BMS', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false } ] ]', '[ [ [ false, false, false, false, false, false ], [ false, false, false, false, false, false ], [ false, false, false, false, false, false ] ] ]', '[ [ { "127": false, "440": false, "287": false }, { "127": false, "440": false, "287": false }, { "127": false, "440": false, "287": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(24, 'PF', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "departmentBlip": false, "manageKeysGate": false, "departmentRadio": false, "impoundBikes": false, "packerImpound": false, "manageKeysVehicle": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "departmentBlip": false, "manageKeysGate": false, "departmentRadio": false, "impoundBikes": false, "packerImpound": false, "manageKeysVehicle": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "departmentBlip": false, "manageKeysGate": false, "departmentRadio": false, "impoundBikes": false, "packerImpound": false, "manageKeysVehicle": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false } ] ]', '[ [ [ false, false, false, false ], [ false, false, false, false ], [ false, false, false, false ] ] ]', '[ [ { "314": false, "127": false }, { "314": false, "127": false }, { "314": false, "127": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0),
(25, 'RING', '[ [ "Rang 1", "Rang 2", "Rang 3" ] ]', '[ [ "green", "green", "green" ] ]', '[ [ 0, 0, 0 ] ]', '[ [ { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false }, { "promoteDemote": false, "engineKey": false, "mechanicCheckout": false, "vehicleExam": false, "manageKeysGate": false, "manageKeysVehicle": false, "nixorder": false, "mechanicCheckStock": false, "mechanicStats": false, "editInteriors": false, "hireFire": false, "manageKeysInterior": false, "editPed": false, "manageGroupBalance": false, "packerTow": false } ] ]', '[ [ [ ], [ ], [ ] ] ]', '[ [ { "440": false, "287": false, "127": false }, { "440": false, "287": false, "127": false }, { "440": false, "287": false, "127": false } ] ]', '[ [ ] ]', '[ [ ] ]', 'Leírás', 0, 0, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "interiors"
--

DROP TABLE IF EXISTS "interiors" CASCADE;
CREATE TABLE "interiors" (
  "interiorId" SERIAL,
  "outside" TEXT NOT NULL,
  "inside" TEXT NOT NULL,
  "name" varchar(64) NOT NULL,
  "zone" varchar(64) NOT NULL DEFAULT 'N/A',
  "type" varchar(32) NOT NULL,
  "ownerType" TEXT CHECK ("ownerType" IN ('group','player')) NOT NULL DEFAULT 'player',
  "owner" text NOT NULL DEFAULT '0',
  "editable" varchar(1) NOT NULL DEFAULT 'N',
  "locked" INTEGER NOT NULL DEFAULT 0,
  "price" INTEGER NOT NULL,
  "rentTime" INTEGER NOT NULL DEFAULT 0,
  "dummy" varchar(1) NOT NULL DEFAULT 'Y',
  "gameInterior" INTEGER NOT NULL,
  "entrance_rotation" INTEGER NOT NULL DEFAULT 0,
  "exit_rotation" INTEGER NOT NULL DEFAULT 0,
  "deleted" varchar(1) NOT NULL DEFAULT 'N',
  "policeLock" text NOT NULL,
  "policeLockBy" text NOT NULL,
  "policeLockGroup" text NOT NULL
);

--
-- A tábla adatainak kiíratása "interiors"
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "interior_datas"
--

DROP TABLE IF EXISTS "interior_datas" CASCADE;
CREATE TABLE "interior_datas" (
  "interiorId" INTEGER NOT NULL,
  "paidCash" INTEGER NOT NULL DEFAULT 0,
  "interiorData" TEXT NOT NULL DEFAULT '',
  "dynamicData" varchar(255) NOT NULL DEFAULT '',
  "unlockedPP" varchar(255) NOT NULL DEFAULT ''
);

--
-- A tábla adatainak kiíratása "interior_datas"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "invoices"
--

DROP TABLE IF EXISTS "invoices" CASCADE;
CREATE TABLE "invoices" (
  "dbId" SERIAL,
  "bookId" text NOT NULL,
  "invoiceId" INTEGER NOT NULL,
  "created" INTEGER NOT NULL,
  "netPrice" INTEGER NOT NULL,
  "postfix" text NOT NULL,
  "companyName" text NOT NULL,
  "vatNumber" text NOT NULL,
  "buyer" text NOT NULL,
  "product" text NOT NULL,
  "sellerSign" text NOT NULL,
  "buyerSign" text NOT NULL
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "items"
--

DROP TABLE IF EXISTS "items" CASCADE;
CREATE TABLE "items" (
  "dbID" SERIAL,
  "slot" INTEGER NOT NULL,
  "itemId" INTEGER NOT NULL,
  "amount" INTEGER NOT NULL,
  "data1" BYTEA DEFAULT NULL,
  "data2" varchar(255) DEFAULT NULL,
  "data3" varchar(255) DEFAULT NULL,
  "nameTag" varchar(64) DEFAULT NULL,
  "serial" INTEGER NOT NULL,
  "ownerType" varchar(32) NOT NULL,
  "ownerId" INTEGER NOT NULL
);

--
-- A tábla adatainak kiíratása "items"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "licenses"
--

DROP TABLE IF EXISTS "licenses" CASCADE;
CREATE TABLE "licenses" (
  "dbID" SERIAL,
  "characterId" INTEGER NOT NULL,
  "type" varchar(32) NOT NULL,
  "issueDate" BIGINT NOT NULL DEFAULT 0,
  "expiryDate" BIGINT NOT NULL DEFAULT 0,
  "status" INTEGER NOT NULL DEFAULT 1,
  "points" INTEGER NOT NULL DEFAULT 0
);

--
-- A tábla adatainak kiíratása "licenses"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "lifts"
--

DROP TABLE IF EXISTS "lifts" CASCADE;
CREATE TABLE "lifts" (
  "id" SERIAL,
  "type" INTEGER NOT NULL DEFAULT 1,
  "dimension" INTEGER NOT NULL DEFAULT 0,
  "lifted" INTEGER NOT NULL DEFAULT 0,
  "slot" INTEGER NOT NULL DEFAULT 1
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "mdc_records"
--

DROP TABLE IF EXISTS "mdc_records" CASCADE;
CREATE TABLE "mdc_records" (
  "dbID" SERIAL,
  "recordType" varchar(255) DEFAULT NULL,
  "punishedName" varchar(255) DEFAULT NULL,
  "recordBy" varchar(255) DEFAULT NULL,
  "description" varchar(255) DEFAULT NULL,
  "recordTime" INTEGER DEFAULT NULL,
  "recordPunishment" varchar(255) DEFAULT NULL
);

--
-- A tábla adatainak kiíratása "mdc_records"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "mdc_vehwarrants"
--

DROP TABLE IF EXISTS "mdc_vehwarrants" CASCADE;
CREATE TABLE "mdc_vehwarrants" (
  "warrantId" SERIAL,
  "wantedPlate" text NOT NULL,
  "creationDate" INTEGER NOT NULL,
  "officerName" text NOT NULL,
  "reason" text NOT NULL,
  "wantedVehicleId" INTEGER NOT NULL
);

--
-- A tábla adatainak kiíratása "mdc_vehwarrants"
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "mdc_warrants"
--

DROP TABLE IF EXISTS "mdc_warrants" CASCADE;
CREATE TABLE "mdc_warrants" (
  "warrantId" SERIAL,
  "wantedCharacterId" INTEGER NOT NULL,
  "wantedName" text NOT NULL,
  "creationDate" text NOT NULL,
  "officerName" text NOT NULL,
  "reason" text NOT NULL,
  "isActive" INTEGER NOT NULL DEFAULT 1
);

--
-- A tábla adatainak kiíratása "mdc_warrants"
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "paintshopperms"
--

DROP TABLE IF EXISTS "paintshopperms" CASCADE;
CREATE TABLE "paintshopperms" (
  "dbID" SERIAL,
  "playerIdentity" INTEGER NOT NULL,
  "workshopIdentity" INTEGER NOT NULL,
  "openClose" INTEGER NOT NULL DEFAULT 0,
  "useSkin" INTEGER NOT NULL DEFAULT 0,
  "useSander" INTEGER NOT NULL DEFAULT 0,
  "usePaintGun" INTEGER NOT NULL DEFAULT 0,
  "useToggleDry" INTEGER NOT NULL DEFAULT 0,
  "useNextState" INTEGER NOT NULL DEFAULT 0,
  "useStartJob" INTEGER NOT NULL DEFAULT 0,
  "useCancelJob" INTEGER NOT NULL DEFAULT 0,
  "useMixer" INTEGER NOT NULL DEFAULT 0,
  "doMixerMaintance" INTEGER NOT NULL DEFAULT 0,
  "createOrder" INTEGER NOT NULL DEFAULT 0,
  "transportOrder" INTEGER NOT NULL DEFAULT 0,
  "startTransport" INTEGER NOT NULL DEFAULT 0,
  "endTransport" INTEGER NOT NULL DEFAULT 0
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "paintshops"
--

DROP TABLE IF EXISTS "paintshops" CASCADE;
CREATE TABLE "paintshops" (
  "dbID" SERIAL,
  "paintshopIdentity" INTEGER NOT NULL,
  "rentedBy" INTEGER NOT NULL,
  "rentUntil" INTEGER NOT NULL,
  "lockedState" INTEGER NOT NULL,
  "policeLockDatas" TEXT  DEFAULT NULL,
  "paintshopName" varchar(64) NOT NULL,
  "paintshopCertificate" TEXT  NOT NULL DEFAULT '''\\''{{0, 0}}\\''''',
  "rentMode" varchar(5) NOT NULL
);


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "peds"
--

DROP TABLE IF EXISTS "peds" CASCADE;
CREATE TABLE "peds" (
  "id" SERIAL,
  "owner" TEXT CHECK ("owner" IN ('interior','group','char','server')) NOT NULL,
  "ownerId" text NOT NULL DEFAULT '-1',
  "posX" REAL NOT NULL,
  "posY" REAL NOT NULL,
  "posZ" REAL NOT NULL,
  "posR" REAL NOT NULL,
  "interior" INTEGER NOT NULL,
  "dimension" INTEGER NOT NULL,
  "skin" INTEGER NOT NULL,
  "name" varchar(32) NOT NULL DEFAULT 'PED',
  "balance" BIGINT NOT NULL DEFAULT 0,
  "selectedItems" TEXT NOT NULL,
  "categories" TEXT NOT NULL,
  "pedPrice" TEXT NOT NULL,
  "pedStock" TEXT NOT NULL
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "phoneads"
--

DROP TABLE IF EXISTS "phoneads" CASCADE;
CREATE TABLE "phoneads" (
  "id" SERIAL,
  "type" INTEGER NOT NULL DEFAULT 1,
  "adText" varchar(255) NOT NULL,
  "images" INTEGER NOT NULL DEFAULT 0,
  "endTime" INTEGER DEFAULT NULL,
  "startTime" INTEGER DEFAULT NULL,
  "number" varchar(25) NOT NULL,
  "owner" varchar(105) NOT NULL DEFAULT '"N/A"',
  "adTitle" varchar(55) NOT NULL,
  "price" INTEGER NOT NULL,
  "subType" INTEGER NOT NULL,
  "highlighted" varchar(255) NOT NULL DEFAULT '[[]]',
  "photo1" BYTEA DEFAULT NULL,
  "photo2" BYTEA DEFAULT NULL,
  "photo3" BYTEA DEFAULT NULL,
  "photo4" BYTEA DEFAULT NULL,
  "senderCharId" INTEGER NOT NULL DEFAULT 1
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "phonemessages"
--

DROP TABLE IF EXISTS "phonemessages" CASCADE;
CREATE TABLE "phonemessages" (
  "recievedPhone" varchar(25) NOT NULL,
  "senderPhone" varchar(25) NOT NULL,
  "messageData" BYTEA NOT NULL,
  "id" INTEGER NOT NULL,
  "type" INTEGER NOT NULL DEFAULT 1
);

--
-- A tábla adatainak kiíratása "phonemessages"
--



-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "phone_datas"
--

DROP TABLE IF EXISTS "phone_datas" CASCADE;
CREATE TABLE "phone_datas" (
  "id" INTEGER NOT NULL,
  "number" varchar(25) NOT NULL,
  "settings" text NOT NULL DEFAULT '[ [ ] ]',
  "contacts" text NOT NULL DEFAULT ' [ [ { "number": "911", "name": "* SEGÉLYHÍVÓ *", "color": 7, "icon": "ambulance", "default": true }, { "number": "1818", "name": "* SZOLGÁLTATÁSOK *", "color": 4, "icon": "deskbell", "default": true }, { "number": "3876100107", "name": "* SCKH BÍRSÁG *", "color": 7, "icon": "car", "default": true }, { "number": "131", "name": "* EGYENLEGINFÓ *", "color": 8, "icon": "dollar", "default": true }, { "number": "387579460801", "name": "* A Valutás *", "color": 8, "icon": "dollar", "default": true }, { "number": "1331", "name": "* NET-COM *", "color": 9, "icon": "phone", "default": true } ] ]''\t',
  "lastSMS" text NOT NULL DEFAULT '[ [ ] ]',
  "bank" INTEGER NOT NULL DEFAULT 0,
  "titlebardatas" varchar(300) NOT NULL DEFAULT '[ [ { "name": "soundon", "enabled": true }, { "name": "vibration", "enabled": true }, { "name": "location", "enabled": true }, { "name": "microphone", "enabled": true } ] ]',
  "recentCalls" text NOT NULL DEFAULT '[ [ ] ]',
  "ringtone" INTEGER NOT NULL DEFAULT 1,
  "wallpaper" INTEGER NOT NULL DEFAULT 1,
  "noti" INTEGER NOT NULL DEFAULT 1
);

--
-- A tábla adatainak kiíratása "phone_datas"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "phone_images"
--

DROP TABLE IF EXISTS "phone_images" CASCADE;
CREATE TABLE "phone_images" (
  "id" INTEGER NOT NULL,
  "phoneNumber" varchar(20) NOT NULL,
  "date" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "position" varchar(255) NOT NULL DEFAULT '[ [ ] ]',
  "type" INTEGER NOT NULL DEFAULT 2,
  "rotation" INTEGER NOT NULL
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "player_stat"
--

DROP TABLE IF EXISTS "player_stat" CASCADE;
CREATE TABLE "player_stat" (
  "dbID" SERIAL,
  "players" INTEGER NOT NULL DEFAULT 0,
  "date" TIMESTAMP DEFAULT NULL,
  "time" text NOT NULL
);

--
-- A tábla adatainak kiíratása "player_stat"
--



-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "premium"
--

DROP TABLE IF EXISTS "premium" CASCADE;
CREATE TABLE "premium" (
  "codeId" SERIAL,
  "code" text DEFAULT NULL,
  "codeState" TEXT CHECK ("codeState" IN ('Valid','Used','Expired')) DEFAULT NULL,
  "activationTimestamp" text DEFAULT NULL,
  "expireTimestamp" text DEFAULT NULL,
  "discordUserId" text DEFAULT NULL,
  "duration" text DEFAULT NULL,
  "roleType" TEXT CHECK ("roleType" IN ('Silver','Gold','Diamond','Emerald')) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "priorities"
--

DROP TABLE IF EXISTS "priorities" CASCADE;
CREATE TABLE "priorities" (
  "dbID" INTEGER NOT NULL,
  "prioType" INTEGER NOT NULL,
  "expireTimestamp" BIGINT NOT NULL,
  "serial" varchar(32) NOT NULL
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "safes"
--

DROP TABLE IF EXISTS "safes" CASCADE;
CREATE TABLE "safes" (
  "dbID" SERIAL,
  "posX" REAL NOT NULL,
  "posY" REAL NOT NULL,
  "posZ" REAL NOT NULL,
  "rotZ" REAL NOT NULL,
  "interior" INTEGER NOT NULL,
  "dimension" INTEGER NOT NULL,
  "ownerGroup" varchar(20) NOT NULL DEFAULT '0',
  "safeType" varchar(25) NOT NULL DEFAULT '1'
);

--
-- A tábla adatainak kiíratása "safes"
--



-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "serverdatas"
--

DROP TABLE IF EXISTS "serverdatas" CASCADE;
CREATE TABLE "serverdatas" (
  "dbID" SERIAL,
  "players" INTEGER NOT NULL,
  "password" varchar(32) NOT NULL
);

--
-- A tábla adatainak kiíratása "serverdatas"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "tickets"
--

DROP TABLE IF EXISTS "tickets" CASCADE;
CREATE TABLE "tickets" (
  "dbID" SERIAL,
  "money" INTEGER NOT NULL,
  "reason" text NOT NULL,
  "offenderId" INTEGER NOT NULL,
  "offenderName" text NOT NULL,
  "ticketDate" BIGINT NOT NULL,
  "ticketBy" text NOT NULL,
  "ticketPlace" text NOT NULL,
  "ticketGroup" text NOT NULL
);

--
-- A tábla adatainak kiíratása "tickets"
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "trashes"
--

DROP TABLE IF EXISTS "trashes" CASCADE;
CREATE TABLE "trashes" (
  "databaseId" SERIAL,
  "posX" REAL NOT NULL,
  "posY" REAL NOT NULL,
  "posZ" REAL NOT NULL,
  "rotZ" REAL NOT NULL,
  "interior" INTEGER NOT NULL,
  "dimension" INTEGER NOT NULL,
  "modelId" INTEGER NOT NULL,
  "lamart" INTEGER NOT NULL DEFAULT 0
);

--
-- A tábla adatainak kiíratása "trashes"
--



-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "undoneprocesses_connect"
--

DROP TABLE IF EXISTS "undoneprocesses_connect" CASCADE;
CREATE TABLE "undoneprocesses_connect" (
  "id" SERIAL,
  "details" TEXT NOT NULL
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "undoneprocesses_discord"
--

DROP TABLE IF EXISTS "undoneprocesses_discord" CASCADE;
CREATE TABLE "undoneprocesses_discord" (
  "id" SERIAL,
  "details" TEXT NOT NULL
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "undoneprocesses_main"
--

DROP TABLE IF EXISTS "undoneprocesses_main" CASCADE;
CREATE TABLE "undoneprocesses_main" (
  "id" SERIAL,
  "details" TEXT NOT NULL
);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához "vehicles"
--

DROP TABLE IF EXISTS "vehicles" CASCADE;
CREATE TABLE "vehicles" (
  "dbID" SERIAL,
  "characterId" INTEGER NOT NULL,
  "modelId" INTEGER NOT NULL,
  "groupPrefix" text DEFAULT NULL,
  "health" INTEGER NOT NULL DEFAULT 1000,
  "position" TEXT  NOT NULL DEFAULT '[ [ 0, 0, 0, 0, 0 ] ]' ,
  "parkPosition" TEXT  NOT NULL DEFAULT '[ [ 0, 0, 0, 0, 0 ] ]' ,
  "rotation" TEXT  NOT NULL DEFAULT '[ [ 0, 0, 0 ] ]',
  "color" TEXT  NOT NULL DEFAULT '[ [ 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255 ] ]',
  "engine" INTEGER NOT NULL DEFAULT 0,
  "ignition" INTEGER NOT NULL DEFAULT 0,
  "light" INTEGER NOT NULL DEFAULT 0,
  "handbrake" INTEGER NOT NULL DEFAULT 0,
  "fuel" INTEGER NOT NULL DEFAULT 100,
  "oil" INTEGER NOT NULL DEFAULT 1000,
  "checkengine" INTEGER NOT NULL DEFAULT 0,
  "distance" INTEGER NOT NULL DEFAULT 0,
  "locked" INTEGER NOT NULL DEFAULT 0,
  "pulling" INTEGER NOT NULL DEFAULT 0,
  "inService" INTEGER DEFAULT NULL,
  "impounded" INTEGER NOT NULL DEFAULT 0,
  "ecuValues" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "balanceValue" INTEGER NOT NULL DEFAULT 0,
  "customEcuValues" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "averageMultipler" INTEGER NOT NULL DEFAULT 0,
  "performanceTuning" TEXT  NOT NULL DEFAULT '[ { "tire": 0, "turbo": 0, "weightReduction": 0, "brakes": 0, "suspension": 0, "ecu": 0, "engine": 0, "transmission": 0 } ]',
  "customBackfire" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "backfire" INTEGER NOT NULL DEFAULT 0,
  "customTurbo" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "nitro" INTEGER NOT NULL DEFAULT 0,
  "nitroLevel" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "traffipaxRadar" INTEGER NOT NULL DEFAULT 0,
  "driveType" varchar(1024) NOT NULL DEFAULT 'handling',
  "customDriveType" INTEGER NOT NULL DEFAULT 0,
  "customHorn" INTEGER NOT NULL DEFAULT 0,
  "lsdDoor" INTEGER NOT NULL DEFAULT 0,
  "variant" INTEGER NOT NULL DEFAULT 0,
  "steeringLock" INTEGER NOT NULL DEFAULT 0,
  "offroadSetting" INTEGER NOT NULL DEFAULT 0,
  "abs" INTEGER NOT NULL DEFAULT 0,
  "paintjob" INTEGER NOT NULL DEFAULT 0,
  "currentTexture" INTEGER NOT NULL DEFAULT 0,
  "currentWheelTexture" INTEGER NOT NULL DEFAULT 0,
  "currentHeadlightTexture" INTEGER NOT NULL DEFAULT 0,
  "headlightColor" text NOT NULL DEFAULT 'ffffff',
  "wheelWidthFront" INTEGER NOT NULL DEFAULT 0,
  "wheelWidthRear" INTEGER NOT NULL DEFAULT 0,
  "spinner" INTEGER NOT NULL DEFAULT 0,
  "spinnerColor" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "opticalTunings" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "neon" text DEFAULT NULL,
  "neonData" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "airride" INTEGER DEFAULT NULL,
  "airrideDatas" TEXT  NOT NULL DEFAULT '[ [ ] ]' ,
  "airrideMemory" TEXT  NOT NULL DEFAULT '[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]' ,
  "wheelStates" TEXT  NOT NULL DEFAULT '[ [ 0, 0, 0, 0 ] ]' ,
  "panelStates" TEXT  NOT NULL DEFAULT '[ [ 0, 0, 0, 0, 0, 0 ] ]' ,
  "plate" varchar(8) DEFAULT NULL,
  "customPlate" varchar(8) DEFAULT NULL,
  "protected" BIGINT DEFAULT NULL,
  "fuelType" text DEFAULT NULL,
  "supercharger" INTEGER NOT NULL DEFAULT 0,
  "automaticShifter" INTEGER NOT NULL DEFAULT 0
);

--
-- A tábla adatainak kiíratása "vehicles"
--



--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei "accounts"
--
ALTER TABLE "accounts"
  ADD PRIMARY KEY ("accountId");

--
-- A tábla indexei "animals"
--
ALTER TABLE "animals"
  ADD PRIMARY KEY ("animalId");

--
-- A tábla indexei "armors"
--
ALTER TABLE "armors"
  ADD PRIMARY KEY ("armorId");

--
-- A tábla indexei "characters"
--
ALTER TABLE "characters"
  ADD PRIMARY KEY ("characterId");

--
-- A tábla indexei "companies"
--
ALTER TABLE "companies"
  ADD PRIMARY KEY ("companyId");

--
-- A tábla indexei "coupons"
--
ALTER TABLE "coupons"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "discordcodes"
--
ALTER TABLE "discordcodes"
  ADD PRIMARY KEY ("dbId");

--
-- A tábla indexei "farms"
--
ALTER TABLE "farms"
  ADD PRIMARY KEY ("id");

--
-- A tábla indexei "garages"
--
ALTER TABLE "garages"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "groupmembers"
--
ALTER TABLE "groupmembers"
  ADD PRIMARY KEY ("dbId");

--
-- A tábla indexei "groups"
--
ALTER TABLE "groups"
  ADD PRIMARY KEY ("dbId");

--
-- A tábla indexei "interiors"
--
ALTER TABLE "interiors"
  ADD PRIMARY KEY ("interiorId");

--
-- A tábla indexei "interior_datas"
--
ALTER TABLE "interior_datas"
  ADD PRIMARY KEY ("interiorId");

--
-- A tábla indexei "invoices"
--
ALTER TABLE "invoices"
  ADD PRIMARY KEY ("dbId");

--
-- A tábla indexei "items"
--
ALTER TABLE "items"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "licenses"
--
ALTER TABLE "licenses"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "lifts"
--
ALTER TABLE "lifts"
  ADD PRIMARY KEY ("id");

--
-- A tábla indexei "mdc_records"
--
ALTER TABLE "mdc_records"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "mdc_vehwarrants"
--
ALTER TABLE "mdc_vehwarrants"
  ADD PRIMARY KEY ("warrantId");

--
-- A tábla indexei "mdc_warrants"
--
ALTER TABLE "mdc_warrants"
  ADD PRIMARY KEY ("warrantId");

--
-- A tábla indexei "paintshopperms"
--
ALTER TABLE "paintshopperms"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "paintshops"
--
ALTER TABLE "paintshops"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "peds"
--
ALTER TABLE "peds"
  ADD PRIMARY KEY ("id");

--
-- A tábla indexei "phoneads"
--
ALTER TABLE "phoneads"
  ADD PRIMARY KEY ("id");

--
-- A tábla indexei "player_stat"
--
ALTER TABLE "player_stat"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "premium"
--
ALTER TABLE "premium"
  ADD PRIMARY KEY ("codeId");

--
-- A tábla indexei "safes"
--
ALTER TABLE "safes"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "serverdatas"
--
ALTER TABLE "serverdatas"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "tickets"
--
ALTER TABLE "tickets"
  ADD PRIMARY KEY ("dbID");

--
-- A tábla indexei "trashes"
--
ALTER TABLE "trashes"
  ADD PRIMARY KEY ("databaseId");

--
-- A tábla indexei "undoneprocesses_connect"
--
ALTER TABLE "undoneprocesses_connect"
  ADD PRIMARY KEY ("id");

--
-- A tábla indexei "undoneprocesses_discord"
--
ALTER TABLE "undoneprocesses_discord"
  ADD PRIMARY KEY ("id");

--
-- A tábla indexei "undoneprocesses_main"
--
ALTER TABLE "undoneprocesses_main"
  ADD PRIMARY KEY ("id");

--
-- A tábla indexei "vehicles"
--
ALTER TABLE "vehicles"
  ADD PRIMARY KEY ("dbID");

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához "accounts"
--


--
-- AUTO_INCREMENT a táblához "animals"
--


--
-- AUTO_INCREMENT a táblához "armors"
--


--
-- AUTO_INCREMENT a táblához "characters"
--


--
-- AUTO_INCREMENT a táblához "companies"
--


--
-- AUTO_INCREMENT a táblához "coupons"
--


--
-- AUTO_INCREMENT a táblához "discordcodes"
--


--
-- AUTO_INCREMENT a táblához "farms"
--


--
-- AUTO_INCREMENT a táblához "garages"
--


--
-- AUTO_INCREMENT a táblához "groupmembers"
--


--
-- AUTO_INCREMENT a táblához "groups"
--


--
-- AUTO_INCREMENT a táblához "interiors"
--


--
-- AUTO_INCREMENT a táblához "invoices"
--


--
-- AUTO_INCREMENT a táblához "items"
--


--
-- AUTO_INCREMENT a táblához "licenses"
--


--
-- AUTO_INCREMENT a táblához "lifts"
--


--
-- AUTO_INCREMENT a táblához "mdc_records"
--


--
-- AUTO_INCREMENT a táblához "mdc_vehwarrants"
--


--
-- AUTO_INCREMENT a táblához "mdc_warrants"
--


--
-- AUTO_INCREMENT a táblához "paintshopperms"
--


--
-- AUTO_INCREMENT a táblához "paintshops"
--


--
-- AUTO_INCREMENT a táblához "peds"
--


--
-- AUTO_INCREMENT a táblához "phoneads"
--


--
-- AUTO_INCREMENT a táblához "player_stat"
--


--
-- AUTO_INCREMENT a táblához "premium"
--


--
-- AUTO_INCREMENT a táblához "safes"
--


--
-- AUTO_INCREMENT a táblához "serverdatas"
--


--
-- AUTO_INCREMENT a táblához "tickets"
--


--
-- AUTO_INCREMENT a táblához "trashes"
--


--
-- AUTO_INCREMENT a táblához "undoneprocesses_connect"
--


--
-- AUTO_INCREMENT a táblához "undoneprocesses_discord"
--


--
-- AUTO_INCREMENT a táblához "undoneprocesses_main"
--


--
-- AUTO_INCREMENT a táblához "vehicles"
--

COMMIT;

-- Sequence Restarts
ALTER SEQUENCE "accounts_accountId_seq" RESTART WITH 29;
ALTER SEQUENCE "animals_animalId_seq" RESTART WITH 9;
ALTER SEQUENCE "armors_armorId_seq" RESTART WITH 18;
ALTER SEQUENCE "characters_characterId_seq" RESTART WITH 29;
ALTER SEQUENCE "companies_companyId_seq" RESTART WITH 2;
ALTER SEQUENCE "coupons_dbID_seq" RESTART WITH 24;
ALTER SEQUENCE "discordcodes_dbId_seq" RESTART WITH 52;
ALTER SEQUENCE "garages_dbID_seq" RESTART WITH 4;
ALTER SEQUENCE "groupmembers_dbId_seq" RESTART WITH 65;
ALTER SEQUENCE "groups_dbId_seq" RESTART WITH 26;
ALTER SEQUENCE "interiors_interiorId_seq" RESTART WITH 19;
ALTER SEQUENCE "invoices_dbId_seq" RESTART WITH 2;
ALTER SEQUENCE "items_dbID_seq" RESTART WITH 1972;
ALTER SEQUENCE "licenses_dbID_seq" RESTART WITH 47;
ALTER SEQUENCE "mdc_records_dbID_seq" RESTART WITH 8;
ALTER SEQUENCE "mdc_vehwarrants_warrantId_seq" RESTART WITH 12;
ALTER SEQUENCE "mdc_warrants_warrantId_seq" RESTART WITH 5;
ALTER SEQUENCE "paintshops_dbID_seq" RESTART WITH 13;
ALTER SEQUENCE "peds_id_seq" RESTART WITH 5;
ALTER SEQUENCE "phoneads_id_seq" RESTART WITH 23;
ALTER SEQUENCE "player_stat_dbID_seq" RESTART WITH 7349;
ALTER SEQUENCE "premium_codeId_seq" RESTART WITH 2;
ALTER SEQUENCE "safes_dbID_seq" RESTART WITH 27;
ALTER SEQUENCE "serverdatas_dbID_seq" RESTART WITH 2;
ALTER SEQUENCE "tickets_dbID_seq" RESTART WITH 9;
ALTER SEQUENCE "trashes_databaseId_seq" RESTART WITH 94;
ALTER SEQUENCE "undoneprocesses_connect_id_seq" RESTART WITH 6;
ALTER SEQUENCE "undoneprocesses_main_id_seq" RESTART WITH 6;
ALTER SEQUENCE "vehicles_dbID_seq" RESTART WITH 10;
-- ============================================================
-- DUMMY DATA FOR TESTING
-- ============================================================

--
-- Dummy Accounts (2 accounts: 1 Admin, 1 regular User)
--
INSERT INTO "accounts" ("accountId", "username", "password", "suspended", "serial", "email", "maxCharacters", "adminLevel", "adminNick", "helperLevel", "premiumPoints", "osvenyPiro", "osvenyPrioExperie", "2fa", "2fastate", "discordId", "discordAuth", "discordName", "adminJailType", "adminJailBy", "adminJailTime", "adminJailReason") VALUES
(1, 'admin_user', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 0, 'ADMIN001', 'admin@example.com', 3, 10, 'SuperAdmin', 0, 1000, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'test_user', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 0, 'USER001', 'user@example.com', 2, 0, 'User', 0, 100, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Dummy Characters (1 for each account)
--
INSERT INTO "characters" ("characterId", "accountId", "name", "skin", "permGroupSkin", "creationStage", "canSkipCreation", "x", "y", "z", "r", "interior", "dimension", "money", "bankMoney", "playedMinutes", "inDeath", "coins", "boughtClothes", "clothesPos", "clothesLimit", "health", "armor", "hunger", "thirst", "lastOnline", "actionBarItems", "skills", "weaponPos", "armors", "inDuty", "online", "vehiclesSlot", "interiorsSlot", "facePaint", "playerRecipes", "radioFreq", "jail", "jailTime", "jailReason", "jailCell") VALUES
(1, 1, 'John Admin', 0, 'N', 5, 0, 1682.7392578125, -2328.7177734375, 13.546875, 0, 0, 0, 100000, 50000, 120, 0, 500, '[[]]', '''[[]]''', 5, 100, 100, 100, 100, CURRENT_TIMESTAMP, '[[1,2,3,4,5]]', '[[]]', '[[]]', '[[]]', '""', 0, 5, 5, 0, '[[]]', '[[0, 0]]', 0, 0, NULL, 0),
(2, 2, 'Jane Player', 1, 'N', 5, 0, 1682.7392578125, -2328.7177734375, 13.546875, 0, 0, 0, 50000, 10000, 60, 0, 50, '[[]]', '''[[]]''', 2, 100, 0, 100, 100, CURRENT_TIMESTAMP, '[[1,2,3,4,5]]', '[[]]', '[[]]', '[[]]', '""', 0, 2, 2, 0, '[[]]', '[[0, 0]]', 0, 0, NULL, 0);

--
-- Dummy Vehicles (2 vehicles owned by characters)
--
INSERT INTO "vehicles" ("dbID", "characterId", "modelId", "health", "position", "parkPosition", "rotation", "color", "fuel", "oil", "locked", "plate") VALUES
(1, 1, 411, 1000, '[[1682.7, -2328.7, 13.5, 0, 0]]', '[[1682.7, -2328.7, 13.5, 0, 0]]', '[[0, 0, 0]]', '[[255, 0, 0, 255, 0, 0, 255, 255, 255, 255, 255, 255]]', 100, 1000, 1, 'ADM1N01'),
(2, 2, 562, 1000, '[[1682.7, -2320.7, 13.5, 0, 0]]', '[[1682.7, -2320.7, 13.5, 0, 0]]', '[[0, 0, 0]]', '[[0, 0, 255, 0, 0, 255, 255, 255, 255, 255, 255, 255]]', 80, 1000, 1, 'USR0001');

--
-- Dummy Interiors (2 properties owned by characters)
--
INSERT INTO "interiors" ("interiorId", "outside", "inside", "name", "type", "ownerType", "owner", "locked", "price", "gameInterior", "policeLock", "policeLockBy", "policeLockGroup") VALUES
(1, '[[1682.7, -2328.7, 13.5, 0]]', '[[2196.85, -1204.36, 1049.02, 0]]', 'Admin House', 'house', 'player', '1', 0, 150000, 6, 'N', '', ''),
(2, '[[1682.7, -2320.7, 13.5, 0]]', '[[2196.85, -1204.36, 1049.02, 0]]', 'User House', 'house', 'player', '2', 0, 100000, 6, 'N', '', '');

--
-- Dummy Items (basic inventory items for characters)
--
INSERT INTO "items" ("dbID", "slot", "itemId", "amount", "data1", "data2", "data3", "nameTag", "serial", "ownerType", "ownerId") VALUES
(1, 1, 1, 1, NULL, NULL, NULL, 'Phone', 1001, 'character', 1),
(2, 2, 2, 1, NULL, NULL, NULL, 'Wallet', 1002, 'character', 1),
(3, 3, 10, 5, NULL, NULL, NULL, 'Sandwich', 1003, 'character', 1),
(4, 4, 11, 3, NULL, NULL, NULL, 'Water Bottle', 1004, 'character', 1),
(5, 1, 1, 1, NULL, NULL, NULL, 'Phone', 2001, 'character', 2),
(6, 2, 2, 1, NULL, NULL, NULL, 'Wallet', 2002, 'character', 2),
(7, 3, 10, 2, NULL, NULL, NULL, 'Sandwich', 2003, 'character', 2),
(8, 4, 11, 2, NULL, NULL, NULL, 'Water Bottle', 2004, 'character', 2);

--
-- Dummy Licenses (driver licenses for characters)
--
INSERT INTO "licenses" ("dbID", "characterId", "type", "issueDate", "expiryDate", "status", "points") VALUES
(1, 1, 'driver', 1609459200, 1767225600, 1, 0),
(2, 2, 'driver', 1609459200, 1767225600, 1, 0);
