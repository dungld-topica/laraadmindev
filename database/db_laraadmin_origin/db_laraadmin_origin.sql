/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_laraadmin_origin

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-07-19 10:45:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for backups
-- ----------------------------
DROP TABLE IF EXISTS `backups`;
CREATE TABLE `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backup_size` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backups_name_unique` (`name`),
  UNIQUE KEY `backups_file_name_unique` (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of backups
-- ----------------------------

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `color` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', 'Administration', '[]', '#000', null, '2018-07-19 03:38:51', '2018-07-19 03:38:51');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `designation` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dept` int(10) unsigned NOT NULL DEFAULT '1',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` date NOT NULL DEFAULT '1990-01-01',
  `date_hire` date NOT NULL,
  `date_left` date NOT NULL DEFAULT '1990-01-01',
  `salary_cur` decimal(15,3) NOT NULL DEFAULT '0.000',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_dept_foreign` (`dept`),
  CONSTRAINT `employees_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('1', 'dungld', 'Super Admin', 'Male', '8888888888', '', 'admin@laraadmin.com', '1', 'Pune', 'Karve nagar, Pune 411030', 'About user / biography', '2018-07-19', '2018-07-19', '2018-07-19', '0.000', null, '2018-07-19 03:39:58', '2018-07-19 03:39:58');

-- ----------------------------
-- Table structure for la_configs
-- ----------------------------
DROP TABLE IF EXISTS `la_configs`;
CREATE TABLE `la_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of la_configs
-- ----------------------------
INSERT INTO `la_configs` VALUES ('1', 'sitename', '', 'LaraAdmin 1.0', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('2', 'sitename_part1', '', 'Lara', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('3', 'sitename_part2', '', 'Admin 1.0', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('4', 'sitename_short', '', 'LA', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('5', 'site_description', '', 'LaraAdmin is a open-source Laravel Admin Panel for quick-start Admin based applications and boilerplate for CRM or CMS systems.', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('6', 'sidebar_search', '', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('7', 'show_messages', '', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('8', 'show_notifications', '', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('9', 'show_tasks', '', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('10', 'show_rightsidebar', '', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('11', 'skin', '', 'skin-white', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('12', 'layout', '', 'fixed', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_configs` VALUES ('13', 'default_email', '', 'test@example.com', '2018-07-19 03:38:51', '2018-07-19 03:38:51');

-- ----------------------------
-- Table structure for la_menus
-- ----------------------------
DROP TABLE IF EXISTS `la_menus`;
CREATE TABLE `la_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'module',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `hierarchy` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of la_menus
-- ----------------------------
INSERT INTO `la_menus` VALUES ('1', 'Team', '#', 'fa-group', 'custom', '0', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_menus` VALUES ('2', 'Users', 'users', 'fa-group', 'module', '1', '0', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_menus` VALUES ('3', 'Uploads', 'uploads', 'fa-files-o', 'module', '0', '0', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_menus` VALUES ('4', 'Departments', 'departments', 'fa-tags', 'module', '1', '0', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_menus` VALUES ('5', 'Employees', 'employees', 'fa-group', 'module', '1', '0', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_menus` VALUES ('6', 'Roles', 'roles', 'fa-user-plus', 'module', '1', '0', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_menus` VALUES ('7', 'Organizations', 'organizations', 'fa-university', 'module', '0', '0', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `la_menus` VALUES ('8', 'Permissions', 'permissions', 'fa-magic', 'module', '1', '0', '2018-07-19 03:38:51', '2018-07-19 03:38:51');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_05_26_050000_create_modules_table', '1');
INSERT INTO `migrations` VALUES ('2014_05_26_055000_create_module_field_types_table', '1');
INSERT INTO `migrations` VALUES ('2014_05_26_060000_create_module_fields_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_01_000000_create_uploads_table', '1');
INSERT INTO `migrations` VALUES ('2016_05_26_064006_create_departments_table', '1');
INSERT INTO `migrations` VALUES ('2016_05_26_064007_create_employees_table', '1');
INSERT INTO `migrations` VALUES ('2016_05_26_064446_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('2016_07_05_115343_create_role_user_table', '1');
INSERT INTO `migrations` VALUES ('2016_07_06_140637_create_organizations_table', '1');
INSERT INTO `migrations` VALUES ('2016_07_07_134058_create_backups_table', '1');
INSERT INTO `migrations` VALUES ('2016_07_07_134058_create_menus_table', '1');
INSERT INTO `migrations` VALUES ('2016_09_10_163337_create_permissions_table', '1');
INSERT INTO `migrations` VALUES ('2016_09_10_163520_create_permission_role_table', '1');
INSERT INTO `migrations` VALUES ('2016_09_22_105958_role_module_fields_table', '1');
INSERT INTO `migrations` VALUES ('2016_09_22_110008_role_module_table', '1');
INSERT INTO `migrations` VALUES ('2016_10_06_115413_create_la_configs_table', '1');

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_db` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view_col` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `is_gen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES ('1', 'Users', 'Users', 'users', 'name', 'User', 'UsersController', 'fa-group', '1', '2018-07-19 03:38:48', '2018-07-19 03:38:51');
INSERT INTO `modules` VALUES ('2', 'Uploads', 'Uploads', 'uploads', 'name', 'Upload', 'UploadsController', 'fa-files-o', '1', '2018-07-19 03:38:48', '2018-07-19 03:38:51');
INSERT INTO `modules` VALUES ('3', 'Departments', 'Departments', 'departments', 'name', 'Department', 'DepartmentsController', 'fa-tags', '1', '2018-07-19 03:38:49', '2018-07-19 03:38:51');
INSERT INTO `modules` VALUES ('4', 'Employees', 'Employees', 'employees', 'name', 'Employee', 'EmployeesController', 'fa-group', '1', '2018-07-19 03:38:49', '2018-07-19 03:38:51');
INSERT INTO `modules` VALUES ('5', 'Roles', 'Roles', 'roles', 'name', 'Role', 'RolesController', 'fa-user-plus', '1', '2018-07-19 03:38:49', '2018-07-19 03:38:51');
INSERT INTO `modules` VALUES ('6', 'Organizations', 'Organizations', 'organizations', 'name', 'Organization', 'OrganizationsController', 'fa-university', '1', '2018-07-19 03:38:49', '2018-07-19 03:38:51');
INSERT INTO `modules` VALUES ('7', 'Backups', 'Backups', 'backups', 'name', 'Backup', 'BackupsController', 'fa-hdd-o', '1', '2018-07-19 03:38:50', '2018-07-19 03:38:51');
INSERT INTO `modules` VALUES ('8', 'Permissions', 'Permissions', 'permissions', 'name', 'Permission', 'PermissionsController', 'fa-magic', '1', '2018-07-19 03:38:50', '2018-07-19 03:38:51');

-- ----------------------------
-- Table structure for module_fields
-- ----------------------------
DROP TABLE IF EXISTS `module_fields`;
CREATE TABLE `module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `colname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` int(10) unsigned NOT NULL,
  `field_type` int(10) unsigned NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `defaultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `popup_vals` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_fields_module_foreign` (`module`),
  KEY `module_fields_field_type_foreign` (`field_type`),
  CONSTRAINT `module_fields_field_type_foreign` FOREIGN KEY (`field_type`) REFERENCES `module_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `module_fields_module_foreign` FOREIGN KEY (`module`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of module_fields
-- ----------------------------
INSERT INTO `module_fields` VALUES ('1', 'name', 'Name', '1', '16', '0', '', '5', '250', '1', '', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('2', 'context_id', 'Context', '1', '13', '0', '0', '0', '0', '0', '', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('3', 'email', 'Email', '1', '8', '1', '', '0', '250', '0', '', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('4', 'password', 'Password', '1', '17', '0', '', '6', '250', '1', '', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('5', 'type', 'User Type', '1', '7', '0', 'Employee', '0', '0', '0', '[\"Employee\",\"Client\"]', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('6', 'name', 'Name', '2', '16', '0', '', '5', '250', '1', '', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('7', 'path', 'Path', '2', '19', '0', '', '0', '250', '0', '', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('8', 'extension', 'Extension', '2', '19', '0', '', '0', '20', '0', '', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('9', 'caption', 'Caption', '2', '19', '0', '', '0', '250', '0', '', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('10', 'user_id', 'Owner', '2', '7', '0', '1', '0', '0', '0', '@users', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('11', 'hash', 'Hash', '2', '19', '0', '', '0', '250', '0', '', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('12', 'public', 'Is Public', '2', '2', '0', '0', '0', '0', '0', '', '0', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_fields` VALUES ('13', 'name', 'Name', '3', '16', '1', '', '1', '250', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('14', 'tags', 'Tags', '3', '20', '0', '[]', '0', '0', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('15', 'color', 'Color', '3', '19', '0', '', '0', '50', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('16', 'name', 'Name', '4', '16', '0', '', '5', '250', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('17', 'designation', 'Designation', '4', '19', '0', '', '0', '50', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('18', 'gender', 'Gender', '4', '18', '0', 'Male', '0', '0', '1', '[\"Male\",\"Female\"]', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('19', 'mobile', 'Mobile', '4', '14', '0', '', '10', '20', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('20', 'mobile2', 'Alternative Mobile', '4', '14', '0', '', '10', '20', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('21', 'email', 'Email', '4', '8', '1', '', '5', '250', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('22', 'dept', 'Department', '4', '7', '0', '0', '0', '0', '1', '@departments', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('23', 'city', 'City', '4', '19', '0', '', '0', '50', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('24', 'address', 'Address', '4', '1', '0', '', '0', '1000', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('25', 'about', 'About', '4', '19', '0', '', '0', '0', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('26', 'date_birth', 'Date of Birth', '4', '4', '0', '1990-01-01', '0', '0', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('27', 'date_hire', 'Hiring Date', '4', '4', '0', 'date(\'Y-m-d\')', '0', '0', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('28', 'date_left', 'Resignation Date', '4', '4', '0', '1990-01-01', '0', '0', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('29', 'salary_cur', 'Current Salary', '4', '6', '0', '0.0', '0', '2', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('30', 'name', 'Name', '5', '16', '1', '', '1', '250', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('31', 'display_name', 'Display Name', '5', '19', '0', '', '0', '250', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('32', 'description', 'Description', '5', '21', '0', '', '0', '1000', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('33', 'parent', 'Parent Role', '5', '7', '0', '1', '0', '0', '0', '@roles', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('34', 'dept', 'Department', '5', '7', '0', '1', '0', '0', '0', '@departments', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('35', 'name', 'Name', '6', '16', '1', '', '5', '250', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('36', 'email', 'Email', '6', '8', '1', '', '0', '250', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('37', 'phone', 'Phone', '6', '14', '0', '', '0', '20', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('38', 'website', 'Website', '6', '23', '0', 'http://', '0', '250', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('39', 'assigned_to', 'Assigned to', '6', '7', '0', '0', '0', '0', '0', '@employees', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('40', 'connect_since', 'Connected Since', '6', '4', '0', 'date(\'Y-m-d\')', '0', '0', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('41', 'address', 'Address', '6', '1', '0', '', '0', '1000', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('42', 'city', 'City', '6', '19', '0', '', '0', '250', '1', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('43', 'description', 'Description', '6', '21', '0', '', '0', '1000', '0', '', '0', '2018-07-19 03:38:49', '2018-07-19 03:38:49');
INSERT INTO `module_fields` VALUES ('44', 'profile_image', 'Profile Image', '6', '12', '0', '', '0', '250', '0', '', '0', '2018-07-19 03:38:50', '2018-07-19 03:38:50');
INSERT INTO `module_fields` VALUES ('45', 'profile', 'Company Profile', '6', '9', '0', '', '0', '250', '0', '', '0', '2018-07-19 03:38:50', '2018-07-19 03:38:50');
INSERT INTO `module_fields` VALUES ('46', 'name', 'Name', '7', '16', '1', '', '0', '250', '1', '', '0', '2018-07-19 03:38:50', '2018-07-19 03:38:50');
INSERT INTO `module_fields` VALUES ('47', 'file_name', 'File Name', '7', '19', '1', '', '0', '250', '1', '', '0', '2018-07-19 03:38:50', '2018-07-19 03:38:50');
INSERT INTO `module_fields` VALUES ('48', 'backup_size', 'File Size', '7', '19', '0', '0', '0', '10', '1', '', '0', '2018-07-19 03:38:50', '2018-07-19 03:38:50');
INSERT INTO `module_fields` VALUES ('49', 'name', 'Name', '8', '16', '1', '', '1', '250', '1', '', '0', '2018-07-19 03:38:50', '2018-07-19 03:38:50');
INSERT INTO `module_fields` VALUES ('50', 'display_name', 'Display Name', '8', '19', '0', '', '0', '250', '1', '', '0', '2018-07-19 03:38:50', '2018-07-19 03:38:50');
INSERT INTO `module_fields` VALUES ('51', 'description', 'Description', '8', '21', '0', '', '0', '1000', '0', '', '0', '2018-07-19 03:38:50', '2018-07-19 03:38:50');

-- ----------------------------
-- Table structure for module_field_types
-- ----------------------------
DROP TABLE IF EXISTS `module_field_types`;
CREATE TABLE `module_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of module_field_types
-- ----------------------------
INSERT INTO `module_field_types` VALUES ('1', 'Address', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('2', 'Checkbox', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('3', 'Currency', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('4', 'Date', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('5', 'Datetime', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('6', 'Decimal', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('7', 'Dropdown', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('8', 'Email', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('9', 'File', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('10', 'Float', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('11', 'HTML', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('12', 'Image', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('13', 'Integer', '2018-07-19 03:38:47', '2018-07-19 03:38:47');
INSERT INTO `module_field_types` VALUES ('14', 'Mobile', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_field_types` VALUES ('15', 'Multiselect', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_field_types` VALUES ('16', 'Name', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_field_types` VALUES ('17', 'Password', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_field_types` VALUES ('18', 'Radio', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_field_types` VALUES ('19', 'String', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_field_types` VALUES ('20', 'Taginput', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_field_types` VALUES ('21', 'Textarea', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_field_types` VALUES ('22', 'TextField', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_field_types` VALUES ('23', 'URL', '2018-07-19 03:38:48', '2018-07-19 03:38:48');
INSERT INTO `module_field_types` VALUES ('24', 'Files', '2018-07-19 03:38:48', '2018-07-19 03:38:48');

-- ----------------------------
-- Table structure for organizations
-- ----------------------------
DROP TABLE IF EXISTS `organizations`;
CREATE TABLE `organizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'http://',
  `assigned_to` int(10) unsigned NOT NULL DEFAULT '1',
  `connect_since` date NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` int(11) NOT NULL,
  `profile` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_name_unique` (`name`),
  UNIQUE KEY `organizations_email_unique` (`email`),
  KEY `organizations_assigned_to_foreign` (`assigned_to`),
  CONSTRAINT `organizations_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of organizations
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'ADMIN_PANEL', 'Admin Panel', 'Admin Panel Permission', null, '2018-07-19 03:38:51', '2018-07-19 03:38:51');

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL DEFAULT '1',
  `dept` int(10) unsigned NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  KEY `roles_parent_foreign` (`parent`),
  KEY `roles_dept_foreign` (`dept`),
  CONSTRAINT `roles_dept_foreign` FOREIGN KEY (`dept`) REFERENCES `departments` (`id`),
  CONSTRAINT `roles_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'SUPER_ADMIN', 'Super Admin', 'Full Access Role', '1', '1', null, '2018-07-19 03:38:51', '2018-07-19 03:38:51');

-- ----------------------------
-- Table structure for role_module
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `acc_view` tinyint(1) NOT NULL,
  `acc_create` tinyint(1) NOT NULL,
  `acc_edit` tinyint(1) NOT NULL,
  `acc_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_role_id_foreign` (`role_id`),
  KEY `role_module_module_id_foreign` (`module_id`),
  CONSTRAINT `role_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_module
-- ----------------------------
INSERT INTO `role_module` VALUES ('1', '1', '1', '1', '1', '1', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module` VALUES ('2', '1', '2', '1', '1', '1', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module` VALUES ('3', '1', '3', '1', '1', '1', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module` VALUES ('4', '1', '4', '1', '1', '1', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module` VALUES ('5', '1', '5', '1', '1', '1', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module` VALUES ('6', '1', '6', '1', '1', '1', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module` VALUES ('7', '1', '7', '1', '1', '1', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module` VALUES ('8', '1', '8', '1', '1', '1', '1', '2018-07-19 03:38:51', '2018-07-19 03:38:51');

-- ----------------------------
-- Table structure for role_module_fields
-- ----------------------------
DROP TABLE IF EXISTS `role_module_fields`;
CREATE TABLE `role_module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `access` enum('invisible','readonly','write') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_fields_role_id_foreign` (`role_id`),
  KEY `role_module_fields_field_id_foreign` (`field_id`),
  CONSTRAINT `role_module_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `module_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_fields_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_module_fields
-- ----------------------------
INSERT INTO `role_module_fields` VALUES ('1', '1', '1', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('2', '1', '2', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('3', '1', '3', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('4', '1', '4', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('5', '1', '5', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('6', '1', '6', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('7', '1', '7', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('8', '1', '8', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('9', '1', '9', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('10', '1', '10', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('11', '1', '11', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('12', '1', '12', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('13', '1', '13', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('14', '1', '14', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('15', '1', '15', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('16', '1', '16', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('17', '1', '17', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('18', '1', '18', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('19', '1', '19', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('20', '1', '20', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('21', '1', '21', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('22', '1', '22', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('23', '1', '23', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('24', '1', '24', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('25', '1', '25', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('26', '1', '26', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('27', '1', '27', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('28', '1', '28', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('29', '1', '29', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('30', '1', '30', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('31', '1', '31', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('32', '1', '32', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('33', '1', '33', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('34', '1', '34', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('35', '1', '35', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('36', '1', '36', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('37', '1', '37', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('38', '1', '38', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('39', '1', '39', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('40', '1', '40', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('41', '1', '41', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('42', '1', '42', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('43', '1', '43', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('44', '1', '44', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('45', '1', '45', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('46', '1', '46', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('47', '1', '47', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('48', '1', '48', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('49', '1', '49', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('50', '1', '50', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');
INSERT INTO `role_module_fields` VALUES ('51', '1', '51', 'write', '2018-07-19 03:38:51', '2018-07-19 03:38:51');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1', '1', null, null);

-- ----------------------------
-- Table structure for uploads
-- ----------------------------
DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `caption` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploads_user_id_foreign` (`user_id`),
  CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of uploads
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `context_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Employee',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'dungld', '1', 'admin@laraadmin.com', '$2y$10$c2LwDfcFmC1DvahLbbdoQumL2/pASLORprS7LuT9TJi3x3CfH7yYm', 'Employee', null, null, '2018-07-19 03:39:58', '2018-07-19 03:39:58');
