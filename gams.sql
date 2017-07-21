-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 12 2016 г., 07:03
-- Версия сервера: 10.1.10-MariaDB
-- Версия PHP: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gams`
--

-- --------------------------------------------------------

--
-- Структура таблицы `calibrationcoefs`
--

CREATE TABLE `calibrationcoefs` (
  `COL 1` varchar(18) DEFAULT NULL,
  `COL 2` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `calibrationcoefs`
--

INSERT INTO `calibrationcoefs` (`COL 1`, `COL 2`) VALUES
('PastureCoefCal', '10.00'),
('CoefCalibration', '1.34'),
('PercentRoughageCal', '5.00'),
('PercentFeedCal', '95.00');

-- --------------------------------------------------------

--
-- Структура таблицы `cattle`
--

CREATE TABLE `cattle` (
  `Cattle` varchar(12) NOT NULL,
  `Coeff` double(6,6) DEFAULT NULL,
  `Cattle_FeedUnit` double(6,6) DEFAULT NULL,
  `CattleNorm` double(6,6) DEFAULT NULL,
  `Consumption` double(6,6) DEFAULT NULL,
  `Amount` double(6,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cattle`
--

INSERT INTO `cattle` (`Cattle`, `Coeff`, `Cattle_FeedUnit`, `CattleNorm`, `Consumption`, `Amount`) VALUES
('beef_cattle', 0.000000, 0.999999, 0.999999, 0.000000, 0.999999),
('dairy_cattle', 0.000000, 0.000000, 0.000000, 0.000000, 0.999999),
('pig', 0.000000, 0.999999, 0.999999, 0.000000, 0.999999),
('poultry ', 0.000000, 0.999999, 0.105000, 0.000000, 0.999999),
('sheep_goat', 0.000000, 0.999999, 0.999999, 0.000000, 0.999999);

-- --------------------------------------------------------

--
-- Структура таблицы `crops`
--

