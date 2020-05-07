-- ----------------------
-- dump de la base Numid au 14-Sep-2017
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

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
INSERT INTO articles VALUES('51', '2', '1', 'Amine', '2', 'Produit 2', 'Gros', '300.00', '300.00', '1', '100.00', '1502086260');
INSERT INTO articles VALUES('52', '2', '1', 'Amine', '3', 'Produit 3', 'Gros', '400.00', '400.00', '1', '100.00', '1502086260');
INSERT INTO articles VALUES('53', '1', '8', 'Toufik', '2', 'Produit 2', 'Achat', '200.00', '200.00', '1', '0.00', '1502085540');
INSERT INTO articles VALUES('54', '1', '8', 'Toufik', '3', 'Produit 3', 'Achat', '300.00', '300.00', '1', '0.00', '1502085540');
INSERT INTO articles VALUES('55', '1', '8', 'Toufik', '1', 'Produit 1', 'Achat', '100.00', '100.00', '1', '0.00', '1502085540');
INSERT INTO articles VALUES('56', '3', '1', 'Amine', '1', 'Produit 1', 'Gros', '200.00', '200.00', '1', '100.00', '1502096460');
INSERT INTO articles VALUES('57', '4', '1', 'Amine', '1', 'Produit 1', 'Detail', '302.00', '604.00', '2', '404.00', '1502096460');
INSERT INTO articles VALUES('58', '6', '8', 'Toufik', '1', 'Produit 1', 'Achat', '100.00', '200.00', '2', '0.00', '1502099400');
INSERT INTO articles VALUES('59', '6', '8', 'Toufik', '3', 'Produit 3', 'Achat', '300.00', '300.00', '1', '0.00', '1502099400');
INSERT INTO articles VALUES('60', '7', '6', 'amine aid', '3', 'Produit 3', 'Detail', '500.00', '500.00', '1', '200.00', '1502100960');
INSERT INTO articles VALUES('65', '9', '8', 'Toufik', '1', 'Produit 1', 'Gros', '200.00', '4000.00', '20', '1980.00', '1505028600');
INSERT INTO articles VALUES('66', '10', '8', 'Toufik', '1', 'Produit 1', 'Achat', '100.00', '100.00', '1', '0.00', '1505030160');
INSERT INTO articles VALUES('67', '8', '8', 'Toufik', '2', 'Produit 2', 'Detail', '400.00', '800.00', '2', '400.00', '1505028120');
INSERT INTO articles VALUES('68', '8', '8', 'Toufik', '1', 'Produit 1', 'Detail', '300.00', '300.00', '1', '200.00', '1505028120');
INSERT INTO articles VALUES('69', '8', '8', 'Toufik', '3', 'Produit 3', 'Detail', '500.00', '1500.00', '3', '600.00', '1505028120');
INSERT INTO articles VALUES('70', '8', '8', 'Toufik', '4', 'Produit 4', 'Detail', '600.00', '2400.00', '4', '800.00', '1505028120');
INSERT INTO articles VALUES('71', '11', '8', 'Toufik', '2', 'Produit 2', 'Detail', '400.00', '400.00', '1', '200.00', '1505186640');
INSERT INTO articles VALUES('72', '11', '8', 'Toufik', '4', 'Produit 4', 'Detail', '600.00', '600.00', '1', '200.00', '1505186640');

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
INSERT INTO orders VALUES('1', 'Achat', '8', 'Toufik', '-600.00', '600.00', '0.00', '1502085540', '1502139633', '1');
INSERT INTO orders VALUES('2', 'Gros', '1', 'Amine', '700.00', '500.00', '200.00', '1502086260', '1502139627', '1');
INSERT INTO orders VALUES('3', 'Gros', '1', 'Amine', '200.00', '100.00', '100.00', '1502096460', '1502096460', '1');
INSERT INTO orders VALUES('4', 'Detail', '1', 'Amine', '604.00', '200.00', '404.00', '1502096460', '1502096460', '1');
INSERT INTO orders VALUES('5', 'Achat', '8', 'Toufik', '-500.00', '0.00', '0.00', '1502099400', '1502099400', '1');
INSERT INTO orders VALUES('6', 'Achat', '8', 'Toufik', '-500.00', '0.00', '0.00', '1502099400', '1502099400', '1');
INSERT INTO orders VALUES('7', 'Detail', '6', 'amine aid', '500.00', '300.00', '200.00', '1502100960', '1502100960', '1');
INSERT INTO orders VALUES('8', 'Detail', '8', 'Toufik', '5000.00', '1000.00', '4000.00', '1505028120', '1505074966', '1');
INSERT INTO orders VALUES('9', 'Gros', '8', 'Toufik', '4000.00', '2020.00', '1980.00', '1505028600', '1505028600', '1');
INSERT INTO orders VALUES('10', 'Achat', '8', 'Toufik', '-100.00', '0.00', '0.00', '1505030160', '1505030160', '1');
INSERT INTO orders VALUES('11', 'Detail', '8', 'Toufik', '1500.00', '900.00', '600.00', '1505186640', '1505186640', '1');

-- -----------------------------
-- insertions dans la table products
-- -----------------------------
INSERT INTO products VALUES('1', '1', '001', 'Produit 1', '100.00', '200.00', '300.00', '-10.00');
INSERT INTO products VALUES('2', '1', '002', 'Produit 2', '200.00', '300.00', '400.00', '7.00');
INSERT INTO products VALUES('3', '1', '003', 'Produit 3', '300.00', '400.00', '500.00', '10.00');
INSERT INTO products VALUES('4', '1', '004', 'Produit 4', '400.00', '500.00', '600.00', '5.00');

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

