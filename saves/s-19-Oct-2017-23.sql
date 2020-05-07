-- ----------------------
-- dump de la base Numid au 19-Oct-2017
-- ----------------------


-- -----------------------------
-- creation de la table articles
-- -----------------------------
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `contact_name` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `operation_type` text NOT NULL,
  `uprice` decimal(15,2) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `q` int(11) DEFAULT NULL,
  `b` decimal(15,2) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table contacts
-- -----------------------------
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `contact` text NOT NULL,
  `com` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table defaults
-- -----------------------------
CREATE TABLE `defaults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table orders
-- -----------------------------
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_type` text NOT NULL,
  `contact_id` int(11) NOT NULL,
  `contact_name` text NOT NULL,
  `price` float(15,2) NOT NULL,
  `pricea` float(15,2) NOT NULL,
  `b` float(15,2) NOT NULL,
  `time` int(11) NOT NULL,
  `last_modified` int(11) NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table products
-- -----------------------------
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '1',
  `reference` text NOT NULL,
  `designation` text NOT NULL,
  `pricea` float(15,2) NOT NULL,
  `priceg` float(15,2) NOT NULL,
  `priced` float(15,2) NOT NULL,
  `q` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table tempdata
-- -----------------------------
CREATE TABLE `tempdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `q` int(11) NOT NULL,
  `d` float(18,2) NOT NULL,
  `productref` text NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1697 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table tempdata2
-- -----------------------------
CREATE TABLE `tempdata2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) NOT NULL,
  `name` text NOT NULL,
  `region` text NOT NULL,
  `contact` text NOT NULL,
  `orders` int(11) NOT NULL,
  `ordersvalue` decimal(10,0) NOT NULL,
  `q` int(11) NOT NULL,
  `d` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=latin1;

