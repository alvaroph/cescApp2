-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-01-2025 a las 12:28:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cesc2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respostes`
--

CREATE TABLE `respostes` (
  `id_enquesta` int(11) NOT NULL,
  `id_alumne` int(11) NOT NULL,
  `numero_alumno` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `genero` enum('Noi','Noia') DEFAULT NULL,
  `clase` varchar(255) DEFAULT NULL,
  `tutor` varchar(255) DEFAULT NULL,
  `centro` varchar(255) DEFAULT NULL,
  `poblacion` varchar(255) DEFAULT NULL,
  `soc_POS_1` int(11) DEFAULT NULL,
  `soc_POS_2` int(11) DEFAULT NULL,
  `soc_POS_3` int(11) DEFAULT NULL,
  `soc_NEG_1` int(11) DEFAULT NULL,
  `soc_NEG_2` int(11) DEFAULT NULL,
  `soc_NEG_3` int(11) DEFAULT NULL,
  `ar_i_1` int(11) DEFAULT NULL,
  `ar_i_2` int(11) DEFAULT NULL,
  `ar_i_3` int(11) DEFAULT NULL,
  `pros_1` int(11) DEFAULT NULL,
  `pros_2` int(11) DEFAULT NULL,
  `pros_3` int(11) DEFAULT NULL,
  `af_1` int(11) DEFAULT NULL,
  `af_2` int(11) DEFAULT NULL,
  `af_3` int(11) DEFAULT NULL,
  `ar_d_1` int(11) DEFAULT NULL,
  `ar_d_2` int(11) DEFAULT NULL,
  `ar_d_3` int(11) DEFAULT NULL,
  `pros_2_1` int(11) DEFAULT NULL,
  `pros_2_2` int(11) DEFAULT NULL,
  `pros_2_3` int(11) DEFAULT NULL,
  `av_1` int(11) DEFAULT NULL,
  `av_2` int(11) DEFAULT NULL,
  `av_3` int(11) DEFAULT NULL,
  `vf_1` int(11) DEFAULT NULL,
  `vf_2` int(11) DEFAULT NULL,
  `vf_3` int(11) DEFAULT NULL,
  `vv_1` int(11) DEFAULT NULL,
  `vv_2` int(11) DEFAULT NULL,
  `vv_3` int(11) DEFAULT NULL,
  `vr_1` int(11) DEFAULT NULL,
  `vr_2` int(11) DEFAULT NULL,
  `vr_3` int(11) DEFAULT NULL,
  `amics_1` int(11) DEFAULT NULL,
  `amics_2` int(11) DEFAULT NULL,
  `amics_3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respostes`
--

INSERT INTO `respostes` (`id_enquesta`, `id_alumne`, `numero_alumno`, `nom`, `genero`, `clase`, `tutor`, `centro`, `poblacion`, `soc_POS_1`, `soc_POS_2`, `soc_POS_3`, `soc_NEG_1`, `soc_NEG_2`, `soc_NEG_3`, `ar_i_1`, `ar_i_2`, `ar_i_3`, `pros_1`, `pros_2`, `pros_3`, `af_1`, `af_2`, `af_3`, `ar_d_1`, `ar_d_2`, `ar_d_3`, `pros_2_1`, `pros_2_2`, `pros_2_3`, `av_1`, `av_2`, `av_3`, `vf_1`, `vf_2`, `vf_3`, `vv_1`, `vv_2`, `vv_3`, `vr_1`, `vr_2`, `vr_3`, `amics_1`, `amics_2`, `amics_3`) VALUES
(6, 1, NULL, 'alumne', '', '', '', '', '', 5, 30, 11, 8, 29, 25, 16, 30, 7, 27, 2, 11, 29, 26, 10, 25, 6, 28, 9, 2, 25, 22, 20, 23, 22, 20, 15, 17, 24, 10, 7, 21, 15, 21, 12, 13),
(6, 2, NULL, 'alumne', '', '', '', '', '', 15, 22, 13, 7, 6, 9, 30, 23, 25, 20, 6, 4, 19, 27, 11, 29, 27, 24, 14, 23, 3, 19, 4, 29, 28, 16, 5, 3, 4, 8, 12, 19, 3, 30, 28, 13),
(6, 3, NULL, 'alumne', '', '', '', '', '', 6, 1, 26, 9, 24, 30, 23, 6, 8, 28, 7, 26, 9, 15, 1, 8, 22, 13, 16, 30, 9, 7, 6, 18, 11, 14, 24, 7, 24, 21, 10, 27, 16, 30, 25, 22),
(6, 4, NULL, 'alumne', '', '', '', '', '', 29, 13, 25, 13, 8, 20, 11, 21, 29, 23, 1, 25, 6, 15, 28, 21, 5, 26, 13, 14, 3, 23, 16, 17, 13, 19, 5, 5, 3, 30, 1, 9, 14, 21, 6, 24),
(6, 5, NULL, 'alumne', '', '', '', '', '', 11, 20, 9, 29, 12, 17, 22, 1, 18, 27, 8, 22, 28, 17, 26, 12, 13, 18, 7, 6, 8, 11, 24, 9, 3, 9, 18, 18, 16, 1, 16, 22, 14, 30, 9, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respostes_processades`
--

