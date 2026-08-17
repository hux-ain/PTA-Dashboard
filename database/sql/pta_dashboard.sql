-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Aug 17, 2026 at 02:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pta_dashboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `source_sheet` varchar(50) DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `complaint_channel` varchar(255) NOT NULL,
  `main_city` varchar(255) NOT NULL,
  `opened_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `issue` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `affect` varchar(255) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `aging_downtime` varchar(255) DEFAULT NULL,
  `rfo` text DEFAULT NULL,
  `rca` text DEFAULT NULL,
  `update_log` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `source_sheet`, `customer_name`, `complaint_channel`, `main_city`, `opened_at`, `closed_at`, `issue`, `status`, `affect`, `owner`, `aging_downtime`, `rfo`, `rca`, `update_log`, `created_at`, `updated_at`) VALUES
(1, 'Tickets', 'SATCOM PVT LTD', 'Email', 'Karachi', '2026-08-13 15:06:00', '2026-08-13 15:19:00', 'Latency', 'Closed', 'Service Affecting', 'Gerrys', '0.0090277777777778', '—', 'issue observed from upstream vendor', 'Ticket: TKT-2026-0196 | Connection: D 38 Site Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(2, 'Tickets', 'Stack Lab Private Limited (creative Chaos)', 'Call', 'Karachi', '2026-08-13 15:06:00', '2026-08-13 15:19:00', 'Latency', 'Closed', 'Service Affecting', 'Gerrys', '0.0090277777777778', '—', 'issue observed from upstream vendor', 'Ticket: TKT-2026-0198 | Connection: Basement Marine Pride Plot C-2 Khayaban e Iqbal road | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(3, 'Tickets', 'Zara Mobility- khadda market', 'WhatsApp', 'Karachi', '2026-08-13 15:06:00', '2026-08-13 15:19:00', 'Latency', 'Closed', 'Service Affecting', 'Gerrys', '0.0090277777777778', '—', 'issue observed from upstream vendor', 'Ticket: TKT-2026-0199 | Connection: 42 block-6 PECHS | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(4, 'Tickets', 'HRSG BPO', 'Portal', 'Karachi', '2026-08-13 07:12:00', '2026-08-13 12:00:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.2', 'Equipment', 'media power adaptor faulty', 'Ticket: TKT-2026-0195 | Connection: HRSG House, 46-D Street No. 46, off Shahra-e-Faisal, Block 6 P.E.C.H.S | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(5, 'Tickets', 'Satcomm Pvt Ltd (PIE Bandwidth)', 'Email', 'Karachi', '2026-08-12 16:49:00', '2026-08-12 17:10:00', 'Latency', 'Closed', 'Service Affecting', 'Gerrys', '0.014583333333333', 'Transworld', 'issue observed from upstream\'s end', 'Ticket: TKT-2026-0194 | Connection: Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(6, 'Tickets', 'Al Momin', 'Email', 'Karachi', '2026-08-12 15:47:00', '2026-08-12 15:48:00', 'Packet Loss', 'Closed', 'Service Affecting', 'Gerrys', '0.00069444444444444', 'upstraem', 'issue observed from upstream\'s end', 'Ticket: TKT-2026-0192 | Connection: Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(7, 'Tickets', 'Cineplex', 'Email', 'Karachi', '2026-08-12 15:35:00', '2026-08-12 16:22:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.032638888888889', 'Transworld', 'issue observed from upstream\'s end', 'Ticket: TKT-2026-0193 | Connection: Boulevard Mall A/14 Auto Bhan Road Hyderabad | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(8, 'Tickets', 'Aurther lawrence link 2 (Behria)', 'Email', 'Karachi', '2026-08-12 15:31:00', '2026-08-12 17:37:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.0875', '—', 'SFP faulty at POP end, which has been replaced.', 'Ticket: TKT-2026-0191 | Connection: 21 floor Behria town Tower Tariq Road PECHS | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(9, 'Tickets', 'Postex (Korangi)', 'WhatsApp', 'Karachi', '2026-08-12 13:32:00', NULL, 'Link Down', 'Open', 'Service Affecting', 'Gerrys', '3 days 02:09', '—', '—', 'Ticket: TKT-2026-0190 | Connection: near saylani 3 shed, Sector 5 Korangi 5, Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(10, 'Tickets', 'Postex Pvt Ltd Ghas Mandi VLAN 560', 'Portal', 'Karachi', '2026-08-12 09:38:00', '2026-08-12 15:50:00', 'Link Down', 'Closed', 'Service Affecting', 'Connect', '0.25833333333333', 'Fiber', 'Fiber Breakage Force majeure', 'Ticket: TKT-2026-0188 | Connection: Icon tower ghas mandi Plot no LY26/3/2/1 Garden | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(11, 'Tickets', 'Gaditek Association (pvt) Limited.', 'Portal', 'Karachi', '2026-08-12 05:29:00', '2026-08-12 12:51:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS.', '0.30694444444444', '—', 'Feeder cable damage', 'Ticket: TKT-2026-0189 | Connection: 141-D Allama Iqbal Road, Block 2, PECHS | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(12, 'Tickets', 'Telecard Limited Enterprise Communication Solution (K Electric Call Center)', 'Email', 'Karachi', '2026-08-11 16:26:00', '2026-08-11 16:26:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '3 days 23:15', '—', 'As per Ahsan NOC person in telecard link was restored last night and no any activity performed by our RF team', 'Ticket: TKT-2026-0170 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(13, 'Tickets', 'Pro Athletic SKBZ Cricket Ground', 'Call', 'Karachi', '2026-08-11 15:55:00', '2026-08-12 18:30:00', 'Link Down', 'Closed', 'Service Affecting', 'Satcom', '1 day 02:35', 'Fiber cut', 'OFC Breakage', 'Ticket: TKT-2026-0169 | Connection: 26-Khayaban-e-Rahat DHA Phase 6 Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(14, 'Tickets', 'Saudi Pak Insurance', 'Call', 'Karachi', '2026-08-11 11:42:00', '2026-08-11 12:08:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.018055555555556', 'No Activity', 'No activity perform', 'Ticket: TKT-2026-0160 | Connection: 2nd Floor. State Life Building No. 2A, Wallace Road | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(15, 'Tickets', 'PACC (Liaquat Library)', 'Portal', 'Karachi', '2026-08-11 09:30:00', '2026-08-11 18:34:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Fibresh', '0.37777777777778', '—', 'As per fiberish team OFC Breakage restored no CP at customer end', 'Ticket: TKT-2026-0148 | Connection: Liquat National hospital | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(16, 'Tickets', 'Oberthur (Idemia) Technologies Pakistan (pvt.) Ltd.', 'Portal', 'Karachi', '2026-08-10 13:08:00', '2026-08-10 16:46:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Connect', '0.15138888888889', 'Fiber', 'Outage has occurred due to underground fiber cable damage', 'Ticket: TKT-2026-0187 | Connection: Plot 189, Mehran Town Sector 23 Korangi, Karachi, | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(17, 'Tickets', 'Two Shades LLP', 'Email', 'Karachi', '2026-08-10 11:37:00', '2026-08-10 11:38:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.00069444444444444', '—', 'Customer production operation is in process, customer response awaited', 'Ticket: TKT-2026-0144 | Connection: Suite no. 1001 10th floor Kashif Center Shahrah e Faisal KCB Saddar Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(18, 'Tickets', 'Two Shades LLP', 'Email', 'Karachi', '2026-08-10 11:37:00', '2026-08-10 11:37:00', 'Bandwidth', 'Closed', 'Service Affecting', 'Gerrys', '5 days 04:04', 'No issue found', '—', 'Ticket: TKT-2026-0186 | Connection: Suite no. 1001 10th floor Kashif Center Shahrah e Faisal KCB Saddar Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(19, 'Tickets', 'Suparco Hq Communication Section', 'Email', 'Karachi', '2026-08-08 18:25:00', '2026-08-09 17:52:00', 'Link Down', 'Closed', 'Service Affecting', 'Connect', '0.97708333333333', 'Fiber', 'RFO: Media Converter Faulty at POP end', 'Ticket: TKT-2026-0185 | Connection: Suparco Rd, Gulzar-e-Hijri Sachal Goth Sector 28 Gulzar E Hijri Scheme 33, Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(20, 'Tickets', 'Suparco Hq Communication Section', 'Email', 'Karachi', '2026-08-08 15:08:00', '2026-08-08 15:27:00', 'Link Down', 'Closed', 'Service Affecting', 'Connect', '0.013194444444444', 'Fiber', 'Dual Fiber cut', 'Ticket: TKT-2026-0184 | Connection: Suparco Rd, Gulzar-e-Hijri Sachal Goth Sector 28 Gulzar E Hijri Scheme 33, Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(21, 'Tickets', 'Mustaqim Dyeing & Printing Ind.', 'Email', 'Karachi', '2026-08-08 13:30:00', '2026-08-08 22:18:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.36666666666667', 'Fiber', 'Fiber breakage', 'Ticket: TKT-2026-0183 | Connection: D-14/A، Bara Board, Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(22, 'Tickets', 'Feroze 1888 Mills Limited Head Office', 'Email', 'Karachi', '2026-08-07 21:13:00', '2026-08-08 12:50:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS.', '0.65069444444444', 'Fiber', 'Cable damage near plaza', 'Ticket: TKT-2026-0181 | Connection: Feroze1888 Mills, K&N\'s Centre, 160 Shahra-e-Faisal, | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(23, 'Tickets', 'Gaditek Association (pvt) Limited.', 'Portal', 'Karachi', '2026-08-07 21:13:00', '2026-08-08 12:56:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS.', '0.65486111111111', 'Fiber', 'Cable damage near plaza', 'Ticket: TKT-2026-0182 | Connection: 141-D Allama Iqbal Road, Block 2, PECHS | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(24, 'Tickets', 'ARY Films and Production', 'Email', 'Karachi', '2026-08-07 11:29:00', '2026-08-07 16:02:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.18958333333333', 'Fiber', 'fiber cut due to excavation work', 'Ticket: TKT-2026-0180 | Connection: Site Area | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(25, 'Tickets', 'Feroze 1888 Mills Limited C-3 Aggregation', 'Email', 'Karachi', '2026-08-07 11:13:00', '2026-08-07 16:02:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.20069444444444', 'Fiber', 'fiber cut due to excavation work', 'Ticket: TKT-2026-0179 | Connection: Link #883 | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(26, 'Tickets', 'Food Links Site Area (Divine Foods)', 'Email', 'Karachi', '2026-08-07 09:57:00', '2026-08-07 16:02:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.25347222222222', 'Fiber', 'fiber cut due to excavation work', 'Ticket: TKT-2026-0178 | Connection: F540/A, SITE Area, near Zia Mor | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(27, 'Tickets', 'Utopia Industries Pvt Ltd 4 to 6 Repeter', 'Email', 'Karachi', '2026-08-06 23:05:00', '2026-08-07 12:28:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.55763888888889', 'Equipment', 'port stuck, reset the equipment and patch refreshed.', 'Ticket: TKT-2026-0177 | Connection: Link #718 | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(28, 'Tickets', 'Gaditek Association (pvt) Limited.', 'Portal', 'Karachi', '2026-08-06 20:20:00', '2026-08-06 23:00:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.11111111111111', 'Fiber', 'Fiber Cut', 'Ticket: TKT-2026-0176 | Connection: 141-D Allama Iqbal Road, Block 2, PECHS | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(29, 'Tickets', 'Kamil Packages (SITE Area)', 'Portal', 'Karachi', '2026-08-06 16:52:00', '2026-08-06 17:41:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.034027777777778', 'No issue found', 'customer disconnected uplink of our switch / customer disconnected the uplink cable from our switch, which caused the link to go down.', 'Ticket: TKT-2026-0175 | Connection: A-70 S.I.T.E, Opp. Valika Hospital, Near METRO | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(30, 'Tickets', 'Chipa Welfare Association', 'Portal', 'Karachi', '2026-08-06 15:12:00', '2026-08-07 16:36:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Fibresh', '1 day 01:24', 'Fiber', 'Fiber Breakage', 'Ticket: TKT-2026-0174 | Connection: Link #865 | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(31, 'Tickets', 'Suparco Rs & Gis Divison', 'Email', 'Karachi', '2026-08-06 13:22:00', '2026-08-06 14:40:00', 'Link Down', 'Closed', 'Service Affecting', 'Connect', '0.054166666666667', 'Power issue node end', 'Power issue node end', 'Ticket: TKT-2026-0171 | Connection: Suparco Rd, Gulzar-e-Hijri Sachal Goth Sector 28 Gulzar E Hijri Scheme 33, Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(32, 'Tickets', 'Matrix Systems Pvt Ltd', 'WhatsApp', 'Karachi', '2026-08-06 13:02:00', '2026-08-06 14:06:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.044444444444444', 'Fiber', 'core break', 'Ticket: TKT-2026-0172 | Connection: Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(33, 'Tickets', 'Feroze 1888 Mills Limited C-3 Aggregation', 'Portal', 'Karachi', '2026-08-06 11:58:00', '2026-08-06 13:37:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.06875', 'fiber', 'fiber cut', 'Ticket: TKT-2026-0173 | Connection: Link #883 | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(34, 'Tickets', 'Stahl Pakistan', 'Email', 'Karachi', '2026-08-05 14:49:00', '2026-08-05 20:35:00', 'Link Down', 'Closed', 'Service Affecting', 'GCS', '0.24027777777778', 'Fiber', 'services were shifted to tertiary path as a fallback. However, tertiary path is also currently down, resulting in service outage.', 'Ticket: TKT-2026-0166 | Connection: Saggian by-pass road- Lahore Pakistan | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(35, 'Tickets', 'SARWAT CONVERTER (PVT) LTD', 'WhatsApp', 'Karachi', '2026-08-05 14:22:00', '2026-08-08 20:18:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '3 days 05:56', 'Fiber', 'Fiber Cut', 'Ticket: TKT-2026-0167 | Connection: Link #810 | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(36, 'Tickets', 'Telecard- Alamgir Welfare', 'Email', 'Karachi', '2026-08-05 11:57:00', '2026-08-05 12:32:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.024305555555556', 'Customer', 'customer end device is showing powered off', 'Ticket: TKT-2026-0165 | Connection: 7 floor world Trade Center 10 Khayaban-e-Roomi.Clifton Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(37, 'Tickets', 'Assurety Consulting Pvt Ltd', 'WhatsApp', 'Karachi', '2026-08-05 10:36:00', '2026-08-05 13:30:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.12083333333333', 'Fiber', '40 meter 4 core 2 joined box', 'Ticket: TKT-2026-0162 | Connection: Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(38, 'Tickets', 'Gerrys Leisure (Costa Coffee) -khi- tipu sultan road', 'Portal', 'Karachi', '2026-08-05 10:36:00', '2026-08-05 13:30:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.12083333333333', 'Fiber', '40 meter 4 core 2 joined box', 'Ticket: TKT-2026-0163 | Connection: 1A Tipu Sultan Rd, Karachi Memon Co-operative Housing Society Jinnah Housing Society P.E.C.H.S., Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(39, 'Tickets', 'Abacus', 'Portal', 'Karachi', '2026-08-05 10:36:00', '2026-08-05 13:30:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.12083333333333', 'Fiber', '40 meter 4 core 2 joined box', 'Ticket: TKT-2026-0164 | Connection: 3rd Floor, Citi Towers, 33-A Shahra-e-Faisal, Block-6 P.E.C.H.S | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(40, 'Tickets', 'Stahl Pakistan', 'Email', 'Karachi', '2026-08-05 08:47:00', '2026-08-05 13:22:00', 'Link Down', 'Closed', 'Service Affecting', 'GCS', '0.19097222222222', 'Fiber', 'as per GCS our primary and backup aggregation links went down , due to which the services were shifted to the tertiary path.', 'Ticket: TKT-2026-0161 | Connection: Saggian by-pass road- Lahore Pakistan | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(41, 'Tickets', 'Zara Mobility', 'Portal', 'Karachi', '2026-08-04 09:56:00', '2026-08-04 13:31:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'SES', '0.14930555555556', 'Fiber', 'Shoot fiber was broken', 'Ticket: TKT-2026-0159 | Connection: 42 block-6 PECHS | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(42, 'Tickets', 'Utopia Industries (Private) Ltd', 'Portal', 'Karachi', '2026-08-04 09:14:00', '2026-08-04 17:20:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'logon', '0.3375', 'Fiber', 'due to fiber cut caused by ongoing excavation work', 'Ticket: TKT-2026-0158 | Connection: HEAD OFFICE. Plot # Z-63 S.I.T.E Super Highway Phase II Karachi, | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(43, 'Tickets', 'Feroze 1888 Mills Limited C-3 Aggregation', 'Email', 'Karachi', '2026-08-03 13:40:00', '2026-08-03 15:06:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.059722222222222', 'Customer', 'some one has removed power cord at POP', 'Ticket: TKT-2026-0157 | Connection: Link #883 | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(44, 'Tickets', 'Telecard-jilani flexible', 'Portal', 'Karachi', '2026-08-03 11:15:00', '2026-08-03 15:36:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.18125', 'Equipment', 'some one has removed power cord at POP', 'Ticket: TKT-2026-0155 | Connection: Shed no 4,plot # F-202 SITE Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(45, 'Tickets', 'Western Textile Pvt Ltd', 'Call', 'Karachi', '2026-08-03 10:52:00', '2026-08-03 14:21:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.14513888888889', 'Fiber', 'Western all linkns restore Rfo fiber break 40 mtr 2 core 3 joint box use', 'Ticket: TKT-2026-0154 | Connection: Plot No E, 11, Sindh Industrial Trading Estate | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(46, 'Tickets', 'PACC (Liaquat Library)', 'Portal', 'Karachi', '2026-08-03 09:45:00', '2026-08-03 22:00:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Fibresh', '0.51041666666667', 'No issue found', 'as per fiberish No activity performed from our end', 'Ticket: TKT-2026-0153 | Connection: Liquat National hospital | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(47, 'Tickets', 'Dynamic Shipping', 'Call', 'Karachi', '2026-08-03 09:30:00', '2026-08-03 13:00:00', 'Slow Browsing', 'Closed', 'Service Affecting', 'Gerrys', '0.14583333333333', '—', 'client\'s IT person was unavailable from 9:30 AM to 1:00 PM, which caused the delay in troubleshooting . Client was checking the link on wi-fi but when he connected it to LAN required bandwidth had been received', 'Ticket: TKT-2026-0152 | Connection: Plot No W 2 /1/152 /153 port Qasim | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(48, 'Tickets', 'Feroze 1888 Mills Limited S-81 Hub Choki', 'Email', 'Karachi', '2026-08-03 09:25:00', '2026-08-03 13:11:00', 'Link Down', 'Closed', 'Service Affecting', 'Absolute', '0.15694444444444', 'Radio', 'frequency interferrence', 'Ticket: TKT-2026-0151 | Connection: Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(49, 'Tickets', 'Telecard- Alamgir Welfare', 'Email', 'Karachi', '2026-08-03 00:32:00', '2026-08-03 00:32:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '12 days 15:09', 'Customer', 'We are not receiving the MAC from client end. link restored after reconnect the Ethernet cable', 'Ticket: TKT-2026-0156 | Connection: 7 floor world Trade Center 10 Khayaban-e-Roomi.Clifton Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(50, 'Tickets', 'Wali House (AWM)', 'WhatsApp', 'Karachi', '2026-08-02 16:25:00', '2026-08-02 17:15:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.034722222222222', '—', 'due to cable issue on lift room side', 'Ticket: TKT-2026-0150 | Connection: Nil | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(51, 'Tickets', 'Sharptel- Afroz Textile', 'Email', 'Karachi', '2026-08-01 08:18:00', '2026-08-01 13:18:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.20833333333333', 'Equipment', 'Sharptel device is fault already informed to sharptel for device replacement', 'Ticket: TKT-2026-0149 | Connection: CA scheen 33 site karachi motorway | Created By: Manzar Akbar', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(52, 'Tickets', 'Feroze 1888 Mills Limited S-81 Hub Choki', 'Email', 'Karachi', '2026-07-28 14:32:00', '2026-07-28 14:32:00', 'Link Down', 'Closed', 'Service Affecting', 'Absolute', '18 days 01:09', '—', '—', 'Ticket: TKT-2026-0142 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(53, 'Tickets', 'Utopia Industries Pvt Ltd 4 to 6 Repeter', 'Portal', 'Karachi', '2026-07-28 13:34:00', '2026-07-28 16:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.10138888888889', '—', 'IDU Burn', 'Ticket: TKT-2026-0143 | Connection: Link #718 | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(54, 'Tickets', 'Chipa Welfare Association', 'Portal', 'Karachi', '2026-07-27 11:28:00', '2026-07-27 15:05:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS.', '0.15069444444444', '—', 'Client\'s Internal cable damage', 'Ticket: TKT-2026-0141 | Connection: Link #865 | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(55, 'Tickets', 'Sharptel- Afroz Textile', 'Email', 'Karachi', '2026-07-26 19:38:00', '2026-07-27 15:37:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.83263888888889', '—', 'device reset', 'Ticket: TKT-2026-0139 | Connection: CA scheen 33 site karachi motorway | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(56, 'Tickets', 'Telecard Limited Enterprise Communication Solution (K Electric Call Center)', 'Email', 'Karachi', '2026-07-25 03:34:00', '2026-07-25 17:35:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.58402777777778', '—', 'faulty device replaced at Node end.', 'Ticket: TKT-2026-0140 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(57, 'Tickets', 'Gaditek Association (pvt) Limited.', 'Portal', 'Karachi', '2026-07-24 15:36:00', '2026-07-24 17:08:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS.', '0.063888888888889', '—', 'fiber was in preasure.', 'Ticket: TKT-2026-0138 | Connection: 141-D Allama Iqbal Road, Block 2, PECHS | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(58, 'Tickets', 'PACC (Liaquat Library)', 'Portal', 'Karachi', '2026-07-23 17:15:00', '2026-07-30 14:30:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Fibresh', '6 days 21:15', '—', '—', 'Ticket: TKT-2026-0137 | Connection: Liquat National hospital | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(59, 'Tickets', 'Chipa Welfare Association', 'Portal', 'Karachi', '2026-07-23 13:52:00', '2026-07-23 14:02:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS.', '0.0069444444444444', 'fiber break', 'fiber break at multiple locations', 'Ticket: TKT-2026-0136 | Connection: Link #865 | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(60, 'Tickets', 'Al Momin', 'Call', 'Karachi', '2026-07-22 14:25:00', '2026-07-22 17:28:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.12708333333333', 'equipment malfunctioned which has been replaced', 'Device faulty', 'Ticket: TKT-2026-0134 | Connection: A-17 north west industrial zone port qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(61, 'Tickets', 'Oberthur (Idemia) Technologies Pakistan (pvt.) Ltd.', 'Portal', 'Karachi', '2026-07-22 12:02:00', '2026-07-22 12:55:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Connect', '0.036805555555556', 'Fiber cut', 'RFO :  Underground Fiber Cut', 'Ticket: TKT-2026-0132 | Connection: Plot 189, Mehran Town Sector 23 Korangi, Karachi, | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(62, 'Tickets', 'Feroze 1888 Mills Limited C-3 Aggregation', 'Email', 'Karachi', '2026-07-22 10:32:00', '2026-07-22 21:55:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.47430555555556', 'fiber break', 'cable was damaged near Tibet Center during excavation work', 'Ticket: TKT-2026-0133 | Connection: Link #883 | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(63, 'Tickets', 'Gaditek Association (pvt) Limited.', 'Portal', 'Karachi', '2026-07-21 13:24:00', '2026-07-21 15:06:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS.', '0.070833333333333', 'fiber break', 'Feeder cable cut', 'Ticket: TKT-2026-0131 | Connection: 141-D Allama Iqbal Road, Block 2, PECHS | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(64, 'Tickets', 'IFI Logistics and Services Pvt Ltd', 'Call', 'Karachi', '2026-07-21 10:45:00', '2026-07-21 10:45:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '25 days 04:56', '—', 'No issue found from our end', 'Ticket: TKT-2026-0130 | Connection: Port Qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(65, 'Tickets', 'GENERAL TYRE AND RUBBER COMPANY', 'Email', 'Karachi', '2026-07-21 09:52:00', '2026-07-21 13:04:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.13333333333333', 'fiber break', 'Cable was found damaged near murghi Khana bridge', 'Ticket: TKT-2026-0129 | Connection: Gujro Zone B, | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(66, 'Tickets', 'Magnacreate', 'Email', 'Karachi', '2026-07-21 09:24:00', '2026-07-21 13:04:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.15277777777778', 'fiber break', 'Cable was found damaged near murghi Khana bridge', 'Ticket: TKT-2026-0128 | Connection: Office No. 218, 2nd Floor, The Plaza Plot No. G-7 Block 9, Near II Talwar Clifton, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(67, 'Tickets', 'Feroze 1888 Mills Limited H-23 Landhi to SITE Area', 'Email', 'Karachi', '2026-07-21 09:20:00', '2026-07-21 13:04:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.15555555555556', 'fiber break', 'Cable was found damaged near murghi Khana bridge', 'Ticket: TKT-2026-0127 | Connection: H-23 YB Chowrangi Flyover, Landhi Town, | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(68, 'Tickets', 'Bari Fatani (Eureka)', 'Email', 'Karachi', '2026-07-21 09:13:00', '2026-07-21 13:04:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.16041666666667', 'fiber break', 'Cable was found damaged near murghi Khana bridge', 'Ticket: TKT-2026-0125 | Connection: National Hihway, Super Highway, Link Road, Bin Qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(69, 'Tickets', 'EUREKA NET  DWP Digital World Pakistan', 'Email', 'Karachi', '2026-07-21 09:08:00', '2026-07-21 13:04:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.16388888888889', 'fiber break', 'Cable was found damaged near murghi Khana bridge', 'Ticket: TKT-2026-0126 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(70, 'Tickets', 'Faisalabad Oil Refinery', 'Email', 'Karachi', '2026-07-20 09:51:00', '2026-07-20 15:29:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.23472222222222', '—', 'Link has been restored after change the switch port.', 'Ticket: TKT-2026-0123 | Connection: North Western Industrial Zone Port Qasim Authority | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(71, 'Tickets', 'Chipa Welfare Association', 'Portal', 'Karachi', '2026-07-20 09:47:00', '2026-07-20 14:55:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Fibresh', '0.21388888888889', 'fiber break', '—', 'Ticket: TKT-2026-0124 | Connection: Link #865 | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(72, 'Tickets', 'Movenpick Hotel Karachi', 'Portal', 'Karachi', '2026-07-20 09:10:00', '2026-07-20 11:04:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.079166666666667', 'Fiber cut', 'OFC Breakage Restored', 'Ticket: TKT-2026-0122 | Connection: Club Rd, Civil Lines | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(73, 'Tickets', 'PC HOTEL', 'Email', 'Karachi', '2026-07-20 09:09:00', '2026-07-20 11:04:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.079861111111111', 'Fiber Cut', 'OFC Breakage restored', 'Ticket: TKT-2026-0121 | Connection: Club Rd، opposite PIDC, Civil Lines, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(74, 'Tickets', 'kamil converter -Ahsanabad unit 2', 'Portal', 'Karachi', '2026-07-17 12:18:00', '2026-07-17 18:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.2375', 'Radio', 'link was restored after upgrading the firmware.', 'Ticket: TKT-2026-0120 | Connection: Maymar industrial area | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(75, 'Tickets', 'Feroze 1888 Mills Limited Head Office', 'Email', 'Karachi', '2026-07-16 16:16:00', '2026-07-18 01:20:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '1 day 09:04', 'fiber break', 'PFC Breakage', 'Ticket: TKT-2026-0119 | Connection: Feroze1888 Mills, K&N\'s Centre, 160 Shahra-e-Faisal, | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(76, 'Tickets', 'Hub Leather', 'Call', 'Karachi', '2026-07-16 15:14:00', '2026-07-16 16:24:00', 'Link Down', 'Closed', 'Service Affecting', 'Absolute', '0.048611111111111', '—', 'Power outage at pop end.', 'Ticket: TKT-2026-0118 | Connection: Plot No. 74 Sector 7 A Korangi Industrial Area Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(77, 'Tickets', 'Zara Mobility- khadda market', 'Portal', 'Karachi', '2026-07-16 11:29:00', '2026-07-16 12:20:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS.', '0.035416666666667', 'fiber break', 'CITS. team did not perform any activity', 'Ticket: TKT-2026-0117 | Connection: 42 block-6 PECHS | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(78, 'Tickets', 'kutiyana memon hospital', 'Portal', 'Karachi', '2026-07-16 10:01:00', '2026-07-16 13:05:00', 'Link Down', 'Closed', 'Service Affecting', 'Fibresh', '0.12777777777778', '—', 'outage occurred due to power failure at POP end.', 'Ticket: TKT-2026-0116 | Connection: Nawab Mahabat Khanji Rd, Kharadar Ghulam Hussain Kasim Quarters, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(79, 'Tickets', 'Lucky Textie Mills Ltd', 'WhatsApp', 'Karachi', '2026-07-16 09:10:00', '2026-07-24 19:55:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '8 days 10:45', 'fiber break', '230 meters fiber cut at Lucky Site, 3 joined box used in restoration.', 'Ticket: TKT-2026-0115 | Connection: A-8/C SITE Area Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(80, 'Tickets', 'Kompass Pakistan Link2 PQ-POP', 'Email', 'Karachi', '2026-07-15 12:47:00', '2026-07-15 14:58:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.090972222222222', '—', '5-meter patch was damaged due to construction of work, team replaced the faulty patch', 'Ticket: TKT-2026-0114 | Connection: F-37, North Western Ind. Zone، Port Qasim Authority, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(81, 'Tickets', 'NETSOL CONNECT/SANA SAFINA', 'Email', 'Karachi', '2026-07-15 09:24:00', '2026-07-15 12:15:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.11875', '—', 'issue identified due to faulty tower cable which has been replaced at Gerrys end', 'Ticket: TKT-2026-0112 | Connection: Link #904 | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(82, 'Tickets', 'Gandhara Automoblies', 'Email', 'Karachi', '2026-07-15 08:33:00', '2026-07-17 17:01:00', 'Bandwidth', 'Closed', 'Service Affecting', 'Gerrys', '2 days 08:28', '—', 'after installation of 4 port Hub requested throughput received', 'Ticket: TKT-2026-0113 | Connection: Port Qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(83, 'Tickets', 'Movenpick Hotel Karachi', 'Portal', 'Karachi', '2026-07-13 11:56:00', '2026-07-13 13:15:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.054861111111111', '—', 'Core was broken', 'Ticket: TKT-2026-0110 | Connection: Club Rd, Civil Lines | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(84, 'Tickets', 'Oberthur (Idemia) Technologies Pakistan (pvt.) Ltd.', 'Email', 'Karachi', '2026-07-13 10:56:00', '2026-07-15 16:11:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Fibresh', '2 days 05:15', 'fiber break', 'Outage has occurred due to dual fiber cut on Korangi route', 'Ticket: TKT-2026-0108 | Connection: Plot 189, Mehran Town Sector 23 Korangi, Karachi, | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(85, 'Tickets', 'EUREKA NET  DWP Digital World Pakistan', 'Email', 'Karachi', '2026-07-13 10:52:00', '2026-07-13 20:58:00', 'Packet Loss', 'Closed', 'Service Affecting', 'Gerrys', '0.42083333333333', '—', 'Link affected due to Satcomm\'s fiber down', 'Ticket: TKT-2026-0109 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(86, 'Tickets', 'Al Momin', 'Email', 'Karachi', '2026-07-13 09:51:00', '2026-07-13 12:48:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.12291666666667', '—', 'Kompass backhaul 1 port no.42 Kompass backhaul 2 port no.40 switch ports were faulty', 'Ticket: TKT-2026-0111 | Connection: A-17 north west industrial zone port qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(87, 'Tickets', 'Kompass Pakistan Link 1 GT-POP', 'Email', 'Karachi', '2026-07-13 09:35:00', '2026-07-13 11:09:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.065277777777778', '—', 'issue was traced to a faulty LAN patch cable which has been replaced by client', 'Ticket: TKT-2026-0107 | Connection: F-37, North Western Ind. Zone، Port Qasim Authority, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(88, 'Tickets', 'Muno pakistan', 'Email', 'Karachi', '2026-07-13 09:24:00', '2026-07-13 12:10:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.11527777777778', 'fiber break', 'Link down due to fiber cut', 'Ticket: TKT-2026-0106 | Connection: Plot 141 Sector 28 Korangi industerial | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(89, 'Tickets', 'Lucky Kathore', 'Email', 'Karachi', '2026-07-10 15:08:00', '2026-07-10 15:09:00', 'Bandwidth', 'Closed', 'Service Affecting', 'Gerrys', '0.00069444444444444', '—', 'Bandwidth issue has resolved after refreshing the port.', 'Ticket: TKT-2026-0105 | Connection: Link #630 | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(90, 'Tickets', 'GD Office', 'Portal', 'Karachi', '2026-07-10 12:07:00', '2026-07-10 17:02:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS..', '0.20486111111111', 'Link outage occurred due to fiber cut', '—', 'Ticket: TKT-2026-0104 | Connection: Link #890 | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(91, 'Tickets', 'Union Steel', 'Email', 'Karachi', '2026-07-09 17:02:00', '2026-07-09 19:37:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.10763888888889', 'fiber break', 'link went down due to fiber cut. Affected fiber was restored by using one joint box', 'Ticket: TKT-2026-0103 | Connection: D-36 Manghopir Rd, Metroville Sindh Industrial Trading Estate, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(92, 'Tickets', 'Postex Quetta Town VLAN 1936 Corporate Courier', 'WhatsApp', 'Karachi', '2026-07-09 16:06:00', '2026-07-09 18:13:00', 'Link Down', 'Closed', 'Service Affecting', 'Fibresh', '0.088194444444444', '—', 'pigtail found damaged at POP end', 'Ticket: TKT-2026-0102 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(93, 'Tickets', 'Chipa Trust Authority', 'Call', 'Karachi', '2026-07-08 18:19:00', '2026-07-10 14:13:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Absolute', '1 day 19:54', 'awaited at Absolute\'s end.', '—', 'Ticket: TKT-2026-0101 | Connection: Opp. FTC Bridge Shahrah e Faisal | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(94, 'Tickets', 'Muno pakistan', 'Portal', 'Karachi', '2026-07-08 11:52:00', '2026-07-08 13:06:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.051388888888889', 'fiber break', 'Link down due to fiber cut.', 'Ticket: TKT-2026-0099 | Connection: Plot 141 Sector 28 Korangi industerial | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(95, 'Tickets', 'Union Steel', 'Email', 'Karachi', '2026-07-08 11:14:00', '2026-07-08 11:25:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.0076388888888889', 'Radio', 'port stuck, Firmware has been upgraded.', 'Ticket: TKT-2026-0098 | Connection: D-36 Manghopir Rd, Metroville Sindh Industrial Trading Estate, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(96, 'Tickets', 'comstar link 2', 'Email', 'Karachi', '2026-07-03 22:43:00', '2026-07-07 17:30:00', 'Other', 'Closed', 'Service Affecting', 'Gerrys', '3 days 18:47', 'Media Converter has been replaced at client end.', 'equipment malfunctioned which has been replaced .', 'Ticket: TKT-2026-0097 | Connection: 3rd floor ILLACO House,Abdullah Haroon road saddar,Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(97, 'Tickets', 'Lucky Kathore', 'Email', 'Karachi', '2026-07-02 11:35:00', '2026-07-02 11:35:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '44 days 04:06', '—', 'Link is up and no issue observed from our end.', 'Ticket: TKT-2026-0095 | Connection: Link #630 | Created By: Sumaira Ansari', '2026-08-16 10:48:12', '2026-08-16 10:48:12'),
(98, 'Tickets', 'Utopia Industries Pvt Ltd Head Office', 'Portal', 'Karachi', '2026-07-02 11:12:00', '2026-07-02 15:08:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'logon', '0.16388888888889', 'Fiber cut', 'T-joint was Refreshed', 'Ticket: TKT-2026-0096 | Connection: HEAD OFFICE. Plot # Z-63 S.I.T.E Super Highway Phase II Karachi, | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(99, 'Tickets', 'Rasheed Enterprise', 'Call', 'Karachi', '2026-07-01 17:28:00', '2026-07-02 19:48:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Satcom', '1 day 02:20', 'Fiber', 'RFO: OFC was break at 60M', 'Ticket: TKT-2026-0094 | Connection: F-259, Rasheedabad Sindh Industrial Trading Estate, Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(100, 'Tickets', 'Postex kalaboard Shadman', 'WhatsApp', 'Karachi', '2026-07-01 11:42:00', '2026-07-01 12:27:00', 'Link Down', 'Closed', 'Service Affecting', 'Fibresh', '0.03125', '—', 'as per fiberish team no activity performed from our end.', 'Ticket: TKT-2026-0093 | Connection: Millat Garden road,Block A Malir Ghazi Dawood Brohi Goth Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(101, 'Tickets', 'Zill Pvt Ltd (khi)', 'Portal', 'Karachi', '2026-07-01 09:35:00', '2026-07-01 11:44:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.089583333333333', 'fiber break', '—', 'Ticket: TKT-2026-0091 | Connection: Ground Floor, Bahria Complex III, Moulvi Tamizuddin Khan Rd, | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(102, 'Tickets', 'Utopia Industries Pvt Ltd Head Office', 'Portal', 'Karachi', '2026-07-01 08:18:00', '2026-07-01 16:16:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'logon', '0.33194444444444', 'fiber break', 'RFO: The main fiber was damaged at multiple locations.', 'Ticket: TKT-2026-0092 | Connection: HEAD OFFICE. Plot # Z-63 S.I.T.E Super Highway Phase II Karachi, | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(103, 'Tickets', 'HRSG Outsourcing', 'Email', 'Karachi', '2026-06-29 19:11:00', NULL, 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '46 days 20:30', 'Equipment', 'adapter issue', 'Ticket: TKT-2026-0090 | Connection: HRSG House, 46-D Street No. 46, off Shahra-e-Faisal, Block 6 P.E.C.H.S | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(104, 'Tickets', 'Pak Petro Chemical Industries port qasim Link 1', 'Call', 'Karachi', '2026-06-29 11:15:00', '2026-06-29 11:15:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '47 days 04:26', '—', 'No issue observed from our end.', 'Ticket: TKT-2026-0088 | Connection: Link #660 | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(105, 'Tickets', 'OF Logistix Pvt ltd', 'Call', 'Karachi', '2026-06-29 10:15:00', '2026-06-29 10:39:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.016666666666667', '—', 'We performed link testing with customer at his premises. During testing no issues were observed from our end,', 'Ticket: TKT-2026-0087 | Connection: Office No. 104, 1st Floor, Shafi Court, Merewether Rd, off Club Road, Civil Lines, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(106, 'Tickets', 'Saudi Pak Insurance', 'Portal', 'Karachi', '2026-06-29 10:00:00', '2026-06-29 14:20:00', 'Slow Browsing', 'Closed', 'Service Affecting', 'Gerrys', '0.18055555555556', 'Equipment', 'media converter found hang', 'Ticket: TKT-2026-0089 | Connection: 2nd Floor. State Life Building No. 2A, Wallace Road | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(107, 'Tickets', 'Matrix Systems Pvt Ltd', 'Email', 'Karachi', '2026-06-29 05:23:00', '2026-06-29 12:40:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.30347222222222', 'Fiber', 'iber found break 66 mtr 2 core or one joint box use', 'Ticket: TKT-2026-0085 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(108, 'Tickets', 'Zara Mobility', 'Portal', 'Karachi', '2026-06-28 14:55:00', '2026-06-29 12:16:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Satcom', '0.88958333333333', 'fiber break', 'Underground OFC core was damaged at the length of 5100m.', 'Ticket: TKT-2026-0084 | Connection: 42 block-6 PECHS | Created By: Manzar Akbar', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(109, 'Tickets', 'Kaizen Paints', 'WhatsApp', 'Karachi', '2026-06-27 10:47:00', '2026-06-29 12:30:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '2 days 01:43', '—', 'Radio | Tower cable has been changed', 'Ticket: TKT-2026-0083 | Connection: Karachi | Created By: Manzar Akbar', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(110, 'Tickets', 'Telecard Limited Enterprise Communication Solution (Vital Pakistan Trust Gadap Town)', 'Email', 'Karachi', '2026-06-24 13:29:00', '2026-06-24 13:29:00', 'Packet Loss', 'Closed', 'Service Affecting', 'Gerrys', '52 days 02:12', '—', 'no issue found', 'Ticket: TKT-2026-0082 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(111, 'Tickets', 'Optimize Engineering Core Pvt Ltd OEC', 'Email', 'Karachi', '2026-06-24 12:08:00', '2026-06-24 12:08:00', 'Packet Loss', 'Closed', 'Service Affecting', 'Gerrys', '52 days 03:33', '—', 'No issue has been observed from our end', 'Ticket: TKT-2026-0079 | Connection: Port Qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(112, 'Tickets', 'Dhl Global Forwarding', 'Call', 'Karachi', '2026-06-24 11:34:00', '2026-06-24 11:34:00', 'Slow Browsing', 'Closed', 'Service Affecting', 'Gerrys', '52 days 04:07', '—', 'No issue found from our end.', 'Ticket: TKT-2026-0080 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(113, 'Tickets', 'Utopia Industries Pvt Ltd 4 to 6 Repeter', 'Email', 'Karachi', '2026-06-24 11:32:00', '2026-07-03 18:50:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '9 days 07:18', 'equipment malfunctioned which has been replaced', 'equipment malfunctioned which needs to be replaced', 'Ticket: TKT-2026-0078 | Connection: Link #718 | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(114, 'Tickets', 'BCD Travel forum Mall', 'Portal', 'Karachi', '2026-06-23 12:39:00', '2026-06-23 14:38:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.082638888888889', 'fiber break', 'Fiber cut has been identified as the root cause of the issue', 'Ticket: TKT-2026-0075 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(115, 'Tickets', 'Dynamic Shipping', 'Call', 'Karachi', '2026-06-23 12:30:00', '2026-06-23 16:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.14583333333333', 'Radio', 'Link affected due to Frequency Allocation Board (FAB) and Pakistan Telecommunication Authority (PTA) joint link testing activity at POP end', 'Ticket: TKT-2026-0074 | Connection: Plot No W 2 /1/152 /153 port Qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(116, 'Tickets', 'Pak Petro Chemical Industries Link 2', 'Email', 'Karachi', '2026-06-23 11:57:00', '2026-06-23 16:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.16875', 'Radio', 'Link affected due to Frequency Allocation Board (FAB) and Pakistan Telecommunication Authority (PTA) joint link testing activity at POP end', 'Ticket: TKT-2026-0073 | Connection: Survey No. 136, Polymer House, Main N-5, Zafar Town Landhi Town, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(117, 'Tickets', 'zafa to b21 data / Internet', 'WhatsApp', 'Karachi', '2026-06-23 11:50:00', '2026-06-23 13:19:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.061805555555556', 'fiber break', 'Link down due to fiber cut', 'Ticket: TKT-2026-0076 | Connection: L/1 B, Sohrab Goth Flyover, Federal B Area Block 21 Industrial Area, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(118, 'Tickets', 'Dhl Global Forwarding', 'Call', 'Karachi', '2026-06-23 11:47:00', '2026-06-23 16:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.17569444444444', 'Radio', 'Link affected due to Frequency Allocation Board (FAB) and Pakistan Telecommunication Authority (PTA) joint link testing activity at POP end', 'Ticket: TKT-2026-0072 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(119, 'Tickets', 'Optimize Engineering Core Pvt Ltd OEC', 'Email', 'Karachi', '2026-06-23 11:34:00', '2026-06-23 16:00:00', 'Packet Loss', 'Closed', 'Service Affecting', 'Gerrys', '0.18472222222222', 'Radio', 'Link affected due to Frequency Allocation Board (FAB) and Pakistan Telecommunication Authority (PTA) joint link testing activity at POP end', 'Ticket: TKT-2026-0069 | Connection: Port Qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(120, 'Tickets', 'Pakistan Tanker', 'Call', 'Karachi', '2026-06-23 11:34:00', '2026-06-23 16:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.18472222222222', 'Radio', 'Link affected due to Frequency Allocation Board (FAB) and Pakistan Telecommunication Authority (PTA) joint link testing activity at POP end', 'Ticket: TKT-2026-0070 | Connection: Plot # W2/1/140, 141 Port Qasim, Bin Qasim Town, | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(121, 'Tickets', 'Al Momin', 'Call', 'Karachi', '2026-06-23 11:34:00', '2026-06-23 16:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.18472222222222', 'Radio', 'Link affected due to Frequency Allocation Board (FAB) and Pakistan Telecommunication Authority (PTA) joint link testing activity at POP end', 'Ticket: TKT-2026-0071 | Connection: A-17 north west industrial zone port qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(122, 'Tickets', 'PACC (Liaquat Library)', 'WhatsApp', 'Karachi', '2026-06-23 09:42:00', '2026-06-23 09:50:00', 'Link Down', 'Closed', 'Service Affecting', 'Fibresh', '0.0055555555555556', '—', 'link came up automatically, and no activity was performed from Fiberish end.', 'Ticket: TKT-2026-0067 | Connection: Liquat National hospital | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(123, 'Tickets', 'OF Logistix Pvt ltd', 'Call', 'Karachi', '2026-06-23 09:15:00', '2026-06-23 09:15:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '53 days 06:26', '—', 'After thorough inspection, it was found that LAN cable was unplugged at client end', 'Ticket: TKT-2026-0068 | Connection: Office No. 104, 1st Floor, Shafi Court, Merewether Rd, off Club Road, Civil Lines, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(124, 'Tickets', 'Kompass Pakistan Link 1 GT-POP', 'Email', 'Karachi', '2026-06-23 02:19:00', '2026-06-23 16:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.57013888888889', 'Radio', 'link was affected due to joint testing activity conducted by  Frequency Allocation Board (FAB) and Pakistan Telecommunication Authority (PTA) at POP end.', 'Ticket: TKT-2026-0077 | Connection: F-37, North Western Ind. Zone، Port Qasim Authority, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13');
INSERT INTO `complaints` (`id`, `source_sheet`, `customer_name`, `complaint_channel`, `main_city`, `opened_at`, `closed_at`, `issue`, `status`, `affect`, `owner`, `aging_downtime`, `rfo`, `rca`, `update_log`, `created_at`, `updated_at`) VALUES
(125, 'Tickets', 'Pakistan Tanker', 'Portal', 'Karachi', '2026-06-22 12:06:00', '2026-06-22 12:06:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '54 days 03:35', '—', 'no issue observed from our end', 'Ticket: TKT-2026-0066 | Connection: Plot # W2/1/140, 141 Port Qasim, Bin Qasim Town, | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(126, 'Tickets', 'Amarant Pharma', 'Portal', 'Karachi', '2026-06-22 08:35:00', '2026-06-22 09:14:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.027083333333333', 'Radio', 'Link has been restored after fine tuning.', 'Ticket: TKT-2026-0065 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(127, 'Tickets', 'Wali House (AWM)', 'Portal', 'Karachi', '2026-06-22 03:48:00', '2026-06-22 05:12:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'SES', '0.058333333333333', 'fiber break', 'Link down due to fiber cut', 'Ticket: TKT-2026-0064 | Connection: Nil | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(128, 'Tickets', 'Telecard- Alamgir Welfare', 'Email', 'Karachi', '2026-06-21 18:48:00', '2026-06-21 20:22:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.065277777777778', '—', 'Link restored after device rebooted', 'Ticket: TKT-2026-0063 | Connection: 7 floor world Trade Center 10 Khayaban-e-Roomi.Clifton Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(129, 'Tickets', 'Utopia Industries (Private) Ltd', 'Portal', 'Karachi', '2026-06-21 10:03:00', '2026-06-21 10:46:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.029861111111111', '—', 'switch was rebooted', 'Ticket: TKT-2026-0062 | Connection: HEAD OFFICE. Plot # Z-63 S.I.T.E Super Highway Phase II Karachi, | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(130, 'Tickets', 'Muno pakistan', 'Email', 'Karachi', '2026-06-19 15:51:00', '2026-06-22 12:51:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '2 days 21:00', 'fiber break', 'outage occurred due to fiber core break at multiple joints', 'Ticket: TKT-2026-0061 | Connection: Plot 141 Sector 28 Korangi industerial | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(131, 'Tickets', 'Zil Limited (HYD)', 'Email', 'Karachi', '2026-06-19 15:47:00', '2026-06-19 16:25:00', 'Packet Loss', 'Closed', 'Service Affecting', 'Gerrys', '0.026388888888889', 'Radio', '—', 'Ticket: TKT-2026-0060 | Connection: Link #761 | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(132, 'Tickets', 'Suparco Hq Communication Section', 'Call', 'Karachi', '2026-06-19 15:00:00', '2026-06-19 18:55:00', 'Link Down', 'Closed', 'Service Affecting', 'Connect', '0.16319444444444', 'fiber break', 'fiber cable infrastructure has been damaged at multiple locations due to the ongoing BRT project', 'Ticket: TKT-2026-0059 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(133, 'Tickets', 'Younus Textile Mills Limited Weaving Department, Unit 07', 'Call', 'Karachi', '2026-06-19 13:35:00', '2026-06-19 13:35:00', 'Other', 'Closed', 'Service Affecting', 'Gerrys', '57 days 02:06', '—', '—', 'Ticket: TKT-2026-0058 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(134, 'Tickets', 'transworld Abbot korangi (Expereo)', 'Email', 'Karachi', '2026-06-19 10:28:00', '2026-06-19 16:10:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.2375', 'Radio', '—', 'Ticket: TKT-2026-0057 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(135, 'Tickets', 'Wali House (AWM)', 'Portal', 'Karachi', '2026-06-19 10:00:00', '2026-06-20 02:36:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS.', '0.69166666666667', 'fiber break', 'Link was down due to fiber cut.', 'Ticket: TKT-2026-0056 | Connection: Nil | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(136, 'Tickets', 'Ema Shipping Agencies', 'Portal', 'Karachi', '2026-06-19 09:49:00', '2026-06-20 06:26:00', 'Link Down', 'Closed', 'Service Affecting', 'RDS', '0.85902777777778', 'fiber break', 'Fiber cut by KMC Government authorities', 'Ticket: TKT-2026-0054 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(137, 'Tickets', 'Matrix Systems Pvt Ltd', 'Email', 'Karachi', '2026-06-19 09:42:00', '2026-06-19 13:40:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.16527777777778', '—', 'Core break.', 'Ticket: TKT-2026-0055 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(138, 'Tickets', 'Stack Lab Private Limited (creative Chaos)', 'Call', 'Karachi', '2026-06-18 20:33:00', '2026-06-18 20:33:00', 'Slow Browsing', 'Closed', 'Service Affecting', 'Gerrys', '57 days 19:08', '—', 'no issue found', 'Ticket: TKT-2026-0049 | Connection: Link #N/A | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(139, 'Tickets', 'Ema Shipping Agencies', 'Portal', 'Karachi', '2026-06-18 19:43:00', '2026-06-18 20:40:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.039583333333333', 'Fiber cut', '1 joined box', 'Ticket: TKT-2026-0050 | Connection: Link #N/A | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(140, 'Tickets', 'Umar Spinning Mills/ Pervaiz Umar Enterprises', 'Portal', 'Karachi', '2026-06-18 19:43:00', '2026-06-18 20:40:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.039583333333333', 'Fiber cut', '1 joined box', 'Ticket: TKT-2026-0051 | Connection: 101 Commerce Center, Hasrat Mohani Road Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(141, 'Tickets', 'Saudi Pak Insurance', 'Portal', 'Karachi', '2026-06-18 19:43:00', '2026-06-18 20:40:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.039583333333333', 'Fiber cut', '1 joined box', 'Ticket: TKT-2026-0052 | Connection: Link #N/A | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(142, 'Tickets', 'Pak Poly Industries (Pak Petro Kasur)', 'Call', 'Karachi', '2026-06-18 14:50:00', '2026-06-18 15:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.0069444444444444', 'Radio', 'Link is stable after fine-tuning', 'Ticket: TKT-2026-0047 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(143, 'Tickets', 'kamil converter -Ahsanabad unit 2', 'Portal', 'Karachi', '2026-06-18 11:45:00', '2026-06-18 12:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.010416666666667', 'Radio', 'Link restored after refreshing the port.', 'Ticket: TKT-2026-0048 | Connection: Maymar industrial area | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(144, 'Tickets', 'NRSP', 'Email', 'Karachi', '2026-06-18 10:15:00', '2026-06-18 14:48:00', 'Packet Loss', 'Closed', 'Service Affecting', 'Gerrys', '0.18958333333333', 'Radio', 'LAN cable at client end was faulty.', 'Ticket: TKT-2026-0046 | Connection: Link #753 | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(145, 'Tickets', 'Dynamic Shipping', 'Call', 'Karachi', '2026-06-17 19:17:00', '2026-06-18 12:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.69652777777778', 'Radio', 'device reconfigured and switch port has been changed at POP end.', 'Ticket: TKT-2026-0045 | Connection: Link #N/A | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(146, 'Tickets', 'Wali House (AWM)', 'WhatsApp', 'Karachi', '2026-06-17 06:40:00', '2026-06-17 11:00:00', 'Other', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.18055555555556', '—', '—', 'Ticket: TKT-2026-0043 | Connection: Nil | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(147, 'Tickets', 'Postex (Korangi)', 'Portal', 'Karachi', '2026-06-17 05:15:00', '2026-06-17 12:17:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.29305555555556', 'fiber break', 'Lan cable found disconnected at POP end.', 'Ticket: TKT-2026-0044 | Connection: near saylani 3 shed, Sector 5 Korangi 5, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(148, 'Tickets', 'Matrix Systems Pvt Ltd', 'Portal', 'Karachi', '2026-06-17 04:09:00', '2026-06-17 10:35:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.26805555555556', '—', '—', 'Ticket: TKT-2026-0042 | Connection: Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(149, 'Tickets', 'Sharptel -IO Digital (Data)', 'Email', 'Karachi', '2026-06-16 16:55:00', '2026-06-16 16:55:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '59 days 22:46', 'No issue found', 'No issue found', 'Ticket: TKT-2026-0041 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(150, 'Tickets', 'Bari Fatani (Eureka)', 'Email', 'Karachi', '2026-06-16 15:24:00', '2026-06-16 15:29:00', 'Latency', 'Closed', 'Service Affecting', 'Gerrys', '0.0034722222222222', 'Radio', 'issue resolved after fine tuning.', 'Ticket: TKT-2026-0040 | Connection: National Hihway, Super Highway, Link Road, Bin Qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(151, 'Tickets', 'Optimize Engineering Core Pvt Ltd OEC', 'Email', 'Karachi', '2026-06-16 13:14:00', '2026-06-16 13:55:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.028472222222222', 'Radio', 'link is affected due to RF team activity', 'Ticket: TKT-2026-0038 | Connection: Port Qasim | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(152, 'Tickets', 'SARWAT CONVERTER (PVT) LTD', 'WhatsApp', 'Karachi', '2026-06-16 12:30:00', '2026-06-16 14:31:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.084027777777778', 'fiber break', 'Link down due to fiber cut.', 'Ticket: TKT-2026-0039 | Connection: Link #810 | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(153, 'Tickets', 'Magnacreate', 'Email', 'Karachi', '2026-06-16 11:31:00', '2026-06-16 13:55:00', 'Slow Browsing', 'Closed', 'Service Affecting', 'Gerrys', '0.1', 'Radio', 'link is temporarily affected due to RF team activity.', 'Ticket: TKT-2026-0036 | Connection: Office No. 218, 2nd Floor, The Plaza Plot No. G-7 Block 9, Near II Talwar Clifton, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(154, 'Tickets', 'saakh pharma', 'Call', 'Karachi', '2026-06-16 11:25:00', '2026-06-16 13:55:00', 'Slow Browsing', 'Closed', 'Service Affecting', 'Gerrys', '0.10416666666667', 'Radio', 'link is temporarily affected due to RF team activity.', 'Ticket: TKT-2026-0035 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(155, 'Tickets', 'Kuehne & Nagel Pakistan Port Qasim( Pvt.) Ltd.', 'Call', 'Karachi', '2026-06-16 11:01:00', '2026-06-16 13:55:00', 'Slow Browsing', 'Closed', 'Service Affecting', 'Gerrys', '0.12083333333333', 'Radio', 'link is affected due to RF team activity.', 'Ticket: TKT-2026-0034 | Connection: Block 6 47-E-3, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(156, 'Tickets', 'Utopia Industries Pvt Ltd Head Office', 'Portal', 'Karachi', '2026-06-16 10:41:00', '2026-06-16 20:35:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'logon', '0.4125', 'Fiber Cut', 'Cable cut due to excavation work', 'Ticket: TKT-2026-0032 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(157, 'Tickets', 'Pak Petro Chemical Industries Link 2', 'Call', 'Karachi', '2026-06-16 10:40:00', '2026-06-16 13:55:00', 'Slow Browsing', 'Closed', 'Service Affecting', 'Gerrys', '0.13541666666667', '—', 'link is affected due to RF team activity', 'Ticket: TKT-2026-0033 | Connection: Survey No. 136, Polymer House, Main N-5, Zafar Town Landhi Town, Karachi | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(158, 'Tickets', 'Pakistan Tanker', 'Call', 'Karachi', '2026-06-16 10:30:00', '2026-06-16 13:55:00', 'Slow Browsing', 'Closed', 'Service Affecting', 'Gerrys', '0.14236111111111', '—', 'link is affected due to RF team activity.', 'Ticket: TKT-2026-0030 | Connection: Plot # W2/1/140, 141 Port Qasim, Bin Qasim Town, | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(159, 'Tickets', 'Lucky Kathore', 'Call', 'Karachi', '2026-06-16 10:30:00', '2026-06-16 13:55:00', 'Slow Browsing', 'Closed', 'Service Affecting', 'Gerrys', '0.14236111111111', '—', 'link is temporarily affected due to RF team activity', 'Ticket: TKT-2026-0031 | Connection: Link #630 | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(160, 'Tickets', 'Amarant Pharma', 'Email', 'Karachi', '2026-06-16 10:10:00', '2026-06-16 12:47:00', 'Other', 'Closed', 'Service Affecting', 'Gerrys', '0.10902777777778', 'Radio', 'bandwidth choked', 'Ticket: TKT-2026-0037 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(161, 'Tickets', 'Al Rehmat Industries', 'WhatsApp', 'Karachi', '2026-06-15 12:56:00', '2026-06-15 16:15:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.13819444444444', 'fiber break', 'service interruption occurred due to damage at 160-meter 4 core', 'Ticket: TKT-2026-0029 | Connection: Link #N/A | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(162, 'Tickets', 'zafa to b21 data / Internet', 'WhatsApp', 'Karachi', '2026-06-15 10:28:00', '2026-06-15 13:38:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.13194444444444', 'Fiber Cut', 'OFC Breakage', 'Ticket: TKT-2026-0027 | Connection: L/1 B, Sohrab Goth Flyover, Federal B Area Block 21 Industrial Area, Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(163, 'Tickets', 'Assurety Consulting Pvt Ltd', 'WhatsApp', 'Karachi', '2026-06-15 10:26:00', '2026-06-15 12:14:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.075', 'Fiber', 'Fiber break 1 joint box use', 'Ticket: TKT-2026-0026 | Connection: Link #N/A | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(164, 'Tickets', 'Gerrys Leisure (Costa Coffee) -khi- tipu sultan road', 'Portal', 'Karachi', '2026-06-15 10:25:00', '2026-06-15 12:14:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.075694444444444', 'Fiber', 'Fiber break 1 joint box use', 'Ticket: TKT-2026-0025 | Connection: 1A Tipu Sultan Rd, Karachi Memon Co-operative Housing Society Jinnah Housing Society P.E.C.H.S., Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(165, 'Tickets', 'PACC (Liaquat Library)', 'Portal', 'Karachi', '2026-06-15 09:42:00', '2026-06-16 09:08:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Fibresh', '0.97638888888889', 'fiber break', 'Fiber breakage near Yaadgaar Fish', 'Ticket: TKT-2026-0024 | Connection: Liquat National hospital | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(166, 'Tickets', 'Telecard- Alamgir Welfare', 'Email', 'Karachi', '2026-06-13 22:25:00', '2026-06-15 09:30:00', 'Other', 'Closed', 'Service Affecting', 'Gerrys', '1 day 11:05', '—', 'No issue found', 'Ticket: TKT-2026-0023 | Connection: 7 floor world Trade Center 10 Khayaban-e-Roomi.Clifton Karachi | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(167, 'Tickets', 'Ihop Korangi Warehouse', 'Portal', 'Karachi', '2026-06-12 16:20:00', '2026-06-12 17:44:00', 'Link Down', 'Closed', 'Service Affecting', 'Fibresh', '0.058333333333333', 'Power issue node end', 'Power issue observed at POP end.', 'Ticket: TKT-2026-0022 | Connection: 39C IHOP Restaurant, Main Khayaban-e-Shahbaz | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(168, 'Tickets', 'Utopia Industries Pvt Ltd Head Office', 'Email', 'Karachi', '2026-06-12 10:35:00', '2026-06-12 15:11:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'logon', '0.19166666666667', 'fiber break', '—', 'Ticket: TKT-2026-0021 | Connection: Link #N/A | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(169, 'Tickets', 'lucky knites', 'Email', 'Karachi', '2026-06-11 15:19:00', NULL, 'Other', 'Open', 'Service Affecting', 'Gerrys', '65 days 00:22', 'Radio', '—', 'Ticket: TKT-2026-0100 | Connection: 57 KM Mile Stone Super High | Created By: Sumaira Ansari', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(170, 'Tickets', 'Oberthur (Idemia) Technologies Pakistan (pvt.) Ltd.', 'Portal', 'Karachi', '2026-06-11 14:00:00', '2026-06-15 20:10:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Fibresh', '4 days 06:10', 'fiber break', '—', 'Ticket: TKT-2026-0028 | Connection: Plot 189, Mehran Town Sector 23 Korangi, Karachi, | Created By: Muhammad Younis', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(171, 'Tickets', 'Gaditek Association (pvt) Limited.', 'Portal', 'Karachi', '2026-06-10 12:47:00', '2026-06-12 03:12:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'CITS.', '1 day 14:25', 'fiber break', 'Link down due to fiber cut.', 'Ticket: TKT-2026-0020 | Connection: Link #N/A | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(172, 'Tickets', 'Utopia Industries Pvt Ltd 4 to 6 Repeter', 'Email', 'Karachi', '2026-06-09 11:03:00', '2026-06-09 15:57:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.20416666666667', 'Either patch card issue', 'LAN patch cable was found to be faulty and has been replaced. and device reset', 'Ticket: TKT-2026-0019 | Connection: Link #718 | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(173, 'Tickets', 'Lucky Textie Mills Ltd', 'Call', 'Karachi', '2026-06-09 10:36:00', '2026-06-09 16:21:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'logon', '0.23958333333333', 'Fiber cut', 'OFC Breakage restored', 'Ticket: TKT-2026-0018 | Connection: Failover 192.168.6.74 Public IP 202.69.41.34 - 38 | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(174, 'Tickets', 'Ema Shipping Agencies', 'Call', 'Karachi', '2026-06-09 10:05:00', '2026-06-10 13:23:00', 'Link Down', 'Closed', 'Service Affecting', 'RDS', '1 day 03:18', 'Fiber Cut', 'Fiber cut by KMC', 'Ticket: TKT-2026-0017 | Connection: Link #N/A | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(175, 'Tickets', 'Kompass Pakistan Link 1 GT-POP', 'Email', 'Karachi', '2026-06-09 08:39:00', '2026-06-09 08:39:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '67 days 07:02', 'No issue found', 'No issue found', 'Ticket: TKT-2026-0014 | Connection: Link #N/A | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(176, 'Tickets', 'Yunus Textile Mills 1', 'Email', 'Karachi', '2026-06-09 07:57:00', '2026-06-09 13:14:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.22013888888889', 'Hardware Maulfunctione', 'Connector faulty at audio end and replaced', 'Ticket: TKT-2026-0015 | Connection: H-23/1, Landhi Industrial Area, Karachi | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(177, 'Tickets', 'Amarant Pharma', 'Call', 'Karachi', '2026-06-08 13:25:00', '2026-06-08 13:30:00', 'Packet Loss', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.0034722222222222', 'Radio', 'Link has been restored after fine-tuning.', 'Ticket: TKT-2026-0012 | Connection: Link #N/A | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(178, 'Tickets', 'Gerrys Visa (Japan VAC)', 'Email', 'Karachi', '2026-06-08 11:07:00', '2026-06-08 14:04:00', 'Packet Loss', 'Closed', 'Service Affecting', 'Gerrys', '0.12291666666667', 'Media Faulty', 'media converter replaced , which was found to be faulty.', 'Ticket: TKT-2026-0011 | Connection: Link #599 | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(179, 'Tickets', 'Utopia Industries Pvt Ltd 4 to 6 Repeter', 'Email', 'Karachi', '2026-06-08 10:33:00', '2026-06-08 12:00:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.060416666666667', 'Radio', 'hard rebooted from Utopia 5 because of POE stuck', 'Ticket: TKT-2026-0010 | Connection: Link #718 | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(180, 'Tickets', 'PACC (Liaquat Library)', 'Portal', 'Karachi', '2026-06-08 10:28:00', '2026-06-08 14:18:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Fibresh', '0.15972222222222', 'Fiber cut', 'Fiber cut.', 'Ticket: TKT-2026-0013 | Connection: Liquat National hospital | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(181, 'Tickets', 'Postex Quetta Town Corporate Courier', 'WhatsApp', 'Karachi', '2026-06-08 09:37:00', '2026-06-08 14:18:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Fibresh', '0.19513888888889', 'Fiber cut', 'Fiber cut.', 'Ticket: TKT-2026-0008 | Connection:  | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(182, 'Tickets', 'Stahl Pakistan (pvt.) Limited', 'Call', 'Karachi', '2026-06-08 09:30:00', '2026-06-08 10:40:00', 'Link Down', 'Closed', 'Service Affecting', 'GCS', '0.048611111111111', 'fiber break', 'cable was found damaged near POP end.', 'Ticket: TKT-2026-0007 | Connection: Plot 67 Sector 27 Korangi | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(183, 'Tickets', 'Kompass Pakistan Link2 PQ-POP', 'Email', 'Karachi', '2026-06-08 08:36:00', '2026-06-08 09:00:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Gerrys', '0.016666666666667', 'Device Rebooted', 'Device rebooted issue resolved', 'Ticket: TKT-2026-0009 | Connection: F-37, North Western Ind. Zone، Port Qasim Authority, Karachi | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(184, 'Tickets', 'Optimize Engineering Core Pvt Ltd OEC', 'Call', 'Karachi', '2026-06-05 11:00:00', '2026-06-05 13:13:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.092361111111111', 'Equipment', 'faulty device replaced at clietnt end', 'Ticket: TKT-2026-0006 | Connection: Port Qasim | Created By: Manzar Akbar', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(185, 'Tickets', 'Zara Mobility- khadda market', 'Portal', 'Karachi', '2026-06-05 01:39:00', '2026-06-05 04:26:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Satcom', '0.11597222222222', 'Fiber cut', 'OFC was break at 530m.', 'Ticket: TKT-2026-0005 | Connection: Link #N/A | Created By: Manzar Akbar', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(186, 'Tickets', 'Assurety Consulting Pvt Ltd', 'WhatsApp', 'Karachi', '2026-06-04 17:19:00', '2026-06-04 19:20:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.084027777777778', 'Fiber', 'fiber cut  200m fiber 4 core fiber use', 'Ticket: TKT-2026-0004 | Connection: Link #N/A | Created By: Manzar Akbar', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(187, 'Tickets', 'Gerrys Leisure (Costa Coffee) -khi- tipu sultan road', 'WhatsApp', 'Karachi', '2026-06-04 16:30:00', '2026-06-04 19:20:00', 'Link Down', 'Closed', 'Service Affecting', 'Gerrys', '0.11805555555556', 'Fiber', 'fiber cut  200m fiber 4 core fiber use', 'Ticket: TKT-2026-0003 | Connection: 1A Tipu Sultan Rd, Karachi Memon Co-operative Housing Society Jinnah Housing Society P.E.C.H.S., Karachi | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(188, 'Tickets', 'Pphi (karachi Clifton)', 'Call', 'Karachi', '2026-06-04 10:01:00', '2026-06-04 14:00:00', 'Link Down', 'Closed', 'Non-Service Affecting', 'Satcom', '0.16597222222222', 'fiber', 'Multipile fibercut', 'Ticket: TKT-2026-0002 | Connection: Link #N/A | Created By: Farhan Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13'),
(189, 'Tickets', '2 shades LLP', 'Email', 'Karachi', '2026-04-29 03:07:00', '2026-05-11 10:43:00', 'Slow Browsing', 'Closed', 'Non-Service Affecting', 'Gerrys', '12 days 07:35', 'No Issue Found', 'Thats Great', 'Ticket: TKT-2026-0001 | Connection: Link #N/A | Created By: Hussain', '2026-08-16 10:48:13', '2026-08-16 10:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `dark_core_links`
--

CREATE TABLE `dark_core_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `point_a` text NOT NULL,
  `point_b` text NOT NULL,
  `service_provider_name` varchar(255) NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `own_or_lease` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dplc_details`
--

CREATE TABLE `dplc_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `point_a_gps` longtext NOT NULL,
  `point_b_gps` longtext NOT NULL,
  `service_provider` varchar(255) NOT NULL,
  `total_bandwidth_acquired` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dplc_details`
--

INSERT INTO `dplc_details` (`id`, `serial_no`, `point_a_gps`, `point_b_gps`, `service_provider`, `total_bandwidth_acquired`, `created_at`, `updated_at`) VALUES
(1, '1', 'Transworld Plaza 24°49\'16.73\"N  67° 2\'5.89\"E', 'Hyderabad 25.363273, 68.380369', 'Transworld', '5G / DPLC Capacity', '2026-08-16 10:54:10', '2026-08-16 10:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faults_cleared`
--

