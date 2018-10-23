CREATE TABLE IF NOT EXISTS `gsr` (
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(250) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;