CREATE TABLE `crops` (
  `Crops` varchar(9) DEFAULT NULL,
  `productivity` double(4,4) DEFAULT NULL,
  `FeedMassCoef` double(4,4) DEFAULT NULL,
  `FeedUnitCoef` double(3,2) DEFAULT NULL,
  `WaterRate` double(6,6) DEFAULT NULL,
  `Coef_Expenses` double(6,6) DEFAULT NULL,
  `Wages` double(6,6) DEFAULT NULL,
  `Tax` double(6,6) DEFAULT NULL,
  `Cost` double(6,6) DEFAULT NULL,
  `Fact_Area` double(6,6) DEFAULT NULL,
  `Calibration_Feed_Unit` double(6,6) DEFAULT NULL,
  `Conversion` double(6,6) DEFAULT NULL,
  `Inn_Area` double(6,6) DEFAULT NULL,
  `Inn_Productivity` double(6,6) DEFAULT NULL,
  `Inn_WaterRate` double(6,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `crops`
--

INSERT INTO `crops` (`Crops`, `productivity`, `FeedMassCoef`, `FeedUnitCoef`, `WaterRate`, `Coef_Expenses`, `Wages`, `Tax`, `Cost`, `Fact_Area`, `Calibration_Feed_Unit`, `Conversion`, `Inn_Area`, `Inn_Productivity`, `Inn_WaterRate`) VALUES
('cotton', 0.9999, 0.9999, 0.18, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.000000, 0.999999, 0.025000, 0.999999, 0.520000),
('grape', 0.9999, 0.0000, 0.00, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.000000, 0.000000, 0.200000, 0.999999, 0.350000),
('fruits', 0.9999, 0.0000, 0.00, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.000000, 0.000000, 0.200000, 0.999999, 0.450000),
('vegetable', 0.9999, 0.0000, 0.00, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.000000, 0.999999, 0.200000, 0.999999, 0.550000),
('melon', 0.9999, 0.0000, 0.00, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.000000, 0.000000, 0.200000, 0.999999, 0.550000),
('CornGrain', 0.9999, 0.9999, 0.21, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.000000, 0.120000, 0.025000, 0.999999, 0.250000),
('rise', 0.9999, 0.9999, 0.24, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.500000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000),
('lucerne', 0.9999, 0.9999, 0.49, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000),
('corn', 0.9999, 0.9999, 0.37, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.000000, 0.000000, 0.020000, 0.999999, 0.500000),
('potato', 0.9999, 0.5000, 0.12, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.999999, 0.000000, 0.000000, 0.200000, 0.999999, 0.550000),
('grain', 0.9999, 0.9999, 1.34, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.999999, 0.000000, 0.000000, 0.020000, 0.999999, 0.500000),
('silage', 0.9999, 0.9999, 0.20, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.999999, 0.000000, 0.000000, 0.020000, 0.999999, 0.500000);

-- --------------------------------------------------------

--
-- Структура таблицы `outputcompdata`
--

CREATE TABLE `outputcompdata` (
  `COL 1` varchar(18) DEFAULT NULL,
  `COL 2` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `outputcompdata`
--

INSERT INTO `outputcompdata` (`COL 1`, `COL 2`) VALUES
('ProdMeat', '        2.59\r'),
('ProdMilk', '       40.04\r'),
('ProdMelon', '      171.00\r'),
('ProdFruits', '      355.00\r'),
('ProdBread', '      211.00\r'),
('ProdPotato', '       40.00\r'),
('SpecProdMeat', '        0.75\r'),
('SpecProdMilk', '       11.57\r'),
('SpecProdMelon', '       49.42\r'),
('SpecProdFruit', '      102.60\r'),
('SpecProdBread', '       60.98\r'),
('SpecProdPotato', '       11.56\r'),
('SpecificFact', '      331.21\r'),
('SpecificFact', '      128.61\r'),
('SpecificFact', '       34.68\r'),
('SpecificFact', '      167.92\r'),
('Amount_Water', '   100000.00\r'),
('Feed_Cal    ', '   420000.00\r'),
('Roughage_Cal', '        0.00\r'),
('FactAmountFr', '     1146.00\r'),
('FactAmountMe', '      445.00\r'),
('FactAmountPo', '      120.00\r'),
('FactAmountBr', '      581.00\r'),
('Area        ', '      397.00\r'),
('Population  ', '     3460.00\r'),
('MilkUnit    ', '        1.00\r'),
('std_Milk    ', '      200.00\r'),
('std_Meat    ', '       55.00\r'),
('std_Fruit   ', '      170.00\r'),
('std_Melon   ', '      165.00\r'),
('std_Bread   ', '      200.00\r'),
('std_Potato  ', '       35.00\r'),
('FactProdMilk', '      793.00\r'),
('FactProdMeat', '       82.00\r'),
('pc_mol      ', '        1.00\r'),
('pc_meat     ', '        0.00\r'),
('pc_fr       ', '        1.00\r'),
('pc_bh       ', '        1.00\r'),
('pc_krt      ', '        1.00\r'),
('pc_hl       ', '        1.00\r'),
('ras_potr    ', '     1415.67\r'),
('k_meat      ', '      251.00\r'),
('k_milk      ', '      408.00\r'),
('k_bh        ', '      300.00\r'),
('k_fr        ', '      224.00\r'),
('k_krt       ', '       75.00\r'),
('k_hl        ', '      832.00\r'),
('k_norm      ', '     3008.00\r'),
('k_n_god     ', '        0.00\r'),
('pro_meat    ', '       31.00\r'),
('pro_milk    ', '      228.00\r'),
('DeviationAddedTax', '  1991761.26\r'),
('SpecProdMeat 2nd', '        0.75\r'),
('SpecProdMilk 2nd', '       11.57\r'),
('SpecProdMelon 2nd', '       49.42\r'),
('SpecProdFruit 2nd', '      102.60\r'),
('SpecProdBread 2nd', '       60.98\r'),
('SpecProdPotato 2nd', '       11.56\r'),
('PastureCoefCal', '       10.00\r'),
('CoefCalibration', '        1.34\r'),
('PercentFeed', '       95.00\r'),
('PercentRoughage', '        5.00\r');

-- --------------------------------------------------------

--
-- Структура таблицы `outputfactdata`
--

CREATE TABLE `outputfactdata` (
  `COL 1` varchar(15) DEFAULT NULL,
  `COL 2` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `outputfactdata`
--

INSERT INTO `outputfactdata` (`COL 1`, `COL 2`) VALUES
('ProdMeatCal', '24.45'),
('ProdMilkCal', '792.61'),
('SpecProdMeatCal', '7.07'),
('SpecProdMilkCal', '229.08');

-- --------------------------------------------------------

--
-- Структура таблицы `par`
--

CREATE TABLE `par` (
  `Set_Parameters` varchar(24) DEFAULT NULL,
  `values_` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `par`
--

INSERT INTO `par` (`Set_Parameters`, `values_`) VALUES
('Amount_Water', 100000),
('Feed_Cal', 0),
('Roughage_Cal', 0),
('FactAmountFruits', 0),
('FactAmountMelon', 0),
('FactAmountPotato', 0),
('FactAmountBread', 0),
('SpecificFactAmountFruits', 0),
('SpecificFactAmountMelone', 0),
('SpecificFactAmountPotato', 0),
('SpecificFactAmountBread', 0),
('Area', 397),
('Population', 3460),
('MilkUnit', 1),
('std_Milk', 200),
('std_Meat', 55),
('std_Fruit', 170),
('std_Melon', 165),
('std_Bread', 200),
('std_Potato', 35),
('FactProdMilk', 793),
('FactProdMeat', 82),
('pro_meat', 31),
('pro_milk', 228),
('k_meat', 251),
('k_milk', 408),
('k_bh', 300),
('k_fr', 224),
('k_krt', 75),
('k_hl', 832),
('k_norm', 3008),
('k_n_god', 0),
('pc_mol', 1),
('pc_meat', 0),
('pc_fr', 1),
('pc_bh', 1),
('pc_krt', 1),
('pc_hl', 1),
('ras_potr', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cattle`
--
ALTER TABLE `cattle`
  ADD PRIMARY KEY (`Cattle`);

--
-- Индексы таблицы `crops`
--
ALTER TABLE `crops`
  ADD UNIQUE KEY `Crops` (`Crops`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