CREATE TABLE `faults_cleared` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `complaint_channel` varchar(255) NOT NULL,
  `main_city` varchar(255) NOT NULL,
  `opened_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `issue` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `affect` varchar(255) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `aging_downtime` varchar(255) DEFAULT NULL,
  `rfo` text DEFAULT NULL,
  `rca` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faults_cleared`
--

INSERT INTO `faults_cleared` (`id`, `customer_name`, `complaint_channel`, `main_city`, `opened_at`, `closed_at`, `issue`, `status`, `affect`, `owner`, `aging_downtime`, `rfo`, `rca`, `created_at`, `updated_at`) VALUES
(1, 'Utopia Industries', 'Proactive', 'KHI', '2026-05-19 10:25:00', '2026-05-19 16:26:00', 'Link Down', 'closed', 'Non-Service Affecting', 'Logon', '0.25069444444444', 'Fiber', 'Cable cut due to excavation work.', '2026-08-16 10:53:44', '2026-08-16 10:53:44'),
(2, 'Amarant Pharma', 'WhatsApp', 'KHI', '2026-05-18 12:00:00', '2026-05-18 14:00:00', 'Upload issue', 'closed', 'Service Affecting', 'Gerrys', '0.083333333333333', 'Radio', 'Issue has now resolved after fine-tuning', '2026-08-16 10:53:45', '2026-08-16 10:53:45'),
(3, 'Star denim', 'Call', 'KHI', '2026-05-20 13:15:00', '2026-05-20 14:30:00', 'Link Down', 'closed', 'Non-Service Affecting', 'Gerrys', '0.052083333333333', 'fiber', 'Link down due to fiber cut', '2026-08-16 10:53:45', '2026-08-16 10:53:45'),
(4, 'Complaint resolved within 48 hours', '', '', NULL, NULL, '', '', '', '', '', '', '', '2026-08-16 10:53:45', '2026-08-16 10:53:45'),
(5, 'Customer Name', 'Complaint Channel', 'Main City', NULL, NULL, 'Issue', 'status', 'Affect', 'Owner', 'Aging/Downtime', 'RFO', 'RCA', '2026-08-16 10:53:45', '2026-08-16 10:53:45'),
(6, 'Zafa B 10 Data Connectivity', 'call', 'KHI', '2026-06-02 11:37:00', '2026-06-03 15:00:00', 'Link Down', 'closed', 'Non-Service Affecting', 'Gerrys', '1.1409722222222', 'Radio', 'connector refreshed from ODU and IDU', '2026-08-16 10:53:45', '2026-08-16 10:53:45'),
(7, 'Suparco', 'Proactive', 'KHI', '2026-05-28 07:16:00', '2026-05-29 13:37:00', 'Link Down', 'closed', 'Service Affecting', 'Connect', '1.2645833333333', 'fiber', 'multiple fiber cuts have been observed due to ongoing BRT Yellow Line project / consider this case under Force Majeure. | OFC pressure losses issue and now was the core break in multiple joints', '2026-08-16 10:53:45', '2026-08-16 10:53:45'),
(8, 'Akmal Print House', 'Email', 'KHI', '2026-05-15 17:51:00', '2026-05-16 15:03:00', 'Link Down', 'closed', 'Service Affecting', 'Gerrys', '0.88333333333333', 'Fiber', 'Fiber break', '2026-08-16 10:53:45', '2026-08-16 10:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `faults_reported`
--

CREATE TABLE `faults_reported` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `complaint_channel` varchar(255) NOT NULL,
  `main_city` varchar(255) NOT NULL,
  `opened_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `issue` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `affect` varchar(255) NOT NULL,
  `aging_downtime` varchar(255) NOT NULL,
  `rfo` text DEFAULT NULL,
  `rca` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faults_reported`
--

INSERT INTO `faults_reported` (`id`, `customer_name`, `complaint_channel`, `main_city`, `opened_at`, `closed_at`, `issue`, `status`, `affect`, `aging_downtime`, `rfo`, `rca`, `created_at`, `updated_at`) VALUES
(1, 'abbott vlan 1576', 'Email', 'KHI', '2026-03-01 01:25:00', '2026-03-04 14:00:00', 'Link Down', 'closed', 'Non-Service Affecting', '3.5243055555556', '', 'Ethernet cable was found damaged.', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(2, 'GCS dark core', 'Email', 'KHI', '2026-03-01 02:25:00', '2026-03-01 09:02:00', 'link down', 'Closed', 'Non-Service Affecting', '0.27569444444444', 'No activity', 'No activity performed', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(3, 'I.o Digital', 'Email', 'KHI', '2026-03-02 07:55:00', '2026-03-02 13:00:00', 'Link Down', 'closed', 'Service Affecting', '0.21180555555556', 'fiber', 'Dual fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(4, 'magnacreate', 'Email', 'KHI', '2026-03-02 08:52:00', '2026-03-02 13:00:00', 'Link Down', 'closed', 'Service Affecting', '0.17222222222222', 'Fiber', 'Dual fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(5, 'DWP eureka', 'Email', 'KHI', '2026-03-02 07:34:00', '2026-03-02 13:00:00', 'Link Down', 'closed', 'Service Affecting', '0.22638888888889', 'Fiber', 'Dual fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(6, 'Tata Pakistan', 'Email', 'KHI', '2026-03-02 10:21:00', '2026-03-02 13:00:00', 'Link Down', 'closed', 'Service Affecting', '0.11041666666667', 'fiber', 'Dual fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(7, 'Feroze H-23', 'Email', 'KHI', '2026-03-02 08:51:00', '2026-03-02 11:27:00', 'Link Down', 'closed', 'Service Affecting', '0.10833333333333', 'Fiber', 'Dual fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(8, 'Feroze C-3 Aggregation', 'Email', 'KHI', '2026-03-02 13:29:00', '2026-03-02 17:40:00', 'Link Down', 'closed', 'Service Affecting', '0.17430555555556', 'Fiber', 'cable has been damaged due to excavation work', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(9, 'Lucky Kathore', 'Call', 'KHI', '2026-03-03 08:45:00', '2026-03-03 08:45:00', 'Bandwidth', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(10, 'Pak Petro Chemicals', 'Call', 'KHI', '2026-03-03 10:00:00', '2026-03-03 10:00:00', 'Link Down', 'closed', 'Service Affecting', '0', 'customer', 'LAN cable was un plugged at client end', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(11, 'Tata Pakistan', 'Email', 'KHI', '2026-03-03 10:40:00', '2026-03-03 10:40:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(12, 'Abacus Consulting Technology Ltd.', 'Email', 'KHI', '2026-03-03 11:15:00', '2026-03-03 13:39:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.1', 'fiber', 'link was affected due to 90-meter, 6-core fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(13, 'Ihope ware house VLAN 923', 'Proactive', 'KHI', '2026-03-03 12:38:00', '2026-03-03 12:38:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(14, 'AWM Home', 'Proactive', 'KHI', '2026-03-03 14:03:00', '2026-03-03 17:20:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.13680555555556', 'Fiber', '96 fiber cut in DHA', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(15, 'Fedex Sialkot kashmir Road', 'Email', 'KHI', '2026-03-03 23:17:00', '2026-03-04 11:14:00', 'Link Down', 'closed', 'Service Affecting', '0.49791666666667', 'fiber', 'cable cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(16, 'Lucky Textile Site', 'WhatsApp', 'KHI', '2026-03-04 09:47:00', '2026-03-04 09:47:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(17, 'Royal Printing', 'WhatsApp', 'KHI', '2026-03-04 09:54:00', '2026-03-04 09:54:00', 'Link Down', 'closed', 'Service Affecting', '0', 'customer', 'LAN cable was un plugged at client end', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(18, 'Amarant Pharma', 'call', 'KHI', '2026-03-04 20:03:00', '2026-03-05 07:40:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.48402777777778', 'Radio', 'Client had off his device since wednesday', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(19, 'gaditex kashmir road', 'Proactive', 'KHI', '2026-03-05 07:56:00', '2026-03-05 11:15:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.13819444444444', 'fiber', 'cable cut near Jail Chorangi', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(20, 'Zara Khadda', 'Proactive', 'KHI', '2026-03-05 20:00:00', '2026-03-05 20:10:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.0069444444444444', 'Fiber', 'Core was break glass tower h.h', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(21, 'PICT VLAN 1573', 'Email', 'KHI', '2026-03-06 03:52:00', '2026-03-06 06:17:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.10069444444444', 'Radio', 'device rebooted', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(22, 'awm', 'Proactive', 'KHI', '2026-03-06 05:13:00', '2026-03-06 05:36:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.015972222222222', 'Fiber', 'Joined me core damaged ftc', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(23, 'AP TO SHARPTEL', 'Proactive', 'KHI', '2026-03-06 02:05:00', '2026-03-06 02:46:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.028472222222222', 'Fiber', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(24, 'Matracon VLAN 1510', 'Email', 'KHI', '2026-03-06 12:45:00', '2026-03-06 16:56:00', 'Bandwidth', 'closed', 'Service Affecting', '0.17430555555556', 'Radio', 'required parameters share with gcs/ Device rebooted', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(25, 'EMA Shipping', 'Call', 'KHI', '2026-03-06 14:29:00', '2026-03-06 20:29:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.25', 'Fiber', 'Core break near IIC POP', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(26, 'PICT VLAN 1573', 'Email', 'KHI', '2026-03-07 02:46:00', '2026-03-07 09:20:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.27361111111111', 'Customer', 'LAN cable unpluged at client end', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(27, 'expereo abbot 1576', 'Email', 'KHI', '2026-03-07 02:34:00', '2026-03-07 02:34:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0', 'No Issue Found', 'No issue found', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(28, 'Muno Pakistan', 'Proactive', 'KHI', '2026-03-09 09:21:00', '2026-03-09 11:35:00', 'Link Down', 'closed', 'Service Affecting', '0.093055555555556', 'Fiber', 'fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(29, 'expereo abbot 1575', 'Email', 'KHI', '2026-03-08 22:44:00', '2026-03-09 02:57:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.17569444444444', 'Fiber', 'Cable was found damaged Near Murgi khana bridge', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(30, 'DWP VLAN: 1764', 'Email', 'KHI', '2026-03-08 22:21:00', '2026-03-09 02:57:00', 'Link Down', 'closed', 'Service Affecting', '0.19166666666667', '', 'Cable was found damaged Near Murgi khana bridge', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(31, 'Bari Fatani VLAN: 1763', 'Email', 'KHI', '2026-03-08 22:21:00', '2026-03-09 02:57:00', 'Link Down', 'closed', 'Service Affecting', '0.19166666666667', 'fiber', 'Cable was found damaged Near Murgi khana bridge', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(32, 'tata Pakistan', 'WhatsApp', 'KHI', '2026-03-08 22:21:00', '2026-03-09 02:57:00', 'Link Down', 'closed', 'Service Affecting', '0.19166666666667', 'fiber', 'Cable was found damaged Near Murgi khana bridge', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(33, 'Postex Ghas Mandi Vlan 560', 'WhatsApp', 'KHI', '2026-03-09 08:26:00', '2026-03-09 14:15:00', 'Link Down', 'closed', 'Service Affecting', '0.24236111111111', 'Fiber', 'fiber damage caused by KMC activity', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(34, 'Feroz c3 aggregation link', 'Email', 'KHI', '2026-03-09 05:36:00', '2026-03-09 08:05:00', 'Link Down', 'closed', 'Service Affecting', '0.10347222222222', 'Fiber', 'Cable cut due to excavation work', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(35, 'Magnacrete', 'Email', 'KHI', '2026-03-09 10:04:00', '2026-03-09 12:52:00', 'Packet Loss', 'closed', 'Service Affecting', '0.11666666666667', 'radio', 'device reboot', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(36, 'Gaditek', 'Email', 'KHI', '2026-03-09 10:16:00', '2026-03-09 10:16:00', 'DNS', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(37, 'Assurety Consult', 'call', 'KHI', '2026-03-09 10:30:00', '2026-03-09 12:45:00', 'Link Down', 'closed', 'Service Affecting', '0.09375', 'fiber', 'fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(38, 'PC Hotel RF', 'Proactive', 'KHI', '2026-03-09 10:45:00', '2026-03-09 11:00:00', 'Link Down', 'closed', 'Service Affecting', '0.010416666666667', 'Radio', 'port refresh', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(39, 'Costa Coffee sm fiber', 'WhatsApp', 'KHI', '2026-03-09 10:30:00', '2026-03-09 12:45:00', 'Link Down', 'closed', 'Service Affecting', '0.09375', 'fiber', 'fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(40, 'Digital Processing', 'Call', 'KHI', '2026-03-09 11:05:00', '2026-03-09 11:05:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(41, 'Assurety Consultant', 'call', 'KHI', '2026-03-09 12:52:00', '2026-03-09 19:03:00', 'Link Down', 'closed', 'Service Affecting', '0.25763888888889', 'Equipment', 'media converter needs to be replaced, as the existing one is faulty | core dmage', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(42, 'Feroz C-3 Aggregation', 'Email', 'KHI', '2026-03-10 07:49:00', '2026-03-10 09:55:00', 'Link Down', 'closed', 'Service Affecting', '0.0875', '', 'primary link was affected due to SES outage GIT to ARY, Link has been temporarily routed through an alternate path to restore connectivity while the fiber restoration work is being carried out.', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(43, 'Matrix Systems Pvt Ltd', 'Email', 'KHI', '2026-03-10 09:11:00', '2026-03-10 12:05:00', 'Link Down', 'closed', 'Service Affecting', '0.12083333333333', 'fiber', 'link down due to fiber cut, 2 core 80 meter used', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(44, 'Sharptel - Interconnect VLAN 2075', 'Email', 'KHI', '2026-03-10 11:24:00', '2026-03-10 11:24:00', 'Link Down', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(45, 'Saakh Pharma', 'Email', 'KHI', '2026-03-10 12:02:00', '2026-03-10 12:02:00', 'Slow Browsing', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(46, 'Amarant Pharma', 'Proactive', 'KHI', '2026-03-10 13:10:00', '2026-03-10 14:30:00', 'Link Down', 'closed', 'Service Affecting', '0.055555555555556', 'radio', 'hard reboot', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(47, 'Mustaqim Dyeing', 'Email', 'KHI', '2026-03-10 13:26:00', '2026-03-10 13:26:00', 'Link Down', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(48, 'Chippa', 'Proactive', 'KHI', '2026-03-10 13:15:00', '2026-03-10 20:45:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.3125', 'Fiber', 'fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(49, 'Hesco Steel', 'Proactive', 'HYD', '2026-03-10 14:45:00', '2026-03-10 15:00:00', 'Link Down', 'closed', 'Service Affecting', '0.010416666666667', 'No Issue Found', 'link came up automatically after a few minutes.', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(50, 'Postex Korangi', 'WhatsApp', 'KHI', '2026-03-11 09:10:00', '2026-03-11 12:55:00', 'Link Down', 'closed', 'Service Affecting', '0.15625', 'fiber', 'fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(51, 'Magnacrete', 'call', 'KHI', '2026-03-11 08:45:00', '2026-03-11 08:45:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(52, 'Waada Insurance', 'Email', 'KHI', '2026-03-12 12:11:00', '2026-03-12 12:24:00', 'Link Down', 'closed', 'Service Affecting', '0.0090277777777778', 'radio', 'interference issue', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(53, 'Atique Carpet', 'WhatsApp', 'KHI', '2026-03-12 12:00:00', '2026-03-12 12:00:00', 'Link Down', 'closed', 'Service Affecting', '0', 'customer', 'LAN is observing un plugged at client end, Following the removal of the bird nest, client will be able to check', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(54, 'Fiberish Primary Interconnect', 'Proactive', 'KHI', '2026-03-12 12:18:00', '2026-03-12 16:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.175', 'Fiber', 'Fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(55, 'Assurety Consult', 'call', 'KHI', '2026-03-12 12:30:00', '2026-03-12 13:00:00', 'Link Down', 'closed', 'Service Affecting', '0.020833333333333', 'fiber', 'core was in pressure', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(56, 'AWM Home', 'Call', 'KHI', '2026-03-12 05:00:00', '2026-03-12 15:30:00', 'Lan Issue', 'closed', 'Non-Service Affecting', '0.4375', 'Customer', 'due to LAN cable connector faulty', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(57, 'Zara Khadda', 'Proactive', 'KHI', '2026-03-13 05:30:00', '2026-03-13 15:12:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.40416666666667', 'Fiber', 'Underground OFC was break.', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(58, 'AWM Home', 'call', 'KHI', '2026-03-13 05:00:00', '2026-03-13 05:42:00', 'Reachability', 'closed', 'Non-Service Affecting', '0.029166666666667', 'Equipment', 'Our team visited and install the AP at prayer area sucsesfully', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(59, 'Fedex Sasi', 'Proactive', 'KHI', '2026-03-13 10:30:00', '2026-03-13 12:40:00', 'Link Down', 'closed', 'Service Affecting', '0.090277777777778', 'fiber', 'fiber damaged', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(60, 'Pakistan Tankers Company', 'call', 'KHI', '2026-03-13 11:45:00', '2026-03-13 11:45:00', 'Slow Browsing', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(61, 'Feroze 1888', 'Proactive', 'KHI', '2026-03-13 22:19:00', '2026-03-13 22:51:00', 'Link Down', 'closed', 'Service Affecting', '0.022222222222222', 'Fiber', 'cable cut near amber tower', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(62, 'Gaditech kasmir road', 'Proactive', 'KHI', '2026-03-13 22:19:00', '2026-03-13 22:33:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.0097222222222222', 'Fiber', 'cabele cut near amber tower', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(63, 'Abbot Korangi', 'Email', 'KHI', '2026-03-14 10:23:00', '2026-03-14 10:54:00', 'Link Down', 'closed', 'Service Affecting', '0.021527777777778', 'Power', 'power outage at pop end', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(64, 'Utopia pri', 'Proactive', 'KHI', '2026-03-14 16:08:00', '2026-03-14 16:36:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.019444444444444', '', 'Upstream Issue', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(65, 'Lucky Textile FB Area', 'Call', 'KHI', '2026-03-14 16:08:00', '2026-03-14 16:36:00', 'Link Down', 'Closed', 'Service Affecting', '0.019444444444444', '', 'Upstream Issue', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(66, 'Feroz 1888', 'Proactive', 'KHI', '2026-03-14 16:08:00', '2026-03-14 19:15:00', 'Link Down', 'Closed', 'Service Affecting', '0.12986111111111', 'fiber', 'Cabel cut near SF allied bank', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(67, 'Zafa Active core', 'Proactive', 'KHI', '2026-03-15 15:00:00', '2026-03-16 03:26:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.51805555555556', 'Fiber', 'fiber cut near sohrab chorangi', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(68, 'Bhoana VLAN 567', 'WhatsApp', 'KHI', '2026-03-15 16:06:00', '2026-03-15 22:58:00', 'Link Down', 'Closed', 'Service Affecting', '0.28611111111111', 'Fiber', 'Spur Fiber Break', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(69, 'AM POP', 'Proactive', 'KHI', '2026-03-15 15:05:00', '2026-03-16 09:33:00', 'Link Down', 'closed', 'Service Affecting', '0.76944444444444', 'Power', 'switch at client end was hang', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(70, 'Gerrys Visa UKVAC', 'Email', 'KHI', '2026-03-16 08:52:00', '2026-03-16 10:01:00', 'Packet Loss', 'closed', 'Service Affecting', '0.047916666666667', 'fiber', 'link was affected due to AM switch observing powered off', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(71, 'Amarant Pharama', 'Email', 'KHI', '2026-03-16 11:04:00', '2026-03-16 12:11:00', 'Link Down', 'closed', 'Service Affecting', '0.046527777777778', 'Radio', 'LAN Patch replaced with connector refreshed from PoE end.', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(72, 'Kamil Convertor 2', 'call', 'KHI', '2026-03-16 09:39:00', '2026-03-16 12:11:00', 'Link Down', 'closed', 'Service Affecting', '0.10555555555556', 'Radio', 'Connector refreshed from tower end', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(73, 'Dashi Foods (HUB) VLAN 956', 'Proactive', 'KHI', '2026-03-16 11:35:00', '2026-03-16 11:35:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(74, 'DWP VLAN: 1764', 'Email', 'KHI', '2026-03-16 14:37:00', '2026-03-16 14:37:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(75, 'AWM Home', 'Call', 'KHI', '2026-03-15 21:30:00', '2026-03-16 15:00:00', 'PoE', 'closed', 'Non-Service Affecting', '0.72916666666667', 'Equipment', 'media convertor replaced with cisco 2960g 8 port switch placed in AWM study room due to usage of multiple laptp and system s', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(76, 'Chippa', 'Proactive', 'KHI', '2026-03-16 20:10:00', '2026-03-16 23:50:00', 'Link Down', 'closed', 'Service Affecting', '0.15277777777778', 'Fiber', 'RFO pending', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(77, 'AWM Home', 'Call', 'KHI', '2026-03-16 20:05:00', '2026-03-16 21:25:00', 'Lan Issue', 'closed', 'Non-Service Affecting', '0.055555555555556', 'Customer', 'ethernet path cord connector refresh at guest room', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(78, 'Costa Coffee sm fiber', 'WhatsApp', 'KHI', '2026-03-16 15:41:00', '2026-03-16 15:41:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', 'no issue found', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(79, 'Mekotex Kotri Unit-2', 'Email', 'KHI', '2026-03-17 10:19:00', '2026-03-17 11:12:00', 'Link Down', 'closed', 'Service Affecting', '0.036805555555556', 'Radio', 'client end device restarted', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(80, 'Al Rehmat Site 3', 'WhatsApp', 'KHI', '2026-03-17 11:18:00', '2026-03-17 13:00:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.070833333333333', 'fiber', 'fiber cut', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(81, 'Oburther VLAN 1932', 'Email', 'KHI', '2026-03-18 10:02:00', '2026-03-24 16:14:00', 'Link Down', 'closed', 'Non-Service Affecting', '6.2583333333333', 'Fiber', 'Due to ongoing rain , K-electric outage and thunderstorm in the City \n>> last night our multiple POPs and fiber rings are at outage.', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(82, 'Zil Hyderabad', 'Email', 'HYD', '2026-03-18 12:08:00', '2026-03-18 12:08:00', 'Link Down', 'closed', 'Service Affecting', '0', 'customer', 'LAN cable unplugged at client end', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(83, 'Abbott vlan 1576', 'Email', 'KHI', '2026-03-18 17:38:00', '2026-03-18 19:50:00', 'Link Down', 'closed', 'Service Affecting', '0.091666666666667', 'Equipment', 'Port stuck at node end', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(84, 'Gaditech kasmir road', 'Proactive', 'KHI', '2026-03-18 22:15:00', '2026-03-19 16:00:00', 'Link Down', 'closed', 'Service Affecting', '0.73958333333333', 'Fiber', 'Cabel damage near fourtune tower', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(85, 'Utopia logon', 'Proactive', 'KHI', '2026-03-19 02:50:00', '2026-03-19 07:10:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.18055555555556', '', 'Fiber was broken near the POP end.', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(86, 'Ghas mandi vlan 927', 'Proactive', 'KHI', '2026-03-19 08:22:00', '2026-03-19 08:22:00', 'Link Down', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(87, 'IO Digital sharptel', 'Email', 'KHI', '2026-03-19 13:03:00', '2026-03-19 14:20:00', 'Link Down', 'closed', 'Service Affecting', '0.053472222222222', '', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(88, 'EZ Life Technology | Telecard', 'Email', 'KHI', '2026-03-19 13:33:00', '2026-03-20 14:20:00', 'Link Down', 'closed', 'Service Affecting', '1.0326388888889', '', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(89, 'alamgir welfare', 'Email', 'KHI', '2026-03-19 13:54:00', '2026-03-21 14:20:00', 'Link Down', 'closed', 'Service Affecting', '2.0180555555556', '', '', '2026-08-16 10:53:09', '2026-08-16 10:53:09'),
(90, 'SERWAT CONVERTER', 'Email', 'KHI', '2026-03-20 03:25:00', '2026-03-20 14:45:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.47222222222222', 'Power', 'Power issue at customer end', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(91, 'Gaditech kasmir road', 'Proactive', 'KHI', '2026-03-20 11:28:00', '2026-03-20 15:28:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.16666666666667', 'Fiber', 'Cable cut by KMC', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(92, 'ferozee 1888', 'Call', 'KHI', '2026-03-21 06:25:00', '2026-03-21 09:45:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.13888888888889', 'No Issue Found', 'No issue issue found', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(93, 'C3 Aggregation', 'Email', 'KHI', '2026-03-21 10:54:00', '2026-03-23 15:08:00', 'Link Down', 'Closed', 'Service Affecting', '2.1763888888889', '', 'Fiber cut', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(94, 'Fedex DHA Khadda Market', 'Email', 'KHI', '2026-03-21 17:25:00', '2026-03-21 17:25:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No activity', 'no activity performed from Satcomm\'s end', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(95, 'Gerrys Visa', 'call', 'KHI', '2026-03-24 09:10:00', '2026-03-24 15:37:00', 'Link Down', 'closed', 'Service Affecting', '0.26875', 'Equipment', 'switch has malfunctioned.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(96, 'Al Momin', 'call', 'KHI', '2026-03-24 09:25:00', '2026-03-24 09:25:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(97, 'JB Industries Korangi', 'call', 'KHI', '2026-03-24 11:01:00', '2026-03-24 13:07:00', 'Link Down', 'closed', 'Service Affecting', '0.0875', 'fiber', 'Cable Damaged', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(98, 'Postex Quetta Town', 'WhatsApp', 'KHI', '2026-03-24 11:18:00', '2026-03-24 11:45:00', 'Link Down', 'closed', 'Service Affecting', '0.01875', 'Power', 'Power issue at node end.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(99, 'Utopia 4 to 6', 'WhatsApp', 'KHI', '2026-03-24 11:45:00', '2026-03-24 15:20:00', 'Link Down', 'closed', 'Service Affecting', '0.14930555555556', 'Radio', 'RF team installed 4 Port Hub at Unit-6 to loop the PoEs between Unit-6 & Unit-4', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(100, 'Ghani Glass', 'call', 'KHI', '2026-03-24 15:00:00', '2026-03-24 16:25:00', 'Link Down', 'closed', 'Service Affecting', '0.059027777777778', 'Radio', 'Device reboot', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(101, 'Costa Coffee DHA', 'WhatsApp', 'KHI', '2026-03-24 18:05:00', '2026-03-24 20:02:00', 'Link Down', 'Closed', 'Service Affecting', '0.08125', 'No Issue Found', '0311 2127739 mubashir/ multiples time call to sajid and mubasir but still not responding', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(102, 'Ihope ware house VLAN 923', 'WhatsApp', 'KHI', '2026-03-24 18:05:00', '2026-03-27 17:40:00', 'Link Down', 'Closed', 'Service Affecting', '2.9826388888889', 'fiber', 'due to Fiber cut', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(103, 'Fedex Sassi', 'Proactive', 'KHI', '2026-03-25 04:05:00', '2026-03-25 12:15:00', 'Link Down', 'Closed', 'Service Affecting', '0.34027777777778', 'Fiber', 'RFO : OFC Breakage', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(104, 'Utopia Logon', 'Proactive', 'KHI', '2026-03-25 15:06:00', '2026-03-25 15:17:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.0076388888888889', 'No Issue Found', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(105, 'Postex call courier -nazimabad', 'Proactive', 'KHI', '2026-03-25 14:00:00', '2026-03-25 16:16:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.094444444444444', 'Fiber', 'RFO : OFC Breakage', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(106, 'Kutiyana Memon Hospital', 'Proactive', 'KHI', '2026-03-24 18:29:00', '2026-03-24 22:43:00', 'Link Down', 'closed', 'Service Affecting', '0.17638888888889', 'Equipment', 'faulty hardware replaced', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(107, 'Kamil Package | VLAN 1933', 'Proactive', 'KHI', '2026-03-24 18:29:00', '2026-03-24 22:43:00', 'Link Down', 'closed', 'Service Affecting', '0.17638888888889', 'Equipment', 'faulty hardware replaced', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(108, 'Stahl Pakistan', 'Proactive', 'KHI', '2026-03-24 18:29:00', '2026-03-24 22:43:00', 'Link Down', 'closed', 'Service Affecting', '0.17638888888889', 'Equipment', 'faulty hardware replaced', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(109, 'Chippa', 'Proactive', 'KHI', '2026-03-24 18:29:00', '2026-03-24 22:43:00', 'Link Down', 'closed', 'Service Affecting', '0.17638888888889', 'Equipment', 'faulty hardware replaced', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(110, 'Postex Shadman Kalaboard | VLAN 1934', 'Proactive', 'KHI', '2026-03-24 18:29:00', '2026-03-24 22:43:00', 'Link Down', 'closed', 'Service Affecting', '0.17638888888889', 'Equipment', 'faulty hardware replaced', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(111, 'Postex Quetta Town | VLAN 1936', 'Proactive', 'KHI', '2026-03-24 18:29:00', '2026-03-24 22:43:00', 'Link Down', 'closed', 'Service Affecting', '0.17638888888889', 'Equipment', 'faulty hardware replaced', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(112, 'Oburther', 'Proactive', 'KHI', '2026-03-24 18:29:00', '2026-03-24 22:43:00', 'Link Down', 'closed', 'Service Affecting', '0.17638888888889', 'Equipment', 'faulty hardware replaced', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(113, 'Kamil Packaging Site (VLAN 1933)', 'Proactive', 'KHI', '2026-03-26 09:27:00', '2026-03-26 11:06:00', 'Link Down', 'closed', 'Service Affecting', '0.06875', '', 'Routting issue at fiberish end', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(114, 'Forum Mall Saasi arcade', 'Email', 'KHI', '2026-03-26 10:15:00', '2026-03-26 12:03:00', 'Link Down', 'closed', 'Service Affecting', '0.075', 'fiber', 'Link down due to fiber cut', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(115, 'Matracon VLAN 1510', 'Email', 'KHI', '2026-03-26 10:59:00', '2026-03-26 10:59:00', 'Bandwidth', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(116, 'Pak Poly Industries', 'call', 'KHI', '2026-03-26 12:45:00', '2026-03-26 13:10:00', 'Download issue', 'closed', 'Service Affecting', '0.017361111111111', 'Radio', 'due to interference issue.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(117, 'Sharptel - Interconnect Backup Link', 'Email', 'KHI', '2026-03-26 14:13:00', '2026-03-26 17:25:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.13333333333333', 'fiber', 'fiber damaged', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(118, 'AWM Home', 'WhatsApp', 'KHI', '2026-03-25 23:00:00', '2026-03-26 01:15:00', 'Slow Browsing', 'closed', 'Service Affecting', '0.09375', 'No Issue Found', 'We have thoroughly checked the link in cordination with NOC Dept and have also shared the relevant graphs. No issue has been observed from our end', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(119, 'YTM 7', 'Email', 'KHI', '2026-03-26 17:05:00', '2026-03-27 12:32:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.81041666666667', 'Fiber', 'OFC Brakage', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(120, 'Kutiyana Memon Hospital', 'Email', 'KHI', '2026-03-26 19:45:00', '2026-03-27 19:08:00', 'Link Down', 'Closed', 'Service Affecting', '0.97430555555556', 'Fiber', 'due to Fiber cut', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(121, 'AWM Home', 'Proactive', 'KHI', '2026-03-26 22:00:00', '2026-03-27 04:00:00', 'Issue', 'closed', 'Non-Service Affecting', '0.25', 'Equipment', 'It is basically a query, As per Boss instructions, our Field Engineer Khurram visited the premises and relocated the router', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(122, 'Oburther', 'Proactive', 'KHI', '2026-03-27 09:16:00', '2026-03-27 12:29:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.13402777777778', 'Fiber', 'OFC Brakage', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(123, 'Star Denim', 'Email', 'KHI', '2026-03-27 09:56:00', '2026-03-27 13:37:00', 'Link Down', 'closed', 'Service Affecting', '0.15347222222222', 'Equipment', 'dish alignment and refresh the connectors', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(124, 'Chippa Welfare Association primary', 'Proactive', 'KHI', '2026-03-27 11:10:00', '2026-03-27 16:44:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.23194444444444', 'fiber', 'fiber cut', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(125, 'GD Office', 'Proactive', 'KHI', '2026-03-27 01:17:00', '2026-03-27 14:00:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.52986111111111', 'fiber', 'Fiber cut near Do Talwar', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(126, 'Mekotex Kotri Unit 2', 'Email', 'HYD', '2026-03-27 16:08:00', '2026-03-27 17:07:00', 'Packet Loss', 'Closed', 'Service Affecting', '0.040972222222222', '', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(127, 'suparco connect', 'call', 'KHI', '2026-03-27 22:25:00', '2026-03-27 23:00:00', 'Link Down', 'Closed', 'Service Affecting', '0.024305555555556', 'Power', 'Pro Long power issue at node end.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(128, 'Zara Mobility Via Satcomm', 'Proactive', 'KHI', '2026-03-28 01:25:00', '2026-03-28 05:25:00', 'Lan Issue', 'closed', 'Non-Service Affecting', '0.16666666666667', 'Fiber', 'due to Fiber cut', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(129, 'Postex Ghas Mandi Vlan 560', 'Call', 'KHI', '2026-03-28 09:50:00', '2026-03-28 13:10:00', 'Link Down', 'closed', 'Service Affecting', '0.13888888888889', 'Equipment', 'customer has temporarily arranged ONU device, Connect will provide his device at client premises', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(130, 'YTM 2', 'Email', 'KHI', '2026-03-28 11:10:00', '2026-03-28 14:42:00', 'Link Down', 'closed', 'Service Affecting', '0.14722222222222', 'Equipment', 'both end POE and cable connector replaced also refresh the cable joint', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(131, 'Zafa Active core', 'Proactive', 'KHI', '2026-03-29 11:53:00', '2026-03-30 02:50:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.62291666666667', 'Fiber', 'Joinder was Demaged Near Luckyone Mall', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(132, 'Chippa Welfare Association primary', 'Proactive', 'KHI', '2026-03-29 13:50:00', '2026-03-29 23:15:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.39236111111111', 'Fiber', 'Cable cut FedEx side', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(133, 'AWM Home', 'WhatsApp', 'KHI', '2026-03-29 18:43:00', '2026-03-31 15:52:00', 'Camera\'s issue', 'Closed', 'Non-Service Affecting', '1.88125', 'Equipment', 'delay occurred due to the procurement of camera accessories required for the activity.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(134, 'Stahal Pakistan VLAN 925', 'Email', 'KHI', '2026-03-30 08:13:00', '2026-03-31 19:04:00', 'Link Down', 'closed', 'Service Affecting', '1.4520833333333', 'Fiber', 'fiber cut & pop end sfp replaced', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(135, 'Gerrys International', 'call', 'KHI', '2026-03-30 09:20:00', '2026-03-30 10:00:00', 'Service disruption', 'closed', 'Service Affecting', '0.027777777777778', 'customer', 'port 3 was replaced with a new one, and port 15 was found unplugged, then we made it connected by Mr. Abdul Muqtadir.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(136, 'Postex Korangi', 'WhatsApp', 'KHI', '2026-03-30 09:40:00', '2026-03-30 15:40:00', 'Link Down', 'Closed', 'Service Affecting', '0.25', 'Fiber', 'OFC breakage', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(137, 'Matracon VLAN 1510', 'Email', 'KHI', '2026-03-30 09:51:00', '2026-03-30 09:53:00', 'Link Down', 'closed', 'Service Affecting', '0.0013888888888889', 'Radio', 'port refresh', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(138, 'Postex Hub Malir VLAN 1934 (Millat Garden Shadman)', 'WhatsApp', 'KHI', '2026-03-30 10:48:00', '2026-03-30 14:52:00', 'Link Down', 'closed', 'Service Affecting', '0.16944444444444', 'Fiber', 'RFO, due to fiber cut', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(139, 'Dynamic Shipping', 'Email', 'KHI', '2026-03-30 11:32:00', '2026-03-30 11:32:00', 'Slow Browsing', 'Closed', 'Service Affecting', '0', 'customer', 'Disscussed over call no issue observed informed over mail', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(140, 'RBC Orangi VLAN 961', 'WhatsApp', 'KHI', '2026-03-30 12:06:00', '2026-03-30 13:54:00', 'Link Down', 'closed', 'Service Affecting', '0.075', 'Radio', 'Frequency interference issue.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(141, 'MEKOTEX (PVT.) LIMITED- SHARPTEL', 'Email', 'KHI', '2026-03-30 14:29:00', '2026-03-30 14:29:00', 'Bandwidth', 'closed', 'Service Affecting', '0', 'No Issue Found', 'our P2P connectivity is showing normal, and no loss has been observed.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(142, 'Dynamic Shipping', 'call', 'KHI', '2026-03-31 09:55:00', '2026-03-31 09:55:00', 'Slow Browsing', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(143, 'Matracon VLAN 1510', 'Email', 'KHI', '2026-03-31 11:04:00', '2026-03-31 11:04:00', 'Slow Browsing', 'Closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(144, 'Zafa B 21', 'call', 'KHI', '2026-03-31 02:10:00', '2026-03-31 11:30:00', 'Link Down', 'closed', 'Service Affecting', '0.38888888888889', 'fiber', 'fiber cut approximately 70 meters', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(145, 'Feroze SFO', 'Proactive', 'KHI', '2026-03-31 12:14:00', '2026-03-31 22:00:00', 'Link Down', 'closed', 'Service Affecting', '0.40694444444444', 'Fiber', 'Cabel damage near baloch due to authorities are working', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(146, 'Gaditek', 'Proactive', 'KHI', '2026-03-31 12:32:00', '2026-03-31 12:32:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No activity', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(147, 'Gaditek Kashmir Road backup', 'Email', 'KHI', '2026-03-31 17:09:00', '2026-03-31 22:00:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.20208333333333', 'Fiber', 'Cabel damage near baloch due to authorities are working', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(148, 'Assurety Consulting Pvt Ltd', 'Call', 'KHI', '2026-03-31 17:37:00', '2026-04-01 13:15:00', 'Link Down', 'closed', 'Service Affecting', '0.81805555555556', 'fiber', 'Fiber was cut 4 core 50 meter, and client’s switch port was faulty', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(149, 'AWM Home', 'WhatsApp', 'KHI', '2026-03-31 22:00:00', '2026-04-01 01:00:00', 'Issue', 'closed', 'Non-Service Affecting', '0.125', '', 'Email Spam Issue Necessary corrective actions have been taken, and the issue has been resolved.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(150, 'ALI AKBAR ENTER', 'Proactive', 'HYD', '2026-04-01 04:57:00', '2026-04-01 04:57:00', 'Link Down', 'Closed', 'Service Affecting', '0', 'Power', 'Power issue at client end', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(151, 'Feroze SFO', 'Email', 'KHI', '2026-04-01 11:08:00', '2026-04-01 11:53:00', 'Link Down', 'Closed', 'Service Affecting', '0.03125', '', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(152, 'Suparco', 'Call', 'KHI', '2026-04-01 13:19:00', '2026-04-01 18:50:00', 'Link Down', 'closed', 'Service Affecting', '0.22986111111111', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(153, 'Magnacrete', 'Email', 'KHI', '2026-04-01 15:12:00', '2026-04-01 15:20:00', 'Link Down', 'closed', 'Service Affecting', '0.0055555555555556', 'Power', 'power issue at node end', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(154, 'Feroze C-3 Aggregation', 'Email', 'KHI', '2026-04-01 15:34:00', '2026-04-01 17:30:00', 'Link Down', 'closed', 'Service Affecting', '0.080555555555556', 'Fiber', 'Fibercut restored by SES', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(155, 'Ghani Glass', 'Call', 'KHI', '2026-04-01 16:20:00', '2026-04-02 10:00:00', 'Link Down', 'closed', 'Service Affecting', '0.73611111111111', 'Radio', 'Device stuck at POP end', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(156, 'Pacc Fatima', 'Proactive', 'KHI', '2026-04-02 09:43:00', '2026-04-02 09:43:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0', '', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(157, 'Jinnah sindh Medical University JSMU', 'call', 'KHI', '2026-04-02 09:50:00', '2026-04-02 12:20:00', 'Link Down', 'closed', 'Service Affecting', '0.10416666666667', 'Radio', 'Connector refreshed from both ends.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(158, 'PACC Larkana', 'Proactive', 'KHI', '2026-04-02 10:39:00', '2026-04-02 11:13:00', 'Link Down', 'closed', 'Service Affecting', '0.023611111111111', 'No activity', 'As per Netsol No activity performed at our end.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(159, 'Gerrys international Behria 4', 'Proactive', 'KHI', '2026-04-02 11:17:00', '2026-04-02 11:17:00', 'Flap', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(160, 'Gerrys international Behria 4', 'Proactive', 'KHI', '2026-04-02 11:11:00', '2026-04-02 11:11:00', 'Flap', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(161, 'Afroze Textile', 'Email', 'KHI', '2026-04-02 11:49:00', '2026-04-02 14:53:00', 'Link Down', 'closed', 'Service Affecting', '0.12777777777778', 'Radio', 'port stuck at POP end', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(162, 'Gerrys Visa UKVAC', 'Email', 'KHI', '2026-04-02 11:53:00', '2026-04-02 12:46:00', 'Packet Loss', 'closed', 'Service Affecting', '0.036805555555556', 'Equipment', 'switch has been observed to be malfunctioning', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(163, 'PC Hottel', 'Call', 'KHI', '2026-04-02 11:52:00', '2026-04-02 15:00:00', 'Issue', 'closed', 'Non-Service Affecting', '0.13055555555556', '', 'As per client\'s concern, failover switching time has been minimized.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(164, 'Magnacrete', 'Email', 'KHI', '2026-04-02 14:43:00', '2026-04-02 14:43:00', 'Packet Loss', 'Closed', 'Service Affecting', '0', 'No Issue Found', 'NO issue found informed', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(165, 'Ghani Glass', 'Call', 'KHI', '2026-04-02 16:08:00', '2026-04-02 23:21:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.30069444444444', 'Equipment', 'device reboot', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(166, 'Pak Petro Chemicals', 'Call', 'KHI', '2026-04-02 17:50:00', '2026-04-03 14:38:00', 'Link Down', 'closed', 'Service Affecting', '0.86666666666667', 'Equipment', 'POP end connector changed', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(167, 'Ghandhara', 'Call', 'KHI', '2026-04-02 17:50:00', '2026-04-03 14:38:00', 'Link Down', 'closed', 'Service Affecting', '0.86666666666667', 'Equipment', 'POP end connector changed', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(168, 'Mekotex Kotri Unit 2', 'Email', 'HYD', '2026-04-02 18:37:00', '2026-04-02 19:26:00', 'Link Down', 'closed', 'Service Affecting', '0.034027777777778', 'Equipment', 'device reboot', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(169, 'PAK POLY INDUSTRIES PVT LTD High Way', 'Proactive', 'KHI', '2026-04-03 10:15:00', '2026-04-03 14:38:00', 'Link Down', 'Closed', 'Service Affecting', '0.18263888888889', 'Equipment', 'POP end connector changed', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(170, 'PPHI secondary', 'Proactive', 'KHI', '2026-04-03 10:15:00', '2026-04-04 12:55:00', 'Link Down', 'closed', 'Service Affecting', '1.1111111111111', 'Radio', 'Connector refreshed at Tower end', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(171, 'PC Hotel', 'Proactive', 'KHI', '2026-04-03 11:42:00', '2026-04-03 14:32:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.11805555555556', 'Fiber', 'Fiber Cut restored', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(172, 'Zara Mobility', 'Proactive', 'KHI', '2026-04-03 01:15:00', '2026-04-04 08:56:00', 'Link Down', 'Closed', 'Non-Service Affecting', '1.3201388888889', 'Fiber', 'Fiber was found damaged near Sultan Masjid.', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(173, 'Muwar International', 'WhatsApp', 'KHI', '2026-04-03 12:58:00', '2026-04-04 11:32:00', 'Link Down', 'closed', 'Service Affecting', '0.94027777777778', 'Customer', 'customer end power issue', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(174, 'Mustaqim Dyeing & Printing Ind.', 'Email', 'KHI', '2026-04-03 14:57:00', '2026-04-03 14:57:00', 'Slow Browsing', 'Closed', 'Service Affecting', '0', 'Equipment', 'Port Referesh', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(175, 'Mekotex Kotri Unit 2', 'Email', 'HYD', '2026-04-03 16:30:00', '2026-04-03 16:30:00', 'Service disruption', 'closed', 'Service Affecting', '0', 'No Issue Found', 'No issue found informed by sajid on email', '2026-08-16 10:53:10', '2026-08-16 10:53:10'),
(176, 'zafa active core', 'Proactive', 'KHI', '2026-04-04 04:39:00', '2026-04-04 12:27:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.325', 'Fiber', 'Fiber was Break', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(177, 'Postex Malir', 'WhatsApp', 'KHI', '2026-04-04 10:25:00', '2026-04-04 20:52:00', 'Link Down', 'closed', 'Service Affecting', '0.43541666666667', 'Fiber', 'fiber cut', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(178, 'Magnacrete', 'Email', 'KHI', '2026-04-04 10:52:00', '2026-04-06 12:00:00', 'Packet Loss', 'Closed', 'Service Affecting', '2.0472222222222', 'Equipment', 'LAN patch cord issue at client’s end.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(179, 'Ghandhara Automobiles', 'Call', 'KHI', '2026-04-04 12:28:00', '2026-04-06 14:23:00', 'Link Down', 'closed', 'Service Affecting', '2.0798611111111', 'Radio', 'POE, LAN patch and connector refreshed', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(180, 'Pakistan Tankers Company', 'Call', 'KHI', '2026-04-04 07:37:00', '2026-04-07 18:16:00', 'Packet Loss', 'closed', 'Service Affecting', '3.44375', 'Equipment', 'Devoice has been changed query has been resolved', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(181, 'Utopia Logon', 'Proactive', 'KHI', '2026-04-05 06:57:00', '2026-04-05 07:44:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.032638888888889', 'Fiber', 'Fiber is damaged', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(182, 'AWM Main', 'Proactive', 'KHI', '2026-04-05 06:12:00', '2026-04-06 11:45:00', 'Link Down', 'closed', 'Non-Service Affecting', '1.23125', 'Fiber', 'Core was in pressure avari h.h', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(183, 'Muno Pakistan', 'Email', 'KHI', '2026-04-06 09:15:00', '2026-04-06 14:00:00', 'Link Down', 'closed', 'Service Affecting', '0.19791666666667', 'fiber', 'fiber cut', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(184, 'Postex Korangi', 'WhatsApp', 'KHI', '2026-04-06 09:42:00', '2026-04-06 13:37:00', 'Link Down', 'closed', 'Service Affecting', '0.16319444444444', 'Fiber', 'fiber cut use 100 meters 2 core', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(185, 'Matracon VLAN 1510', 'Email', 'KHI', '2026-04-06 11:14:00', '2026-04-06 11:14:00', 'Flap', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(186, 'SSF Kimari VLAN: 1768', 'Email', 'KHI', '2026-04-06 11:45:00', '2026-04-06 11:45:00', 'Service disruption', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(187, 'Saasi Arcade Clifton', 'Email', 'KHI', '2026-04-06 12:49:00', '2026-04-06 15:09:00', 'Link Down', 'closed', 'Service Affecting', '0.097222222222222', 'fiber', 'fiber cut', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(188, 'Moach Goth', 'Call', 'KHI', '2026-04-06 15:27:00', '2026-04-06 16:04:00', 'Link Down', 'closed', 'Service Affecting', '0.025694444444444', 'customer', 'customer end lan issue', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(189, 'Lucky Kathore', 'Email', 'KHI', '2026-04-06 15:26:00', '2026-04-17 17:00:00', 'Link Down', 'closed', 'Service Affecting', '11.065277777778', 'Radio', 'Worked remotely in collaboration with Lucky Knits team', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(190, 'AWM Home', 'Proactive', 'KHI', '2026-04-07 03:58:00', '2026-04-07 13:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.39722222222222', 'Fiber', 'fiber cut', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(191, 'Muno Pakistan', 'Email', 'KHI', '2026-04-07 09:24:00', '2026-04-07 12:30:00', 'Link Down', 'closed', 'Service Affecting', '0.12916666666667', '', 'fiber cut', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(192, 'Oburther Idemia', 'Email', 'KHI', '2026-04-07 10:10:00', '2026-04-07 18:16:00', 'Link Down', 'closed', 'Service Affecting', '0.3375', 'Fiber', 'RFO : Force Majeure - OFC Breakage.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(193, 'Oburther VLAN 1932', 'Email', 'KHI', '2026-04-07 10:24:00', '2026-04-07 14:14:00', 'Link Down', 'closed', 'Service Affecting', '0.15972222222222', 'Fiber', 'Fiber cut at katti korangi', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(194, 'Pak Petro Kasur', 'call', 'KHI', '2026-04-07 10:28:00', '2026-04-07 12:05:00', 'Link Down', 'closed', 'Service Affecting', '0.067361111111111', 'Radio', 'issue due to wireless dishes. Problem has been resolved after signal optimization.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(195, 'Assurety Consult', 'WhatsApp', 'KHI', '2026-04-07 10:30:00', '2026-04-07 13:30:00', 'Link Down', 'closed', 'Service Affecting', '0.125', 'fiber', 'core break', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(196, 'RBC Orangi VLAN 961', 'call', 'KHI', '2026-04-07 12:26:00', '2026-04-07 12:58:00', 'Link Down', 'closed', 'Service Affecting', '0.022222222222222', 'No activity', 'Absolute didn\'t perform any activity', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(197, 'Assurety Consult', 'WhatsApp', 'KHI', '2026-04-07 14:46:00', '2026-04-07 16:00:00', 'Link Down', 'closed', 'Service Affecting', '0.051388888888889', 'Fiber', 'fiber cut', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(198, 'Costa coffee', 'Proactive', 'KHI', '2026-04-07 14:46:00', '2026-04-07 16:00:00', 'Link Down', 'closed', 'Service Affecting', '0.051388888888889', 'Fiber', 'fiber cut', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(199, 'Saigal Moach Goth', 'Call', 'KHI', '2026-04-07 16:50:00', '2026-04-07 16:50:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(200, 'EZ Life Technology | Telecard', 'Email', 'KHI', '2026-04-08 05:22:00', '2026-04-08 08:58:00', 'Link Down', 'closed', 'Service Affecting', '0.15', 'Fiber', 'back haul fiber cut', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(201, 'Oburther VLAN 1932', 'Proactive', 'KHI', '2026-04-08 09:18:00', '2026-04-08 14:00:00', 'Link Down', 'closed', 'Service Affecting', '0.19583333333333', 'Fiber', 'Fiber cut at korangi route', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(202, 'RBC Orangi VLAN 961', 'WhatsApp', 'KHI', '2026-04-08 09:48:00', '2026-04-08 09:48:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(203, 'Lucky textile Site', 'WhatsApp', 'KHI', '2026-04-08 09:48:00', '2026-04-08 12:56:00', 'Link Down', 'closed', 'Service Affecting', '0.13055555555556', 'Fiber', 'Core break 1 joint box use', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(204, 'Gandhara Automobiles', 'Email', 'KHI', '2026-04-08 10:36:00', '2026-04-08 10:36:00', 'Flap', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(205, 'Utopia', 'Proactive', 'KHI', '2026-04-08 11:25:00', '2026-04-08 11:58:00', 'Link Down', 'closed', 'Service Affecting', '0.022916666666667', 'Fiber', 'Fiber was break', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(206, 'venus carpet Atique', 'WhatsApp', 'KHI', '2026-04-08 10:50:00', '2026-04-08 11:15:00', 'Link Down', 'closed', 'Service Affecting', '0.017361111111111', 'Equipment', 'device reboot', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(207, 'Gandhara Automobiles', 'Email', 'KHI', '2026-04-08 12:17:00', '2026-04-08 16:34:00', 'Link Down', 'closed', 'Service Affecting', '0.17847222222222', 'Radio', 'replacing the device at POP end', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(208, 'AM4 to AM2', 'Email', 'KHI', '2026-04-08 13:07:00', '2026-04-08 15:35:00', 'Link Down', 'closed', 'Service Affecting', '0.10277777777778', 'fiber', 'Cable was found damaged outside AM Unit 2 Main Gate, Korangi.', '2026-08-16 10:53:11', '2026-08-16 10:53:11');
INSERT INTO `faults_reported` (`id`, `customer_name`, `complaint_channel`, `main_city`, `opened_at`, `closed_at`, `issue`, `status`, `affect`, `aging_downtime`, `rfo`, `rca`, `created_at`, `updated_at`) VALUES
(209, 'Gaditek Kashmir Road backup', 'Proactive', 'KHI', '2026-04-08 13:25:00', '2026-04-10 15:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '2.0868055555556', '', 'suspended their services due to non-payment.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(210, 'Zara Khadda', 'Proactive', 'KHI', '2026-04-08 14:28:00', '2026-04-08 16:28:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.083333333333333', 'fiber', 'OFC was damaged.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(211, 'Abbott VLAN 1576', 'Email', 'KHI', '2026-04-08 13:43:00', '2026-04-08 15:35:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.077777777777778', 'fiber', 'Cable was found damaged outside AM Unit 2 Main Gate, Korangi.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(212, 'Hub Leather', 'Call', 'KHI', '2026-04-08 16:09:00', '2026-04-08 18:03:00', 'Link Down', 'closed', 'Service Affecting', '0.079166666666667', 'No Issue Found', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(213, 'Muno Pakistan', 'Email', 'KHI', '2026-04-08 16:29:00', '2026-04-08 18:10:00', 'Link Down', 'closed', 'Service Affecting', '0.070138888888889', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(214, 'Hesco Steel', 'Call', 'KHI', '2026-04-08 19:59:00', '2026-04-08 19:59:00', 'Link Down', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(215, 'Fedex kashmir Road', 'Email', 'KHI', '2026-04-08 22:57:00', '2026-04-09 10:28:00', 'Link Down', 'closed', 'Service Affecting', '0.47986111111111', 'customer', 'During OTDR testing at POP, fault was found inside the client premises. As confirmed with POC Mr. Dawood (0327-6445318), there was a power issue at their end.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(216, 'Feroze S81 VLAN 952', 'Email', 'KHI', '2026-04-09 09:11:00', '2026-04-13 14:23:00', 'Link Down', 'closed', 'Service Affecting', '4.2166666666667', 'customer', 'Client has changed configuration (trunk to access port ) in his internal network,', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(217, 'TWA primary', 'Proactive', 'KHI', '2026-04-09 10:00:00', '2026-04-09 15:35:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.23263888888889', 'Fiber', 'Cable was found damaged near Marriot Hotel , Frere Hall, due to the KWSB excavator working', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(218, 'Pak Petro Chemicals', 'Call', 'KHI', '2026-04-09 09:15:00', '2026-04-09 12:15:00', 'Link Down', 'closed', 'Service Affecting', '0.125', 'Radio', 'ODO and connector have been refreshed at POP end.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(219, 'Hub Leather VLAN 951', 'call', 'KHI', '2026-04-09 12:40:00', '2026-04-09 15:08:00', 'Link Down', 'closed', 'Service Affecting', '0.10277777777778', '', 'Fiber break.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(220, 'Hesco Steel', 'WhatsApp', 'KHI', '2026-04-09 11:00:00', '2026-04-09 15:08:00', 'Link Down', 'closed', 'Service Affecting', '0.17222222222222', '', 'Fiber break.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(221, 'Saigal Moach Goth', 'Call', 'KHI', '2026-04-09 11:00:00', '2026-04-10 15:15:00', 'Link Down', 'closed', 'Service Affecting', '1.1770833333333', 'No activity', 'didn\'t perform any activity.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(222, 'Aurther lawrence link 1 (PECHS)', 'Email', 'KHI', '2026-04-09 20:00:00', '2026-04-09 20:00:00', 'Slow Browsing', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', 'Testing completed no issue found informed', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(223, 'Utopia VLAN 3826', 'Proactive', 'KHI', '2026-04-09 22:15:00', '2026-04-10 15:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.71875', '', 'Unactive due to nonpayment as per logon', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(224, 'Lucky Textile', 'Proactive', 'KHI', '2026-04-09 20:00:00', '2026-04-10 15:30:00', 'Link Down', 'closed', 'Service Affecting', '0.8125', '', 'Logon has suspended their services due to non-payment.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(225, 'stack lab fiber-back up', 'Proactive', 'KHI', '2026-04-09 22:15:00', '2026-04-10 15:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.71875', '', 'Unactive due to nonpayment as per logon', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(226, 'Ameen sb', 'Proactive', 'KHI', '2026-04-10 04:30:00', '2026-04-11 19:31:00', 'Link Down', 'closed', 'Service Affecting', '1.6256944444444', 'fiber', 'Fiber Cut', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(227, 'Pak Poly Industries', 'call', 'KHI', '2026-04-10 09:10:00', '2026-04-10 12:40:00', 'Link Down', 'closed', 'Service Affecting', '0.14583333333333', 'Equipment', 'RF team deploy new link and visit at POP end', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(228, 'SSF Kimari VLAN: 1768', 'Email', 'KHI', '2026-04-10 09:58:00', '2026-04-10 09:58:00', 'Bandwidth', 'closed', 'Service Affecting', '0', 'No Issue Found', 'Eureka will share the relevant bandwidth document as evidence', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(229, 'Hub Leather', 'call', 'KHI', '2026-04-10 09:50:00', '2026-04-10 16:22:00', 'Upload issue', 'closed', 'Service Affecting', '0.27222222222222', 'Radio', 'Frequency Interference.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(230, 'UK Vac', 'Email', 'KHI', '2026-04-10 10:27:00', '2026-04-10 10:27:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No Issue Found', 'our Field Engineer Mr. Khurram visited client premises today. However, Mr. Jahanzaib confirmed that link is working properly after switch was replacement', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(231, 'Magnacrete', 'Email', 'KHI', '2026-04-10 12:54:00', '2026-04-10 12:54:00', 'Link Down', 'closed', 'Service Affecting', '0', 'Customer', 'link is down due to upgradation query from client. Our team is working at factory end', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(232, 'Bori Kaka', 'Proactive', 'HYD', '2026-04-10 06:00:00', '2026-04-10 15:00:00', 'Link Down', 'closed', 'Service Affecting', '0.375', 'customer', 'Port down due to router is switched off at client end.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(233, 'AWM', 'Proactive', 'KHI', '2026-04-10 16:00:00', '2026-04-14 03:25:00', 'Link Down', 'closed', 'Service Affecting', '3.4756944444444', 'Fiber', 'fiber cut', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(234, 'six sigma gerrys travel', 'Proactive', 'KHI', '2026-04-11 06:35:00', '2026-04-11 15:35:00', 'Link Down', 'closed', 'Service Affecting', '0.375', 'Fiber', 'OFC Breakage/60 mtr 4 core 2 joint box use', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(235, 'Oburther VLAN 1932', 'Proactive', 'KHI', '2026-04-11 14:00:00', '2026-04-11 15:06:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.045833333333333', 'Power', 'Power issue at node end', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(236, 'General Tyre Landhi', 'Proactive', 'KHI', '2026-04-12 08:00:00', '2026-04-12 08:00:00', 'Link Down', 'closed', 'Service Affecting', '0', 'Fiber', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(237, 'Ameen sb', 'Proactive', 'KHI', '2026-04-12 06:00:00', '2026-04-14 07:59:00', 'Link Down', 'Closed', 'Service Affecting', '2.0826388888889', 'Fiber', 'Fiber Breakge', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(238, 'mianwali dplc', 'Proactive', 'KHI', '2026-04-12 13:43:00', '2026-04-12 14:44:00', 'Link Down', 'closed', 'Service Affecting', '0.042361111111111', 'Power', 'As discussed with farooq power issue at POP end', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(239, 'Ameen Sb New Link', 'Proactive', 'KHI', '2026-04-13 01:43:00', '2026-04-14 17:00:00', 'Link Down', 'closed', 'Service Affecting', '1.6368055555556', 'Fiber', 'Client will check his own internal connectivity', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(240, 'Saylani HO', 'Email', 'KHI', '2026-04-13 09:03:00', '2026-04-13 09:03:00', 'Link Down', 'closed', 'Service Affecting', '0', 'Customer', 'link working on direct connecting via last mile device', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(241, 'Muno Pakistan', 'Email', 'KHI', '2026-04-13 09:18:00', '2026-04-13 13:17:00', 'Link Down', 'closed', 'Service Affecting', '0.16597222222222', 'Fiber', 'fiber cut, 4 core 70 meter use', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(242, 'Magnacrete', 'Email', 'KHI', '2026-04-13 09:10:00', '2026-04-13 09:10:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(243, 'Saudi Pak', 'WhatsApp', 'KHI', '2026-04-13 09:56:00', '2026-04-13 14:35:00', 'Link Down', 'closed', 'Service Affecting', '0.19375', 'Equipment', 'media converter replaced', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(244, 'Fedex Kashmir RD', 'Email', 'KHI', '2026-04-13 10:01:00', '2026-04-13 10:46:00', 'Link Down', 'closed', 'Service Affecting', '0.03125', 'fiber', 'Backhaul Connectivity issue', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(245, 'AWM IT Pvt Ltd', 'call', 'KHI', '2026-04-13 11:40:00', '2026-04-13 13:20:00', 'Link Down', 'closed', 'Service Affecting', '0.069444444444444', 'Equipment', 'client’s router was found to be malfunctioning. It has been replaced with a new router provided by client.', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(246, 'Zara Khadda', 'Proactive', 'KHI', '2026-04-13 12:45:00', '2026-04-13 22:16:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.39652777777778', 'Fiber', 'OFC Breackage', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(247, 'PACC Liaquat VLAN 930 & 1935', 'WhatsApp', 'KHI', '2026-04-13 13:01:00', '2026-04-14 13:17:00', 'Link Down', 'closed', 'Service Affecting', '1.0111111111111', '', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(248, 'OF Logistic', 'Email', 'KHI', '2026-04-13 11:51:00', '2026-04-13 13:45:00', 'High Latency', 'closed', 'Non-Service Affecting', '0.079166666666667', 'Upstream', 'latency seems normal', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(249, 'Postex Quetta Town', 'WhatsApp', 'KHI', '2026-04-13 14:13:00', '2026-04-15 09:00:00', 'Link Down', 'closed', 'Service Affecting', '1.7826388888889', 'fiber', 'fiber damaged at multiple points', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(250, 'Hub Leather VLAN 951', 'WhatsApp', 'KHI', '2026-04-13 14:23:00', '2026-04-13 14:47:00', 'Link Down', 'closed', 'Service Affecting', '0.016666666666667', 'No Issue Found', '', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(251, 'Gaditake Kashmir road', 'Proactive', 'KHI', '2026-04-13 19:09:00', '2026-04-14 15:35:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.85138888888889', 'Fiber', 'Fiber Breakage', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(252, 'Zara mobility', 'Proactive', 'KHI', '2026-04-14 02:09:00', '2026-04-15 04:09:00', 'Link Down', 'Closed', 'Non-Service Affecting', '1.0833333333333', 'Fiber', 'Restored || Fiber Breakage', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(253, 'AWM Satcomm link', 'Proactive', 'KHI', '2026-04-14 06:09:00', '2026-04-14 13:22:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.30069444444444', 'Fiber', 'Pressure was identified in the UG OFC at 1KM from Wali house', '2026-08-16 10:53:11', '2026-08-16 10:53:11'),
(254, 'DHL Port Qasim', 'call', 'KHI', '2026-04-14 09:25:00', '2026-04-14 14:30:00', 'Link Down', 'closed', 'Service Affecting', '0.21180555555556', 'Radio', 'LAN part malfunction', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(255, 'EOBI', 'Email', 'KHI', '2026-04-14 11:49:00', '2026-04-14 17:15:00', 'Link Down', 'closed', 'Service Affecting', '0.22638888888889', 'customer', 'faulty Ethernet connector replaced at client end', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(256, 'AWM', 'Proactive', 'KHI', '2026-04-14 13:14:00', '2026-04-14 13:35:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.014583333333333', 'No activity', 'as per We didn\'t perform any activity', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(257, 'Afroze Textile', 'Email', 'KHI', '2026-04-14 22:09:00', '2026-04-15 15:30:00', 'Link Down', 'closed', 'Service Affecting', '0.72291666666667', '', 'device reconfigured, and connector refreshed at POP end.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(258, 'EOBI', 'Email', 'KHI', '2026-04-15 09:23:00', '2026-04-15 13:35:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.175', 'radio', 'After replacing the cable at client premises, link has been restored.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(259, 'AWM Home', 'Proactive', 'KHI', '2026-04-15 11:48:00', '2026-04-15 14:35:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.11597222222222', 'fiber', 'due to fiber removal from a pole located near Arshad Sb premises.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(260, 'Pakistan Tankers Company', 'call', 'KHI', '2026-04-15 12:10:00', '2026-04-15 12:10:00', 'Slow Browsing', 'closed', 'Service Affecting', '0', 'customer', 'Client\'s internal connectivity issue', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(261, 'Magnacreate', 'WhatsApp', 'KHI', '2026-04-15 12:15:00', '2026-04-15 12:15:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(262, 'Abbott Vlan:1576', 'Email', 'KHI', '2026-04-15 13:20:00', '2026-04-15 13:35:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.010416666666667', 'Fiber', 'Link affected due to AM POP down / Cable was found damaged near Alkaram Textile , Landhi.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(263, 'AM4 to AM2', 'Email', 'KHI', '2026-04-15 12:54:00', '2026-04-15 15:15:00', 'Link Down', 'closed', 'Service Affecting', '0.097916666666667', 'fiber', 'Cable was found damaged near Alkaram Textile , Landhi.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(264, 'AJM Pharma', 'call', 'KHI', '2026-04-15 14:00:00', '2026-04-15 14:35:00', 'Link Down', 'closed', 'Service Affecting', '0.024305555555556', 'Fiber', 'Link affected due to AM POP down / Cable was found damaged near Alkaram Textile , Landhi.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(265, 'Al Momin Link 1 & 2', 'call', 'KHI', '2026-04-15 14:15:00', '2026-04-15 14:20:00', 'Link Down', 'closed', 'Service Affecting', '0.0034722222222222', 'Radio', 'back haul issue', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(266, 'PPHI', 'call', 'KHI', '2026-04-15 15:44:00', '2026-04-16 15:44:00', 'Link Down', 'closed', 'Service Affecting', '1', 'fiber', 'Underground ofc cut 4900m from node', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(267, 'Magnacreate', 'call', 'KHI', '2026-04-15 16:20:00', '2026-04-15 20:06:00', 'Link Down', 'closed', 'Service Affecting', '0.15694444444444', 'Fiber', 'RFO : The authorities had removed some poles in the area, which has caused damage to our fiber cables.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(268, 'DWP - VLAN: 1764', 'Email', 'KHI', '2026-04-15 16:31:00', '2026-04-15 20:06:00', 'Link Down', 'closed', 'Service Affecting', '0.14930555555556', 'Fiber', 'RFO : The authorities had removed some poles in the area, which has caused damage to our fiber cables.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(269, 'Bari - Fatani VLAN: 1763', 'Email', 'KHI', '2026-04-15 16:31:00', '2026-04-15 20:06:00', 'Link Down', 'closed', 'Service Affecting', '0.14930555555556', 'Fiber', 'RFO : The authorities had removed some poles in the area, which has caused damage to our fiber cables.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(270, 'Feroze H-23', 'Email', 'KHI', '2026-04-15 16:38:00', '2026-04-15 20:06:00', 'Link Down', 'closed', 'Service Affecting', '0.14444444444444', 'Fiber', 'RFO : The authorities had removed some poles in the area, which has caused damage to our fiber cables.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(271, 'Abbott Vlan:1576', 'Email', 'KHI', '2026-04-15 16:34:00', '2026-04-15 20:06:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.14722222222222', 'Fiber', 'RFO : The authorities had removed some poles in the area, which has caused damage to our fiber cables.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(272, 'Abbott Vlan:1575', 'Email', 'KHI', '2026-04-15 16:34:00', '2026-04-15 20:06:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.14722222222222', 'Fiber', 'RFO : The authorities had removed some poles in the area, which has caused damage to our fiber cables.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(273, 'TATA Pakistan RDS', 'Email', 'KHI', '2026-04-15 18:08:00', '2026-04-15 20:06:00', 'Link Down', 'closed', 'Service Affecting', '0.081944444444444', 'Fiber', 'RFO : The authorities had removed some poles in the area, which has caused damage to our fiber cables.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(274, 'stack lab fiber-back up', 'Proactive', 'KHI', '2026-04-15 22:21:00', '2026-04-16 00:01:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.069444444444444', 'fiber', 'Cable was found damaged near pop', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(275, 'Muno Pakistan', 'Email', 'KHI', '2026-04-16 08:54:00', '2026-04-16 13:00:00', 'Link Down', 'closed', 'Service Affecting', '0.17083333333333', 'fiber', 'fiber cut', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(276, 'Amarant Pharma', 'WhatsApp', 'KHI', '2026-04-16 09:02:00', '2026-04-16 09:02:00', 'Link Down', 'closed', 'Service Affecting', '0', 'customer', 'LAN cable unplugged at client end', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(277, 'Lucky SITE', 'WhatsApp', 'KHI', '2026-04-16 09:19:00', '2026-04-16 14:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.21597222222222', 'fiber', 'fiber cut', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(278, 'Lucky Kathore', 'WhatsApp', 'KHI', '2026-04-16 09:19:00', '2026-04-16 09:22:00', 'Link Down', 'closed', 'Service Affecting', '0.0020833333333333', 'Radio', 'device reboot', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(279, 'AM4 to AM2', 'Email', 'KHI', '2026-04-16 09:45:00', '2026-04-16 09:45:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'customer', 'no issue observed', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(280, 'Kamil converter', 'call', 'KHI', '2026-04-16 10:00:00', '2026-04-16 14:30:00', 'Link Down', 'closed', 'Service Affecting', '0.1875', 'fiber', 'fiber cut', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(281, 'PACC Liaquat VLAN 930 & 1935', 'Email', 'KHI', '2026-04-16 10:43:00', '2026-04-16 14:03:00', 'Link Down', 'closed', 'Service Affecting', '0.13888888888889', 'Fiber', 'for primary: Fiber cut, for backup: Joint/core issue', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(282, 'Pak poly Industries', 'call', 'KHI', '2026-04-16 10:45:00', '2026-04-16 11:15:00', 'Slow Browsing', 'closed', 'Service Affecting', '0.020833333333333', 'Radio', 'fine tune', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(283, 'GTV Network', 'call', 'KHI', '2026-04-16 11:31:00', '2026-04-22 17:24:00', 'Link Down', 'closed', 'Service Affecting', '6.2451388888889', 'Radio', 'after installed equipment.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(284, 'IO-Digital VLAN 2094', 'Email', 'KHI', '2026-04-16 12:09:00', '2026-04-16 15:20:00', 'Flap', 'closed', 'Service Affecting', '0.13263888888889', 'fiber', 'link was affected due to low optical power. team was working on it', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(285, 'EZ Life Technologies Private Limited', 'Email', 'KHI', '2026-04-16 13:12:00', '2026-04-16 15:20:00', 'Link Down', 'closed', 'Service Affecting', '0.088888888888889', 'fiber', 'link was affected due to low optical power. team was working on it', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(286, 'Alamgir Welfare Korangi', 'Email', 'KHI', '2026-04-16 14:43:00', '2026-04-16 15:20:00', 'Link Down', 'closed', 'Service Affecting', '0.025694444444444', 'fiber', 'link was affected due to low optical power. team was working on it', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(287, 'YTM-02', 'Email', 'KHI', '2026-04-16 15:05:00', '2026-04-16 15:40:00', 'Slow Browsing', 'closed', 'Service Affecting', '0.024305555555556', 'Radio', 'port refresh', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(288, 'GT Active Core', 'Proactive', 'KHI', '2026-04-16 17:18:00', '2026-04-17 00:07:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.28402777777778', 'Fiber', 'Cable was found damaged near Younis Chowrangi.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(289, 'Chippa Welfare Association primary', 'WhatsApp', 'KHI', '2026-04-17 01:58:00', '2026-04-17 05:19:00', 'Link Down', 'closed', 'Service Affecting', '0.13958333333333', 'Inquiry', 'RFO pending', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(290, 'Pak Petro', 'call', 'KHI', '2026-04-17 09:57:00', '2026-04-17 11:20:00', 'Link Down', 'closed', 'Service Affecting', '0.057638888888889', 'Radio', 'issue was related to the dishes', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(291, 'Hyd Hesco', 'Proactive', 'HYD', '2026-04-18 05:02:00', '2026-04-18 10:49:00', 'link down', 'closed', 'Non-Service Affecting', '0.24097222222222', 'Fiber', 'Either Patch card Issue', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(292, 'Lucky Kathore', 'Call', 'KHI', '2026-04-18 09:14:00', '2026-04-18 09:14:00', 'Slow Browsing', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(293, 'Lucky Site', 'WhatsApp', 'KHI', '2026-04-18 09:14:00', '2026-04-19 14:24:00', 'Link Down', 'closed', 'Service Affecting', '1.2152777777778', 'Fiber', 'Core was in pressure', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(294, 'IO-Digital VLAN 2094', 'Email', 'KHI', '2026-04-18 12:12:00', '2026-04-18 15:33:00', 'Link Down', 'closed', 'Service Affecting', '0.13958333333333', '', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(295, 'EZ Life Technology | Telecard', 'Email', 'KHI', '2026-04-18 13:22:00', '2026-04-18 15:33:00', 'Link Down', 'closed', 'Service Affecting', '0.090972222222222', '', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(296, 'alamgir welfare', 'Email', 'KHI', '2026-04-18 13:22:00', '2026-04-18 15:33:00', 'Link Down', 'closed', 'Service Affecting', '0.090972222222222', '', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(297, 'Digital Process pvt Ltd', 'Call', 'KHI', '2026-04-18 13:57:00', '2026-04-18 15:33:00', 'Link Down', 'closed', 'Service Affecting', '0.066666666666667', '', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(298, 'Zhong-Engineering', 'Call', 'HYD', '2026-04-18 11:00:00', '2026-04-18 13:40:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.11111111111111', 'Equipment', 'Devocie Rebooted at POP end', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(299, 'Mars BPO', 'call', 'KHI', '2026-04-18 23:14:00', '2026-04-18 23:56:00', 'Slow Browsing', 'closed', 'Service Affecting', '0.029166666666667', 'customer', 'POC : 0335-2401332 || Call POC for confirmation after 1am night', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(300, 'utopia logon', 'Proactive', 'KHI', '2026-04-20 06:30:00', '2026-04-20 16:45:00', 'Link Down', 'closed', 'Service Affecting', '0.42708333333333', 'Fiber', 'RFO= Core was found broken at Distribution Joint', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(301, 'Stahl Pakistan VLAN 925', 'Email', 'KHI', '2026-04-20 08:50:00', '2026-04-21 07:50:00', 'Link Down', 'Closed', 'Service Affecting', '0.95833333333333', 'Fiber', 'Fiber Breakage', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(302, 'Muno Pakistan', 'Email', 'KHI', '2026-04-20 09:01:00', '2026-04-20 12:34:00', 'Link Down', 'closed', 'Service Affecting', '0.14791666666667', 'fiber', 'fiber cut (approx. 60 meters).', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(303, 'Kompass Pakistan', 'Email', 'KHI', '2026-04-20 09:06:00', '2026-04-20 15:13:00', 'Link Down', 'closed', 'Service Affecting', '0.25486111111111', 'Radio', 'connector refresh at client end', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(304, 'HRSG Outsourcing', 'Email', 'KHI', '2026-04-20 09:53:00', '2026-04-20 13:26:00', 'Link Down', 'closed', 'Service Affecting', '0.14791666666667', 'Fiber', 'fiber cut 1 joint box use', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(305, 'Pakistan Tankers Company', 'Call', 'KHI', '2026-04-20 10:00:00', '2026-04-20 10:00:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(306, 'China VAC', 'WhatsApp', 'KHI', '2026-04-20 10:31:00', '2026-04-20 16:10:00', 'High Latency', 'closed', 'Service Affecting', '0.23541666666667', 'Upstream', 'Route optimized', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(307, 'Dashi Foods (HUB) VLAN 956', 'call', 'KHI', '2026-04-20 10:43:00', '2026-04-20 10:43:00', 'Link Down', 'closed', 'Service Affecting', '0', 'customer', 'client has deliberately powered off his device', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(308, 'Saigal Moach Goth', 'Email', 'KHI', '2026-04-20 10:47:00', '2026-04-20 12:25:00', 'Link Down', 'closed', 'Service Affecting', '0.068055555555556', 'Radio', 'Frequency interference.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(309, 'OF Logistix ERP software issue', 'Email', 'KHI', '2026-04-20 11:11:00', '2026-04-21 12:35:00', 'Issue', 'closed', 'Non-Service Affecting', '1.0583333333333', 'customer', 'Issue was resolved by changing the IP', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(310, 'PACC Liaquat VLAN 1935', 'Proactive', 'KHI', '2026-04-20 13:10:00', '2026-04-20 13:40:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.020833333333333', 'Power', 'due to Node was offline', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(311, 'Faisalabad oil refinery Vlan 1502', 'Email', 'KHI', '2026-04-20 18:10:00', '2026-04-20 18:10:00', 'Link Down', 'Closed', 'Service Affecting', '0', 'No activity', 'link is already UP, No activity performed by our side, GCS', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(312, 'Zara Mobility', 'Proactive', 'KHI', '2026-04-21 06:50:00', '2026-05-16 15:15:00', 'Link Down', 'closed', 'Non-Service Affecting', '25.350694444444', 'Fiber', 'Underground fiber was damaged near Khadda market', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(313, 'AWM', 'Proactive', 'KHI', '2026-04-21 06:50:00', '2026-04-21 12:16:00', 'link down', 'closed', 'Non-Service Affecting', '0.22638888888889', 'Fiber', 'OFC was break at 7700meter', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(314, 'Zil Ltd', 'Proactive', 'KHI', '2026-04-21 06:50:00', '2026-04-21 11:44:00', 'link down', 'closed', 'Service Affecting', '0.20416666666667', 'fiber', 'patch cord was broken at client’s end.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(315, 'utopia logon', 'Proactive', 'KHI', '2026-04-21 18:43:00', '2026-04-22 03:37:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.37083333333333', 'fiber', 'RFO : Fiber Breakage', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(316, 'Move n pick', 'Proactive', 'KHI', '2026-04-21 19:25:00', '2026-04-21 20:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.045138888888889', 'fiber', 'OFC Breakage', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(317, 'Ghandhara Automobiles Limited Port Qasim', 'Email', 'KHI', '2026-04-22 11:39:00', '2026-04-22 11:55:00', 'Link Down', 'closed', 'Service Affecting', '0.011111111111111', 'Radio', 'Device Stuck', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(318, 'FedEx Kashmir Road', 'Email', 'KHI', '2026-04-22 13:05:00', '2026-04-22 13:51:00', 'Link Down', 'closed', 'Service Affecting', '0.031944444444444', 'fiber', 'Backhaul Connectivity Issue', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(319, 'Utopia Industries', 'Proactive', 'KHI', '2026-04-22 13:50:00', '2026-04-22 16:48:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.12361111111111', 'Fiber', 'RFO : Fiber was found damaged near north Karachi', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(320, 'GD Office', 'Proactive', 'KHI', '2026-04-22 15:13:00', '2026-04-23 13:40:00', 'link down', 'closed', 'Non-Service Affecting', '0.93541666666667', 'fiber', 'There is a fiber cut in the outside plant section.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(321, 'Postex Quetta Town VLAN 1936', 'WhatsApp', 'KHI', '2026-04-23 08:59:00', '2026-04-23 20:26:00', 'Link Down', 'closed', 'Service Affecting', '0.47708333333333', '', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(322, 'Hesco Steel', 'WhatsApp', 'KHI', '2026-04-23 09:49:00', '2026-04-23 10:14:00', 'Link Down', 'closed', 'Service Affecting', '0.017361111111111', 'Radio', 'Frequency Interference', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(323, 'AM4 to AM2', 'Email', 'KHI', '2026-04-23 10:42:00', '2026-04-23 10:48:00', 'Packet Loss', 'closed', 'Service Affecting', '0.0041666666666667', 'Upstream', 'Service degradation has been observed from upstream vendor.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(324, 'AWM Home', 'Proactive', 'KHI', '2026-04-23 11:43:00', '2026-04-23 13:30:00', 'Link Down', 'closed', 'Service Affecting', '0.074305555555556', 'Equipment', 'switch stuck Cisco 3650 and service restore after rebooting the switch', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(325, 'Zara Khadda', 'Proactive', 'KHI', '2026-04-23 12:37:00', '2026-04-23 19:15:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.27638888888889', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(326, 'GT Active Core', 'Proactive', 'KHI', '2026-04-23 14:50:00', '2026-04-23 18:35:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.15625', 'Fiber', 'Cable was found damaged near Younus Chowrangi, Landhi.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(327, 'AM2 to AM4', 'Proactive', 'KHI', '2026-04-23 14:13:00', '2026-04-23 15:25:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.05', 'Fiber', 'cable was cut by Artistic Milliners authorities. As a result, we have performed route shifting at AM unit to restore the service.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(328, 'Pro Athletic SKBZ Cricket Ground', 'call', 'KHI', '2026-04-23 13:45:00', '2026-04-23 13:45:00', 'Issue', 'closed', 'Service Affecting', '0', '', 'Internet service is working properly.Issue appears to be related to camera system rather than internet connectivity. Therefore, Mr. Faraz will arrange a check through technician or third-party vendor.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(329, 'DWP - VLAN: 1764', 'Email', 'KHI', '2026-04-23 17:08:00', '2026-04-23 18:35:00', 'Link Down', 'closed', 'Service Affecting', '0.060416666666667', 'Fiber', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(330, 'Bari - Fatani VLAN: 1763', 'Email', 'KHI', '2026-04-23 17:08:00', '2026-04-23 18:35:00', 'Link Down', 'closed', 'Service Affecting', '0.060416666666667', 'Fiber', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(331, 'Mekotex', 'Email', 'KHI', '2026-04-23 17:21:00', '2026-04-23 18:35:00', 'Link Down', 'closed', 'Service Affecting', '0.051388888888889', 'Fiber', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(332, 'Ghani Glass', 'Call', 'KHI', '2026-04-23 17:21:00', '2026-04-23 18:35:00', 'Link Down', 'closed', 'Service Affecting', '0.051388888888889', 'Fiber', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(333, 'Pakistan Tankers Company', 'Call', 'KHI', '2026-04-23 17:26:00', '2026-04-23 18:35:00', 'Link Down', 'closed', 'Service Affecting', '0.047916666666667', 'Fiber', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(334, 'Kuehne + Nagel', 'Call', 'KHI', '2026-04-23 17:38:00', '2026-04-23 18:35:00', 'Link Down', 'closed', 'Service Affecting', '0.039583333333333', 'Fiber', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(335, 'SSF Kimari VLAN: 1768', 'Email', 'KHI', '2026-04-23 18:25:00', '2026-04-23 18:25:00', 'Link Down', 'Closed', 'Service Affecting', '0', 'No Issue Found', 'Link is already showing up', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(336, 'Kassim Textile Pvt Ltd RF Landhi', 'Email', 'KHI', '2026-04-23 18:31:00', '2026-04-23 18:35:00', 'Link Down', 'closed', 'Service Affecting', '0.0027777777777778', 'Fiber', '', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(337, 'Gaditake Kashmir road', 'Proactive', 'KHI', '2026-04-24 01:04:00', '2026-04-24 03:47:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.11319444444444', 'Fiber', 'Core break near grand palace banquet PECHS', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(338, 'Kompass Pakistan', 'Email', 'KHI', '2026-04-24 09:11:00', '2026-04-24 12:37:00', 'Data Down', 'closed', 'Non-Service Affecting', '0.14305555555556', 'Radio', 'Connector refreshed at IDU end and LAN patch cable replaced.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(339, 'General Tyre Landhi', 'call', 'KHI', '2026-04-24 09:20:00', '2026-04-24 09:20:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', 'by checking the link on direct connectivity no issue found from our end.', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(340, 'General Tyre', 'Email', 'KHI', '2026-04-24 11:18:00', '2026-04-24 11:18:00', 'Issue', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', 'all connectivity from our end is found to be normal', '2026-08-16 10:53:12', '2026-08-16 10:53:12'),
(341, 'CC Altamash pop', 'WhatsApp', 'KHI', '2026-04-25 11:59:00', '2026-04-25 14:00:00', 'link down', 'closed', 'Service Affecting', '0.084027777777778', 'Equipment', 'Due to client end mantanance activity informed to cutomer also via call', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(342, 'Kutiyana Memon Hospital', 'WhatsApp', 'KHI', '2026-04-25 17:09:00', '2026-04-25 18:01:00', 'Link Down', 'Closed', 'Service Affecting', '0.036111111111111', 'Fiber', 'Fiber Breakage', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(343, 'Muno Pakistan', 'Proactive', 'HYD', '2026-04-26 13:30:00', '2026-04-26 15:00:00', 'Link Down', 'closed', 'Service Affecting', '0.0625', 'Fiber', 'RFO pending on fiber team', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(344, 'Bhoana VLAN 567', 'WhatsApp', 'HYD', '2026-04-26 16:20:00', '2026-04-27 01:30:00', 'Slow Browsing', 'closed', 'Service Affecting', '0.38194444444444', 'Equipment', ': Link thorughput degraded due to physical port connectivity issue. Service restored to normal after changing serving port.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(345, 'Oburther VLAN 1932', 'Proactive', 'KHI', '2026-04-27 09:07:00', '2026-04-28 09:15:00', 'Link Down', 'closed', 'Non-Service Affecting', '1.0055555555556', 'fiber', 'due to multiple fiber cut on brooks route.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(346, 'zafa to zafa b10', 'Proactive', 'KHI', '2026-04-27 06:04:00', '2026-04-27 13:02:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.29027777777778', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(347, 'Stahl Pakistan', 'Email', 'KHI', '2026-04-27 09:04:00', '2026-04-27 09:04:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(348, 'Utopia Industries', 'Email', 'KHI', '2026-04-27 09:34:00', '2026-04-27 12:35:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.12569444444444', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(349, 'PACC Khairpur', 'Email', 'KHI', '2026-04-27 10:37:00', '2026-04-27 16:07:00', 'Link Down', 'Closed', 'Service Affecting', '0.22916666666667', 'Fiber', 'fiber patch changed.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(350, 'Star Denim', 'Call', 'KHI', '2026-04-27 11:02:00', '2026-04-27 12:45:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.071527777777778', '', 'Link affected due to SES fiber down', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(351, '2 Shades', 'Email', 'KHI', '2026-04-27 10:14:00', '2026-04-27 10:14:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(352, 'Utopia 4 to 6', 'Email', 'KHI', '2026-04-27 10:15:00', '2026-04-27 12:35:00', 'Link Down', 'closed', 'Service Affecting', '0.097222222222222', 'Radio', 'Link was flapping due to Backhaul interference issue', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(353, 'AWM Home', 'Proactive', 'KHI', '2026-04-27 11:43:00', '2026-04-29 18:10:00', 'Link Down', 'closed', 'Non-Service Affecting', '2.26875', 'Fiber', '500m 6 core 2joint used', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(354, 'Pakistan Tankers Company', 'Call', 'KHI', '2026-04-27 09:30:00', '2026-04-27 09:30:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(355, 'Ghandhara', 'Email', 'KHI', '2026-04-27 08:19:00', '2026-04-27 16:25:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.3375', 'Equipment', 'ODU,connector and LAN patch replaced', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(356, 'Saigal Packages Mouch Goth', 'Email', 'KHI', '2026-04-27 13:30:00', '2026-04-28 13:07:00', 'Link Down', 'closed', 'Service Affecting', '0.98402777777778', 'Equipment', 'LAN port not connected at client end/ POE device needs to be replaced', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(357, 'Afroze Textile', 'Email', 'KHI', '2026-04-27 06:36:00', '2026-04-27 13:45:00', 'Flap', 'closed', 'Service Affecting', '0.29791666666667', 'Radio', 'Link was flapping due to Backhaul interference issue', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(358, 'Hub Leather VLAN 951', 'Call', 'KHI', '2026-04-27 16:33:00', '2026-04-27 18:15:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.070833333333333', 'No Issue Found', 'delay in response from Absolut’s end.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(359, 'Feroze S81', 'Email', 'KHI', '2026-04-27 16:36:00', '2026-04-27 18:16:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.069444444444444', 'No Issue Found', 'delay in response from Absolut’s end.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(360, 'Ghandhara Automobiles Limited Port Qasim', 'Email', 'KHI', '2026-04-28 08:46:00', '2026-04-28 13:04:00', 'Link Down', 'closed', 'Service Affecting', '0.17916666666667', 'Radio', 'device changed at POP end', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(361, 'PC hotel', 'Proactive', 'KHI', '2026-04-28 03:33:00', '2026-04-28 12:04:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.35486111111111', '', 'Link has been shifted to Gerrys fiber', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(362, 'Movienpick burried DC', 'Proactive', 'KHI', '2026-04-28 03:33:00', '2026-04-28 12:04:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.35486111111111', 'fiber', 'core was damaged', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(363, 'Utopia Industries', 'Proactive', 'KHI', '2026-04-28 09:15:00', '2026-04-28 09:53:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.026388888888889', 'Fiber', 'Logon primary link down trafic routed on backup', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(364, 'PPHI', 'call', 'KHI', '2026-04-28 10:30:00', '2026-04-28 10:30:00', 'Issue', 'closed', 'Service Affecting', '0', 'Customer', 'client end device hard reboot', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(365, 'Sharptel Mekotex', 'Email', 'KHI', '2026-04-28 13:12:00', '2026-04-28 13:14:00', 'Link Down', 'Closed', 'Service Affecting', '0.0013888888888889', 'Fiber', 'Miner flap was observed', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(366, 'Gaditek Kashmir Road backup', 'Proactive', 'KHI', '2026-04-28 13:52:00', '2026-04-29 22:08:00', 'Link Down', 'closed', 'Non-Service Affecting', '1.3444444444444', 'Fiber', 'Multiple core brake in underground', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(367, 'NRSP', 'Email', 'HYD', '2026-04-28 14:11:00', '2026-04-28 14:11:00', 'Slow Browsing', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', 'No issue found informed to customer', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(368, 'AM Unit 4', 'Email', 'KHI', '2026-04-28 14:27:00', '2026-04-28 14:27:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'Customer', 'as per our findings, bandwidth is being fully utilized, which is causing the reported issue', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(369, 'YTM 3', 'Email', 'KHI', '2026-04-28 14:28:00', '2026-04-28 14:50:00', 'Link Down', 'closed', 'Service Affecting', '0.015277777777778', 'Radio', 'Port stuck at node end', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(370, 'Utopia Industries', 'Proactive', 'KHI', '2026-04-29 08:46:00', '2026-04-29 09:09:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.015972222222222', 'Power', 'K-Electric was carrying out maintenance, which caused the switch to restart.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(371, 'Pak poly Industries', 'Call', 'KHI', '2026-04-29 11:50:00', '2026-04-29 12:00:00', 'Link Down', 'closed', 'Service Affecting', '0.0069444444444444', 'Radio', 'drops observed at client end device, link stable after POP end device reboot', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(372, 'Lucky Kathore', 'call', 'KHI', '2026-04-29 12:25:00', '2026-04-29 13:06:00', 'Link Down', 'Closed', 'Service Affecting', '0.028472222222222', 'Radio', 'Device stuck', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(373, 'EMA Shipping pri', 'Proactive', 'KHI', '2026-04-29 17:10:00', '2026-04-29 18:03:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.036805555555556', 'Fiber', 'Core break', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(374, 'EMA Shipping backup RDS', 'Proactive', 'KHI', '2026-04-29 17:10:00', '2026-04-30 11:58:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.78333333333333', 'Fiber', 'RFO: joint core was break.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(375, 'Kutiyana Memon Hospital vlan 1931', 'WhatsApp', 'KHI', '2026-04-29 19:56:00', '2026-04-30 10:54:00', 'Link Down', 'closed', 'Service Affecting', '0.62361111111111', 'Fiber', 'RFO, due to fiber cut near old city', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(376, 'suparco Connect', 'Call', 'KHI', '2026-04-30 03:54:00', '2026-04-30 05:12:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.054166666666667', 'Fiber', 'Power issue at node end', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(377, 'Avari Future Cabel', 'Proactive', 'KHI', '2026-04-30 07:58:00', '2026-04-30 13:46:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.24166666666667', 'Fiber', 'Internal fiber Down', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(378, 'Pak Agro', 'Proactive', 'KHI', '2026-04-30 11:52:00', '2026-04-30 13:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.068055555555556', 'Radio', 'IDU was faulty.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(379, 'Utopia Industries', 'Proactive', 'KHI', '2026-04-30 09:49:00', '2026-04-30 10:44:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.038194444444444', 'Fiber', 'RFO: The joint box was damaged.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(380, 'Artistic Milliners', 'Email', 'KHI', '2026-04-30 09:47:00', '2026-04-30 09:47:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'customer', 'bandwidth is being fully utilized, which is causing the reported issue', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(381, 'Al Rehmat Industries site 3', 'call', 'KHI', '2026-04-30 11:15:00', '2026-04-30 13:00:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.072916666666667', 'fiber', 'Fiber cut identified outside Altamash 1.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(382, 'Kamil Packaging Site (VLAN 1933)', 'Proactive', 'KHI', '2026-04-30 14:16:00', '2026-05-02 16:16:00', 'Link Down', 'closed', 'Service Affecting', '2.0833333333333', 'Fiber', 'due to core was swapped & missed, team deployed & restored it', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(383, 'SARWAT CONVERTER (PVT) LTD', 'Proactive', 'KHI', '2026-04-30 14:28:00', '2026-04-30 14:46:00', 'Link Down', 'closed', 'Service Affecting', '0.0125', 'Fiber', 'SM Fiber restored', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(384, 'venus carpet Atique', 'WhatsApp', 'KHI', '2026-05-02 09:48:00', '2026-05-02 10:15:00', 'Link Down', 'closed', 'Service Affecting', '0.01875', 'Radio', 'radio device stuck at client end', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(385, 'Fedex Saasi Arcade', 'Email', 'KHI', '2026-05-02 10:30:00', '2026-05-02 10:50:00', 'Link Down', 'closed', 'Service Affecting', '0.013888888888889', 'Power', 'power issue at node end', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(386, 'Zafa Active Core', 'Proactive', 'KHI', '2026-05-02 15:10:00', '2026-05-02 16:06:00', 'Link Down', 'closed', 'Service Affecting', '0.038888888888889', 'Fiber', 'as per logon team did not perform any activity', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(387, 'AWM Home', 'Proactive', 'KHI', '2026-05-02 17:15:00', '2026-05-02 17:17:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.0013888888888889', 'Fiber', 'as per satcomm No activity has been performed by our team', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(388, 'Movenpick', 'Proactive', 'KHI', '2026-05-02 17:54:00', '2026-05-03 15:10:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.88611111111111', 'Fiber', 'iNTERNAL CORE BREAK IN MOVEINPICK', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(389, 'EMA Shipping', 'Proactive', 'KHI', '2026-05-03 00:54:00', '2026-05-03 17:01:00', 'Link Down', 'closed', 'Service Affecting', '0.67152777777778', 'Fiber', 'Forwarded to SM via watsap. 4 core 40 meter 1 joined box', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(390, 'Gaditek kasmir road', 'Proactive', 'KHI', '2026-05-03 10:05:00', '2026-05-04 17:58:00', 'Link Down', 'closed', 'Non-Service Affecting', '1.3284722222222', 'Fiber', 'Backhaul cable damage due to ongoing BRT project', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(391, 'Utopia Logon', 'Proactive', 'KHI', '2026-05-04 08:45:00', '2026-05-04 19:07:00', 'Link Down', 'closed', 'Service Affecting', '0.43194444444444', 'Fiber', 'The fiber was damaged', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(392, 'PACC Liaquat VLAN 1935', 'Email', 'KHI', '2026-05-04 11:54:00', '2026-05-04 12:53:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.040972222222222', 'No activity', 'as per fiberish team no activity has been performed from our end', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(393, 'Chippa Welfare Association primary', 'Proactive', 'KHI', '2026-05-04 14:18:00', '2026-05-04 16:51:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.10625', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(394, 'Matracon VLAN 1510', 'Email', 'KHI', '2026-05-04 14:35:00', '2026-05-04 14:35:00', 'Link Down', 'Closed', 'Service Affecting', '0', 'No Issue Found', 'No issue found link is working fine', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(395, 'Lucky Kathore', 'Call', 'KHI', '2026-05-04 17:10:00', '2026-05-04 17:20:00', 'Link Down', 'closed', 'Service Affecting', '0.0069444444444444', 'Radio', 'fine tune', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(396, 'Lucky Textile Site Area', 'Proactive', 'KHI', '2026-05-04 18:00:00', '2026-05-04 22:05:00', 'Link Down', 'closed', 'Service Affecting', '0.17013888888889', 'Fiber', 'fiber cut', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(397, 'Utopia Industries', 'Proactive', 'KHI', '2026-05-05 08:56:00', '2026-05-05 12:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.14861111111111', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(398, 'Satcom Pvt Ltd path optimization issue', 'Email', 'KHI', '2026-05-05 10:06:00', '2026-05-05 10:06:00', 'Reachability', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', 'as per provided stats latency is found to be optimal with respect to geo location.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(399, 'IXP-HEC', 'Proactive', 'KHI', '2026-05-05 00:21:00', '2026-05-05 11:00:00', 'Link Down', 'closed', 'Service Affecting', '0.44375', 'customer', 'As discussed with client Mr. Waheed Gul, switches were found powered off at their end.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(400, 'Faisalabad oil refinery', 'Email', 'KHI', '2026-05-05 11:09:00', '2026-05-05 11:25:00', 'High Latency', 'closed', 'Service Affecting', '0.011111111111111', 'Radio', 'radio device refresh', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(401, 'Amin Pur-VLAN 564', 'call', 'LHR', '2026-05-05 12:06:00', '2026-05-05 12:06:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', 'Connectivity is stable from both ends Zong & LHE Noc', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(402, 'Kutiyana Memon Hospital', 'WhatsApp', 'KHI', '2026-05-05 14:32:00', '2026-05-05 14:59:00', 'Link Down', 'closed', 'Service Affecting', '0.01875', 'Fiber', 'Multiple fiber break', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(403, 'Postex Nazimabad SITE Area', 'WhatsApp', 'KHI', '2026-05-05 14:55:00', '2026-05-05 20:44:00', 'Link Down', 'closed', 'Service Affecting', '0.24236111111111', 'Fiber', 'fiber cut 2 core 70 Meter use', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(404, 'Postex Quetta Town || VLAN 1936', 'WhatsApp', 'KHI', '2026-05-05 15:22:00', '2026-05-05 15:43:00', 'Link Down', 'closed', 'Service Affecting', '0.014583333333333', 'Fiber', 'Multiple fiber break', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(405, 'SARWAT CONVERTER (PVT) LTD', 'WhatsApp', 'KHI', '2026-05-05 16:22:00', '2026-05-05 18:08:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.073611111111111', 'Fiber', 'fiber cut', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(406, 'Lucky Textile FB Area', 'call', 'KHI', '2026-05-05 16:40:00', '2026-05-05 18:39:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.082638888888889', 'Equipment', 'issue has occurred due to hardware failure', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(407, 'Utopia Industries', 'Email', 'KHI', '2026-05-05 16:40:00', '2026-05-05 18:28:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.075', 'Equipment', 'issue has occurred due to hardware failure', '2026-08-16 10:53:13', '2026-08-16 10:53:13');
INSERT INTO `faults_reported` (`id`, `customer_name`, `complaint_channel`, `main_city`, `opened_at`, `closed_at`, `issue`, `status`, `affect`, `aging_downtime`, `rfo`, `rca`, `created_at`, `updated_at`) VALUES
(408, 'ZAFA Active Core', 'Proactive', 'KHI', '2026-05-05 16:43:00', '2026-05-05 19:09:00', 'Link Down', 'closed', 'Service Affecting', '0.10138888888889', 'Equipment', 'issue has occurred due to hardware failure', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(409, 'ARY Active Core', 'Proactive', 'KHI', '2026-05-05 22:22:00', '2026-05-05 23:04:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.029166666666667', 'Fiber', 'RFO Pending', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(410, 'Saudi Pak', 'Proactive', 'KHI', '2026-05-06 02:37:00', '2026-05-06 11:50:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.38402777777778', 'Fiber', 'Link was down due to fiber breakage, 1 joint box was used during restoration activity', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(411, 'EMA Shipping', 'Proactive', 'KHI', '2026-05-06 02:37:00', '2026-05-06 11:50:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.38402777777778', 'Fiber', 'Link was down due to fiber breakage, 1 joint box was used during restoration activity', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(412, 'Umer Spinning', 'Proactive', 'KHI', '2026-05-06 02:37:00', '2026-05-06 11:50:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.38402777777778', 'Fiber', 'Link was down due to fiber breakage, 1 joint box was used during restoration activity', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(413, 'Fiberish primary interconnect', 'Proactive', 'KHI', '2026-05-06 02:37:00', '2026-05-06 11:50:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.38402777777778', 'Fiber', 'Link was down due to fiber breakage, 1 joint box was used during restoration activity', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(414, 'AWM Satcomm link', 'Proactive', 'KHI', '2026-05-06 02:19:00', '2026-05-06 17:57:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.65138888888889', 'Fiber', 'undergorund core was found damage', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(415, 'Mars BPO', 'Email', 'KHI', '2026-05-06 02:19:00', '2026-05-06 19:10:00', 'Slow Browsing', 'closed', 'Service Affecting', '0.70208333333333', 'customer', 'testing done at client end with FE, observe over utilization', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(416, 'Stack lab fiber-back up', 'Proactive', 'KHI', '2026-05-06 09:30:00', '2026-05-06 09:59:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.020138888888889', 'Equipment', 'link became stable after refreshing the port.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(417, 'General Tyre Site access issue', 'call', 'KHI', '2026-05-06 11:35:00', '2026-05-06 11:35:00', 'Issue', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', 'As per confirmation from sir Imran, a thorough check has completed and no issue has been observed from our end.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(418, 'ARY Active Core', 'Proactive', 'KHI', '2026-05-06 14:35:00', '2026-05-06 15:13:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.026388888888889', 'Inquiry', 'RFO is still awaited from end', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(419, 'Saylani HO', 'Email', 'KHI', '2026-05-06 20:05:00', '2026-05-06 23:00:00', 'Link Down', 'closed', 'Service Affecting', '0.12152777777778', '', 'rfo awaited', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(420, 'Satcom Pvt Ltd path optimization issue', 'Email', 'KHI', '2026-05-07 09:43:00', '2026-05-07 09:43:00', 'Reachability', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', 'We have tested via provided testing pool and found no issue in trace, path is already optimized,', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(421, 'Pak Poly Industries', 'call', 'KHI', '2026-05-07 10:53:00', '2026-05-07 12:00:00', 'Flap', 'closed', 'Service Affecting', '0.046527777777778', 'Radio', 'link is stable after fine-tuning.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(422, 'Pak Petro Kasur', 'call', 'LHR', '2026-05-07 11:10:00', '2026-05-07 11:10:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No Issue Found', 'KK Networks shared their findings, graphs, and relevant evidence; however, no issue was observed . Additionally, upon contacting the client, Mr. Ashraf stated that he will check and update us regarding the issue being faced.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(423, 'GD Office', 'call', 'KHI', '2026-05-07 11:30:00', '2026-05-07 11:40:00', 'Link Down', 'closed', 'Service Affecting', '0.0069444444444444', 'Equipment', 'L2 switch is observing down / Switch rebooted forcefully', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(424, 'Utopia Industries Backup Link', 'Proactive', 'KHI', '2026-05-07 11:55:00', '2026-05-07 12:15:00', 'Flap', 'closed', 'Non-Service Affecting', '0.013888888888889', 'Radio', 'port refresh', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(425, 'Janat Gul', 'call', 'KHI', '2026-05-07 14:30:00', '2026-05-07 14:30:00', 'Slow Browsing', 'closed', 'Service Affecting', '0', 'Customer', 'Slow browsing issue observed due to overutilization.', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(426, 'Feroze SFO', 'Email', 'KHI', '2026-05-07 15:27:00', '2026-05-07 19:08:00', 'Link Down', 'closed', 'Service Affecting', '0.15347222222222', 'Fiber', 'fiber cut', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(427, 'gerrys leisure (costa coffee tipu sultan) (Ihop)', 'WhatsApp', 'KHI', '2026-05-07 16:26:00', '2026-05-07 19:17:00', 'Link Down', 'closed', 'Service Affecting', '0.11875', 'Fiber', 'fiber cut', '2026-08-16 10:53:13', '2026-08-16 10:53:13'),
(428, 'Alamgir Welfare', 'Email', 'KHI', '2026-05-07 21:35:00', '2026-05-08 05:35:00', 'Link Down', 'Closed', 'Service Affecting', '0.33333333333333', '', 'pop down due to pro long power outage', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(429, 'EZ Life Technologies', 'Email', 'KHI', '2026-05-07 22:06:00', '2026-05-08 05:35:00', 'Link Down', 'Closed', 'Service Affecting', '0.31180555555556', '', 'pop down due to pro long power outage', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(430, 'Feroze SFO', 'Email', 'KHI', '2026-05-08 09:21:00', '2026-05-08 13:02:00', 'Link Down', 'closed', 'Service Affecting', '0.15347222222222', 'fiber', 'fiber cable cut', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(431, 'Abacus Consulting Technology Ltd primary link', 'Email', 'KHI', '2026-05-08 11:15:00', '2026-05-08 13:05:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.076388888888889', 'fiber', 'fiber cable cut', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(432, 'Lucky Kathore', 'Call', 'KHI', '2026-05-08 11:35:00', '2026-05-08 11:50:00', 'Link Down', 'closed', 'Service Affecting', '0.010416666666667', 'Radio', 'device stuck', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(433, 'Fedex North Station Internet service Degradation', 'Email', 'KHI', '2026-05-08 13:06:00', '2026-05-08 13:15:00', 'Packet Loss', 'closed', 'Non-Service Affecting', '0.00625', 'Upstream', 'DPLC service degradation observed from Upstream', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(434, 'Western pop', 'Proactive', 'KHI', '2026-05-08 15:05:00', '2026-05-08 15:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.017361111111111', '', 'internal issue', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(435, 'Utopia', 'WhatsApp', 'KHI', '2026-05-08 18:07:00', '2026-05-08 23:16:00', 'link down', 'Closed', 'Non-Service Affecting', '0.21458333333333', '', 'RFO:Cable was found damage', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(436, 'Daewoo', 'Email', 'KHI', '2026-05-08 23:03:00', '2026-05-09 14:22:00', 'Link Down', 'closed', 'Service Affecting', '0.63819444444444', 'customer', 'lan cable is unplugged at client end', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(437, 'zara khadda satcom', 'WhatsApp', 'KHI', '2026-05-09 06:46:00', '2026-05-09 14:05:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.30486111111111', 'Fiber', 'OFC was break at 2700 meter', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(438, 'Zara Khadda tri', 'Proactive', 'KHI', '2026-05-09 12:55:00', '2026-05-09 15:48:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.12013888888889', 'Fiber', 'Feeder cable cut', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(439, 'ZAFA primary logon', 'Proactive', 'KHI', '2026-05-09 17:13:00', '2026-05-10 01:51:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.35972222222222', 'Fiber', 'fiber cut', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(440, 'Gaditek backup', 'Proactive', 'KHI', '2026-05-09 17:03:00', '2026-05-12 02:49:00', 'Link Down', 'closed', 'Non-Service Affecting', '2.4069444444444', 'Fiber', 'fiber link has been impacted due to SSGC activity, Near grand palace hall opposite h.h core break', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(441, 'Muno Pakistan', 'Email', 'KHI', '2026-05-11 09:04:00', '2026-05-11 12:37:00', 'Link Down', 'closed', 'Service Affecting', '0.14791666666667', 'Fiber', 'Cabel cut 1 joint box use', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(442, 'Stahl Pakistan VLAN 925', 'Email', 'KHI', '2026-05-11 09:34:00', '2026-05-14 15:11:00', 'Link Down', 'closed', 'Service Affecting', '3.2340277777778', 'Fiber', 'Approximately 200 meters of fiber was found missing, team is redeploying the fiber to restore the link.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(443, 'Assurety Consulting Pvt Ltd', 'WhatsApp', 'KHI', '2026-05-11 10:50:00', '2026-05-11 14:25:00', 'Link Down', 'closed', 'Service Affecting', '0.14930555555556', 'fiber', 'Rfo fiber break 1 joint box use', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(444, 'gerrys leisure (costa coffee tipu sultan) (Ihop)', 'WhatsApp', 'KHI', '2026-05-11 10:50:00', '2026-05-11 14:25:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.14930555555556', 'fiber', 'Rfo fiber break 1 joint box use', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(445, 'Abacus Consulting Technology Ltd primary link', 'Proactive', 'KHI', '2026-05-11 10:55:00', '2026-05-11 14:25:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.14583333333333', 'fiber', 'Rfo fiber break 1 joint box use', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(446, 'GSA Cargo', 'Email', 'KHI', '2026-05-11 12:06:00', '2026-05-11 14:57:00', 'Link Down', 'closed', 'Service Affecting', '0.11875', 'fiber', 'OFC was found broken at 3,290 meters at POP end', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(447, 'GD Office', 'Proactive', 'KHI', '2026-05-11 12:25:00', '2026-05-11 12:30:00', 'Link Down', 'closed', 'Service Affecting', '0.0034722222222222', 'Equipment', 'switch rebooted', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(448, 'Naheed Super Market', 'call', 'KHI', '2026-05-11 12:28:00', '2026-05-11 14:19:00', 'Link Down', 'closed', 'Service Affecting', '0.077083333333333', 'fiber', 'OFC was found broken at 3,290 meters at POP end', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(449, 'Al Rehmat Industries site 3', 'WhatsApp', 'KHI', '2026-05-11 11:26:00', '2026-05-11 19:23:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.33125', 'Fiber', 'fiber cut', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(450, 'GD Office', 'Proactive', 'KHI', '2026-05-11 14:13:00', '2026-05-11 19:53:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.23611111111111', 'Fiber', 'under ground Fiber damage', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(451, 'Utopia', 'Proactive', 'KHI', '2026-05-11 20:00:00', '2026-05-12 04:53:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.37013888888889', 'Fiber', 'Cable was found damaged SITE phase 2', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(452, 'Afroze Textile', 'Email', 'KHI', '2026-05-11 20:05:00', '2026-05-11 21:13:00', 'Link Down', 'closed', 'Service Affecting', '0.047222222222222', 'Fiber', 'Cable was found damaged SITE phase 2', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(453, 'AWM Home', 'Proactive', 'KHI', '2026-05-12 05:35:00', '2026-05-12 12:15:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.27777777777778', 'Fiber', 'Feeder cable cut at FtC', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(454, 'Ameen Sahab', 'Proactive', 'KHI', '2026-05-12 10:25:00', '2026-05-12 10:35:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.0069444444444444', 'Power', 'Power issue node end', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(455, 'Pakistan Tankers Company', 'Call', 'KHI', '2026-05-12 11:50:00', '2026-05-12 11:50:00', 'Slow Browsing', 'closed', 'Service Affecting', '0', 'customer', 'After taking AnyDesk, it has been identified that issue is related to client’s system memory (RAM) problem.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(456, 'Waada Digital', 'call', 'KHI', '2026-05-12 12:55:00', '2026-05-12 12:55:00', 'Link Down', 'closed', 'Service Affecting', '0', '', 'line of sight has been obstructed due to the construction of an 18-floor high-rise building.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(457, 'ZAFA Active Core', 'Proactive', 'KHI', '2026-05-12 14:08:00', '2026-05-12 15:44:00', 'Link Down', 'closed', 'Service Affecting', '0.066666666666667', 'Fiber', 'Main fiber cable damaged due to excavation work.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(458, 'Lucky Textile', 'call', 'KHI', '2026-05-12 14:08:00', '2026-05-12 15:44:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.066666666666667', '', 'Main fiber cable damaged due to excavation work.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(459, 'Utoipa Industries', 'Proactive', 'KHI', '2026-05-12 14:08:00', '2026-05-12 15:50:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.070833333333333', '', 'Main fiber cable damaged due to excavation work.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(460, 'Chippa Welfare Association primary', 'Proactive', 'KHI', '2026-05-13 04:57:00', '2026-05-13 10:00:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.21041666666667', 'Inquiry', 'RFO awaited', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(461, 'Muno Pakistan', 'Email', 'KHI', '2026-05-13 09:07:00', '2026-05-13 12:53:00', 'Link Down', 'Closed', 'Service Affecting', '0.15694444444444', '', 'Fiber break 1 joint box or 40 mtr. 4 core use', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(462, 'Matrix Systems', 'Proactive', 'KHI', '2026-05-13 09:20:00', '2026-05-13 11:40:00', 'Link Down', 'closed', 'Service Affecting', '0.097222222222222', 'fiber', 'Rfo fiber cut by kmc 120 mtr 2 core use', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(463, 'IXP-HEC', 'Proactive', 'HYD', '2026-05-14 01:02:00', '2026-05-14 18:26:00', 'Link Down', 'closed', 'Service Affecting', '0.725', 'fiber', 'As per our investigation, fiber is currently down.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(464, 'Bari Fatani Vlan 1763', 'Email', 'KHI', '2026-05-14 09:18:00', '2026-05-14 09:18:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No Issue Found', 'Client end issue', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(465, 'DWP Vlan 1764', 'Email', 'KHI', '2026-05-14 09:18:00', '2026-05-14 09:18:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(466, 'Oburther', 'Proactive', 'KHI', '2026-05-14 11:56:00', '2026-05-14 15:20:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.14166666666667', 'fiber', '144 Core cable is down on the underground (UG) segment', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(467, 'Rasheed Enterprises', 'call', 'KHI', '2026-05-14 13:00:00', '2026-05-14 13:00:00', 'Slow Browsing', 'closed', 'Service Affecting', '0', 'customer', 'slow browsing issues occured due to bandwidth choked condition caused by over-utilization.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(468, 'Lucky Kathore', 'Call', 'KHI', '2026-05-14 14:55:00', '2026-05-14 15:00:00', 'Link Down', 'closed', 'Service Affecting', '0.0034722222222222', 'Radio', 'frequency interference', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(469, 'GD Office Wi-Fi Router issue', 'Call', 'KHI', '2026-05-14 15:30:00', '2026-05-14 16:45:00', 'Issue', 'closed', 'Non-Service Affecting', '0.052083333333333', '', 'Ethernet SFP port has been changed.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(470, 'GT Active Core', 'Proactive', 'KHI', '2026-05-14 16:00:00', '2026-05-15 00:45:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.36458333333333', 'Fiber', '', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(471, 'Matracon VLAN 1510', 'Email', 'KHI', '2026-05-14 10:38:00', '2026-05-14 10:38:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(472, 'Faisalabad Oil Refinery (Data)', 'Email', 'KHI', '2026-05-14 17:17:00', '2026-05-15 00:45:00', 'Link Down', 'Closed', 'Service Affecting', '0.31111111111111', 'Fiber', '', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(473, 'Gaditek', 'Proactive', 'KHI', '2026-05-14 18:42:00', '2026-05-14 23:05:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.18263888888889', 'Fiber', 'link down from gcs', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(474, 'Zill', 'Email', 'KHI', '2026-05-14 19:39:00', '2026-05-15 00:13:00', 'Link Down', 'closed', 'Service Affecting', '0.19027777777778', 'Fiber', 'Fiber Breakage', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(475, 'Bhoana VLAN 567', 'WhatsApp', 'KHI', '2026-05-15 10:01:00', '2026-05-15 10:20:00', 'Flap', 'closed', 'Service Affecting', '0.013194444444444', '', 'issue is related to sink node at TXN end. For which vendor is already informed', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(476, 'Kamil Converter Maymar', 'call', 'KHI', '2026-05-15 10:15:00', '2026-05-15 10:20:00', 'Slow Browsing', 'closed', 'Service Affecting', '0.0034722222222222', '', 'issue has been resolved after refreshing the port.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(477, 'Dynamic Shipping', 'call', 'KHI', '2026-05-15 10:30:00', '2026-05-15 12:45:00', 'Link Down', 'closed', 'Service Affecting', '0.09375', 'Radio', 'Device Stuck We also refreshed LAN patch to avoid outages.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(478, 'Gaditek', 'Email', 'KHI', '2026-05-15 10:26:00', '2026-05-15 10:26:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(479, 'Matracon VLAN 1510', 'Email', 'KHI', '2026-05-15 11:07:00', '2026-05-15 11:07:00', 'Link Down', 'closed', 'Service Affecting', '0', 'customer', 'VPN at client end was enabled, due to which their traffic was not routing.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(480, 'GD Office Wi-Fi Router issue', 'Call', 'KHI', '2026-05-15 14:10:00', '2026-05-15 14:10:00', 'Issue', 'closed', 'Non-Service Affecting', '0', 'Power', 'interruption occurred due to a power failure jerk, because of which switch got rebooted', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(481, 'Artistic Milliners', 'Email', 'KHI', '2026-05-15 17:13:00', '2026-05-15 21:15:00', 'Link Down', 'closed', 'Service Affecting', '0.16805555555556', 'fiber', 'cable was found damaged at the AM2 unit rooftop.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(482, 'Akmal Print House', 'Email', 'KHI', '2026-05-15 17:51:00', '2026-05-16 15:03:00', 'Link Down', 'closed', 'Service Affecting', '0.88333333333333', 'Fiber', 'Fiber break', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(483, 'RBC Civil', 'Call', 'KHI', '2026-05-16 13:33:00', '2026-05-18 16:15:00', 'Link Down', 'closed', 'Service Affecting', '2.1125', 'Fiber', 'RFO is fiber cut and media replaced from client end.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(484, 'Zill HYD', 'Email', 'KHI', '2026-05-16 14:08:00', '2026-05-16 16:41:00', 'Link Down', 'closed', 'Service Affecting', '0.10625', 'Radio', 'port refresh', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(485, 'EZ Life Technologies', 'Email', 'KHI', '2026-05-16 15:07:00', '2026-05-16 16:00:00', 'Link Down', 'closed', 'Service Affecting', '0.036805555555556', 'Power', 'power issue at pop end', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(486, 'EMA shipping SM', 'Proactive', 'KHI', '2026-05-17 06:45:00', '2026-05-17 14:37:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.32777777777778', 'Fiber', '1 joined box core break', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(487, 'stahl pakistan', 'Email', 'KHI', '2026-05-17 09:46:00', '2026-05-17 12:50:00', 'Link Down', 'closed', 'Service Affecting', '0.12777777777778', 'Fiber', 'OFC Cut', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(488, 'Utopia Industries', 'Email', 'KHI', '2026-05-18 08:58:00', '2026-05-18 21:10:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.50833333333333', 'Fiber', 'fiber cut at the Ahsanabad site', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(489, 'Assurety Consulting Pvt Ltd', 'WhatsApp', 'KHI', '2026-05-18 10:30:00', '2026-05-18 13:02:00', 'Link Down', 'Closed', 'Service Affecting', '0.10555555555556', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(490, 'Magnacrete', 'Email', 'KHI', '2026-05-18 10:44:00', '2026-05-18 10:44:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(491, 'Lucky Textile Head Office To Unit 3 Data Connectivity', 'Proactive', 'KHI', '2026-05-18 11:45:00', '2026-05-18 15:54:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.17291666666667', 'fiber', 'cable damaged from multiple points', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(492, 'Matracon VLAN 1510', 'Email', 'KHI', '2026-05-18 12:13:00', '2026-05-18 12:13:00', 'Upload issue', 'closed', 'Service Affecting', '0', 'No Issue Found', 'we are providing L2 connectivity, which is working fine', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(493, 'Amarant Pharma', 'WhatsApp', 'KHI', '2026-05-18 12:00:00', '2026-05-18 14:00:00', 'Upload issue', 'closed', 'Service Affecting', '0.083333333333333', 'Radio', 'Issue has now resolved after fine-tuning', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(494, 'GD Office Whatsapp connectivity issue', 'WhatsApp', 'KHI', '2026-05-18 14:30:00', '2026-05-18 16:00:00', 'Issue', 'closed', 'Non-Service Affecting', '0.0625', 'Power', 'switch rebooted due to power failure, Link will be shifted on UPS tomorrow', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(495, 'YTM 1- YTM 2 Internet', 'Email', 'KHI', '2026-05-18 16:43:00', '2026-05-18 16:43:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(496, 'Star Denim Data Connectivity issue', 'Email', 'KHI', '2026-05-18 18:56:00', '2026-05-19 15:44:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.86666666666667', '', '40-meter Ethernet cable patch was used to restore the data link', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(497, 'Amarant Pharma', 'call', 'KHI', '2026-05-19 09:30:00', '2026-05-19 09:45:00', 'Slow Browsing', 'closed', 'Service Affecting', '0.010416666666667', 'Radio', 'Issue resolved after changing the duplexity and refresh the port', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(498, 'Utopia Industries', 'Proactive', 'KHI', '2026-05-19 10:25:00', '2026-05-19 16:26:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.25069444444444', 'Fiber', 'Cable cut due to excavation work.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(499, 'Utopia 4 to 6', 'Email', 'KHI', '2026-05-19 10:33:00', '2026-05-19 16:26:00', 'Link Down', 'closed', 'Service Affecting', '0.24513888888889', 'Fiber', 'fiber damage caused by excavation work', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(500, 'Afroze Textile', 'Email', 'KHI', '2026-05-19 11:02:00', '2026-05-19 16:26:00', 'Flap', 'closed', 'Service Affecting', '0.225', 'Fiber', 'fiber damage caused by excavation work', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(501, 'Stahl Pakistan', 'Email', 'KHI', '2026-05-19 11:58:00', '2026-05-19 12:10:00', 'Link Down', 'closed', 'Service Affecting', '0.0083333333333333', 'Power', 'power issue at node end', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(502, 'Saigal Packages Behria Primary Link', 'call', 'KHI', '2026-05-19 12:00:00', '2026-05-19 20:25:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.35069444444444', 'Power', 'power issue at node end', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(503, 'Zil Hyderabad', 'Email', 'HYD', '2026-05-19 15:03:00', '2026-05-19 15:32:00', 'Link Down', 'closed', 'Service Affecting', '0.020138888888889', 'Power', 'power issue at node end', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(504, 'Shaheen Automotive', 'call', 'KHI', '2026-05-19 14:45:00', '2026-05-19 14:45:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(505, 'Stahl Pakistan', 'Email', 'KHI', '2026-05-20 06:56:00', '2026-05-20 08:32:00', 'Link Down', 'closed', 'Service Affecting', '0.066666666666667', 'fiber', 'RFO is 12 core fiber break.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(506, 'Transfeirght', 'Email', 'KHI', '2026-05-20 10:20:00', '2026-05-20 10:55:00', 'Link Down', 'closed', 'Service Affecting', '0.024305555555556', 'Power', 'power issue at node end', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(507, 'Amarant Pharma', 'Call', 'KHI', '2026-05-20 11:00:00', '2026-05-20 11:00:00', 'Packet Loss', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(508, 'Star denim', 'Call', 'KHI', '2026-05-20 13:15:00', '2026-05-20 14:30:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.052083333333333', 'fiber', 'Link down due to fiber cut', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(509, 'Chippa Welfare Association primary', 'Proactive', 'KHI', '2026-05-21 01:26:00', '2026-05-21 13:06:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.48611111111111', 'Fiber', 'Joined damage fedex internal joined', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(510, 'gaditex kashmir road', 'Proactive', 'KHI', '2026-05-21 01:26:00', '2026-05-21 13:06:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.48611111111111', 'Fiber', 'Joined damage fedex internal joined', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(511, 'GT Active Core GCS VLAN ID 1501', 'Proactive', 'KHI', '2026-05-21 10:01:00', '2026-05-21 17:19:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.30416666666667', 'fiber', 'underground cable was found damaged near the POP end. Landhi.', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(512, 'YTM-02', 'Email', 'KHI', '2026-05-21 10:48:00', '2026-05-21 10:48:00', 'Slow Browsing', 'closed', 'Service Affecting', '0', 'customer', 'issue is occurring due to overutilization of the link, causing bandwidth choking', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(513, 'Amarant Pharma', 'Email', 'KHI', '2026-05-21 11:41:00', '2026-05-21 11:41:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(514, 'Shaheen Automotive', 'Call', 'KHI', '2026-05-21 16:15:00', '2026-05-21 16:15:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', 'Link is connected from our end', '2026-08-16 10:53:14', '2026-08-16 10:53:14'),
(515, 'SARWAT CONVERTER (PVT) LTD', 'Call', 'KHI', '2026-05-21 16:20:00', '2026-05-21 18:50:00', 'Link Down', 'closed', 'Service Affecting', '0.10416666666667', 'Equipment', 'device stuck at pop end', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(516, 'IO-Digital', 'Email', 'KHI', '2026-05-21 16:57:00', '2026-05-21 16:57:00', 'Flap', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(517, 'Assurety Consulting Pvt Ltd', 'WhatsApp', 'KHI', '2026-05-22 11:54:00', '2026-05-22 15:17:00', 'Link Down', 'Closed', 'Service Affecting', '0.14097222222222', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(518, 'Fedex Kashmir road', 'Email', 'KHI', '2026-05-22 12:18:00', '2026-05-22 12:18:00', 'Link Down', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', 'link came up automatically', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(519, 'Zara mobility Sec Link', 'Proactive', 'KHI', '2026-05-22 12:36:00', '2026-05-22 17:52:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.21944444444444', 'Fiber', 'feeder cable damage', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(520, 'GD Office', 'Proactive', 'KHI', '2026-05-22 18:01:00', '2026-05-23 07:08:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.54652777777778', 'Fiber', 'fiber cut', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(521, 'Lucky Site', 'WhatsApp', 'KHI', '2026-05-23 09:38:00', '2026-05-23 14:00:00', 'Link Down', 'closed', 'Service Affecting', '0.18194444444444', 'Fiber', 'fiber cut', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(522, 'MovenPick', 'Proactive', 'KHI', '2026-05-23 09:58:00', '2026-05-23 12:47:00', 'Link Down', 'closed', 'Service Affecting', '0.11736111111111', 'Fiber', 'Core break', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(523, 'Postex Quetta Town || VLAN 1936', 'WhatsApp', 'KHI', '2026-05-23 10:20:00', '2026-05-23 13:42:00', 'Link Down', 'closed', 'Service Affecting', '0.14027777777778', 'Fiber', 'fiber cut', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(524, 'Postex Quetta Town || VLAN 1936', 'WhatsApp', 'KHI', '2026-05-23 15:07:00', '2026-05-24 06:53:00', 'Link Down', 'closed', 'Service Affecting', '0.65694444444444', 'Fiber', 'fiber cut', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(525, 'IO-Digital', 'Email', 'KHI', '2026-05-24 14:13:00', '2026-05-24 19:33:00', 'Link Down', 'Closed', 'Service Affecting', '0.22222222222222', 'Power', 'Power issue at Helium POP end', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(526, 'EZ Life Technologies', 'Email', 'KHI', '2026-05-24 14:06:00', '2026-05-24 19:33:00', 'Link Down', 'Closed', 'Service Affecting', '0.22708333333333', 'Power', 'Power issue at Helium POP end', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(527, 'MovenPick', 'Proactive', 'KHI', '2026-05-24 14:16:00', '2026-05-24 15:57:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.070138888888889', 'Fiber', 'there was some fiber optic wire issue on the roof top of a building.', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(528, 'General Tyre VPN Tunnel Issue', 'Email', 'KHI', '2026-05-25 08:27:00', '2026-05-25 08:27:00', 'Reachability', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', 'No issue found', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(529, 'IHOPE Korangi Ware house', 'Proactive', 'KHI', '2026-05-25 09:28:00', '2026-05-25 09:28:00', 'Link Down', 'closed', 'Service Affecting', '0', 'customer', 'client is not responding to our calls nor replying to our emails', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(530, 'Lucky Kathore', 'Call', 'KHI', '2026-05-25 12:50:00', '2026-05-25 13:00:00', 'Packet Loss', 'closed', 'Service Affecting', '0.0069444444444444', 'Radio', 'Link is stable after fine-tuning', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(531, 'Hellman', 'Email', 'KHI', '2026-05-25 13:50:00', '2026-05-25 13:50:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', 'Link is already showing up', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(532, 'Zara Mobility', 'Proactive', 'KHI', '2026-05-25 16:58:00', '2026-05-25 18:58:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.083333333333333', 'Fiber', 'fiber cut', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(533, 'Chippa Welfare Association primary', 'Proactive', 'KHI', '2026-05-28 09:36:00', '2026-05-28 18:08:00', 'Link Down', 'closed', 'Service Affecting', '0.35555555555556', 'Fiber', 'escalated to team', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(534, 'Suparco', 'Proactive', 'KHI', '2026-05-28 07:16:00', '2026-05-29 13:37:00', 'Link Down', 'closed', 'Service Affecting', '1.2645833333333', 'fiber', 'multiple fiber cuts have been observed due to ongoing BRT Yellow Line project / consider this case under Force Majeure. | OFC pressure losses issue and now was the core break in multiple joints', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(535, 'Oburther VLAN 1932', 'Email', 'KHI', '2026-05-29 10:27:00', '2026-06-01 17:24:00', 'Link Down', 'closed', 'Non-Service Affecting', '3.2895833333333', 'fiber', 'fiber cut', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(536, 'gaditek kashmir Road', 'Proactive', 'KHI', '2026-05-30 06:30:00', '2026-05-30 13:57:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.31041666666667', 'Fiber', 'Feeder cable cut', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(537, 'IHOPE Korangi Ware house', 'WhatsApp', 'KHI', '2026-05-30 12:29:00', '2026-05-30 13:04:00', 'Link Down', 'closed', 'Service Affecting', '0.024305555555556', 'Fiber', 'as per fiberish No activity performed from our end.', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(538, 'Stahl Pakistan VLAN ID : 1573', 'Email', 'KHI', '2026-06-01 07:28:00', '2026-06-01 12:27:00', 'Flap', 'closed', 'Service Affecting', '0.20763888888889', 'Equipment', 'service interruption occurred due to hardware malfunction at the POP end', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(539, 'Kompass Pakistan', 'Email', 'KHI', '2026-06-01 08:43:00', '2026-06-01 13:20:00', 'Link Down', 'closed', 'Service Affecting', '0.19236111111111', 'Radio', 'Connector refreshed at ODU ( Out Door Unit ) end', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(540, 'Muno Pakistan', 'Email', 'KHI', '2026-06-01 09:22:00', '2026-06-01 11:35:00', 'Link Down', 'closed', 'Service Affecting', '0.092361111111111', 'fiber', 'Link down due to fiber cut', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(541, 'EMA Shipping', 'Proactive', 'KHI', '2026-06-01 09:45:00', '2026-06-01 13:14:00', 'Link Down', 'closed', 'Service Affecting', '0.14513888888889', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(542, 'Saudi Pak', 'Proactive', 'KHI', '2026-06-01 09:45:00', '2026-06-01 13:14:00', 'Link Down', 'closed', 'Service Affecting', '0.14513888888889', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(543, 'Fiberish primary interconnect', 'Proactive', 'KHI', '2026-06-01 06:36:00', '2026-06-01 13:31:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.28819444444444', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(544, 'ZAFA Active Core', 'Proactive', 'KHI', '2026-06-01 13:20:00', '2026-06-01 18:33:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.21736111111111', 'Fiber', 'Internal joint damaged', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(545, 'Sarwat Convertor', 'WhatsApp', 'KHI', '2026-06-01 19:58:00', '2026-06-01 22:52:00', 'Link Down', 'closed', 'Service Affecting', '0.12083333333333', '', '', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(546, 'Expereo International', 'Email', 'KHI', '2026-06-01 18:04:00', '2026-06-01 21:14:00', 'High Latency', 'closed', 'Service Affecting', '0.13194444444444', 'Radio', 'fine tune', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(547, 'Stahl Pakistan', 'Email', 'KHI', '2026-06-01 21:43:00', '2026-06-01 21:43:00', 'Link Down', 'closed', 'Service Affecting', '0', 'No Issue Found', 'as per gcs no issue found', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(548, 'Saylani Head Office', 'Email', 'KHI', '2026-06-02 10:00:00', '2026-06-02 10:00:00', 'Link Down', 'closed', 'Service Affecting', '0', 'customer', 'client has confirmed that link is up now', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(549, 'lucky Textile site', 'WhatsApp', 'KHI', '2026-06-02 09:58:00', '2026-06-02 22:25:00', 'Link Down', 'closed', 'Service Affecting', '0.51875', '', '50m fiber 2 core 5 jonaid box', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(550, 'Zafa B 10 Data Connectivity', 'call', 'KHI', '2026-06-02 11:37:00', '2026-06-03 15:00:00', 'Link Down', 'closed', 'Non-Service Affecting', '1.1409722222222', 'Radio', 'connector refreshed from ODU and IDU', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(551, 'Abbott Korangi Vlan ID: 1576', 'Email', 'KHI', '2026-06-02 16:01:00', '2026-06-02 16:01:00', 'Link Down', 'closed', 'Non-Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(552, 'Oburther VLAN 1932', 'Proactive', 'KHI', '2026-06-03 10:06:00', '2026-06-03 17:38:00', 'Link Down', 'Closed', 'Non-Service Affecting', '0.31388888888889', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(553, 'Stahl Pakistan VLAN ID : 1573', 'Email', 'KHI', '2026-06-03 10:22:00', '2026-06-03 10:22:00', 'Flap', 'closed', 'Service Affecting', '0', 'No Issue Found', '', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(554, 'PostEX nazimabad', 'Proactive', 'KHI', '2026-06-03 11:08:00', '2026-06-03 13:13:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.086805555555556', 'Equipment', 'service interruption was caused by faulty patch cord at node end', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(555, 'Zoaib Tiles POP owner', 'Email', 'HYD', '2026-06-03 13:08:00', '2026-06-03 14:00:00', 'Link Down', 'closed', 'Service Affecting', '0.036111111111111', '', 'faulty cable replaced at POP end', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(556, 'Kutiyana Memon Hospital VLAN - 1931', 'Proactive', 'KHI', '2026-06-03 13:17:00', '2026-06-03 13:33:00', 'Link Down', 'closed', 'Service Affecting', '0.011111111111111', 'Power', 'Node end Equipment Failure.', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(557, 'Fiberish Primary Interconnect', 'Proactive', 'KHI', '2026-06-03 14:36:00', '2026-06-03 16:06:00', 'link down', 'closed', 'Non-Service Affecting', '0.0625', 'Fiber', 'Rfo Core break', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(558, 'EMA Shiping', 'Proactive', 'KHI', '2026-06-03 14:36:00', '2026-06-03 16:06:00', 'link down', 'closed', 'Non-Service Affecting', '0.0625', 'Fiber', 'Rfo Core break', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(559, 'Assurety Consulting Pvt Ltd', 'WhatsApp', 'KHI', '2026-06-03 17:40:00', '2026-06-03 21:20:00', 'Link Down', 'closed', 'Service Affecting', '0.15277777777778', 'Fiber', 'core break 2 joint box', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(560, 'gaditek kashmir Road', 'Proactive', 'KHI', '2026-06-03 23:05:00', '2026-06-04 13:42:00', 'Link Down', 'closed', 'Service Affecting', '0.60902777777778', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(561, 'Lucky SITE Area Primary Link', 'WhatsApp', 'KHI', '2026-06-04 09:55:00', '2026-06-04 12:41:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.11527777777778', 'Fiber', 'OFC Breakage', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(562, 'PPHI pri', 'Proactive', 'KHI', '2026-06-04 10:01:00', '2026-06-04 14:00:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.16597222222222', 'Fiber', 'OFC Breakage at Federation House', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(563, 'GD Office', 'WhatsApp', 'KHI', '2026-06-04 12:30:00', '2026-06-04 13:10:00', 'Link Down', 'closed', 'Service Affecting', '0.027777777777778', 'Power', 'Switch is down due to ongoing power-related work.', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(564, 'Assurety Consulting Pvt Ltd', 'call', 'KHI', '2026-06-04 17:10:00', '2026-06-04 19:20:00', 'Link Down', 'closed', 'Service Affecting', '0.090277777777778', 'Fiber', 'fiber cut 200m fiber 4 core fiber use', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(565, 'Costa Coffee Tipu Sultan', 'Proactive', 'KHI', '2026-06-04 17:10:00', '2026-06-04 19:20:00', 'Link Down', 'closed', 'Service Affecting', '0.090277777777778', 'Fiber', 'fiber cut 200m fiber 4 core fiber use', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(566, 'Zara Khadda', 'Proactive', 'KHI', '2026-06-05 01:39:00', '2026-06-05 04:26:00', 'Link Down', 'closed', 'Non-Service Affecting', '0.11597222222222', 'Fiber', 'OFC was break at 530m.', '2026-08-16 10:53:15', '2026-08-16 10:53:15'),
(567, 'Optimize Engineering Core Pvt Ltd OEC', 'call', 'KHI', '2026-06-05 11:00:00', '2026-06-05 13:30:00', 'Link Down', 'closed', 'Service Affecting', '0.10416666666667', 'Equipment', 'faulty device replaced at clietnt end', '2026-08-16 10:53:15', '2026-08-16 10:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2026_08_13_080001_create_cache_table', 1),
(2, '2026_08_13_080002_create_jobs_table', 1),
(3, '2026_08_13_080101_create_password_resets_table', 1),
(4, '2026_08_13_080201_create_sessions_table', 1),
(5, '2026_08_13_080301_create_users_table', 1),
(6, '2026_08_13_081001_create_subscribers_table', 1),
(7, '2026_08_13_081002_create_p2p_subscribers_table', 1),
(8, '2026_08_13_081003_create_complaints_table', 1),
(9, '2026_08_13_081004_create_faults_reported_table', 1),
(10, '2026_08_13_081005_create_faults_cleared_table', 1),
(11, '2026_08_13_081006_create_dark_core_links_table', 1),
(12, '2026_08_13_081007_create_dplc_details_table', 1),
(13, '2026_08_13_081008_create_noc_pop_locations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `noc_pop_locations`
--

CREATE TABLE `noc_pop_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `pop_name` varchar(255) NOT NULL,
  `gps_coordinates` text NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `own_colocated` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `p2p_subscribers`
--

CREATE TABLE `p2p_subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT NULL,
  `station_a` text NOT NULL,
  `station_b` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `ownership` varchar(255) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `p2p_subscribers`
--

INSERT INTO `p2p_subscribers` (`id`, `serial_no`, `link_name`, `station_a`, `station_b`, `status`, `ownership`, `frequency`, `created_at`, `updated_at`) VALUES
(1, '1', 'ZIL', 'Civil Lines', 'Bahria Complex 3 MT Khan road', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(2, '2', 'A.M-4 (Internet)', 'Korangi', 'Plot 4, 8، 25 Main Korangi Rd، Sector Korangi Industrial Area, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(3, '3', 'Abacus', 'P.E.C.H.S', '3rd Floor, Citi Towers, 33-A Shahra-e-Faisal, Block-6 Block 6 P.E.C.H.S., Karachi, 75400, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(4, '4', 'Abbott', 'Landhi Town', 'Plot No.13 Main Korangi Industrial Road, Sector 20 Landhi Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(5, '6', 'Adamjee', 'S.I.T.E Area', 'Metroville E 17/A Sindh Industrial Trading Estate, Karachi, 75520, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(6, '7', 'Afroze', 'S.I.T.E Area', 'Plot No. C-3 Metroville Sindh Industrial Trading Estate, Karachi', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(7, '8', 'AJM', 'Korangi', 'Plot: 44 Sector: 27, Sector 27 Korangi Industrial Area, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(8, '9', 'Al momin', 'Bin Qasim Town', 'A17, North Western Industrial Zone Port Qasim Bin Qasim Town, Karachi, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(9, '10', 'Al momin  2', 'Bin Qasim Town', 'A17, North Western Industrial Zone Port Qasim Bin Qasim Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(10, '11', 'Alamgir Welfare Trust', 'Korangi Near Brooks', '526, district korangi, 08, Mehran Town Sector 6 A Korangi, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(11, '12', 'Al-Jailani', 'S.I.T.E Area', 'Sindh Industrial Trading Estate, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(12, '13', 'Amarant Pharma', 'FB Area', '158, D. Tore, Gadap Road, Super Highway, Gadap Town, Karachi, 74400, Pakistan', 'In Process', 'Satcom', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(13, '14', 'Amash BH', 'S.I.T.E Area', 'F220, Sindh Industrial Trading Estate, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(14, '15', 'Armored', 'Bin Qasim Town', 'R8R4+2F8, North Western Industrial Zone Port Qasim Bin Qasim Town, Karachi, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(15, '16', 'Arthur Lawrance', 'P.E.C.H.S', '172 C, Block 2 P.E.C.H.S., Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(16, '17', 'Arthur Lawrance 2', 'P.E.C.H.S', '45-F 46th St، off Shahrah-e-Faisal, Block 6 P.E.C.H.S., Karachi, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(17, '18', 'Avari Tower', 'Civil Lines', 'Avari Hotel', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(18, '19', 'Bari Fattani', 'Landhi Town', 'V7RX+JG7, PLOT NO 7 & 8 RAZZAKABAD, Pir Sarhandi Bin Qasim Town, Pir Sarhandi, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(19, '20', 'Bari Fattani2', 'Landhi Town', 'V7RX+JG7, PLOT NO 7 & 8 RAZZAKABAD, Pir Sarhandi Bin Qasim Town, Pir Sarhandi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(20, '21', 'Bhombal', 'Civil Lines', 'Near Naiper Mole Road', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(21, '22', 'Daewoo', 'FB Area', 'Plot No. 145/147, Razzaqabad, Main National Highway, Karachi - Hyderabad Mtwy, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(22, '23', 'DHL', 'Bin Qasim Town', 'Port Bin Qasim Town', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(23, '24', 'Digital procees', 'Korangi Near Brooks', 'B-108, Mehran Town Sector 6 G Korangi, Karachi, 74900, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(24, '25', 'Divine Food Hub', 'S.I.T.E Area', 'Metroville Rd, Block C Sindh Industrial Trading Estate, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(25, '26', 'Dynamic', 'Bin Qasim Town', 'Port Bin Qasim Town', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(26, '27', 'EFU', 'Civil Lines', '112 1st E St D.H.A. Phase 1 Phase 1 Defence Housing Authority, Karachi, 75500', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(27, '28', 'EOBI', 'P.E.C.H.S', 'EOBI House Head Office 190/B/1, Block 2 P.E.C.H.S., Karachi, 75400, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(28, '29', 'Essa Industries', 'Landhi Town', 'V63X+45C, N-5, Zafar Town Landhi Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(29, '30', 'EZ Life', 'Korangi Near Brooks', 'Plot 23, Sector 22, Sector 22, Sector 30 Karachi, 74900, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(30, '31', 'Faisalabad Oil', 'Bin Qasim Town', 'North Western Industrial Zone Port Qasim Authority, Bin Qasim,', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(31, '32', 'Faislabad Oil Repeater', 'Bin Qasim Town', 'North Western Industrial Zone Port Qasim Authority, Bin Qasim,', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(32, '33', 'Gerry\'s visa', 'Civil Lines', 'FTC Building', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(33, '34', 'Ghandhara', 'Bin Qasim Town', 'Port Bin Qasim Town', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(34, '35', 'Ghani Glass', 'Landhi Town', 'R6VF+4FH, Landhi Industrial Area Rd, Firdous Chali Landhi Town Landhi Town, Karachi, 74000, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(35, '36', 'G-TV', 'Civil Lines', 'Shafi Court', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(36, '37', 'GTV Home', 'FB Area', '242H+24F, Maymar Ave, Cotton Export Chs Sector 51 A Gulzar E Hijri Scheme 33, Karachi, 74800, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(37, '38', 'Feroze 1888 C3', 'S.I.T.E Area', 'W257+3PV Sindh Industrial Trading Estate, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(38, '39', 'HRSG', 'P.E.C.H.S', 'HRSG House, 46-D Street No. 46, off Shahra-e-Faisal, Block 6 P.E.C.H.S., Karachi, 75400, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(39, '40', 'Honda Port Qasim', 'Bin Qasim Town', 'V77V+PQ9, Gulshan e Benazir Twp Scheme, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(40, '41', 'IFI Foods', 'Bin Qasim Town', 'North Western Industrial Zone Port Qasim Bin Qasim Town, Karachi, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(41, '42', 'IO Digital', 'Korangi Near Brooks', 'Office 401 - 403, 4th Floor. Building No143-C، Lane 2، D.H.A. Phase 8 Khi', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(42, '43', 'Jannat Gul', 'FB Area', 'MCHC Jannat Gul Hospital Sohrab Goth karachi, Gulzar E Hijri Scheme 33, Karachi, 75330, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(43, '44', 'JB Industries Unit 2 Old', 'S.I.T.E Area', 'C-18 STATE AVENUE ROAD, Metroville Sindh Industrial Trading Estate, Karachi, 75700, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(44, '45', 'jb industry', 'Korangi', 'R4QH+RH4 Korangi, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(45, '46', 'JPMC', 'Civil Lines', 'Jinnah Hospital', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(46, '47', 'Kaizan', 'FB Area', 'W3PQ+WQ Federal B Area, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(47, '48', 'Kamil converter', 'S.I.T.E Area', 'Plot C 11, Phase 1, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(48, '49', 'Kamil Converter 2', 'Gulshan-E-Maymaar', 'Northern Bypass-Super Highway Link Road', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(49, '50', 'Kassim Textile', 'Landhi Town', 'P, 62 N-5, Bin Qasim Town, Karachi, 75100, Pakistan', 'In Process', 'Satcom', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(50, '51', 'Kompass PQ', 'Landhi Town', 'F-37, North Western Ind. Zone، Port Qasim Authority, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(51, '52', 'Kuehne Nagel', 'P.E.C.H.S', 'Block 6 47-E-3, Karachi, 75400, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(52, '53', 'Kuehne Nagel PQ', 'Bin Qasim Town', 'Block 6 47-E-3, Karachi, 75400, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(53, '54', 'Lucky kathore', 'Landhi Town', '3F4H+73 Goth Abdul Hameed Jokhio, Gadap Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(54, '55', 'Lucky Knits', 'Landhi Town', '3F3H+GG Goth Abdul Hameed Jokhio, Gadap Town, Karachi, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(55, '56', 'Lucky Textile (F.B Area)', 'FB Area', 'Federal B Area Block 21 Gulberg Town, Karachi, 75950, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(56, '57', 'Lucky Textile Unit 4', 'S.I.T.E Area', 'A-40/A-B-C, Textile Ave, SITE, Karachi, Sindh, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(57, '58', 'Magnacrete', 'Landhi Town', 'X8VP+92Q, Malir Cantonment, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(58, '59', 'Mekotex', 'Landhi Town', 'V64M+84P Bin Qasim Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(59, '60', 'Metracon', 'FB Area', '3639+63G Omega Grand City, Gadap Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(60, '61', 'Munawar international', 'Landhi Town', 'Export processing Zone Landhi', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(61, '62', 'Mustaqeem Deying', 'S.I.T.E Area', 'D-14/A، Bara Board, Karachi, 75700, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(62, '63', 'Onderland', 'FB Area', 'LA-2/B, Block 21، Main Rashid Minhas Rd، opp. UBL Sports Complex, Karachi, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(63, '64', 'Optimedia', 'P.E.C.H.S', 'Plot 221 B, Block 2 PECHS, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(64, '65', 'Pak Agro', 'Bin Qasim Town', 'V828+6RW, Bin Qasim Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(65, '66', 'Pak Petro', 'Landhi Town', 'Survey No. 136, Polymer House, Main N-5, Zafar Town Landhi Town, Karachi, 75030, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(66, '67', 'Pak Petro-2 (Manzil)', 'Landhi Town', 'Survey No. 136, Polymer House, Main N-5, Zafar Town Landhi Town, Karachi, 75030, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(67, '68', 'Pak Petro PQ', 'Bin Qasim Town', 'R8Q4+HGV, North Western Industrial Zone Port Qasim Bin Qasim Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(68, '69', 'Pakistan Paper', 'Bin Qasim Town', 'R894+JXP, North Western Industrial Zone Port Qasim Bin Qasim Town, Karachi, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(69, '70', 'PakistanTanker company', 'Bin Qasim Town', 'Plot 138-139 North Industrial Zone, Port Qasim Authority, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(70, '71', 'PC Hotel', 'Civil Lines', 'PC hotel', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(71, '72', 'PICT', 'Civil Lines', 'PICT Terminal Kemari', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(72, '73', 'Postex', 'FB Area', 'L 3/ARashid Minhas RdBlock 22 Gulberg Town, Karachi', 'In Process', 'RDS', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(73, '74', 'Postex 2', 'FB Area', 'A501/502, 5th Floor, Fortune Towers, 43, 1-B, Block-6, Block 6 P.E.C.H.S., Karachi, Pakistan', 'In Process', 'GERRYS', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(74, '75', 'PPHI', 'Civil Lines', 'PPHI SINDH, Street 1, Block 2 Clifton, Karachi', 'Yes', 'Satcom', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(75, '76', 'OEC', 'Bin Qasim Town', 'R8Q4+HGV, North Western Industrial Zone Port Qasim Bin Qasim Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(76, '77', 'Rasheed enterprise', 'S.I.T.E Area', 'WX4G+JJ Sindh Industrial Trading Estate, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(77, '78', 'Rija Fashions', 'Landhi Town', 'Export processing Zone Landhi', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(78, '79', 'Risk Consulting', 'FB Area', 'MCHC Jannat Gul Hospital Sohrab Goth karachi\nGulzar E Hijri Scheme 33, Karachi, 75330', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(79, '80', 'Royal Safe Packiging', 'Gulshan-E-Maymaar', 'R8Q2+JJH, Port Qasim Rd, North Western Industrial Zone Port Qasim Bin Qasim Town, Karachi, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(80, '81', 'Saakh pharma', 'Bin Qasim Town', 'C-7, 1, North Western Industrial Zone Port Qasim Bin Qasim Town, Karachi, Pakistan', 'Yes', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(81, '82', 'Saigal (Data link Vlan)', 'Civil Lines', 'Bahria Complex 3 MT Khan road', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(82, '83', 'Sana Safinaz', 'Civil Lines', 'Kemari Road', 'In Process', 'Connect', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(83, '84', 'Shaheen Auto', 'Bin Qasim Town', 'Arabian Sea Country Club Rd, Pakistan Steel Industrial Estate Pakistan Steel Mills Bin Qasim Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(84, '85', 'Sheraton (Move n Pick)', 'Civil Lines', 'Shiraton Hotel', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(85, '86', 'Star denim', 'FB Area', 'Block 21, L-23, Federal B Area Karachi, 75950, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(86, '87', 'TATA ( Vlan )', 'Landhi Town', 'V63X+45C, N-5, Zafar Town Landhi Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(87, '88', 'Two Shades', 'Civil Lines', 'Kashif Centre', 'In Process', 'RDS', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(88, '89', 'Umer Spanning', 'Civil Lines', 'near perfume Chowk, Napier Quarter, Karachi, 75052, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(89, '90', 'Union Steel', 'S.I.T.E Area', 'D-36 Manghopir Rd, Metroville Sindh Industrial Trading Estate, Karachi, 74600, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(90, '91', 'Utopia 5', 'Gulshan-E-Maymaar', '24C4+WG, Phase 2, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(91, '92', 'Utopia 6', 'Gulshan-E-Maymaar', '24F3+7Q, Phase 2, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(92, '93', 'Utopia 6-4', 'Gulshan-E-Maymaar', 'Plot 208, Phase 2, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(93, '94', 'Venus 1', 'Landhi Town', 'W6PW+C9X, Hashim Goth, near Govt. Boys Primary 🏫 School, Gadap Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(94, '95', 'Venus 10 mbps', 'S.I.T.E Area', 'WX9W+65V, Metroville Orangi Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(95, '96', 'Venus 2', 'Landhi Town', 'W6PW+C9X, Hashim Goth, near Govt. Boys Primary 🏫 School, Gadap Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(96, '97', 'Waada Insurance', 'P.E.C.H.S', '163, main Shahra-e-Faisal, Bangalore Town Karachi, 75350, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(97, '98', 'WTC - Telecard HO', 'Civil Lines', 'Twin tower Clifton', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(98, '99', 'White Eagle', 'Bin Qasim Town', 'R8J4+P7R Bin Qasim Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(99, '100', 'YTM 2', 'Landhi Town', 'Habibaabad Bin Qasim Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(100, '101', 'YTM 3', 'Landhi Town', 'V64F+3PQ, Green Park City Bin Qasim Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(101, '102', 'YTM 7', 'Landhi Town', 'R6QG+VVF, Landhi Industrial Area, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44'),
(102, '103', 'YTM HO', 'Landhi Town', 'R6VH+4HR, Landhi Industrial Area Rd, Tauheedabad Colony Landhi Town, Karachi, Pakistan', 'In Process', 'Gerrys', '5725-5875', '2026-08-16 10:52:44', '2026-08-16 10:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6uhgXZs1IrhmM42Bj7dPWupcrbTPsLbPMIm69Hmb', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVXJNNEdZNFAwd0E0aHpUUE9wUUZ6eUhreVJPSGcwaENLZ0xzS2IyRyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvaG9tZSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1786925240),
('aaka4kiHJ6ohYahV7yi6BX8idrOJZirfH7iFkw1B', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.133.0 Chrome/148.0.7778.280 Electron/42.8.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidXpBdzZvdGFEalNEVHg5SURYeW1NUUdqbjhuQklOTlBJSmxoR0tPciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdWJzY3JpYmVycyI7czo1OiJyb3V0ZSI7czoxNzoic3Vic2NyaWJlcnMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1786895362),
('e1inFJ3JTMPdZh7miO8cxrasHSB08lV8zpuuyjdY', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiY2NtQXNVd0VZbkJ4a25UVXh3bzAxNTcyMlNZMkVjTFNaTmd4WlRZTyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvaG9tZSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1786895705);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `ntn_cnic` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `package` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `serial_no`, `company_name`, `ntn_cnic`, `address`, `contact`, `package`, `created_at`, `updated_at`) VALUES
(1, '1', 'Abacus Consulting Technology Ltd.', '3968747-3', '3rd Floor, Citi Towers, 33-A Shahra-e-Faisal, Block-6 P.E.C.H.S', '0312-2479806 / +92 320 2016339', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(2, '2', 'Adamjee', '1229648-1', '17-A SITE Karachi', '021 38658296/0344-4455890', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(3, '3', 'Afroze Textile', '', 'Plot # C-8 scheme 33 SITE Karachi', '0324-9231595', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(4, '4', 'AJM Pharma Data link VLAN 62', '', 'Plot: 44 Sector: 27, Sector 27 Korangi Industrial Area, Karachi', '0346-2198901', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(5, '5', 'Akmal Prints', '2934633-9', 'A-70,Manghopir Road, Metroville Sindh Industrial Trading Estate, Karachi.', '0300-2096577', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(6, '6', 'Al Momin Link 1', '', '', '0312-2099704', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(7, '7', 'Al Momin Link 2', '', '', '0312-2099704', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(8, '8', 'Al Rehmat Industries site 1', '', '', '0321-8212221 / furqan- 0311-2780386 /0313-2733625- kamran', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(9, '9', 'Al Rehmat Industries site 2', '', '', '', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(10, '10', 'Al Rehmat Industries site 3', '', '', '0342-2865759', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(11, '11', 'Al Rehmat Industries site 4', '', '', '0313-2733625', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(12, '12', 'Al Rehmat Industries site 4', '1876413-4', '42 block-6 PECHS', '0321-2202483 / Active POC Imran 92 335 0375331/ Saad Ahmed +92 300 3391118', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(13, '13', 'Armored Pakistan', '4016914-6', 'Plot no: W2/1/16, NW 1-2, Port Bin Qasim, karachi.', '0343-8286305', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(14, '14', 'Arshad Shahid Abdulla ( Pvt.) Ltd.', '0709706-9', 'Central Hotel Building Ground Floor Civil Lane', '0334-3396562', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(15, '15', 'Artistic Milliners U2', '2645727-0', 'Plot- 8 Sector 25 Korangi industrail Area', '0321-8288203/ 0321-2242867/03332250543', '150 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(16, '16', 'Artistic Milliners U4', '2645727-0', '', '0321-8288203/ 0321-2242867', '75 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(17, '17', 'ARY Films and Production', '2803562-3', 'SITE Area', '0345-3928360', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(18, '18', 'Ary Film And Tv Production', '2803562-3', 'D-120 Manghopir Rd', '0345 3928360/ 0345-2433806', '210 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(19, '19', 'Assurety Consulting Pvt Ltd', '', 'Suite 1107-1109, Cantonment Fowler / 100 Carpenter Dr, Suite 206, Sterling, VA 20164', '0345-2433806//Naeem 0336-8277142, 0300-2595306', '15 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(20, '20', 'Atique Pvt Ltd. (venus carpet)', '3645396-0', 'F-432 Metroville Site', '0302-5556120/ Arif 0300-0222732', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(21, '21', 'Aurther lawrence link 1 (PECHS)', '1876413-4', 'fortune center f-45 Block 6 PECHS main shshra-e-faisal khi', '0332 3581019 / +92 346 2304415 / 021-34386573', '25 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(22, '22', 'Aurther lawrence link 2 (Behria)', '1876413-4', '21 floor Behria town Tower Tariq Road PECHS', '0332 3581019 / 021-34386573', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(23, '23', 'Avari Tower', '0709795-4', 'Avari Towers, Main Building, 244 Ftaima Jinnah Road, Karachi', '0300-2510652', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(24, '24', 'AWM IT Pvt ltd', '5153949-0', 'Shafi Court Building, Merewether Road, Karachi', '0300-0171277', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(25, '25', 'Bari Fatani (Eureka)', '2062587-1', 'National Hihway, Super Highway, Link Road, Bin Qasim', '0345-2980414', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(26, '26', 'BIgTree', '', '', '9221 35362745, 92300 2699077', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(27, '27', 'Bombal and co marine inspection', '7919532-0', 'GSA House Plot 19 Tumber RD Kemari', '0333-3076202', '15 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(28, '28', 'CITS Pvt Ltd', '5085193-4', 'B-1, Plot 3-V PECHS Block 2.Khi', '0321-9283203', '3000 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(29, '29', 'Chipa Trust Authority', '', 'Opp. FTC Bridge Shahrah e Faisal', '0300-8204041', '11 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(30, '30', 'Chipa Welfare Association', '4264564-6', '', '0300-8204041/ \n+92 304 7090903', '100 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(31, '31', 'Comstar link 1', '0688717-1', '3rd floor ILLACO House Abdullah Haroon Road Saddar', '0334 2594529/ Bilal 0342 2680075', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(32, '32', 'Comstar link 2', '0688717-1', '3rd floor ILLACO House,Abdullah Haroon road saddar,Karachi', '0334 2594529', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(33, '33', 'Daewoo Pakistan', '7972196-5', 'Daweeo Terminal super high way', '0300-0651885', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(34, '34', 'DHA khadda Market (fedex)', '0710478-2', 'Shop # 8 C Plot # 6, Main Khayaban-e-Shamsheer, opposite UAE Consulate', '0313-0126556/0311-1823462', '3 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(35, '35', 'DKT Pakistan (Telecard)', '0712372-8', 'DKT Pakistan, Plot no: 34-C, Khalid Commercial Street no: 01, Phase VII Extension, DHA Karachi', '0340-3331979', '5 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(36, '36', 'Dhl Global Forwarding', '1516807-7', 'Port Qasim', '0316-2379780/on site POC Shahrukh 0344-2243768 / Khalid Isla 03342111456', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(37, '37', 'Digital Process (pvt.) Ltd.', '2550351-7', 'B-108, Mehran Town Sector 6 G Korangi', '0333-2199934 / 0334-3726409', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(38, '38', 'Dry Style', '', '15 C Bukhari Comercial Lane 12 Phase 6 DHA', '0305-8278786', '5 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(39, '39', 'Dynamic Shipping- Dynamic World Wide Logistics Group', '1029358-2', 'Plot No W 2 /1/152 /153 port Qasim', '3333186834/ +92 315 2267520 / 0333-3313761', '15 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(40, '40', 'Ema Shipping Agencies', '2956110-8', 'EMA Shipping 5B-1, 5th Floor, Fakhri Trade Center, Shahrah-e-Liaquat, New Chali', '0345-3055528 / 0304-2078858', '15 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(41, '41', 'Transworld Enterprise Services Pvt. Ltd EOBI', '', 'EOBI House Head Office 190/B/1, Block 2 P.E.C.H.S., Karachi,', '3332213789', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(42, '42', 'EZ Life Tech (Telecard)', '0712372-8', '7 floor world Trade Center 10 Khayaban-e-Roomi.Clifton Karachi', '0340-3331976/Mr.Farhan 03212441098', '5 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(43, '43', 'Fedex', '', '', '0307-3337192', '', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(44, '44', 'Fedex Outlet ( Saasi Arcade )', '0710478-2', 'Saasi Arcade, Zone A Block 7 Clifton, Karachi,', '0307-3337192/ Fareed 03332172628 / Active POC 0330-2895278 / Furqan – 0336-3821506', '4 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(45, '45', 'Gerry\'s International Fedex Sialkot', '', '', '0307-3337192/ Faruukh 0311-1823462 /Furqan 0336-3821506', '30 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(46, '46', 'Faisalabad Oil Refinery', '0803939-9', 'North Western Industrial Zone Port Qasim Authority', '0302 9339660', '7 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(47, '47', 'Feroze 1888 Mills Limited Head Office', '0698565-3', 'Feroze1888 Mills, K&N\'s Centre, 160 Shahra-e-Faisal,', '0322-2009444', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(48, '48', 'Feroze 1888 Mills Limited C-3 Aggregation', '', '', '021-32567890 Ext: 1296', '80 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(49, '49', 'Feroze 1888 Mills Limited S-81 Hub Choki', '', '', '0335-2475970 / Abdul Basit – 0310-8505943', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(50, '50', 'Feroze 1888 Mills Limited H-23 Landhi to SITE Area', '', '', '', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(51, '51', 'Food Links Site Area (Divine Foods)', '8876764-2', 'F540/A, SITE Area, near Zia Mor', '0333-2458967', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(52, '53', 'Gerrys\'s International Behria', '', '', '', '77 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(53, '54', 'G Television Network', '4176251-7', 'Shafi Court Building Civil Lane', '3332386075', '100 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(54, '55', 'GTV Maymar', '4176251-7', 'Maymar', '', '2 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(55, '56', 'Gaditek Association (pvt) Limited.', '3242490-6', '141-D Allama Iqbal Road, Block 2, PECHS', '0333-1282614', '280 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(56, '57', 'Gandhara Automoblies', '0702447-9', 'Port Qasim', '0302-8653007', '70 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(57, '58', 'Genetech Solutions', '8160575-5', '166, Block III G/5 P.E.C.H.S', '0300 3990826', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(58, '59', 'General Tyre Landhi', '', '', '0333-2259170/ 0324-2056445/ 0345-8242603 / Sohail 0333-2123612 / 03132464223 asrar', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(59, '61', 'Gerrys Visa Quetta', '5239793-2', '', '0333-9299044', '5 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(60, '62', 'Gerrys offshore dr plaza (Plaza POP)', '', '', '300-2699077', '200 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(61, '63', 'Gerrys visa FTC (Khi)', '', '', '0300-9427367/ 0347 2400969 /0333-3912439 / 0333-2348548', '20', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(62, '64', 'Gerry international Cargo (GSA Cargo VLAN 84)', '0710478-2', 'Cargo Office Airport,Karachi', '0302-8295699 / 0330-8984880/Akram Gsa +92 300 8984880', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(63, '65', 'Gerrys Leisure Pvt Ltd Costa Coffee PECHS', '5268073-4', '1A Tipu Sultan Rd, Karachi Memon Co-operative Housing Society Jinnah Housing Society P.E.C.H.S., Karachi', '0333-3221247/Costa Coffee DHA – 0301-5930371/ Mr. Mubashir (0311-2127739).', '5 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(64, '66', 'Gerrys Visa (Japan VAC)', '', '', '301-1010809', '5 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(65, '67', 'Ghani Glass Ltd', '0786178-8', 'Landhi Industrial Area Rd, Firdous Chali Landhi Town', '0321-8468849', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(66, '68', 'Hesco steel pvt ltd', '7191355-4', 'Plot K5 Hub industerial Area', '0321-2956099 / 03222578424/ 0301-1174324/ sarfaraz 0301-1174325', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(67, '69', 'HAF Enterprises', '3645396-0', 'Plot # 96, Nasir Colony Sector 7/A Korangi Industrial Area, Karachi,', '0302-5556120', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(68, '70', 'Hellmann Worldwide Logistics (pvt) Ltd', '2815749-4', '38 5th Street, Block 7 Zone B Block 7 Clifton, Karachi', '0300-2546907/ +92 300 2546907', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(69, '71', 'Honda Quality Service', '7486083-0', 'Gulshan e Benazir Twp Scheme, Karachi', '0333-2211541/ Honda Port Qasim 0323-2375220', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(70, '72', 'HRSG BPO', '2829881-7', '', '0301 8552032 / +92 3102750609', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(71, '73', 'HRSG Outsourcing', '2829881-7', 'HRSG House, 46-D Street No. 46, off Shahra-e-Faisal, Block 6 P.E.C.H.S', '0301 8552032/ Ahsan Khan \n0342-2000109/Aamir Arif \n03002563135 / +92 3102750609', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(72, '74', 'Hub Leather VLAN 951', '0984513-5', 'Plot No. 74 Sector 7 A Korangi Industrial Area Karachi', '03458693020 / 02135121579-81 / 0345-2371170 /', '4 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(73, '75', 'Hunar Foundation', '3072746-4', 'Central Hotel Building 3rd Floor Civil Lane', '0336-2187536-7', '25 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(74, '76', 'ICS', '4239824-0', '1st Floor Shafi Court', '3343657716', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(75, '77', 'ICS Interner- Head Office', '4239824-0', '1st Floor Shafi Court', '0346-2198901', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(76, '78', 'IFI Logistics and Services Pvt Ltd', '', 'Port Qasim', '0312-2316639', '5 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(77, '79', 'I Consultant', '', '1st Floor Shafi Court Civi lane', 'O300-8256482 / 0300-2045902', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(78, '80', 'Ihop Korangi Warehouse (Gerrys Leisure Pvt Ltd)', '5268073-4', 'Mehran Town sector 24 Korangi Industrial Area', '0333-3221247 / 0311-2127739', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(79, '81', 'Idress Impex', '3645396-0', 'Malir Karachi', '0302-5556120', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(80, '82', 'IXP-HEC', '', '', '0335-0225643 / Asif 0333-3313761', '', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(81, '83', 'Jb Industries', '', '', '0333-2211541/ 021 32569724', '22 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(82, '84', 'Jinnah sindh Medical University (JSMU)', '903020-7', 'Rafiqui H.J, Iqbal Shaheed Road, Karachi,', '0321 2648513', '65 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(83, '85', 'jannat gul hospital pphi sindh', '', 'Karachi II, First Floor, MCHS Jannat Gul Hospital, Near Al Asif Square, Sohrab Goth, Karachi.', '0301-2229677', '12 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(84, '86', 'Kamil converter -Ahsanabad unit 2', '4309249-7', 'Maymar industrial area', '0309-3333191', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(85, '87', 'Kamil Converters Pvt. Ltd. Maymar', '4309249-7', 'Plot no C-11, Feroz Alam Lari Road Adjacent to Afroz Textiles, SITE Super Highway, Kaachi.', '0345 2633191/0309-3333191 / Hamzah 0331-0265782', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(86, '88', 'Kamil Packages (SITE Area)', '3612370-6', 'A-70 S.I.T.E, Opp. Valika Hospital, Near METRO', '0309-3333191', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(87, '89', 'Kasim Pvt Ltd PECHS', '0803119-3', 'Muhammad Ali Socity Near Keebees', '0300-0453894', '30 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(88, '90', 'Kassim Textile Pvt Ltd RF Landhi', '0803119-3', 'Plot no: 62 km, Main National Highway, Landhi', '0321-2269253, 0318-2074411', '75 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(89, '91', 'Kompass Pakistan Link 1 GT-POP', '1262332-6', 'F-37, North Western Ind. Zone، Port Qasim Authority, Karachi', '3337869685', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(90, '92', 'Kompass Pakistan Link 2 PQ-POP', '1262332-6', 'F-37, North Western Ind. Zone، Port Qasim Authority, Karachi', '3337869685/ 0333-2686621 / 0337-3192469', '2 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(91, '93', 'Kuehne & Nagel Pakistan PECHS ( Pvt.) Ltd.', '0999405-0', '', '0300-8271401', '5 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(92, '94', 'Kuehne & Nagel Pakistan Port Qasim( Pvt.) Ltd.', '0999405-0', 'Block 6 47-E-3, Karachi', '0300-8271401', '6 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(93, '95', 'kutiyana memon hospital', '5085193-4', 'Nawab Mahabat Khanji Rd, Kharadar Ghulam Hussain Kasim Quarters, Karachi', '0320-1234814', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(94, '96', 'Lucky Kathore', '', '', '0346-2102420', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(95, '97', 'Lucky knites', '2277359-2', '57 KM Mile Stone Super High', '0304-1071362/ 0333-2496020', '30 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(96, '98', 'Lucky Onederland Entertainment Pvt Ltd.', '7222475-2', 'LA-2/B Main Rashid Minhas Road', '3123035182', '3 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(97, '99', 'Lucky Textie Mills Ltd Head Office', '', '', '0321-8207488/Ayub Ali (Lucky Site) 0333-2158624 / Zeeshan 92-320-2526931, + 92-300-2526931', '150 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(98, '100', 'Lucky Textie Mills Ltd Landhi', '', 'Plot # 71 Deh Khanto Main national highway Landhi, karachi', '', '30 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(99, '101', 'Lucky Textie Mills Ltd SITE Area', '', 'A-8/C SITE Area Karachi', '', '30 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(100, '102', 'Magnacreate', '2677089-0', 'Office No. 218, 2nd Floor, The Plaza Plot No. G-7 Block 9, Near II Talwar Clifton, Karachi', '0300 9249511', '60 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(101, '103', 'Maqsad Pvt ltd', '4957122-8', 'Lines, 3rd Floor, Block II Shafi Court, Merewether Rd, Civil, Karachi', '0300-1723923', '150 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(102, '104', 'Mars bpo', '7473726-0', '2nd Floor, Shafi Court, Club Road, Merewether Rd, near Avari Towers, Civil Lines, Karachi', '0335-7070794', '60 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(103, '105', 'Matracon', '3968747-3', '', '0302-8202712 / +92 314 3294954 / 0316-1005424', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(104, '106', 'Movenpick Hotel Karachi', '0700949-6', 'Club Rd, Civil Lines', '0301 8283121', '300 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(105, '107', 'Mr Riaz', '', '1st Floor Centeral Hotel Building Merewearther RD', '', '1 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(106, '108', 'Muno pakistan', 'G485568-0', 'Plot 141 Sector 28 Korangi industerial', '0314 2861231', '30 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(107, '109', 'Mustaqim Dyeing & Printing Ind.', '0803075-8', 'D-14/A، Bara Board, Karachi', '0312-2254084/0312-1263338/ (021) 111 612 612', '100 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(108, '110', 'Naheed Super Market', '1328857-1', 'Plot 199 Sector 23 Korangi Industrial Area', '0300 2241130 / 0332-3420846', '25 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(109, '111', 'NETSOL CONNECT/SANA SAFINA', '', '', '0302-1583191 / Saleem 0311-7744677', '15 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(110, '112', 'Oberthur (Idemia) Technologies Pakistan (pvt.) Ltd.', '3060979-8', 'Plot 189, Mehran Town Sector 23 Korangi, Karachi,', '0307-2225664', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(111, '113', 'Optimize Engineering Core Pvt Ltd OEC', '8294599-1', 'Port Qasim', '0300-8271888', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(112, '114', 'OF Logistix Pvt ltd', '7986289-4', 'Office No. 104, 1st Floor, Shafi Court, Merewether Rd, off Club Road, Civil Lines, Karachi', '0300-2350531, 03032639396', '25 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(113, '115', 'Optimedia Pvt Ltd', '8294599-1', 'House No 221 - B Block 2 PECHS', '0343-2116950', '10 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(114, '116', 'PACC (Jinnah )', '1453102-0', 'Fatima jinnah Cannt karachi', '312-3499609/ POC junaid 0321-2484227', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(115, '117', 'PACC (Liaquat Library)', '1453102-0', '', '312-3499609/ Madiha 0326-6133353 / +92 315 0316607', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(116, '118', 'PC HOTEL', '0822910-4', 'Club Rd، opposite PIDC, Civil Lines, Karachi', '0300-8581279', '130 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(117, '119', 'Pak Agro Oil Industries', '2727262-1', 'Pak Agro, Port Qasim, Gulshan-e- Hadeed, Karachi', '0346-2769307', '24 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(118, '120', 'Pak Petro Chemical Industries Link 1', '', '', '0300-2819695', '20 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(119, '121', 'Pak Petro Chemical Industries National High Way Link 2', '', '', '0300-2819695', '6 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(120, '122', 'Pak Petro Kasur Lahore', '', '', '0333-4850680', '2 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(121, '123', 'Pak Poly Industries', '5423646-3', '', '0316 2364594 / 03222528198/0333-4850680 / Imran +92 300 2819695', '30 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(122, '124', 'Pakistan Paper', '0860023-6', '01 Ismail Center Tayyab Jee Road Off Shahrah e Liaqat Karachi', '0342-1501061, 0302-8478381', '7 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(123, '125', 'Pakistan Tankers Company', '0860023-6', 'Plot No: w2/1/140-141, North Western Industrial Zone, Port Qasim', '0344-2290229/Raza 0318-8492636', '25 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(124, '126', 'Pphi (karachi Clifton)', '', 'C 27 Street 1, near Umer Sharif Park, Block 2 Clifton, Karachi', '0333-2698026/0345-3609496', '12 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(125, '127', 'Postex (FB Area ) Nazimabad', 'Call Courier Series 7972196-5', 'Sara Corporation, Gulberg Town FB Area Karachi', '0310-8130485- 0308-3642441- (0311-3411785 Imtiaz)', '70 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(126, '128', 'Postex (Korangi)', '', 'near saylani 3 shed, Sector 5 Korangi 5, Karachi', '0334-2014944', '50 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(127, '129', 'Postex kalaboard Shadman', '7556192-8', 'Millat Garden road,Block A Malir Ghazi Dawood Brohi Goth Karachi', '0310-8130485- 0308-3642441/ Active POC Arshad Ali 0300-2424185', '30 MB', '2026-08-16 10:52:29', '2026-08-16 10:52:29'),
(128, '130', 'Postex Pvt Ltd', '7556192-8', '', '0310-8130485- 0308-3642441', '100 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(129, '131', 'Postex Ghas Mandi VLAN 560', '7556192-8', 'Icon tower ghas mandi Plot no LY26/3/2/1 Garden', '0310-8130485- 0308-3642441 POC: Altaf hussain 03337528747', '30 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(130, '132', 'Postex Quetta Town VLAN 1936 Corporate Courier', '', '', '0300-4610965', '30 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(131, '133', 'Pro Athletic SKBZ Cricket Ground', '', '26-Khayaban-e-Rahat DHA Phase 6 Karachi', '0302-1229096', '30 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(132, '134', 'Rasheed Enterprise', '1544549-6', 'F-259, Rasheedabad Sindh Industrial Trading Estate, Karachi', '0311-7520442./0322 2359168 / 0304-2904837', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(133, '135', 'Xing solution (Data) postex call courier', '7972196-5', 'L 3/A Rashid Minhas Road Block 22 Gulberg town karachi', '0345-8268826/ 0309-3802190', '25 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(134, '136', 'REDTONE DIGITAL SERVICES PVT. LTD (TATA PAKISTAN)', '', 'D-23, Block-02, Clifton, Karachi, Pakistan', '0335-3043683', '20 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(135, '137', 'Regional Blood Center Qatar Hospital Karachi Orangi RBC', '', 'Qatar Hospital Sector 7/B Orangi Town Karachi', '0345 2843600', '15 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(136, '138', 'Regional Blood Center Karachi Civil', '', '', '0322-2009675', '15 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(137, '139', 'Regional Blood Center Karachi Layari', '4019994-7', 'Plot no: A-27, Karachi', '0343-2216710 / 021) 36691124-25', '15 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(138, '140', 'Rija Fashions (pvt.) Limited.', '0295224-6', 'Plot # 4, 5, 6, 7, 12, 14 Sector A-II, A-ii Karachi Export Processing Zone (KEPZ) LANDHI INDUSTRIAL AREA, Karachi', '0333-2369708/(021) 35085201', '50 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(139, '141', 'RIZ Consulting', '', 'ERU Sindh Jinnah Gul Hospital Soharb goth', '0335-2361691 / 0334-3899034', '20 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(140, '142', 'Royal printing and packages', '', 'B / 25 Site Super high', '3402601707/Imtehaj 0312-9216731/ 334 1728803', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(141, '143', 'Saakh pharma', '4277715-1', 'C-7, 1, North Western Industrial Zone Port Qasim Bin Qasim Town, Karachi', '0333-3461200 / 0326 841 0577', '20 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(142, '144', 'Saigal pakages Industries Behria', '', '', '0303-2991462/ 0333-2253218', '15 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(143, '145', 'Saigal Moach Goth', '', '', '0333-2253218/ Active POC Athar Hussain 0300-2984481', '5 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(144, '146', 'SATCOM PVT LTD', '1876413-4', 'D 38 Site Karachi', '0321-2202483', '5100 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(145, '147', 'Saudi Pak Insurance', '', '2nd Floor. State Life Building No. 2A, Wallace Road', '0333-2375579/0317-2102031', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(146, '148', 'Saya Industries (Essa Industries)', '6296917-4', '', '0333-3400975', '1 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(147, '149', 'Saylani welfare', '1428087', 'A-25 Near Char Minar Chorangi Badurabad', '0314-2350790 / 0314-2322063', '11 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(148, '150', 'Sharptel IO Digital (Data)', '3145528-0', 'SharpTel, 5th Floor Plot # C-10/2 Smart Tower, OFF Shahra-e-Faisal', '0341-1005111/ Active POC +92 344 1333658', '50 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(149, '151', 'Sharptel Afroz Textile', '314528-0', 'CA scheen 33 site karachi motorway', '0300-0651839', '20 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(150, '152', 'Shaheen Automotive (pvt). Ltd.', '0675085-5', 'DSU/36/A, Pakistan Still Mill Industrial Estate Bin Qasim Karachi', '0333-3368525/ PTCL (021) 347236(81-82)', '20 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(151, '153', 'Speciality Sales Dashi Foods Head Office', '2773838-8', 'Office no: 305, hill Trade Center, Near to Hill Park, Hospital, Shaheed Millat Road, Karachi.', '0321-3633925', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(152, '154', 'Stack Lab Private Limited (creative Chaos)', '', 'devoice place at Nazar chowrangi hub chowky near shel petrol pump', '0346-7651224', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(153, '155', 'Stack Lab Private Limited (creative Chaos)', '5304354-6', 'Basement Marine Pride Plot C-2 Khayaban e Iqbal road', '0300-9238812', '60 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(154, '156', 'Stahl Pakistan (pvt.) Limited', '2944737-2', 'Plot 67 Sector 27 Korangi', '0300-2185538', '30 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(155, '157', 'Star Denim', '0676816-4', 'Block 21, L-23, Federal B Area Karachi', '0300-2493385', '3 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(156, '158', 'Studio q', '7279065-0', 'Office # 326, 3rd Floor, Anexe Building, Sindh, Central Hotel Building, Abdullah Haroon Rd, Civil Lines', '0300-2383824', '5 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(157, '159', 'Suparco Hq Communication Section', '9010633-4', 'Suparco Rd, Gulzar-e-Hijri Sachal Goth Sector 28 Gulzar E Hijri Scheme 33, Karachi', '021-34690793 / 0331-2404438', '8 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(158, '160', 'Telecard Fedex Head Office', '0712372-8', '7 floor world Trade Center 10 Khayaban-e-Roomi.Clifton Karachi', '0340-3331976', '5 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(159, '161', 'Telecard Limited Enterprise Communication Solution EFU Limited Enterprise VLAN 2203', '', '', '0340-3331976', '5 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(160, '162', 'Telecard Limited Enterprise Communication Solution Artistic Milliners', '0712372-8', '7th Floor, World Trade Center, 10 Khayaban -E-Roomi, Clifton Karachi', '0340-3331977', '5 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(161, '163', 'Telecard Alamgir Welfare', '0712372-8', '7 floor world Trade Center 10 Khayaban-e-Roomi.Clifton Karachi', '0340-3331976/923092628425', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(162, '164', 'Telecard jilani flexible', '0712372-8', 'Shed no 4,plot # F-202 SITE Karachi', '0340-3331976/ Active POC Mr. Aiteshan \nContact Number: 0312 2281992', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(163, '165', 'Transfreight', '0712450-3', '7th Floor, Bahria Complex III, Moulvi Tamizuddin Khan Rd, Lalazar, Karachi', '0301-1017667', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(164, '166', 'Transworld PICT', '2254821-1', 'Suit 110,1st floor Business Avenue PECHS Block 6 Shahra-e-faisal Karachi', '0300-2101208', '40 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(165, '167', 'Trimsnest', '', 'Building 29 C, 21st Commercial St, D.H.A Phase II Extension Phase 2 Commercial Area Defence Housing Authority, Karachi', '0300 8274995/ 03272048043', '', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(166, '168', 'Travel Agents Association of Pakistan (TAAP)', '', '1 Floor Centeral Building Mereweather RD', '0300-2257423/ 0370-2318007', '2 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(167, '169', 'Transworld Abbot korangi (Expereo)', '2254821-1', 'Plot No.13 Main Korangi Industrial Road, Sector 20 Landhi Town,', '0300-2101208', '50 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(168, '170', 'Transworld Abbot Landi VLAN 1575 (TWA)', '2254821-1', '', '0300-2101208', '150 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(169, '171', 'Two Shades LLP', 'D496489-4', 'Suite no. 1001 10th floor Kashif Center Shahrah e Faisal KCB Saddar Karachi', '0344-20709211', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(170, '172', 'Umar Spinning Mills', '8470319-6', '101 Commerce Center, Hasrat Mohani Road Karachi', '0323-2115205021- 32630724 - 32633641/Ayaz 0342-2395770/Nadeem 0333-2491598', '100 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(171, '173', 'Union Steel Industries', '4108044-7', 'D-36 Manghopir Rd, Metroville Sindh Industrial Trading Estate, Karachi', '0311-4994011', '20 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(172, '174', 'Utopia Industries Pvt Ltd Head Office', '7995393-0', 'HEAD OFFICE. Plot # Z-63 S.I.T.E Super Highway Phase II Karachi,', '3338381378/0333-8234990', '150 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(173, '175', 'Utopia Industries Pvt Ltd 4 to 6 Repeter', '', '', '3338234990', '50 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(174, '176', 'Wada Digital/ Insurance', '6647001-6', '163, main Shahra-e-Faisal, Bangalore Town Karachi', '0313-1004192/ 0333-3727798/ 03150276393', '50 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(175, '177', 'Western Textile Pvt Ltd', '', 'Plot No E, 11, Sindh Industrial Trading Estate', '0334-2882897', '40 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(176, '178', 'White Eagle Engineering Pvt Ltd', '', 'Plot W2 / 5 North west Port Qasim', '0303-7384501 (Zahid 0300-9249300) (Hammad 0313-1269232)', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(177, '179', 'Yunus Textile Mills 1', '', '', '0342 2495753', '180 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(178, '180', 'Yunus Textile Mills 2', '2906767-1', 'Plot no: H-23/1, Landhi Industrial Area, Karachi', '0343-3026628', '20 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(179, '181', 'Yunus Textile Mills 3', '', '', '', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(180, '182', 'Yunus Textile Mills 7', '', '', '0342 2495753', '50 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(181, '183', 'Zafa Pharmaceutical', '0712658-1', 'L/1 B, Sohrab Goth Flyover, Federal B Area Block 21 Industrial Area, Karachi', '0333-3036377', '20 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(182, '184', 'Zafa to b21 data', '0712658-1', '', '0333-3036377', '', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(183, '185', 'Zara Mobility- khadda market', '', '', '0345-3067114', '500 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(184, '186', 'Zill Pvt Ltd (khi)', '0712698-7', 'Ground Floor, Bahria Complex III, Moulvi Tamizuddin Khan Rd,', '0345-3540733 / 0334 3726428', '12 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(185, '187', 'Telecard Limited Enterprise Communication Solution (Unilever New Guest House)', '0712372-8', 'House no: 167, Street no: 30, Phase no: 08, Karachi', '0340-3331976', '5 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(186, '188', 'EUREKA NET DWP Digital World Pakistan', '3815160-9', 'Razakabad, Port Bin Qasim', '0331- 7418915', '20 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(187, '189', 'Telecard Limited Enterprise Communication Solution (K Electric Call Center)', '0712372-8', 'Gulshan-e- Iqbal, Gird Station/AZM Learning Institute, Block-19, Gulshan-e- Iqbal, Karachi', '0340-3331976', '50 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(188, '190', 'Matrix Systems Pvt Ltd', '', '605 Progressive Square, PECHS Block -06, Nursery Shahra e Faisal, Karachi', '0336-8051116/Muhammad Ismail 0333-2388108 / 92-21-34312271', '100 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(189, '191', 'Telecard Limited Enterprise Communication Solution (Vital Pakistan Trust Gadap Town)', '0712372-8', 'Vital Pakistan Trust Qayummabad, KGH Gadap Town', '0340-3331976', '40 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(190, '192', 'Telecard Limited Enterprise Communication Solution (Vital Pakistan- Link 02)', '0712372-8', '', '0340-3331977', '60 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(191, '193', 'SARWAT CONVERTER (PVT) LTD', '8137457', 'Plot no: A-27, Karachi, Pakistan', '0335-7494590, 03444236758 ,03443592250', '20 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(192, '194', 'MEKOTEX (PVT.) LIMITED- SHARPTEL', '3145528', 'plot no: 435, National Highway, Landhi Town, Karachi.', '0300-0651133 / Active POC 03458213745', '60 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(193, '195', 'Telecard Limited Enterprise Communication Solution (Fedex HO Pvt. Ltd.)', '', '7th Floor, World Trade Center, 10 Khayaban -E-Roomi, Clifton Karachi', '0340-3331976', '10 Mbps', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(194, '196', 'Gerrys International Bahria', '', '', '0333-2348548', '40 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(195, '197', 'Younus Textile Mills Limited Weaving Department, Unit 07', '2906767-7', 'Weaving Department, Unit 07, YTM, Karachi', '0349-7794569 / 0341-3546622', '25 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(196, '198', 'Gerrys Visa Quetta', '', 'Maymar Plaza, Old Pashine Stop, Khojak Road, Near white Road, Quetta', '0333-9299044 / 0306-0891223', '5 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(197, '199', 'ZAFA PHARMACEUTICLA LABORATORIES (PVT) LTD', '', 'L-1/B, Block-22, F.B. Industrial Aea, Karachi.', '0333-3036377', '25 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(198, '200', 'GENERAL TYRE AND RUBBER COMPANY', '0712372-8', 'Qayyumbad-KGH, East Gadap Town, Gujro Zone B, Karachi, Pakistan', '0340-3331970', '5 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30'),
(199, '201', 'GERRY\'S LEISURE PLUS (PVT) LTD', '', 'D-139, E-Street, Block 4 Clifton, Karachi', '0333-3221247', '10 MB', '2026-08-16 10:52:30', '2026-08-16 10:52:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Employee') NOT NULL DEFAULT 'Admin',
  `profile_image_url` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `profile_image_url`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Gerrys Administrator', 'admin@gerrys.net', '$2y$12$eVz4toeArD/juxgn332CbuNHAUBErLF7mxlBUfmvYlrlPW1sKe4Uu', 'Admin', NULL, NULL, '2026-08-16 10:37:52', '2026-08-16 10:37:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaints_customer_name_index` (`customer_name`),
  ADD KEY `complaints_status_index` (`status`);

--
-- Indexes for table `dark_core_links`
--
ALTER TABLE `dark_core_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dplc_details`
--
ALTER TABLE `dplc_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dplc_details_serial_no_index` (`serial_no`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faults_cleared`
--
ALTER TABLE `faults_cleared`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faults_cleared_customer_name_index` (`customer_name`);

--
-- Indexes for table `faults_reported`
--
ALTER TABLE `faults_reported`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faults_reported_customer_name_index` (`customer_name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noc_pop_locations`
--
ALTER TABLE `noc_pop_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noc_pop_locations_serial_no_index` (`serial_no`),
  ADD KEY `noc_pop_locations_pop_name_index` (`pop_name`);

--
-- Indexes for table `p2p_subscribers`
--
ALTER TABLE `p2p_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p2p_subscribers_serial_no_index` (`serial_no`),
  ADD KEY `p2p_subscribers_link_name_index` (`link_name`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribers_serial_no_index` (`serial_no`),
  ADD KEY `subscribers_company_name_index` (`company_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `dark_core_links`
--
ALTER TABLE `dark_core_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dplc_details`
--
ALTER TABLE `dplc_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faults_cleared`
--
ALTER TABLE `faults_cleared`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faults_reported`
--
ALTER TABLE `faults_reported`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `noc_pop_locations`
--
ALTER TABLE `noc_pop_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2p_subscribers`
--
ALTER TABLE `p2p_subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