-- -----------------------------
-- creation de la table versements
-- -----------------------------
CREATE TABLE `versements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `contact_id` int(11) NOT NULL,
  `contact_name` text NOT NULL,
  `valeur` decimal(15,2) NOT NULL,
  `time` int(11) NOT NULL,
  `operation_type` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;



-- -----------------------------
-- insertions dans la table articles
-- -----------------------------

-- -----------------------------
-- insertions dans la table contacts
-- -----------------------------
INSERT INTO contacts VALUES('1', 'Amine', '0123456789', '');
INSERT INTO contacts VALUES('6', 'amine aid', 'cotnact', 'Azazga');
INSERT INTO contacts VALUES('7', 'Contact 4', '12345678', 'Azazga');
INSERT INTO contacts VALUES('8', 'Toufik', '011223344', 'Azazga');
INSERT INTO contacts VALUES('9', 'SAMIR', '66666', 'AZAZGA');
INSERT INTO contacts VALUES('10', 'F1', 'Nuln', 'Azazga');

-- -----------------------------
-- insertions dans la table defaults
-- -----------------------------
INSERT INTO defaults VALUES('1', 'location', 'Tizi-Ouzou');
INSERT INTO defaults VALUES('2', 'destinationxls', 'ext');

-- -----------------------------
-- insertions dans la table orders
-- -----------------------------

-- -----------------------------
-- insertions dans la table products
-- -----------------------------
INSERT INTO products VALUES('1', '1', '5960J2', 'Bougie d allumage 617 Peugeot', '187.50', '375.00', '375.00', '12.00');
INSERT INTO products VALUES('7', '1', '1', 'Liquide de refroidissement Tradex 2l G12 ', '580.00', '850.00', '850.00', '7.00');
INSERT INTO products VALUES('8', '1', '2', 'Liquide de refroidissement Noveom G12 2l', '580.00', '630.00', '850.00', '5.00');
INSERT INTO products VALUES('9', '1', '3', 'Liquide de refroidissement Noveom G12 5l', '1120.00', '1200.00', '1600.00', '3.00');
INSERT INTO products VALUES('10', '1', '4', 'Liquide de refroidissement Tradex G12 5l', '1100.00', '1200.00', '1600.00', '12.00');
INSERT INTO products VALUES('11', '1', '5', 'Liquide de refroidissement Tradex -5 5l', '480.00', '510.00', '650.00', '56.00');
INSERT INTO products VALUES('12', '1', '6', 'Naftal 5W40 5l', '2800.00', '3200.00', '3200.00', '7.00');
INSERT INTO products VALUES('13', '1', '7', 'BP 5W40 4l', '2650.00', '2700.00', '3200.00', '11.00');
INSERT INTO products VALUES('14', '1', '8', 'Castrol Pro 5W40 4l', '3050.00', '3150.00', '3700.00', '2.00');
INSERT INTO products VALUES('15', '1', '9', 'CASTROL MAGNATEC 5W40 5L', '3400.00', '3600.00', '4050.00', '2.00');
INSERT INTO products VALUES('16', '1', '10', 'CASTROL EDGE 5W40 5L', '3550.00', '3850.00', '4000.00', '1.00');
INSERT INTO products VALUES('17', '1', '11', 'LIQUIMOLY 5W30 5L', '3200.00', '3750.00', '4300.00', '3.00');
INSERT INTO products VALUES('18', '1', '12', 'TOTAL 5W40 5L', '2480.00', '0.00', '3200.00', '3.00');
INSERT INTO products VALUES('19', '1', '13', 'TOTAL 10W40 5L', '2250.00', '2550.00', '3000.00', '5.00');
INSERT INTO products VALUES('20', '1', '14', 'TOTAL 15W40 5L FR', '0.00', '2350.00', '3200.00', '3.00');
INSERT INTO products VALUES('21', '1', '15', 'TOTAL 15W40 4L FR', '0.00', '3600.00', '2700.00', '6.00');
INSERT INTO products VALUES('22', '1', '16', 'TOTAL 15W40 5L DB', '0.00', '0.00', '2500.00', '2.00');
INSERT INTO products VALUES('23', '1', '17', 'TOTAL 15W40 5L DZ', '0.00', '0.00', '2300.00', '2.00');
INSERT INTO products VALUES('24', '1', '18', 'TOTAL 20W50 5L DZ', '0.00', '0.00', '1600.00', '1.00');
INSERT INTO products VALUES('25', '1', '19', 'CASTROL GTX 10W40 5L', '0.00', '0.00', '3000.00', '9.00');
INSERT INTO products VALUES('26', '1', '20', 'CASTROL GTX 15W40 5L', '0.00', '0.00', '2800.00', '8.00');
INSERT INTO products VALUES('27', '1', '21', 'BP 10W40 5L', '0.00', '0.00', '2800.00', '3.00');
INSERT INTO products VALUES('28', '1', '22', 'BP 15W40 5L', '0.00', '0.00', '2700.00', '7.00');
INSERT INTO products VALUES('29', '1', '23', 'ELF 5W40 5L', '0.00', '0.00', '3200.00', '7.00');
INSERT INTO products VALUES('30', '1', '24', 'ELF 10W40 5L', '0.00', '0.00', '2650.00', '1.00');
INSERT INTO products VALUES('31', '1', '25', 'ELF 15W40 5L DZ', '0.00', '0.00', '2200.00', '6.00');
INSERT INTO products VALUES('32', '1', '26', 'LIQUIMOLY 10W40 5L', '0.00', '0.00', '3000.00', '14.00');
INSERT INTO products VALUES('33', '1', '27', 'LIQUIMOLY 15W40', '0.00', '0.00', '2900.00', '15.00');
INSERT INTO products VALUES('34', '1', '28', 'LIQUIMOLY 10W40 4L', '0.00', '0.00', '2700.00', '4.00');
INSERT INTO products VALUES('35', '1', '29', 'LIQUIDE DE REFROIDISSEMENT TOTAL -26 5L', '0.00', '0.00', '1500.00', '3.00');
INSERT INTO products VALUES('36', '1', '30', 'LIQUIDE DE REFROIDISSEMENT NAFTAL -10 2L', '0.00', '0.00', '350.00', '34.00');
INSERT INTO products VALUES('38', '1', '31', 'LAVE GLACE NAFTAL 5L', '0.00', '0.00', '600.00', '42.00');
INSERT INTO products VALUES('39', '1', '32', 'LAVE GLACE NAFTAL 2L', '0.00', '0.00', '250.00', '70.00');
INSERT INTO products VALUES('40', '1', '33', 'EAU DEMINERALISE PURE 5L', '0.00', '0.00', '150.00', '2.00');
INSERT INTO products VALUES('41', '1', '34', 'NAFTAL TD 15W40 5L', '0.00', '0.00', '2200.00', '11.00');
INSERT INTO products VALUES('42', '1', '35', 'BATTERIE HANKOOK 90AH', '0.00', '12200.00', '12200.00', '1.00');
INSERT INTO products VALUES('43', '1', '36', 'BATTERIE HANKOOK 74AH', '0.00', '9900.00', '9900.00', '2.00');
INSERT INTO products VALUES('44', '1', '37', 'BATTERIE HANKOOK 60AH', '0.00', '8800.00', '8800.00', '2.00');
INSERT INTO products VALUES('45', '1', '38', 'BATTERIE HANKOOK 62AH', '0.00', '9200.00', '9200.00', '4.00');
INSERT INTO products VALUES('46', '1', '39', 'BATTERIE HANKOOK 50AH', '0.00', '8600.00', '8600.00', '2.00');
INSERT INTO products VALUES('47', '1', '40', 'BATTERIE HANKOOK 45AH', '0.00', '7800.00', '7800.00', '2.00');
INSERT INTO products VALUES('48', '1', '41', 'BATTERIE HANKOOK 35AH', '0.00', '6800.00', '6800.00', '2.00');
INSERT INTO products VALUES('49', '1', '42', 'BATTERIE HANKOOK 55AH', '0.00', '8700.00', '8700.00', '1.00');
INSERT INTO products VALUES('50', '1', '43', 'BATTERIE HYUNDAY 90AH', '0.00', '12200.00', '12200.00', '2.00');
INSERT INTO products VALUES('51', '1', '44', 'BATTERIE HYUNDAY 50AH', '0.00', '8600.00', '8600.00', '1.00');
INSERT INTO products VALUES('52', '1', '45', 'BATTERIE HYUNDAY 44AH', '0.00', '7500.00', '7500.00', '1.00');
INSERT INTO products VALUES('53', '1', '46', 'BATTERIE HYUNDAY 45AH', '0.00', '7800.00', '7800.00', '2.00');
INSERT INTO products VALUES('54', '1', '47', 'BATTERIE HYUNDAY 38AH', '0.00', '6900.00', '6900.00', '1.00');
INSERT INTO products VALUES('55', '1', '48', 'BATTERIE VARTA G3 95AH', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('56', '1', '49', 'BATTERIE VARTA G7 95AH', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('57', '1', '50', 'BATTERIE VARTA E24 70AH', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('58', '1', '51', 'BATTERIE VARTA B33 45AH', '0.00', '8800.00', '8800.00', '2.00');
INSERT INTO products VALUES('59', '1', '52', 'BATTERIE FIAMM L3 74A', '0.00', '10100.00', '10100.00', '1.00');
INSERT INTO products VALUES('60', '1', '53', 'BATTERIE TORUS T55 55A', '0.00', '6600.00', '6600.00', '1.00');
INSERT INTO products VALUES('61', '1', '54', 'BATTERIE GLOBATE D24 60AH', '0.00', '6800.00', '6800.00', '2.00');
INSERT INTO products VALUES('62', '1', '55', 'BATTERIE GLOBATE �E11 120AH', '0.00', '14700.00', '14700.00', '2.00');
INSERT INTO products VALUES('63', '1', '56', 'BATTERIE GLOBATE E11 100AH', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('64', '1', '57', 'BATTERIE GLOBATE E11 95AH', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('65', '1', '58', 'BATTERIE GLOBATE C14 55AH', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('66', '1', '59', 'BATTERIE NOVA LX100 45AH', '0.00', '7900.00', '7900.00', '2.00');
INSERT INTO products VALUES('67', '1', '60', 'BATTERIE NOVA 55D 60AH', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('68', '1', '61', 'BATTERIE NOVA SMF 62AH', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('69', '1', '62', 'BATTERIE NOVA NX120 90AH', '0.00', '12400.00', '12400.00', '1.00');
INSERT INTO products VALUES('70', '1', '63', 'BATTERIE NOVA SMF67018 177AH', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('71', '1', '64', 'BATTERIE ARCO 150AH', '15200.00', '17500.00', '17500.00', '4.00');
INSERT INTO products VALUES('72', '1', '65', 'BATTERIE ARCO ASIATIQUE 95AH', '10500.00', '12500.00', '12500.00', '2.00');
INSERT INTO products VALUES('73', '1', '66', 'BATTERIE ARCO 100AH', '10200.00', '12500.00', '12500.00', '2.00');
INSERT INTO products VALUES('74', '1', '67', 'BATTERIE ARCO 75AH', '7200.00', '9000.00', '9000.00', '1.00');
INSERT INTO products VALUES('75', '1', '68', 'BATTERIE ARCO 60AH', '6200.00', '8200.00', '8200.00', '2.00');
INSERT INTO products VALUES('76', '1', '69', 'BATTERIE ARCO 40AH', '4950.00', '6200.00', '6200.00', '2.00');
INSERT INTO products VALUES('77', '1', '70', 'BATTERIE ARCO FORZA L260 60AH', '6800.00', '8600.00', '8600.00', '2.00');
INSERT INTO products VALUES('78', '1', '71', 'BATTERIE TREDEX TYGRA 45AH', '0.00', '7800.00', '7800.00', '1.00');
INSERT INTO products VALUES('79', '1', '72', 'BATTERIE ASSAD 75AH', '6400.00', '7850.00', '7850.00', '2.00');
INSERT INTO products VALUES('80', '1', '73', 'BATTERIE ASSAD 60AH', '5300.00', '6900.00', '6900.00', '2.00');
INSERT INTO products VALUES('81', '1', '74', 'BATTERIE ASSAD 65AH', '5600.00', '7800.00', '7800.00', '1.00');
INSERT INTO products VALUES('82', '1', '75', 'BATTERIE ASSAD 50AH', '0.00', '0.00', '0.00', '0.00');
INSERT INTO products VALUES('83', '1', '76', 'BATTERIE BERGAN ENERGY 100AH', '8800.00', '11200.00', '11200.00', '1.00');
INSERT INTO products VALUES('84', '1', '77', 'BATTERIE BERGAN ENERGY 75AH', '6700.00', '8300.00', '8300.00', '4.00');
INSERT INTO products VALUES('85', '1', '78', 'BATTERIE EVERSTART 60AH', '6900.00', '8900.00', '8900.00', '1.00');
INSERT INTO products VALUES('86', '1', '79', 'BATTERIE DYNAFORCE 100AH', '9300.00', '11400.00', '11400.00', '1.00');
INSERT INTO products VALUES('87', '1', '80', 'BATTERIE KAIYNS KMT7 7AH', '2600.00', '3600.00', '3600.00', '8.00');
INSERT INTO products VALUES('88', '1', '81', 'BATTERIE PLATIN 36AH', '4700.00', '6500.00', '6500.00', '1.00');
INSERT INTO products VALUES('89', '1', '82', 'BATTERIE PLATIN 55AH', '6000.00', '7800.00', '7800.00', '2.00');
INSERT INTO products VALUES('90', '1', '83', 'BATTERIE PLATIN 65AH', '6500.00', '8300.00', '8300.00', '1.00');
INSERT INTO products VALUES('91', '1', '84', 'BATTERIE PLATIN 75AH', '7500.00', '9900.00', '9900.00', '2.00');
INSERT INTO products VALUES('92', '1', '85', 'BATTERIE PLATIN 95AH', '9900.00', '12200.00', '12200.00', '1.00');
INSERT INTO products VALUES('93', '1', '86', 'BATTERIE BOSH 75AH', '10200.00', '12600.00', '12600.00', '4.00');
INSERT INTO products VALUES('94', '1', '87', 'BATTERIE BOSH 70AH', '9200.00', '12000.00', '12000.00', '4.00');
INSERT INTO products VALUES('95', '1', '88', 'BATTERIE BOSH 56AH', '7350.00', '9200.00', '9200.00', '3.00');
INSERT INTO products VALUES('96', '1', '89', 'BATTERIE BOSH 45AH', '6700.00', '8700.00', '8700.00', '3.00');
INSERT INTO products VALUES('97', '1', '90', 'GRAISSE NAFTAL TASSADIT A2 FUT', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('98', '1', '91', 'NAFTAL VPS 15W40 FUT', '0.00', '290.00', '290.00', '200.00');
INSERT INTO products VALUES('99', '1', '92', 'NAFTAL CHIFA PLUS 40D FUT', '0.00', '0.00', '0.00', '200.00');
INSERT INTO products VALUES('100', '1', '93', 'TOTAL 7400 15W40 FUT', '305.00', '350.00', '350.00', '200.00');
INSERT INTO products VALUES('101', '1', '94', 'PETROZER EP90 FUT', '0.00', '0.00', '0.00', '1200.00');
INSERT INTO products VALUES('102', '1', '95', 'PETROZER 10W FUT', '0.00', '0.00', '0.00', '200.00');
INSERT INTO products VALUES('103', '1', '96', 'NAFTAL CHILIA 50D FUT', '0.00', '0.00', '0.00', '200.00');
INSERT INTO products VALUES('104', '1', '97', 'PETROZE X1 40D 20L', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('105', '1', '98', 'GRAISSE TOTAL EP2 15KG', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('106', '1', '99', 'GRAISSE PETROZER EP2 18KG', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('107', '1', '100', 'GRAISSE NAFTAL TASSADIT A2 1KG', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('108', '1', '101', 'GRAISSE MIXONE NLGI2 1KG', '0.00', '0.00', '0.00', '23.00');
INSERT INTO products VALUES('109', '1', '102', 'GRAISSE LUXOIL MP3 1KG', '0.00', '0.00', '0.00', '23.00');
INSERT INTO products VALUES('110', '1', '103', 'GRAISSE SUPER 1KG', '0.00', '0.00', '0.00', '14.00');
INSERT INTO products VALUES('111', '1', '104', 'GRAISE SKF LGMT 2/1 1KG', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('112', '1', '105', 'SUPER ASIAN ATF 1L', '185.00', '300.00', '300.00', '5.00');
INSERT INTO products VALUES('113', '1', '106', 'PETROZER ATF DEXRON II-D 1L', '0.00', '0.00', '0.00', '29.00');
INSERT INTO products VALUES('114', '1', '107', 'NAFTAL TASSILI EP90 1L', '0.00', '0.00', '0.00', '15.00');
INSERT INTO products VALUES('115', '1', '108', 'TOTAL ATX 1L', '0.00', '0.00', '0.00', '17.00');
INSERT INTO products VALUES('116', '1', '109', 'TOTAL LDS 1L', '0.00', '0.00', '0.00', '18.00');
INSERT INTO products VALUES('117', '1', '110', 'TOTAL NEPTUNA 2T 1L', '0.00', '0.00', '0.00', '29.00');
INSERT INTO products VALUES('118', '1', '111', 'BP 5W40 1L', '0.00', '0.00', '0.00', '11.00');
INSERT INTO products VALUES('119', '1', '112', 'TEKNOPRIMA DOT 3 500ML', '0.00', '0.00', '0.00', '22.00');
INSERT INTO products VALUES('120', '1', '113', 'PETROZER 20W50 5L', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('121', '1', '114', 'LIQUIDE DE REFROIDISSEMENT ARECA 5L', '0.00', '0.00', '0.00', '8.00');
INSERT INTO products VALUES('122', '1', '115', 'MANNS ATF 500ML', '0.00', '0.00', '0.00', '48.00');
INSERT INTO products VALUES('123', '1', '116', 'SPEEDFIRE NETOYANT JANTES 5L', '0.00', '0.00', '0.00', '17.00');
INSERT INTO products VALUES('124', '1', '117', 'SPEEDFIRE NETOYANT JANTES 500ML', '0.00', '0.00', '0.00', '13.00');
INSERT INTO products VALUES('125', '1', '118', 'SPEEDFIRE NETOYANT JANTES 460ML', '0.00', '0.00', '0.00', '8.00');
INSERT INTO products VALUES('126', '1', '119', 'SPEEDFIRE NETOYANT MOTEUR 5L', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('127', '1', '120', 'SPEEDFIRE NETOYANT MOTEUR 500ML', '0.00', '0.00', '0.00', '23.00');
INSERT INTO products VALUES('128', '1', '121', 'SPEEDFIRE NETOYANT MOTEUR SANS SOLVANT 5L', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('129', '1', '122', 'SPEEDFIRE NETOYANT TABLEAU DE BORD POLISH 5L', '475.00', '600.00', '750.00', '1.00');
INSERT INTO products VALUES('130', '1', '123', 'SPEEDFIRE GEL ROSE 5L', '0.00', '0.00', '0.00', '8.00');
INSERT INTO products VALUES('131', '1', '124', 'SPEEDFIRE GEL BLANC 5L', '0.00', '0.00', '0.00', '13.00');
INSERT INTO products VALUES('132', '1', '125', 'SPEEDFIRE SILICONE 5L', '0.00', '0.00', '0.00', '45.00');
INSERT INTO products VALUES('133', '1', '126', 'LIQUIDE DE REFROIDISSEMENT ALPINE G12 5L', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('134', '1', '127', 'CASTROL MAGNATEC 5W40D 2L', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('135', '1', '128', 'CASTROL EDGE 5W40 TD 1L', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('136', '1', '129', 'ELF 75W80 1L', '0.00', '0.00', '0.00', '6.00');
INSERT INTO products VALUES('137', '1', '130', 'TOTAL 75W80 1L', '0.00', '0.00', '0.00', '36.00');
INSERT INTO products VALUES('138', '1', '131', 'ARECA 75W80 1L', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('139', '1', '132', 'PACK LAVEGLACE PROFWELL 5L', '0.00', '0.00', '0.00', '78.00');
INSERT INTO products VALUES('140', '1', '133', 'LAVEGLACE PROFWELL 5L', '0.00', '0.00', '0.00', '52.00');
INSERT INTO products VALUES('141', '1', '134', 'NETOYANT JANTES MOTEUR PROFWELL POWER 10L', '0.00', '0.00', '0.00', '18.00');
INSERT INTO products VALUES('142', '1', '135', 'NETOYANT PLASTIQUE PROFWELL 10L', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('143', '1', '136', 'NETOYANT TISSUE PROFWELL 10L', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('144', '1', '137', 'MOUSSE PROFWELL 10L', '0.00', '0.00', '0.00', '42.00');
INSERT INTO products VALUES('145', '1', '138', 'NETOYANT PNEU PROFWELL 10L', '0.00', '0.00', '0.00', '15.00');
INSERT INTO products VALUES('146', '1', '139', 'PACK PROFWELL 3 PIECES²', '0.00', '0.00', '0.00', '43.00');
INSERT INTO products VALUES('147', '1', '140', 'PACK PROFWELL 6 PIECES', '0.00', '0.00', '0.00', '69.00');
INSERT INTO products VALUES('148', '1', '141', 'PACK SPEEDFIRE EXTERIEUR', '0.00', '0.00', '0.00', '11.00');
INSERT INTO products VALUES('149', '1', '142', 'PACK SPEEDFIRE INTERIEUR', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('150', '1', '143', 'SPEEDFIRE SHAMPOOING 10L', '0.00', '0.00', '0.00', '41.00');
INSERT INTO products VALUES('151', '1', '144', 'LAVE GLACE SPEEDFIRE CLASSIC 5L', '0.00', '0.00', '0.00', '40.00');
INSERT INTO products VALUES('152', '1', '145', 'AMBIFRESH 500ML', '0.00', '0.00', '0.00', '554.00');
INSERT INTO products VALUES('153', '1', '146', 'AMBIFRESH 3L', '0.00', '0.00', '0.00', '98.00');
INSERT INTO products VALUES('154', '1', '147', 'SPEEDFIRE GEL BLANC 500L', '0.00', '0.00', '0.00', '26.00');
INSERT INTO products VALUES('155', '1', '148', 'SPEEDFIRE GEL ROSE 500ML', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('156', '1', '149', 'SPEEDFIRE SILICONE 500ML', '0.00', '0.00', '0.00', '6.00');
INSERT INTO products VALUES('157', '1', '150', 'NETOYANT SPEEDFIRE PNEU 500ML', '0.00', '0.00', '0.00', '15.00');
INSERT INTO products VALUES('158', '1', '151', 'LAVE VITRE SPEEDFIRE 500ML', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('159', '1', '152', 'SPEEDFIRE LIFTING 500ML', '0.00', '0.00', '0.00', '24.00');
INSERT INTO products VALUES('160', '1', '153', 'PROFWELL PNEU 500ML', '0.00', '0.00', '0.00', '90.00');
INSERT INTO products VALUES('161', '1', '154', 'PROFWELL GOUDRON 500ML', '0.00', '0.00', '0.00', '142.00');
INSERT INTO products VALUES('162', '1', '155', 'PROFWELL JANTES 500', '0.00', '0.00', '0.00', '212.00');
INSERT INTO products VALUES('163', '1', '156', 'PROFWELL MOTEUR 500ML', '0.00', '0.00', '0.00', '45.00');
INSERT INTO products VALUES('164', '1', '157', 'PROFWELL LIFTING 500ML', '0.00', '0.00', '0.00', '24.00');
INSERT INTO products VALUES('165', '1', '158', 'PROFWELL CUIR 500ML', '0.00', '0.00', '0.00', '18.00');
INSERT INTO products VALUES('166', '1', '159', 'PROFWELL PLASTIQUE 500ML', '0.00', '0.00', '0.00', '26.00');
INSERT INTO products VALUES('167', '1', '161', 'PROFWELL VITRES 500ML', '0.00', '0.00', '0.00', '16.00');
INSERT INTO products VALUES('168', '1', '160', 'LIQUIDE DE REFOIRISSEMEN SPEEDFIRE CLASSIQUE 5L', '0.00', '0.00', '0.00', '106.00');
INSERT INTO products VALUES('169', '1', '162', 'LAVE GLACE SPEEDFIRE SIMPLE 5L', '0.00', '0.00', '0.00', '76.00');
INSERT INTO products VALUES('170', '1', '163', 'PACK SPEEDFIRE TROPICAL', '0.00', '0.00', '0.00', '106.00');
INSERT INTO products VALUES('171', '1', '164', 'EAU DISTILLEE SPIDERONE 5L', '85.00', '100.00', '150.00', '30.00');
INSERT INTO products VALUES('172', '1', '165', 'EAU DISTILLEE EVASION 750ML', '16.00', '20.00', '40.00', '130.00');
INSERT INTO products VALUES('173', '1', '166', 'EAU DISTILLEE PURE 700ML', '14.50', '17.00', '30.00', '12.00');
INSERT INTO products VALUES('174', '1', '167', 'NETOYANT TABLEAU DE BORD MANNS 10L', '700.00', '1000.00', '1200.00', '20.00');
INSERT INTO products VALUES('175', '1', '168', 'NETOYANT PLASTIQUE EXCELLENCE 5L', '350.00', '500.00', '600.00', '40.00');
INSERT INTO products VALUES('176', '1', '169', 'NETOYANT PNEU SPIDERONE 5L', '350.00', '500.00', '600.00', '10.00');
INSERT INTO products VALUES('177', '1', '170', 'NETOYANT MOTEUR SPIDERONE 5L', '310.00', '500.00', '600.00', '10.00');
INSERT INTO products VALUES('178', '1', '171', 'NETOYANT JANTES SPIDERONE 5L', '350.00', '500.00', '600.00', '10.00');
INSERT INTO products VALUES('179', '1', '172', 'SPIDERONE SHAMPOOING 10L', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('180', '1', '173', 'SPIDERONE SHAMPOOING LUXE 10L', '500.00', '600.00', '700.00', '10.00');
INSERT INTO products VALUES('181', '1', '174', 'LIQUIDE DE REFROIDISSEMENT IADA 5L', '450.00', '470.00', '650.00', '185.00');
INSERT INTO products VALUES('182', '1', '175', 'LIQUIDE DE REFROIDISSEMENT EXTRA SIMPLE 5L', '100.00', '120.00', '200.00', '51.00');
INSERT INTO products VALUES('183', '1', '176', 'LIQUIMOLY 15W40 20L', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('184', '1', '178', 'LIQUIDE DE REFROIDISSEMENT SPEEDFIRE SIMPLE 750ML', '0.00', '0.00', '0.00', '684.00');
INSERT INTO products VALUES('185', '1', '177', 'TOTAL HBF4 500ML', '0.00', '0.00', '0.00', '43.00');
INSERT INTO products VALUES('186', '1', '179', 'JURID DOT3 55 500ML', '0.00', '0.00', '0.00', '82.00');
INSERT INTO products VALUES('187', '1', '180', 'JURID DOT4 55 PLUS 500ML', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('188', '1', '181', 'WYNSS DIESEL PLUS 325ML', '0.00', '0.00', '0.00', '43.00');
INSERT INTO products VALUES('189', '1', '182', 'NETOYANT INJECTEURS WYNSS 325ML', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('190', '1', '183', 'WYNSS SUPER CHARGE 325ML', '0.00', '0.00', '0.00', '14.00');
INSERT INTO products VALUES('191', '1', '184', 'NETOYANT RADIATEUR WYNSS 325ML', '0.00', '0.00', '0.00', '11.00');
INSERT INTO products VALUES('192', '1', '185', 'LAVE GLACE SPEEDFIRE 2L', '0.00', '0.00', '0.00', '88.00');
INSERT INTO products VALUES('193', '1', '186', 'LIQUIDE DE REFROIDISSEMENT SPEEDFIRE 2L', '0.00', '0.00', '0.00', '138.00');
INSERT INTO products VALUES('194', '1', '187', 'NETOYANT INJECTEURS BARDAHL DIESEL 250ML', '0.00', '0.00', '0.00', '11.00');
INSERT INTO products VALUES('195', '1', '188', 'NETOYANT INJECTEURS BARDAHL ESSENCE 250ML', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('196', '1', '189', 'DISPERSANT D’EAU BARDAHL 20L', '0.00', '0.00', '0.00', '11.00');
INSERT INTO products VALUES('197', '1', '190', 'LIQUIDE DE REFROIDISSEMENT TOTAL -26 20L', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('198', '1', '191', 'GERMAN ADLER 10W40 1L', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('199', '1', '192', 'GERMAN ADLER 15W40 1L', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('200', '1', '193', 'GERMAN ADLER 75W80 1L', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('201', '1', '194', 'GERMAN ADLER DSGF 1L', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('202', '1', '195', 'GERMAN ADLER ATF-0R 1L', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('203', '1', '196', 'LAVE GLACE BARDAHL ECONOMIQUE 5L', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('204', '1', '197', 'NETOYANT TALEAU DE BORD MANNS 500ML', '0.00', '0.00', '0.00', '48.00');
INSERT INTO products VALUES('205', '1', '198', 'NETOYANT PNEU MANNS 500ML', '0.00', '0.00', '0.00', '48.00');
INSERT INTO products VALUES('206', '1', '199', 'MANNS LIFTING 500ML', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('207', '1', '200', 'LAMPE PHARE KLAXCAR 24V BLANC', '45.00', '60.00', '100.00', '20.00');
INSERT INTO products VALUES('208', '1', '86219Z', 'LAMPE PHAR KLAXCAR H4 24V', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('209', '1', '86225Z', 'LAMPE PHAR KLAXCAR H4 24V II', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('210', '1', '86217Z', 'LAMPE PHAR KLAXCAR H4 12V P45T', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('211', '1', '86200Z', 'LAMPE PHAR KLAXCAR H4 12V P43T', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('212', '1', '12342PRC1', 'LAMPE FAR PHILIPS H412V P43T', '0.00', '0.00', '0.00', '8.00');
INSERT INTO products VALUES('213', '1', '201', 'LAMPE PHARE TUNGSRAM H4 12V P43T', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('214', '1', '202', 'LOT LAMPE PHARE KLAXCAR H4 12V P43T', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('215', '1', '203', 'COFFRET DE SECOURE 10PCS H4', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('216', '1', '204', 'COFFRET DE SECOURE 10PCS H1', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('217', '1', '205', 'LAMPE PHARE GE H7 12V 23P', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('218', '1', '206', 'ANTICHOC RY-305', '0.00', '0.00', '0.00', '8.00');
INSERT INTO products VALUES('219', '1', '222EVA', 'ANTICHOC 4PCS', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('220', '1', '208', 'ALTECO QUICK EPOXY', '0.00', '0.00', '0.00', '8.00');
INSERT INTO products VALUES('221', '1', '209', 'LION EPOXY', '0.00', '0.00', '0.00', '11.00');
INSERT INTO products VALUES('222', '1', '210', 'VICTOR REINZ REINZOSIL', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('223', '1', '211', 'PARFUM K2 V120', '0.00', '0.00', '0.00', '7.00');
INSERT INTO products VALUES('224', '1', '212', 'PARFUM LD EMOTICONS', '0.00', '0.00', '0.00', '49.00');
INSERT INTO products VALUES('225', '1', '213', 'PARFUM LD MAN', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('226', '1', '215', 'CACHE VOLANT XL', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('227', '1', '216', 'CACHE VOLANT TYPER', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('228', '1', '217', 'CACHE VOLANT L', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('229', '1', '218', 'CACHE VOLANT LO80M', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('230', '1', '219', 'CACHE VOLANT 301', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('231', '1', '220', 'CACHE VOLANT CUIRE ', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('232', '1', '221', 'BOUGIE D’ALLUMAGE EYQUEM 50', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('233', '1', '222', 'BOUGIE D’ALLUMAGE MGK BP6EFS5488', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('234', '1', '223', 'BOUGIE D’ALLUMAGE MGK BP6HS5475', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('235', '1', '224', 'BOUGIE D’ALLUMAGE NGK BP6ES92548', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('236', '1', '225', 'BOUGIE D’ALLUMAGE BRISK 24', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('237', '1', '226', 'BOUGIE D’ALLUMAGE RENAULT 2240187 60R', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('238', '1', '227', 'BOUGIE D’ALLUMAGE RENAULT 2T', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('239', '1', '228', 'BOUGIE D’ALLUMAGE EYQUELM 750LS', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('240', '1', '231', 'BOUGIE D’ALLUMAGE EYQUEM 600S', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('241', '1', '233', 'BOUGIE D’ALLUMAGE NGK BK6E5498', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('242', '1', '235', 'BOUGIE D’ALLUMAGE NGK 4194', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('243', '1', '236', 'COSSE DE BATTERIE BC022', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('244', '1', '237', 'COSSE DE BATTERIE BRONZE', '0.00', '0.00', '0.00', '24.00');
INSERT INTO products VALUES('245', '1', '238', 'COSSE DE BATTERIE AUTOMEK', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('246', '1', '239', 'ESSUIE GLACE MODELS', '680.00', '1300.00', '1300.00', '20.00');
INSERT INTO products VALUES('247', '1', '240', 'ESSUI GLACE LONGUEUR', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('248', '1', '241', 'ESSUIE GLACE BOSCH 550C', '0.00', '0.00', '0.00', '41.00');
INSERT INTO products VALUES('249', '1', '242', 'ESSUIE GLACE BOSCH 450C', '0.00', '0.00', '0.00', '38.00');
INSERT INTO products VALUES('250', '1', '243', 'ESSUIE GLACE CLAXCAR 650', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('251', '1', '244', 'ESSUIE GLACE CLAXCAR 600', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('252', '1', '245', 'ESSUIE GLACE CLAXCAR 550', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('253', '1', '246', 'ESSUIE GLACE CLAXCAR 450', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('254', '1', '247', 'ESSUIE GLACE CLAXCAR 400', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('255', '1', '248', 'ESSUIE GLACE TOPCAR 700', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('256', '1', '249', 'ESSUIE GLACE TOPCAR 650', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('257', '1', '250', 'ESSUIE GLACE TOPCAR 600', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('258', '1', '251', 'ESSUIE GLACE TOPCAR 550', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('259', '1', '252', 'ESSUIE GLACE TOPCAR 500', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('260', '1', '254', 'ESSUIE GLACE TOPCAR 450', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('261', '1', '255', 'ESSUIE GLACE TOPCAR 400', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('262', '1', '256', 'CHIFON MICROFIBRE JIN', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('263', '1', '257', 'CHIFON BAI JIN', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('264', '1', '258', 'CHIFFON 06-40', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('265', '1', '259', 'CHFFON 5PCS', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('266', '1', '260', 'JAUGE HUILE 30661', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('267', '1', '261', 'JAUGE HUILE 30660', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('268', '1', '262', 'CLAXCAR H1 24V', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('269', '1', '263', 'CLAXCAR H3 24V', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('270', '1', '264', 'LAMPE NAVETTE 24V', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('271', '1', '265', 'LAMPE 1 PLOT 24V', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('272', '1', '266', 'LAMPE 2 PLOT 24V', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('273', '1', '267', 'LAMPE 24V 5W', '0.00', '0.00', '0.00', '30.00');
INSERT INTO products VALUES('274', '1', '268', 'LAMPE Y21 ORANGE 24V', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('275', '1', '269', 'LAMPE VEILLEUSE CLAXCAR T10', '0.00', '0.00', '0.00', '100.00');
INSERT INTO products VALUES('276', '1', '270', 'LAMPE VEILLEUSE 4W BA75', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('277', '1', '271', 'LAMPE 24V T5', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('278', '1', '272', 'LAMPE CLAXCAR H3 12V', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('279', '1', '273', 'LAMPE CLAXCAR T10 12V', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('280', '1', '274', 'LAMPE CLAXCAR WT5 12V', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('281', '1', '275', 'LAMPE CLAXCAR T20 2 PLOTS 12V', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('282', '1', '276', 'LAMPE CLAXCAR T20 1 PLOT 12V', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('283', '1', '277', 'LAMPE CLAXCAR T15 12V', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('284', '1', '278', 'LAMPE CLAXCAR 36MM 12V', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('285', '1', '279', 'LAMPE CLAXCAR 4W 12V', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('286', '1', '280', 'LAMPE CLAXCAR 2 PLOTS 12V', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('287', '1', '281', 'LAMPE CLAXCAR 1 PLOTS 12V', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('288', '1', '282', 'LAMPE CLAXCAR 404Z 12V', '0.00', '0.00', '0.00', '30.00');
INSERT INTO products VALUES('289', '1', '283', 'PORTE LAMPES T5S1', '0.00', '0.00', '0.00', '8.00');
INSERT INTO products VALUES('290', '1', '284', 'PORTE LAMPES VEILLEUSE', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('291', '1', '285', 'PORTE LAMPES 1 PLOT', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('292', '1', '286', 'PORTE LAMPES 2 PLOTS', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('293', '1', '288', 'LAMPE PHILIPS P21/5W', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('294', '1', '289', 'LAMPE PHARE TUNGSRAM H7 24V PX26D', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('295', '1', '290', 'LAMPE CLAXCAR H7 12V PX26D', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('296', '1', '291', 'LAMPE TUNGSRAM 2 PLOTS 1078 24V', '0.00', '0.00', '0.00', '30.00');
INSERT INTO products VALUES('297', '1', '292', 'LAMPE PHILIPS H7 PX26D', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('298', '1', '293', 'LAMPE PHILIPS 1 PLOT 12498CP', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('299', '1', '294', 'LAMPE TUNGSRAM H7 12V PX26D', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('300', '1', '295', 'LAMPES TUNGSRAM H1 12V P14', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('301', '1', '296', 'LAMPE TUNGSRAM W5W 12V', '0.00', '0.00', '0.00', '30.00');
INSERT INTO products VALUES('302', '1', '297', 'LAMPE TUNGSRAM T4W 12V', '0.00', '0.00', '0.00', '30.00');
INSERT INTO products VALUES('303', '1', '298', 'LAMPE TUNGSRAM 2 PLOTS 12V 1122', '0.00', '0.00', '0.00', '30.00');
INSERT INTO products VALUES('304', '1', '299', 'LAMPE TUNGSRAM 1 PLOT 12V 1057', '0.00', '0.00', '0.00', '30.00');
INSERT INTO products VALUES('305', '1', '300', 'LAMPE TUNGSRAM 2 PLOTS 12V D77', '0.00', '0.00', '0.00', '30.00');
INSERT INTO products VALUES('306', '1', '301', 'LAMPE TUNGSRAM VEILLEUSE 12V 2619', '0.00', '0.00', '0.00', '30.00');
INSERT INTO products VALUES('307', '1', '302', 'LAMPE XENON GE D2S', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('308', '1', '303', 'INTERUPTEUR DE TEMPERATURE 37350', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('309', '1', '304', 'INTERUPTEUR DE TEMPERATURE 37340', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('310', '1', '305', 'FUSIBLE 30A 304900', '0.00', '0.00', '0.00', '100.00');
INSERT INTO products VALUES('311', '1', 'GBC-301', 'FUSIBLE CAFT', '0.00', '0.00', '0.00', '200.00');
INSERT INTO products VALUES('312', '1', '306', 'FUSIBLE 25A', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('313', '1', '307', 'FUSIBLE 10A', '0.00', '0.00', '0.00', '50.00');
INSERT INTO products VALUES('314', '1', '308', 'FUSIBLE', '0.00', '0.00', '0.00', '100.00');
INSERT INTO products VALUES('315', '1', '309', 'FUSIBLE BSX003', '0.00', '0.00', '0.00', '100.00');
INSERT INTO products VALUES('316', '1', '310', 'CHATTERTON ABRO 19X10', '0.00', '0.00', '0.00', '17.00');
INSERT INTO products VALUES('317', '1', '311', 'PATTE ABRO', '0.00', '0.00', '0.00', '14.00');
INSERT INTO products VALUES('318', '1', '312', 'TUYAU RETOUR GASOIL', '0.00', '0.00', '0.00', '20.00');
INSERT INTO products VALUES('319', '1', '313', 'TUYAU LAVE GLACE', '16.00', '50.00', '50.00', '100.00');
INSERT INTO products VALUES('320', '1', '314', 'POUDRE ABRO', '0.00', '0.00', '0.00', '24.00');
INSERT INTO products VALUES('321', '1', '315', 'PARFUM POZZY ', '255.00', '300.00', '300.00', '8.00');
INSERT INTO products VALUES('322', '1', '316', 'NETOYANT PHARE K2 L3050', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('323', '1', '317', 'FILTRE A ESSENCE STANDARD', '0.00', '0.00', '0.00', '6.00');
INSERT INTO products VALUES('324', '1', '318', 'FILTRE A ESSENCE FF001Z', '75.00', '220.00', '220.00', '5.00');
INSERT INTO products VALUES('325', '1', '319', 'COLIER DE SERRAGE PLASTIQUE 15CM', '0.00', '0.00', '0.00', '200.00');
INSERT INTO products VALUES('326', '1', '320', 'COLIER DE SERRAGE PLASTIQUE 37CM', '0.00', '0.00', '0.00', '300.00');
INSERT INTO products VALUES('327', '1', '321', 'COLIER DE SERRAGE 4060', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('328', '1', '322', 'COLIER DE SERRAGE 3250', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('329', '1', '323', 'COLIER DE SERRAGE 3045', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('330', '1', '324', 'COLIER DE SERRAGE 2032', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('331', '1', '336', 'COLIER DE SERRAGE 1627', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('332', '1', '337', 'COLIER DE SERRAGE 1222', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('333', '1', '338', 'COLIER DE SERRAGE 1016', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('334', '1', '339', 'COUVRE CLEF', '100.00', '150.00', '150.00', '9.00');
INSERT INTO products VALUES('335', '1', '340', 'FEVICOL EPOXY', '0.00', '0.00', '0.00', '12.00');
INSERT INTO products VALUES('336', '1', '341', 'MSEAL EPOXY', '80.00', '150.00', '150.00', '24.00');
INSERT INTO products VALUES('337', '1', '342', 'FLACON PARFUM AROMA', '0.00', '0.00', '0.00', '16.00');
INSERT INTO products VALUES('338', '1', '343', 'CLEF FLTRE', '2000.00', '2700.00', '2700.00', '1.00');
INSERT INTO products VALUES('339', '1', '344', 'NETOYANT TABLEAU DE BORD TOPNET', '160.00', '175.00', '250.00', '61.00');
INSERT INTO products VALUES('340', '1', '3051', 'FILTRE A AIR SAFI', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('341', '1', 'FA1510', 'FILTRE A AIR ALSAFA', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('342', '1', 'AS4099', 'FILTRE A AIR SAFI 99', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('343', '1', 'K2841PU', 'FILTRE A AIR SHT', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('344', '1', 'AS3055', 'FILTRE A AIR SAFI 55', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('345', '1', 'DAG055', 'FILTRE A AIR JMC', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('346', '1', 'DR5167R-69NR', 'FILTRE A AIR DELSA 69', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('347', '1', 'AB137/6', 'FILTRE A AIR FILTRON', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('348', '1', 'DR5046B/5045B', 'FILTRE A AIR DELSA 5045', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('349', '1', '17801-0C010', 'FILTRE A AIR HAOGD 010', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('350', '1', 'FA1514C', 'FILTRE A AIR ALSAFA 1514C', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('351', '1', 'PFI-16546-2S600', 'FILTRE A AIR PLANETFILTRE 2S600', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('352', '1', 'FA1503', 'FILTRE A AIR ALSAFA 1503', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('353', '1', 'S3163', 'FILTRE A AIR BOSCH 3163', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('354', '1', 'S9404', 'FILTRE A AIR BOSCH 9404', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('355', '1', 'S3714', 'FILTRE A AIR BOSCH 3714', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('356', '1', '350', 'FILTRE A AIR BOSCH S3059', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('357', '1', '351', 'FILTRE A AIR BOSCH S0114', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('358', '1', '352', 'FILTRE A AIR WIX WA9758', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('359', '1', 'FA2645', 'FILTRE A AIR ALSAFA 2645', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('360', '1', '356', 'FILTRE A AIR BOSCH M2012', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('361', '1', '357', 'FILTRE A AIR BOSCH M2039', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('362', '1', '358', 'FILTRE A AIR BOSCH M2079', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('363', '1', '359', 'FILTRE A AIR BOSCH M2097', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('364', '1', '362', 'FILTRE A AIR FORCE PLUS GFAH008', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('365', '1', 'FA1511', 'FILTRE A AIR ALSAFA ', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('366', '1', '363', 'FILTRE A AIR FORCE PLUS GFAH-017', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('367', '1', '364', 'FILTRE A AIR ONNURI 28113-4F000', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('368', '1', '365', 'FILTRE A AIR BOSH S0391', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('369', '1', '366', 'FILTRE A AIR BOSCH S0035', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('370', '1', '367', 'FILTRE A AIR BOSCH S0287', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('371', '1', '368', 'FILTRE A AIR BOSCH S3070', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('372', '1', '369', 'FILTRE A AIR BOSCH S0150', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('373', '1', '370', 'FILTRE A AIR FILTRON AB139-2', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('374', '1', 'TP1110.10.0107', 'FILTRE A AIR DRIVE PLUS 24116-1757', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('375', '1', '371', 'FILTRE A AIR VESTAL WA6375', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('376', '1', 'PFI16546EB70A', 'FILTRE A AIR PLANETFILTRE', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('377', '1', '372', 'FILTRE A AIR FILTRON AP1343', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('378', '1', '373', 'FILTRE A AIR WUNDER DA9033', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('379', '1', '374', 'FILTRE A AIR DAG DA3006', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('380', '1', '375', 'FILTRE A AIR FILTRON AP196', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('381', '1', '376', 'FILTRE A AIR PEUGEOT 1444TV', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('382', '1', '377', 'FILTRE A AIRFILTRON AR1311', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('383', '1', '378', 'FILTRE A AIR VESSAL WA 9496', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('384', '1', '379', 'FILTRE A AIR VESTAL WA6333', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('385', '1', '380', 'FILTRE A AIR ALCO MD5294', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('386', '1', '381', 'FILTRE A AIR BOSCH S3575', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('387', '1', '382', 'FILTRE A AIR BOSCH S0286', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('388', '1', '383', 'FILTRE A AIR WUNDER WH810', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('389', '1', '384', 'FILTRE A AIR WUNDER WH503', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('390', '1', '2811308000', 'FILTRE A AIR UNICAR 2811', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('391', '1', 'C0004025', 'FILTRE A AIR ONNURI  281134H000', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('392', '1', '386', 'FILTRE A AIR WUNDER WH500', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('393', '1', 'FA2557', 'FILTRE A AIR ALSAFA 2557', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('394', '1', 'FA1502', 'FILTRE A AIR ALSAFA 1502', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('395', '1', '8200166615', 'FILTRE A AIR HAUGD 166615', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('396', '1', '385', 'FILTRE A AIR FILTRON AP1852', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('397', '1', '387', 'FILTRE A AIR DRIVE PLUS 43716', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('398', '1', '388', 'FILTRE A AIR DFM K17', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('399', '1', 'ELP3148', 'FILTRE A AIR HAUGD 3148', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('400', '1', '17801-64010', 'FILTRE A AIR FILTRAM 010', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('401', '1', '390', 'FILTRE A AIR DRIVE PLUS 137162112', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('402', '1', '391', 'FILTRE A AIR DEDAX LF321', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('403', '1', '392', 'FILTRE A AIR DAG DA3009', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('404', '1', '393', 'FILTRE A AIR VESTAL VS0049.R52', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('405', '1', '394', 'TOP FREIN DOT3 500ML', '0.00', '0.00', '0.00', '24.00');
INSERT INTO products VALUES('406', '1', '96553450', 'FILTRE A AIR JSF 3450', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('407', '1', '396', 'FILTRE A AIR ONNURI 42386928', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('408', '1', 'DA3007', 'FILTRE A AIR DAG 3007', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('409', '1', 'WL8113Z40', 'FILTRE A AIR MAZDA Z40', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('410', '1', '398', 'FILTRE A AIR VESTAL L200', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('411', '1', '399', 'FILTRE A AIR VESTAL 129620', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('412', '1', '400', 'FILTRE A AIR VESTAL 058133843', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('413', '1', 'JMC1030', 'FILTRE A AIR DFT JMC 1030', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('414', '1', '403', 'FILTRE A AIR NOMIS NAIT197', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('415', '1', '16546-AW002A', 'FILTRE A AIR HAOGD 002A', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('416', '1', 'F12501', 'FILTRE A AIR ALSAFA 2501', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('417', '1', 'U201-13-Z40', 'FILTRE A AIR VESTAL Z40', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('418', '1', 'IPA669619166', 'FILTRE A AIR INTERPARTS 669', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('419', '1', 'FA1513', 'FILTRE A AIR ALSAFA 1513', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('420', '1', 'FA1543', 'FILTRE A AIR ALSAFA 1543', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('421', '1', 'OK74R23603', 'FILTRE A AIR MICORA 3603', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('422', '1', '2811307010', 'FILTRE A AIR ALMASSAFI 7010', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('423', '1', 'AS5010', 'FILTRE A AIR SAFI 5010', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('424', '1', 'MA826', 'FILTRE A AIR AMC 826', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('425', '1', '407', 'FILTRE A AIR REALSTON MEO17242', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('426', '1', '281305H001', 'FILTRE A AIR JSF H001', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('427', '1', 'OK6B023603', 'FILTRE A AIR UNICAR 3603', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('428', '1', 'FA2727', 'FILTRE A AIR ALSAFA 2727', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('429', '1', '408', 'FILTRE A AIR BOSCH S3158', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('430', '1', '409', 'FILTRE A AIR BOSCH S3160', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('431', '1', 'GBS600', 'FILTRE A GASOIL ALSAFA 600', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('432', '1', 'GBS641', 'FILTRE A GASOIL ALSAFA 641', '0.00', '0.00', '0.00', '6.00');
INSERT INTO products VALUES('433', '1', '412', 'FILTRE A GASOIL FLEETGARD FS1212', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('434', '1', '413', 'FILTRE A GASOIL DELSA DE543FES', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('435', '1', 'GS203M16', 'FILTRE A GASOIL SAFI 203', '0.00', '0.00', '0.00', '23.00');
INSERT INTO products VALUES('436', '1', '415', 'FILTRE A GASOIL NOMIS NFDT100', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('437', '1', '416', 'FILTRE A GASOIL DELSA DS1338F', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('438', '1', '417', 'FILTRE A GASOIL VESTAL VS5231', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('439', '1', '418', 'FILTRE A GASOIL FILTRON PM8151', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('440', '1', '1640501T70', 'FILTRE A GASOIL  HAOGD 01T70', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('441', '1', '420', 'FILTRE A GASOIL FILTRON PE9732', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('442', '1', '421', 'FILTRE A GASOIL FILRON PE973', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('443', '1', 'MF306', 'FILTRE A GASOIL 306', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('444', '1', 'ME006066', 'FILTRE A GASOIL ELEMFIL 6066', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('445', '1', '423', 'FILTRE A GASOIL DELSA DS1355F', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('446', '1', '424', 'FILTRE A GASOIL FILTRON PE9733', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('447', '1', '422', 'FILTRE A GASOIL ONFILTER ON90874M', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('448', '1', '233900l041', 'FILTRE A GASOIL TOYOTA LEXUS', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('449', '1', 'DF5236', 'FILTRE A GASOIL ELEMFIL 5236', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('450', '1', 'KF547', 'FILTRE A GASOIL HAOGD 547', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('451', '1', '427', 'FILTRE A GASOIL BOSCH N1723', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('452', '1', 'DP1110130082', 'FILTRE A GASOIL DRIVE PLUS 0082', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('453', '1', 'DP1110130083', 'FILTRE A GASOIL DRIVE PLUS 0083', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('454', '1', '1640302N10', 'FILTRE A GASOIL  CSFILTER 2N10', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('455', '1', '8660002098', 'FILTRE A GASOIL TRADEX 2098', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('456', '1', '612600081335', 'FILTRE A GASOIL WEICHAI POWER 1335', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('457', '1', 'FS19609', 'FILTRE A GASOIL VESTAL 9609', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('458', '1', '429', 'FILTRE A GASOIL ASSO WP4138', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('459', '1', '430', 'FILTRE A GASOIL SAMPIYON CS0142M', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('460', '1', 'DP1110130057', 'FILTRE A GASOIL DRIVE PLUS 0057', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('461', '1', '190199', 'FILTRE A GASOIL PLANETFILTRE 0199', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('462', '1', '2330364010', 'FILTRE A GASOIL TOYOTA 4010', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('463', '1', '164005033R', 'FILTRE A GASOIL BF1 033R', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('464', '1', '431', 'FILTRE A GASOIL RENAULT SC', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('465', '1', '7111296', 'FILTRE A GASOIL PLANETFILTRE 1296', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('466', '1', 'GBS607', 'FILTRE A GASOIL ALSAFA 607', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('467', '1', 'CC119176BA', 'FILTRE A GASOIL FORD TRANSIT 2015', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('468', '1', '433', 'FILTRE A GASOIL AASAS FILTER AS3541', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('469', '1', '434', 'FILTRE A GASOIL PURFLUX FC500E', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('470', '1', '435', 'FILTRE A GASOIL UFI 2606500', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('471', '1', '436', 'FILTRE A GASOIL VESTAL VS22470', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('472', '1', '437', 'FILTRE A GASOIL VESTAL VSDF5204', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('473', '1', '1457434106', 'FILTRE A GASOIL HAOGD 4106', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('474', '1', '438', 'FILTRE A GASOIL AASAS AS3535', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('475', '1', '439', 'FILTRE A GASOIL RENAULT 16400137R', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('476', '1', 'DP1110130036', 'FILTRE A GASOIL DRIVE PLUS 0036', '0.00', '0.00', '0.00', '6.00');
INSERT INTO products VALUES('477', '1', '440', 'FILTRE A GASOIL CF CENTRAL CF3158', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('478', '1', 'DP1110130048', 'FILTRE A GASOIL DRIVE PLUS 0048', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('479', '1', '8671019186', 'FILTRE A GASOIL MOTRIO 9186', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('480', '1', 'GBS619', 'FILTRE A GASOIL ALSAFA 619', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('481', '1', '443', 'FILTRE A ESSENCE BOSCH F2161', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('482', '1', '444', 'FILTRE A ESSENCE C0004103', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('483', '1', '445', 'FILTRE A ESSECE CGP 384', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('484', '1', 'OBS138', 'FILTRE A HUILE ALSAFA 138', '0.00', '0.00', '0.00', '6.00');
INSERT INTO products VALUES('485', '1', '448', 'FILTRE A HUILE VESTAL VSFH08', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('486', '1', '449', 'FILTRE A HUILE BOSCH P7023', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('487', '1', '450', 'FILTRE A HUILE MANN HU7008Z', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('488', '1', '90915TB001', 'FILTRE A HUILE TOYOTA TB001', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('489', '1', '452', 'FILTRE A HUILE FILTRON OE688', '0.00', '0.00', '0.00', '7.00');
INSERT INTO products VALUES('490', '1', '1903628DV', 'FILTRE A HUILE BF1 3628', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('491', '1', '456', 'PEAU DE CHAMOIS CARLUX 64X43', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('492', '1', '457', 'PEAU DE CHAMOIS CARLUX43X32', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('493', '1', '454', 'FILTRE A HUILE WIX WL7514', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('494', '1', '93743595', 'FILTRE A HUILE REALSTON 3595', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('495', '1', '455', 'FILTRE A HUILE VESTAL VS26310', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('496', '1', '90915300028T', 'FILTRE A HUILE TOYOTA 028T', '0.00', '0.00', '0.00', '0.00');
INSERT INTO products VALUES('497', '1', '90915YZZD2', 'FILTRE A HUILE TOYOTA ZZD2', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('498', '1', '458', 'FILTRE A HUILE DELSA DS1230', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('499', '1', '459', 'FILTRE A HUILE PEUGEOT 1109Y', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('500', '1', '152092W200', 'FILTRE A HUILE MICOTA W200', '0.00', '0.00', '0.00', '6.00');
INSERT INTO products VALUES('501', '1', '461', 'FILTRE A HUILE FILTRON OE667', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('502', '1', '460', 'FILTRE A HUILE FILTRON OE6401', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('503', '1', '462', 'FILTRE A HUILE NOMIS NCT033', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('504', '1', '463', 'FILTRE A HUILE FILTRON OE6501', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('505', '1', '464', 'FILTRE A HUILE FILTRON OE673', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('506', '1', '465', 'FILTRE A HUILE FILTRON OE671', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('507', '1', '466', 'FILTRE A HUILE FILTRON OE6882', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('508', '1', '467', 'FILTRE A HUILE FILTRON OE6713', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('509', '1', '468', 'FILTRE A HUILE FILTRON OE6405', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('510', '1', '469', 'FILTRE A HUILE FILTRON OE670', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('511', '1', '470', 'FILTRE A HUILE AASAS AS1566', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('512', '1', 'OBS160', 'FILTRE A HUILE ALSAFA 160', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('513', '1', 'OBS118', 'FILTRE A HUILE ALSAFA 118', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('514', '1', 'OS603', 'FILTRE A HUILE SAFI 603', '0.00', '0.00', '0.00', '15.00');
INSERT INTO products VALUES('515', '1', '471', 'FILTRE A HUILE ONNURI 263304X000', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('516', '1', '472', 'FILTRE A HUILE PLANETFILTRE 2631145001', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('517', '1', '473', 'FILTRE A HUILE DELSA DS1170', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('518', '1', '474', 'FILTRE A HUILE BOSCH P3336', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('519', '1', '475', 'FILTRE A HUILE BOSCH P7001', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('520', '1', '8200768913', 'FILTRE A HUILE RENAULT 8913', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('521', '1', '477', 'FILTRE A HUILE FILTRON OP6433', '0.00', '0.00', '0.00', '8.00');
INSERT INTO products VALUES('522', '1', '8971482700', 'FILTRE A HUILE ISUZU 2700', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('523', '1', 'OS367', 'FILTRE A HUILE SAFI 367', '0.00', '0.00', '0.00', '9.00');
INSERT INTO products VALUES('524', '1', 'OS371', 'FILTRE A HUILE SAFI 371', '0.00', '0.00', '0.00', '3.00');
INSERT INTO products VALUES('525', '1', 'OBS113A', 'FILTRE A HUILE ALSAFA 113A', '0.00', '0.00', '0.00', '16.00');
INSERT INTO products VALUES('526', '1', 'OBS107', 'FILTRE A HUILE ALSAFA 107', '0.00', '0.00', '0.00', '6.00');
INSERT INTO products VALUES('527', '1', 'OBS106', 'FILTRE A HUILE ALSAFA 106', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('528', '1', 'OS474', 'FILTRE A HUILE SAFI 474', '0.00', '0.00', '0.00', '13.00');
INSERT INTO products VALUES('529', '1', 'OS475', 'FILTRE A HUILE SAFI 475', '0.00', '0.00', '0.00', '6.00');
INSERT INTO products VALUES('530', '1', 'OS485', 'FILTRE A HUILE SAFI 485', '0.00', '0.00', '0.00', '19.00');
INSERT INTO products VALUES('531', '1', '2631145001', 'FILTRE A HUILE HYUNDAI 5001', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('532', '1', '15208W1116', 'FILTRE A HUILE NISSAN 1116', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('533', '1', 'VSLF670', 'FILTRE A HUILE VESTAL 670', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('534', '1', 'DS1085', 'FILTRE A HUILE DELSA DS108', '0.00', '0.00', '0.00', '4.00');
INSERT INTO products VALUES('535', '1', 'DS1028BP', 'FILTRE A HUILE DELSA 28BP', '0.00', '0.00', '0.00', '5.00');
INSERT INTO products VALUES('536', '1', '479', 'RAM PAPIER TAPIS LAVAGE', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('537', '1', '480', 'ESSUIE GLACE VALEO WT41', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('538', '1', '481', 'ESSUIE GLACE VALEO VFB50', '0.00', '0.00', '0.00', '7.00');
INSERT INTO products VALUES('539', '1', '482', 'ESSUIE GLACE VFB45', '0.00', '0.00', '0.00', '6.00');
INSERT INTO products VALUES('540', '1', '483', 'ESSUIE GLACE VALEO VFB40', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('541', '1', '484', 'ESSUIE GLACE VALEO VFB35', '0.00', '0.00', '0.00', '10.00');
INSERT INTO products VALUES('542', '1', '485', 'TAPIS PLASTIQUE MZABAUTO', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('543', '1', '486', 'PARSOLEIL TOPNET', '0.00', '0.00', '0.00', '2.00');
INSERT INTO products VALUES('544', '1', '488', 'LIQUIDE DE REFROIDISSEMENT SPIDERONE 5L', '0.00', '0.00', '0.00', '42.00');
INSERT INTO products VALUES('545', '1', 'KJ10P', 'CRIC KING 10T', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('546', '1', 'KJ5', 'CRIC KING 5T', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('547', '1', 'KJ3', 'CRIC KING 3T', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('548', '1', 'KJ2', 'CRIC KING 2T', '0.00', '0.00', '0.00', '1.00');
INSERT INTO products VALUES('549', '1', '487', 'SPEEDFIRE LAVEGLACE 460ML', '0.00', '0.00', '0.00', '8.00');
INSERT INTO products VALUES('550', '1', '489', 'SPEEDFIRE PNEUS 460ML', '0.00', '0.00', '0.00', '8.00');
INSERT INTO products VALUES('551', '1', '490', 'ACIDE 32DEG EMPEC 1L', '0.00', '0.00', '0.00', '21.00');

-- -----------------------------
-- insertions dans la table tempdata
-- -----------------------------
INSERT INTO tempdata VALUES('1680', '1', '1', '1.00', 'CL 04', '1');
INSERT INTO tempdata VALUES('1681', '2', '6', '1.80', 'CL 05', '1');
INSERT INTO tempdata VALUES('1682', '3', '1', '1.00', 'BL 04', '1');
INSERT INTO tempdata VALUES('1683', '4', '0', '0.00', 'BL 05', '1');
INSERT INTO tempdata VALUES('1684', '5', '6', '1.80', 'VRT 05', '1');
INSERT INTO tempdata VALUES('1685', '6', '0', '0.00', 'BRZ 05', '1');
INSERT INTO tempdata VALUES('1686', '7', '0', '0.00', 'MRG 04', '1');
INSERT INTO tempdata VALUES('1687', '8', '0', '0.00', 'ISLM 04', '1');
INSERT INTO tempdata VALUES('1688', '9', '0', '0.00', 'TISSE 04', '1');
INSERT INTO tempdata VALUES('1689', '10', '0', '0.00', 'FMR 05', '1');
INSERT INTO tempdata VALUES('1690', '11', '0', '0.00', 'FMR 04', '1');
INSERT INTO tempdata VALUES('1691', '12', '0', '0.00', 'FBL 05', '1');
INSERT INTO tempdata VALUES('1692', '13', '0', '0.00', 'FBL 04', '1');
INSERT INTO tempdata VALUES('1693', '14', '1', '1.00', '10', '2');
INSERT INTO tempdata VALUES('1694', '15', '6', '1.80', '6', '2');
INSERT INTO tempdata VALUES('1695', '16', '0', '0.00', '8', '2');
INSERT INTO tempdata VALUES('1696', '17', '0', '0.00', '12', '2');

-- -----------------------------
-- insertions dans la table tempdata2
-- -----------------------------
INSERT INTO tempdata2 VALUES('836', '1', 'Amine', '', '0123456789', '1', '4000', '1', '1');
INSERT INTO tempdata2 VALUES('837', '6', 'amine aid', 'Azazga', 'cotnact', '0', '0', '0', '0');
INSERT INTO tempdata2 VALUES('838', '7', 'Contact 4', 'Azazga', '12345678', '0', '0', '0', '0');
INSERT INTO tempdata2 VALUES('839', '8', 'Toufik', 'Azazga', '011223344', '0', '0', '0', '0');
INSERT INTO tempdata2 VALUES('840', '9', 'SAMIR', 'AZAZGA', '66666', '1', '21678', '6', '2');

-- -----------------------------
-- insertions dans la table versements
-- -----------------------------
INSERT INTO versements VALUES('1', '1', '8', 'Toufik', '500.00', '1502085540', 'Achat', '1');
INSERT INTO versements VALUES('2', '2', '1', 'Amine', '-300.00', '1502086260', 'Gros', '1');
INSERT INTO versements VALUES('3', '3', '1', 'Amine', '-200.00', '1502096460', 'Gros', '1');
INSERT INTO versements VALUES('4', '4', '1', 'Amine', '-202.00', '1502096460', 'Detail', '1');
INSERT INTO versements VALUES('5', '6', '8', 'Toufik', '500.00', '1502099400', 'Achat', '1');
INSERT INTO versements VALUES('6', '7', '6', 'amine aid', '-500.00', '1502100960', 'Detail', '1');
INSERT INTO versements VALUES('7', '8', '8', 'Toufik', '5000.00', '1505028120', 'Detail', '1');
INSERT INTO versements VALUES('8', '9', '8', 'Toufik', '0.00', '1505028600', 'Gros', '1');
INSERT INTO versements VALUES('9', '0', '8', 'Toufik', '100.00', '1505028600', 'Detail', '1');
INSERT INTO versements VALUES('10', '0', '8', 'Toufik', '100.00', '1505029380', 'Achat', '1');
INSERT INTO versements VALUES('11', '10', '8', 'Toufik', '100.00', '1505030160', 'Achat', '1');
INSERT INTO versements VALUES('12', '11', '8', 'Toufik', '-1500.00', '1505186640', 'Detail', '1');