CREATE TABLE `respostes_processades` (
  `id_enquesta` int(11) NOT NULL,
  `id_alumne` int(11) NOT NULL,
  `nom_alumne` varchar(255) DEFAULT NULL,
  `soc_POS` int(11) DEFAULT NULL,
  `soc_NEG` int(11) DEFAULT NULL,
  `ar_i` int(11) DEFAULT NULL,
  `pros` int(11) DEFAULT NULL,
  `af` int(11) DEFAULT NULL,
  `ar_d` int(11) DEFAULT NULL,
  `pros_2` int(11) DEFAULT NULL,
  `av` int(11) DEFAULT NULL,
  `vf` int(11) DEFAULT NULL,
  `vv` int(11) DEFAULT NULL,
  `vr` int(11) DEFAULT NULL,
  `amics` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respostes_processades`
--

INSERT INTO `respostes_processades` (`id_enquesta`, `id_alumne`, `nom_alumne`, `soc_POS`, `soc_NEG`, `ar_i`, `pros`, `af`, `ar_d`, `pros_2`, `av`, `vf`, `vv`, `vr`, `amics`) VALUES
(1, 1, 'Alumne1', 1, 4, 0, 8, 8, 8, 0, 0, 2, 5, 11, 1),
(1, 2, 'Alumne2', 3, 2, 1, 2, 1, 1, 3, 4, 0, 0, 0, 1),
(1, 3, 'Alumne3', 4, 1, 0, 2, 2, 9, 2, 3, 0, 2, 0, 2),
(1, 4, 'Alumne4', 2, 4, 4, 1, 2, 1, 0, 5, 10, 10, 1, 2),
(1, 5, 'Alumne5', 7, 1, 0, 0, 0, 1, 11, 5, 0, 0, 0, 4),
(1, 6, 'Alumne6', 0, 9, 13, 9, 13, 5, 0, 1, 16, 15, 19, 0),
(1, 7, 'Alumne7', 1, 8, 2, 2, 2, 3, 0, 0, 9, 11, 14, 0),
(1, 8, 'Alumne8', 5, 1, 0, 1, 1, 4, 6, 4, 1, 0, 0, 6),
(1, 9, 'Alumne9', 5, 4, 0, 8, 8, 10, 5, 4, 0, 1, 0, 4),
(1, 10, 'Alumne10', 4, 2, 7, 4, 2, 1, 2, 2, 10, 7, 1, 4),
(1, 11, 'Alumne11', 6, 0, 4, 1, 1, 0, 7, 9, 3, 1, 0, 8),
(1, 12, 'Alumne12', 3, 2, 0, 0, 0, 2, 2, 2, 0, 0, 0, 4),
(1, 13, 'Alumne13', 4, 0, 1, 0, 0, 1, 2, 4, 0, 0, 1, 2),
(1, 14, 'Alumne14', 1, 6, 0, 0, 1, 0, 5, 7, 1, 2, 9, 0),
(1, 15, 'Alumne15', 1, 4, 4, 7, 1, 1, 0, 0, 0, 6, 1, 0),
(1, 16, 'Alumne16', 1, 11, 19, 12, 13, 7, 1, 0, 1, 0, 1, 1),
(1, 17, 'Alumne17', 4, 0, 3, 1, 0, 2, 0, 1, 1, 1, 1, 7),
(1, 18, 'Alumne18', 2, 0, 0, 3, 5, 4, 6, 4, 1, 0, 0, 5),
(1, 19, 'Alumne19', 5, 2, 2, 2, 2, 1, 1, 2, 4, 1, 0, 5),
(1, 20, 'Alumne20', 2, 0, 0, 0, 0, 0, 9, 5, 0, 0, 1, 3),
(1, 21, 'Alumne21', 2, 2, 3, 0, 1, 2, 1, 1, 4, 1, 3, 4),
(6, 1, '', 2, 0, 2, 2, 2, 0, 0, 0, 0, 2, 2, 0),
(6, 2, '', 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0),
(6, 3, '', 0, 0, 0, 0, 0, 0, 4, 0, 2, 4, 2, 0),
(6, 4, '', 0, 0, 0, 2, 0, 0, 0, 2, 0, 2, 0, 0),
(6, 5, '', 2, 0, 0, 0, 0, 2, 0, 0, 4, 2, 0, 0),
(6, 6, '', 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 2),
(6, 7, '', 0, 2, 2, 2, 0, 0, 2, 2, 0, 2, 2, 0),
(6, 8, '', 0, 4, 2, 2, 0, 2, 2, 0, 0, 2, 0, 0),
(6, 9, '', 2, 4, 0, 0, 2, 0, 4, 2, 2, 0, 2, 2),
(6, 10, '', 0, 0, 0, 0, 2, 0, 0, 0, 0, 2, 2, 0),
(6, 11, '', 4, 0, 2, 2, 2, 0, 0, 2, 2, 0, 0, 0),
(6, 12, '', 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 2, 2),
(6, 13, '', 4, 2, 0, 0, 0, 4, 2, 0, 2, 0, 0, 4),
(6, 14, '', 0, 0, 0, 0, 0, 0, 4, 0, 2, 0, 4, 0),
(6, 15, '', 2, 0, 0, 0, 4, 0, 0, 0, 2, 0, 2, 0),
(6, 16, '', 0, 0, 2, 0, 0, 0, 2, 2, 2, 2, 4, 0),
(6, 17, '', 0, 2, 0, 0, 2, 0, 0, 2, 0, 2, 0, 0),
(6, 18, '', 0, 0, 2, 0, 0, 2, 0, 2, 2, 2, 0, 0),
(6, 19, '', 0, 0, 0, 0, 2, 0, 0, 2, 2, 0, 2, 0),
(6, 20, '', 2, 2, 0, 2, 0, 0, 0, 2, 2, 0, 0, 0),
(6, 21, '', 0, 0, 2, 0, 0, 2, 0, 0, 0, 2, 2, 4),
(6, 22, '', 2, 0, 2, 2, 0, 2, 0, 2, 2, 0, 2, 2),
(6, 23, '', 0, 0, 4, 2, 0, 0, 2, 4, 0, 0, 0, 0),
(6, 24, '', 0, 2, 0, 0, 0, 2, 0, 2, 2, 4, 0, 2),
(6, 25, '', 2, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0, 4),
(6, 26, '', 2, 0, 0, 2, 4, 2, 0, 0, 0, 0, 0, 0),
(6, 27, '', 0, 0, 0, 4, 2, 2, 0, 0, 0, 0, 2, 0),
(6, 28, '', 0, 0, 0, 2, 4, 2, 0, 0, 2, 0, 0, 2),
(6, 29, '', 2, 4, 2, 0, 2, 2, 0, 2, 0, 0, 0, 0),
(6, 30, '', 2, 2, 4, 0, 0, 0, 2, 0, 0, 2, 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultats`
--

CREATE TABLE `resultats` (
  `id_enquesta` int(11) NOT NULL,
  `id_alumne` int(11) NOT NULL,
  `totalAgressivitat` int(11) DEFAULT NULL,
  `agressivitatFisica` int(11) DEFAULT NULL,
  `agressivitatVerbal` int(11) DEFAULT NULL,
  `agressivitatRelacional` int(11) DEFAULT NULL,
  `totalAgressivitat_SN` varchar(1) DEFAULT NULL,
  `agressivitatFisica_SN` varchar(1) DEFAULT NULL,
  `agressivitatVerbal_SN` varchar(1) DEFAULT NULL,
  `agressivitatRelacional_SN` varchar(1) DEFAULT NULL,
  `prosocialitat` int(11) DEFAULT NULL,
  `prosocialitat_SN` varchar(1) DEFAULT NULL,
  `totalVictimitzacio` int(11) DEFAULT NULL,
  `victimitzacioFisica` int(11) DEFAULT NULL,
  `victimitzacioVerbal` int(11) DEFAULT NULL,
  `victimitzacioRelacional` int(11) DEFAULT NULL,
  `totalVictimitzacio_SN` varchar(1) DEFAULT NULL,
  `victimitzacioFisica_SN` varchar(1) DEFAULT NULL,
  `victimitzacioVerbal_SN` varchar(1) DEFAULT NULL,
  `victimitzacioRelacional_SN` varchar(1) DEFAULT NULL,
  `popular_SN` varchar(1) DEFAULT NULL,
  `rebutjat_SN` varchar(1) DEFAULT NULL,
  `ignorat_SN` varchar(1) DEFAULT NULL,
  `controvertit_SN` varchar(1) DEFAULT NULL,
  `normal_SN` varchar(1) DEFAULT NULL,
  `triesPositives` int(11) DEFAULT NULL,
  `triesNegatives` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resultats`
--

INSERT INTO `resultats` (`id_enquesta`, `id_alumne`, `totalAgressivitat`, `agressivitatFisica`, `agressivitatVerbal`, `agressivitatRelacional`, `totalAgressivitat_SN`, `agressivitatFisica_SN`, `agressivitatVerbal_SN`, `agressivitatRelacional_SN`, `prosocialitat`, `prosocialitat_SN`, `totalVictimitzacio`, `victimitzacioFisica`, `victimitzacioVerbal`, `victimitzacioRelacional`, `totalVictimitzacio_SN`, `victimitzacioFisica_SN`, `victimitzacioVerbal_SN`, `victimitzacioRelacional_SN`, `popular_SN`, `rebutjat_SN`, `ignorat_SN`, `controvertit_SN`, `normal_SN`, `triesPositives`, `triesNegatives`) VALUES
(1, 1, 12, 8, 0, 4, 'X', 'X', ' ', ' ', 4, 'X', 18, 2, 5, 11, 'X', ' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ', 1, 4),
(1, 2, 6, 1, 4, 1, ' ', ' ', ' ', ' ', 3, ' ', 0, 0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 3, 2),
(1, 3, 10, 2, 3, 5, ' ', ' ', ' ', ' ', 2, ' ', 2, 0, 2, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 4, 1),
(1, 4, 10, 2, 5, 3, ' ', ' ', 'X', ' ', 1, ' ', 21, 10, 10, 1, 'X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' ', 2, 4),
(1, 5, 6, 0, 5, 1, ' ', ' ', 'X', ' ', 6, 'X', 0, 0, 0, 0, ' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ', 7, 1),
(1, 6, 23, 13, 1, 9, 'X', 'X', ' ', 'X', 5, 'X', 50, 16, 15, 19, 'X', 'X', 'X', 'X', ' ', 'X', ' ', ' ', ' ', 0, 9),
(1, 7, 5, 2, 0, 3, ' ', ' ', ' ', ' ', 1, ' ', 34, 9, 11, 14, 'X', 'X', 'X', 'X', ' ', 'X', ' ', ' ', ' ', 1, 8),
(1, 8, 7, 1, 4, 2, ' ', ' ', ' ', ' ', 4, ' ', 1, 1, 0, 0, ' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ', 5, 1),
(1, 9, 17, 8, 4, 5, 'X', 'X', ' ', 'X', 7, 'X', 1, 0, 1, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', ' ', 5, 4),
(1, 10, 8, 2, 2, 4, ' ', ' ', ' ', ' ', 3, ' ', 18, 10, 7, 1, 'X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' ', 4, 2),
(1, 11, 12, 1, 9, 2, 'X', ' ', 'X', ' ', 4, 'X', 4, 3, 1, 0, ' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ', 6, 0),
(1, 12, 3, 0, 2, 1, ' ', ' ', ' ', ' ', 1, ' ', 0, 0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 3, 2),
(1, 13, 5, 0, 4, 1, ' ', ' ', ' ', ' ', 1, ' ', 1, 0, 0, 1, ' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ', 4, 0),
(1, 14, 8, 1, 7, 0, ' ', ' ', 'X', ' ', 3, ' ', 12, 1, 2, 9, ' ', ' ', ' ', 'X', ' ', 'X', ' ', ' ', ' ', 1, 6),
(1, 15, 4, 1, 0, 3, ' ', ' ', ' ', ' ', 4, ' ', 7, 0, 6, 1, ' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ', ' ', 1, 4),
(1, 16, 26, 13, 0, 13, 'X', 'X', ' ', 'X', 7, 'X', 2, 1, 0, 1, ' ', ' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', 1, 1),
(1, 17, 4, 0, 1, 3, ' ', ' ', ' ', ' ', 1, ' ', 3, 1, 1, 1, ' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ', 4, 0),
(1, 18, 11, 5, 4, 2, ' ', ' ', ' ', ' ', 5, 'X', 1, 1, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 2, 0),
(1, 19, 6, 2, 2, 2, ' ', ' ', ' ', ' ', 2, ' ', 5, 4, 1, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 5, 2),
(1, 20, 5, 0, 5, 0, ' ', ' ', 'X', ' ', 5, 'X', 1, 0, 0, 1, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 2, 0),
(1, 21, 5, 1, 1, 3, ' ', ' ', ' ', ' ', 1, ' ', 8, 4, 1, 3, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 2),
(6, 1, 0, 2, 0, 1, ' ', ' ', ' ', ' ', 1, ' ', 4, 0, 2, 2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 0),
(6, 2, 2, 0, 0, 0, ' ', ' ', ' ', ' ', 2, 'X', 0, 0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 3, 2, 0, 0, 0, ' ', ' ', ' ', ' ', 2, 'X', 8, 2, 4, 2, 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 4, 0, 0, 2, 0, ' ', ' ', ' ', ' ', 1, ' ', 2, 0, 2, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 5, 0, 0, 0, 1, ' ', ' ', ' ', ' ', 0, ' ', 6, 4, 2, 0, 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 0),
(6, 6, 1, 2, 2, 2, ' ', ' ', ' ', 'X', 2, 'X', 0, 0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 2),
(6, 7, 1, 0, 2, 1, ' ', ' ', ' ', ' ', 2, 'X', 4, 0, 2, 2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 2),
(6, 8, 2, 0, 0, 2, 'X', ' ', ' ', 'X', 2, 'X', 2, 0, 2, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 4),
(6, 9, 1, 2, 2, 0, ' ', ' ', ' ', ' ', 2, 'X', 4, 2, 0, 2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 4),
(6, 10, 0, 2, 0, 0, ' ', ' ', ' ', ' ', 0, ' ', 4, 0, 2, 2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 11, 0, 2, 2, 1, ' ', ' ', ' ', ' ', 1, ' ', 2, 2, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 4, 0),
(6, 12, 0, 0, 0, 1, ' ', ' ', ' ', ' ', 0, ' ', 2, 0, 0, 2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 2),
(6, 13, 1, 0, 0, 2, 'X', ' ', ' ', 'X', 1, ' ', 2, 2, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 4, 2),
(6, 14, 2, 0, 0, 0, ' ', ' ', ' ', ' ', 2, 'X', 6, 2, 0, 4, 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 15, 0, 4, 0, 0, ' ', ' ', ' ', ' ', 0, ' ', 4, 2, 0, 2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 0),
(6, 16, 0, 0, 2, 1, ' ', ' ', ' ', ' ', 1, ' ', 8, 2, 2, 4, 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 17, 0, 2, 2, 0, ' ', ' ', ' ', ' ', 0, ' ', 2, 0, 2, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 2),
(6, 18, 0, 0, 2, 2, ' ', ' ', ' ', 'X', 0, ' ', 4, 2, 2, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 19, 0, 2, 2, 0, ' ', ' ', ' ', ' ', 0, ' ', 4, 2, 0, 2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 20, 0, 0, 2, 0, ' ', ' ', ' ', ' ', 1, ' ', 2, 2, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 2),
(6, 21, 0, 0, 0, 2, 'X', ' ', ' ', 'X', 0, ' ', 4, 0, 2, 2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 22, 0, 0, 2, 2, ' ', ' ', ' ', 'X', 1, ' ', 4, 2, 0, 2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 0),
(6, 23, 1, 0, 4, 2, ' ', ' ', ' ', 'X', 2, 'X', 0, 0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 24, 0, 0, 2, 1, ' ', ' ', ' ', ' ', 0, ' ', 6, 2, 4, 0, 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 2),
(6, 25, 2, 0, 0, 2, 'X', ' ', ' ', 'X', 2, 'X', 0, 0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 2),
(6, 26, 0, 4, 0, 1, ' ', ' ', ' ', ' ', 1, ' ', 0, 0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 0),
(6, 27, 1, 2, 0, 1, ' ', ' ', ' ', ' ', 2, 'X', 2, 0, 0, 2, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 28, 0, 4, 0, 1, ' ', ' ', ' ', ' ', 1, ' ', 2, 2, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 0, 0),
(6, 29, 0, 2, 2, 2, ' ', ' ', ' ', 'X', 0, ' ', 0, 0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 4),
(6, 30, 1, 0, 0, 2, 'X', ' ', ' ', 'X', 1, ' ', 2, 0, 2, 0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'X', 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `respostes`
--
ALTER TABLE `respostes`
  ADD PRIMARY KEY (`id_enquesta`,`id_alumne`);

--
-- Indices de la tabla `respostes_processades`
--
ALTER TABLE `respostes_processades`
  ADD PRIMARY KEY (`id_enquesta`,`id_alumne`);

--
-- Indices de la tabla `resultats`
--
ALTER TABLE `resultats`
  ADD PRIMARY KEY (`id_enquesta`,`id_alumne`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
