/// Comprehensive country data utilities for QUtils
class QCountry {
  final String name;
  final String iso2;
  final String iso3;
  final String phoneCode;
  final String emoji;

  const QCountry({
    required this.name,
    required this.iso2,
    required this.iso3,
    required this.phoneCode,
    required this.emoji,
  });

  @override
  String toString() => '$name ($iso2)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QCountry &&
          runtimeType == other.runtimeType &&
          iso2 == other.iso2;

  @override
  int get hashCode => iso2.hashCode;
}

/// Countries utility class providing access to all world countries data
class QCountries {
  QCountries._();

  /// Complete list of all countries with their data
  static const List<QCountry> all = [
    QCountry(name: 'Afghanistan', iso2: 'AF', iso3: 'AFG', phoneCode: '+93', emoji: '🇦🇫'),
    QCountry(name: 'Albania', iso2: 'AL', iso3: 'ALB', phoneCode: '+355', emoji: '🇦🇱'),
    QCountry(name: 'Algeria', iso2: 'DZ', iso3: 'DZA', phoneCode: '+213', emoji: '🇩🇿'),
    QCountry(name: 'American Samoa', iso2: 'AS', iso3: 'ASM', phoneCode: '+1684', emoji: '🇦🇸'),
    QCountry(name: 'Andorra', iso2: 'AD', iso3: 'AND', phoneCode: '+376', emoji: '🇦🇩'),
    QCountry(name: 'Angola', iso2: 'AO', iso3: 'AGO', phoneCode: '+244', emoji: '🇦🇴'),
    QCountry(name: 'Anguilla', iso2: 'AI', iso3: 'AIA', phoneCode: '+1264', emoji: '🇦🇮'),
    QCountry(name: 'Antarctica', iso2: 'AQ', iso3: 'ATA', phoneCode: '+672', emoji: '🇦🇶'),
    QCountry(name: 'Antigua and Barbuda', iso2: 'AG', iso3: 'ATG', phoneCode: '+1268', emoji: '🇦🇬'),
    QCountry(name: 'Argentina', iso2: 'AR', iso3: 'ARG', phoneCode: '+54', emoji: '🇦🇷'),
    QCountry(name: 'Armenia', iso2: 'AM', iso3: 'ARM', phoneCode: '+374', emoji: '🇦🇲'),
    QCountry(name: 'Aruba', iso2: 'AW', iso3: 'ABW', phoneCode: '+297', emoji: '🇦🇼'),
    QCountry(name: 'Australia', iso2: 'AU', iso3: 'AUS', phoneCode: '+61', emoji: '🇦🇺'),
    QCountry(name: 'Austria', iso2: 'AT', iso3: 'AUT', phoneCode: '+43', emoji: '🇦🇹'),
    QCountry(name: 'Azerbaijan', iso2: 'AZ', iso3: 'AZE', phoneCode: '+994', emoji: '🇦🇿'),
    QCountry(name: 'Bahamas', iso2: 'BS', iso3: 'BHS', phoneCode: '+1242', emoji: '🇧🇸'),
    QCountry(name: 'Bahrain', iso2: 'BH', iso3: 'BHR', phoneCode: '+973', emoji: '🇧🇭'),
    QCountry(name: 'Bangladesh', iso2: 'BD', iso3: 'BGD', phoneCode: '+880', emoji: '🇧🇩'),
    QCountry(name: 'Barbados', iso2: 'BB', iso3: 'BRB', phoneCode: '+1246', emoji: '🇧🇧'),
    QCountry(name: 'Belarus', iso2: 'BY', iso3: 'BLR', phoneCode: '+375', emoji: '🇧🇾'),
    QCountry(name: 'Belgium', iso2: 'BE', iso3: 'BEL', phoneCode: '+32', emoji: '🇧🇪'),
    QCountry(name: 'Belize', iso2: 'BZ', iso3: 'BLZ', phoneCode: '+501', emoji: '🇧🇿'),
    QCountry(name: 'Benin', iso2: 'BJ', iso3: 'BEN', phoneCode: '+229', emoji: '🇧🇯'),
    QCountry(name: 'Bermuda', iso2: 'BM', iso3: 'BMU', phoneCode: '+1441', emoji: '🇧🇲'),
    QCountry(name: 'Bhutan', iso2: 'BT', iso3: 'BTN', phoneCode: '+975', emoji: '🇧🇹'),
    QCountry(name: 'Bolivia', iso2: 'BO', iso3: 'BOL', phoneCode: '+591', emoji: '🇧🇴'),
    QCountry(name: 'Bosnia and Herzegovina', iso2: 'BA', iso3: 'BIH', phoneCode: '+387', emoji: '🇧🇦'),
    QCountry(name: 'Botswana', iso2: 'BW', iso3: 'BWA', phoneCode: '+267', emoji: '🇧🇼'),
    QCountry(name: 'Brazil', iso2: 'BR', iso3: 'BRA', phoneCode: '+55', emoji: '🇧🇷'),
    QCountry(name: 'British Indian Ocean Territory', iso2: 'IO', iso3: 'IOT', phoneCode: '+246', emoji: '🇮🇴'),
    QCountry(name: 'Brunei', iso2: 'BN', iso3: 'BRN', phoneCode: '+673', emoji: '🇧🇳'),
    QCountry(name: 'Bulgaria', iso2: 'BG', iso3: 'BGR', phoneCode: '+359', emoji: '🇧🇬'),
    QCountry(name: 'Burkina Faso', iso2: 'BF', iso3: 'BFA', phoneCode: '+226', emoji: '🇧🇫'),
    QCountry(name: 'Burundi', iso2: 'BI', iso3: 'BDI', phoneCode: '+257', emoji: '🇧🇮'),
    QCountry(name: 'Cambodia', iso2: 'KH', iso3: 'KHM', phoneCode: '+855', emoji: '🇰🇭'),
    QCountry(name: 'Cameroon', iso2: 'CM', iso3: 'CMR', phoneCode: '+237', emoji: '🇨🇲'),
    QCountry(name: 'Canada', iso2: 'CA', iso3: 'CAN', phoneCode: '+1', emoji: '🇨🇦'),
    QCountry(name: 'Cape Verde', iso2: 'CV', iso3: 'CPV', phoneCode: '+238', emoji: '🇨🇻'),
    QCountry(name: 'Cayman Islands', iso2: 'KY', iso3: 'CYM', phoneCode: '+1345', emoji: '🇰🇾'),
    QCountry(name: 'Central African Republic', iso2: 'CF', iso3: 'CAF', phoneCode: '+236', emoji: '🇨🇫'),
    QCountry(name: 'Chad', iso2: 'TD', iso3: 'TCD', phoneCode: '+235', emoji: '🇹🇩'),
    QCountry(name: 'Chile', iso2: 'CL', iso3: 'CHL', phoneCode: '+56', emoji: '🇨🇱'),
    QCountry(name: 'China', iso2: 'CN', iso3: 'CHN', phoneCode: '+86', emoji: '🇨🇳'),
    QCountry(name: 'Christmas Island', iso2: 'CX', iso3: 'CXR', phoneCode: '+61', emoji: '🇨🇽'),
    QCountry(name: 'Cocos Islands', iso2: 'CC', iso3: 'CCK', phoneCode: '+61', emoji: '🇨🇨'),
    QCountry(name: 'Colombia', iso2: 'CO', iso3: 'COL', phoneCode: '+57', emoji: '🇨🇴'),
    QCountry(name: 'Comoros', iso2: 'KM', iso3: 'COM', phoneCode: '+269', emoji: '🇰🇲'),
    QCountry(name: 'Congo', iso2: 'CG', iso3: 'COG', phoneCode: '+242', emoji: '🇨🇬'),
    QCountry(name: 'Democratic Republic of the Congo', iso2: 'CD', iso3: 'COD', phoneCode: '+243', emoji: '🇨🇩'),
    QCountry(name: 'Cook Islands', iso2: 'CK', iso3: 'COK', phoneCode: '+682', emoji: '🇨🇰'),
    QCountry(name: 'Costa Rica', iso2: 'CR', iso3: 'CRI', phoneCode: '+506', emoji: '🇨🇷'),
    QCountry(name: 'Croatia', iso2: 'HR', iso3: 'HRV', phoneCode: '+385', emoji: '🇭🇷'),
    QCountry(name: 'Cuba', iso2: 'CU', iso3: 'CUB', phoneCode: '+53', emoji: '🇨🇺'),
    QCountry(name: 'Cyprus', iso2: 'CY', iso3: 'CYP', phoneCode: '+357', emoji: '🇨🇾'),
    QCountry(name: 'Czech Republic', iso2: 'CZ', iso3: 'CZE', phoneCode: '+420', emoji: '🇨🇿'),
    QCountry(name: 'Denmark', iso2: 'DK', iso3: 'DNK', phoneCode: '+45', emoji: '🇩🇰'),
    QCountry(name: 'Djibouti', iso2: 'DJ', iso3: 'DJI', phoneCode: '+253', emoji: '🇩🇯'),
    QCountry(name: 'Dominica', iso2: 'DM', iso3: 'DMA', phoneCode: '+1767', emoji: '🇩🇲'),
    QCountry(name: 'Dominican Republic', iso2: 'DO', iso3: 'DOM', phoneCode: '+1809', emoji: '🇩🇴'),
    QCountry(name: 'Ecuador', iso2: 'EC', iso3: 'ECU', phoneCode: '+593', emoji: '🇪🇨'),
    QCountry(name: 'Egypt', iso2: 'EG', iso3: 'EGY', phoneCode: '+20', emoji: '🇪🇬'),
    QCountry(name: 'El Salvador', iso2: 'SV', iso3: 'SLV', phoneCode: '+503', emoji: '🇸🇻'),
    QCountry(name: 'Equatorial Guinea', iso2: 'GQ', iso3: 'GNQ', phoneCode: '+240', emoji: '🇬🇶'),
    QCountry(name: 'Eritrea', iso2: 'ER', iso3: 'ERI', phoneCode: '+291', emoji: '🇪🇷'),
    QCountry(name: 'Estonia', iso2: 'EE', iso3: 'EST', phoneCode: '+372', emoji: '🇪🇪'),
    QCountry(name: 'Ethiopia', iso2: 'ET', iso3: 'ETH', phoneCode: '+251', emoji: '🇪🇹'),
    QCountry(name: 'Falkland Islands', iso2: 'FK', iso3: 'FLK', phoneCode: '+500', emoji: '🇫🇰'),
    QCountry(name: 'Faroe Islands', iso2: 'FO', iso3: 'FRO', phoneCode: '+298', emoji: '🇫🇴'),
    QCountry(name: 'Fiji', iso2: 'FJ', iso3: 'FJI', phoneCode: '+679', emoji: '🇫🇯'),
    QCountry(name: 'Finland', iso2: 'FI', iso3: 'FIN', phoneCode: '+358', emoji: '🇫🇮'),
    QCountry(name: 'France', iso2: 'FR', iso3: 'FRA', phoneCode: '+33', emoji: '🇫🇷'),
    QCountry(name: 'French Guiana', iso2: 'GF', iso3: 'GUF', phoneCode: '+594', emoji: '🇬🇫'),
    QCountry(name: 'French Polynesia', iso2: 'PF', iso3: 'PYF', phoneCode: '+689', emoji: '🇵🇫'),
    QCountry(name: 'Gabon', iso2: 'GA', iso3: 'GAB', phoneCode: '+241', emoji: '🇬🇦'),
    QCountry(name: 'Gambia', iso2: 'GM', iso3: 'GMB', phoneCode: '+220', emoji: '🇬🇲'),
    QCountry(name: 'Georgia', iso2: 'GE', iso3: 'GEO', phoneCode: '+995', emoji: '🇬🇪'),
    QCountry(name: 'Germany', iso2: 'DE', iso3: 'DEU', phoneCode: '+49', emoji: '🇩🇪'),
    QCountry(name: 'Ghana', iso2: 'GH', iso3: 'GHA', phoneCode: '+233', emoji: '🇬🇭'),
    QCountry(name: 'Gibraltar', iso2: 'GI', iso3: 'GIB', phoneCode: '+350', emoji: '🇬🇮'),
    QCountry(name: 'Greece', iso2: 'GR', iso3: 'GRC', phoneCode: '+30', emoji: '🇬🇷'),
    QCountry(name: 'Greenland', iso2: 'GL', iso3: 'GRL', phoneCode: '+299', emoji: '🇬🇱'),
    QCountry(name: 'Grenada', iso2: 'GD', iso3: 'GRD', phoneCode: '+1473', emoji: '🇬🇩'),
    QCountry(name: 'Guadeloupe', iso2: 'GP', iso3: 'GLP', phoneCode: '+590', emoji: '🇬🇵'),
    QCountry(name: 'Guam', iso2: 'GU', iso3: 'GUM', phoneCode: '+1671', emoji: '🇬🇺'),
    QCountry(name: 'Guatemala', iso2: 'GT', iso3: 'GTM', phoneCode: '+502', emoji: '🇬🇹'),
    QCountry(name: 'Guernsey', iso2: 'GG', iso3: 'GGY', phoneCode: '+44', emoji: '🇬🇬'),
    QCountry(name: 'Guinea', iso2: 'GN', iso3: 'GIN', phoneCode: '+224', emoji: '🇬🇳'),
    QCountry(name: 'Guinea-Bissau', iso2: 'GW', iso3: 'GNB', phoneCode: '+245', emoji: '🇬🇼'),
    QCountry(name: 'Guyana', iso2: 'GY', iso3: 'GUY', phoneCode: '+592', emoji: '🇬🇾'),
    QCountry(name: 'Haiti', iso2: 'HT', iso3: 'HTI', phoneCode: '+509', emoji: '🇭🇹'),
    QCountry(name: 'Honduras', iso2: 'HN', iso3: 'HND', phoneCode: '+504', emoji: '🇭🇳'),
    QCountry(name: 'Hong Kong', iso2: 'HK', iso3: 'HKG', phoneCode: '+852', emoji: '🇭🇰'),
    QCountry(name: 'Hungary', iso2: 'HU', iso3: 'HUN', phoneCode: '+36', emoji: '🇭🇺'),
    QCountry(name: 'Iceland', iso2: 'IS', iso3: 'ISL', phoneCode: '+354', emoji: '🇮🇸'),
    QCountry(name: 'India', iso2: 'IN', iso3: 'IND', phoneCode: '+91', emoji: '🇮🇳'),
    QCountry(name: 'Indonesia', iso2: 'ID', iso3: 'IDN', phoneCode: '+62', emoji: '🇮🇩'),
    QCountry(name: 'Iran', iso2: 'IR', iso3: 'IRN', phoneCode: '+98', emoji: '🇮🇷'),
    QCountry(name: 'Iraq', iso2: 'IQ', iso3: 'IRQ', phoneCode: '+964', emoji: '🇮🇶'),
    QCountry(name: 'Ireland', iso2: 'IE', iso3: 'IRL', phoneCode: '+353', emoji: '🇮🇪'),
    QCountry(name: 'Isle of Man', iso2: 'IM', iso3: 'IMN', phoneCode: '+44', emoji: '🇮🇲'),
    QCountry(name: 'Israel', iso2: 'IL', iso3: 'ISR', phoneCode: '+972', emoji: '🇮🇱'),
    QCountry(name: 'Italy', iso2: 'IT', iso3: 'ITA', phoneCode: '+39', emoji: '🇮🇹'),
    QCountry(name: 'Ivory Coast', iso2: 'CI', iso3: 'CIV', phoneCode: '+225', emoji: '🇨🇮'),
    QCountry(name: 'Jamaica', iso2: 'JM', iso3: 'JAM', phoneCode: '+1876', emoji: '🇯🇲'),
    QCountry(name: 'Japan', iso2: 'JP', iso3: 'JPN', phoneCode: '+81', emoji: '🇯🇵'),
    QCountry(name: 'Jersey', iso2: 'JE', iso3: 'JEY', phoneCode: '+44', emoji: '🇯🇪'),
    QCountry(name: 'Jordan', iso2: 'JO', iso3: 'JOR', phoneCode: '+962', emoji: '🇯🇴'),
    QCountry(name: 'Kazakhstan', iso2: 'KZ', iso3: 'KAZ', phoneCode: '+7', emoji: '🇰🇿'),
    QCountry(name: 'Kenya', iso2: 'KE', iso3: 'KEN', phoneCode: '+254', emoji: '🇰🇪'),
    QCountry(name: 'Kiribati', iso2: 'KI', iso3: 'KIR', phoneCode: '+686', emoji: '🇰🇮'),
    QCountry(name: 'North Korea', iso2: 'KP', iso3: 'PRK', phoneCode: '+850', emoji: '🇰🇵'),
    QCountry(name: 'South Korea', iso2: 'KR', iso3: 'KOR', phoneCode: '+82', emoji: '🇰🇷'),
    QCountry(name: 'Kuwait', iso2: 'KW', iso3: 'KWT', phoneCode: '+965', emoji: '🇰🇼'),
    QCountry(name: 'Kyrgyzstan', iso2: 'KG', iso3: 'KGZ', phoneCode: '+996', emoji: '🇰🇬'),
    QCountry(name: 'Laos', iso2: 'LA', iso3: 'LAO', phoneCode: '+856', emoji: '🇱🇦'),
    QCountry(name: 'Latvia', iso2: 'LV', iso3: 'LVA', phoneCode: '+371', emoji: '🇱🇻'),
    QCountry(name: 'Lebanon', iso2: 'LB', iso3: 'LBN', phoneCode: '+961', emoji: '🇱🇧'),
    QCountry(name: 'Lesotho', iso2: 'LS', iso3: 'LSO', phoneCode: '+266', emoji: '🇱🇸'),
    QCountry(name: 'Liberia', iso2: 'LR', iso3: 'LBR', phoneCode: '+231', emoji: '🇱🇷'),
    QCountry(name: 'Libya', iso2: 'LY', iso3: 'LBY', phoneCode: '+218', emoji: '🇱🇾'),
    QCountry(name: 'Liechtenstein', iso2: 'LI', iso3: 'LIE', phoneCode: '+423', emoji: '🇱🇮'),
    QCountry(name: 'Lithuania', iso2: 'LT', iso3: 'LTU', phoneCode: '+370', emoji: '🇱🇹'),
    QCountry(name: 'Luxembourg', iso2: 'LU', iso3: 'LUX', phoneCode: '+352', emoji: '🇱🇺'),
    QCountry(name: 'Macau', iso2: 'MO', iso3: 'MAC', phoneCode: '+853', emoji: '🇲🇴'),
    QCountry(name: 'North Macedonia', iso2: 'MK', iso3: 'MKD', phoneCode: '+389', emoji: '🇲🇰'),
    QCountry(name: 'Madagascar', iso2: 'MG', iso3: 'MDG', phoneCode: '+261', emoji: '🇲🇬'),
    QCountry(name: 'Malawi', iso2: 'MW', iso3: 'MWI', phoneCode: '+265', emoji: '🇲🇼'),
    QCountry(name: 'Malaysia', iso2: 'MY', iso3: 'MYS', phoneCode: '+60', emoji: '🇲🇾'),
    QCountry(name: 'Maldives', iso2: 'MV', iso3: 'MDV', phoneCode: '+960', emoji: '🇲🇻'),
    QCountry(name: 'Mali', iso2: 'ML', iso3: 'MLI', phoneCode: '+223', emoji: '🇲🇱'),
    QCountry(name: 'Malta', iso2: 'MT', iso3: 'MLT', phoneCode: '+356', emoji: '🇲🇹'),
    QCountry(name: 'Marshall Islands', iso2: 'MH', iso3: 'MHL', phoneCode: '+692', emoji: '🇲🇭'),
    QCountry(name: 'Martinique', iso2: 'MQ', iso3: 'MTQ', phoneCode: '+596', emoji: '🇲🇶'),
    QCountry(name: 'Mauritania', iso2: 'MR', iso3: 'MRT', phoneCode: '+222', emoji: '🇲🇷'),
    QCountry(name: 'Mauritius', iso2: 'MU', iso3: 'MUS', phoneCode: '+230', emoji: '🇲🇺'),
    QCountry(name: 'Mayotte', iso2: 'YT', iso3: 'MYT', phoneCode: '+262', emoji: '🇾🇹'),
    QCountry(name: 'Mexico', iso2: 'MX', iso3: 'MEX', phoneCode: '+52', emoji: '🇲🇽'),
    QCountry(name: 'Micronesia', iso2: 'FM', iso3: 'FSM', phoneCode: '+691', emoji: '🇫🇲'),
    QCountry(name: 'Moldova', iso2: 'MD', iso3: 'MDA', phoneCode: '+373', emoji: '🇲🇩'),
    QCountry(name: 'Monaco', iso2: 'MC', iso3: 'MCO', phoneCode: '+377', emoji: '🇲🇨'),
    QCountry(name: 'Mongolia', iso2: 'MN', iso3: 'MNG', phoneCode: '+976', emoji: '🇲🇳'),
    QCountry(name: 'Montenegro', iso2: 'ME', iso3: 'MNE', phoneCode: '+382', emoji: '🇲🇪'),
    QCountry(name: 'Montserrat', iso2: 'MS', iso3: 'MSR', phoneCode: '+1664', emoji: '🇲🇸'),
    QCountry(name: 'Morocco', iso2: 'MA', iso3: 'MAR', phoneCode: '+212', emoji: '🇲🇦'),
    QCountry(name: 'Mozambique', iso2: 'MZ', iso3: 'MOZ', phoneCode: '+258', emoji: '🇲🇿'),
    QCountry(name: 'Myanmar', iso2: 'MM', iso3: 'MMR', phoneCode: '+95', emoji: '🇲🇲'),
    QCountry(name: 'Namibia', iso2: 'NA', iso3: 'NAM', phoneCode: '+264', emoji: '🇳🇦'),
    QCountry(name: 'Nauru', iso2: 'NR', iso3: 'NRU', phoneCode: '+674', emoji: '🇳🇷'),
    QCountry(name: 'Nepal', iso2: 'NP', iso3: 'NPL', phoneCode: '+977', emoji: '🇳🇵'),
    QCountry(name: 'Netherlands', iso2: 'NL', iso3: 'NLD', phoneCode: '+31', emoji: '🇳🇱'),
    QCountry(name: 'New Caledonia', iso2: 'NC', iso3: 'NCL', phoneCode: '+687', emoji: '🇳🇨'),
    QCountry(name: 'New Zealand', iso2: 'NZ', iso3: 'NZL', phoneCode: '+64', emoji: '🇳🇿'),
    QCountry(name: 'Nicaragua', iso2: 'NI', iso3: 'NIC', phoneCode: '+505', emoji: '🇳🇮'),
    QCountry(name: 'Niger', iso2: 'NE', iso3: 'NER', phoneCode: '+227', emoji: '🇳🇪'),
    QCountry(name: 'Nigeria', iso2: 'NG', iso3: 'NGA', phoneCode: '+234', emoji: '🇳🇬'),
    QCountry(name: 'Niue', iso2: 'NU', iso3: 'NIU', phoneCode: '+683', emoji: '🇳🇺'),
    QCountry(name: 'Norfolk Island', iso2: 'NF', iso3: 'NFK', phoneCode: '+672', emoji: '🇳🇫'),
    QCountry(name: 'Northern Mariana Islands', iso2: 'MP', iso3: 'MNP', phoneCode: '+1670', emoji: '🇲🇵'),
    QCountry(name: 'Norway', iso2: 'NO', iso3: 'NOR', phoneCode: '+47', emoji: '🇳🇴'),
    QCountry(name: 'Oman', iso2: 'OM', iso3: 'OMN', phoneCode: '+968', emoji: '🇴🇲'),
    QCountry(name: 'Pakistan', iso2: 'PK', iso3: 'PAK', phoneCode: '+92', emoji: '🇵🇰'),
    QCountry(name: 'Palau', iso2: 'PW', iso3: 'PLW', phoneCode: '+680', emoji: '🇵🇼'),
    QCountry(name: 'Palestine', iso2: 'PS', iso3: 'PSE', phoneCode: '+970', emoji: '🇵🇸'),
    QCountry(name: 'Panama', iso2: 'PA', iso3: 'PAN', phoneCode: '+507', emoji: '🇵🇦'),
    QCountry(name: 'Papua New Guinea', iso2: 'PG', iso3: 'PNG', phoneCode: '+675', emoji: '🇵🇬'),
    QCountry(name: 'Paraguay', iso2: 'PY', iso3: 'PRY', phoneCode: '+595', emoji: '🇵🇾'),
    QCountry(name: 'Peru', iso2: 'PE', iso3: 'PER', phoneCode: '+51', emoji: '🇵🇪'),
    QCountry(name: 'Philippines', iso2: 'PH', iso3: 'PHL', phoneCode: '+63', emoji: '🇵🇭'),
    QCountry(name: 'Pitcairn', iso2: 'PN', iso3: 'PCN', phoneCode: '+64', emoji: '🇵🇳'),
    QCountry(name: 'Poland', iso2: 'PL', iso3: 'POL', phoneCode: '+48', emoji: '🇵🇱'),
    QCountry(name: 'Portugal', iso2: 'PT', iso3: 'PRT', phoneCode: '+351', emoji: '🇵🇹'),
    QCountry(name: 'Puerto Rico', iso2: 'PR', iso3: 'PRI', phoneCode: '+1787', emoji: '🇵🇷'),
    QCountry(name: 'Qatar', iso2: 'QA', iso3: 'QAT', phoneCode: '+974', emoji: '🇶🇦'),
    QCountry(name: 'Reunion', iso2: 'RE', iso3: 'REU', phoneCode: '+262', emoji: '🇷🇪'),
    QCountry(name: 'Romania', iso2: 'RO', iso3: 'ROU', phoneCode: '+40', emoji: '🇷🇴'),
    QCountry(name: 'Russia', iso2: 'RU', iso3: 'RUS', phoneCode: '+7', emoji: '🇷🇺'),
    QCountry(name: 'Rwanda', iso2: 'RW', iso3: 'RWA', phoneCode: '+250', emoji: '🇷🇼'),
    QCountry(name: 'Saint Barthélemy', iso2: 'BL', iso3: 'BLM', phoneCode: '+590', emoji: '🇧🇱'),
    QCountry(name: 'Saint Helena', iso2: 'SH', iso3: 'SHN', phoneCode: '+290', emoji: '🇸🇭'),
    QCountry(name: 'Saint Kitts and Nevis', iso2: 'KN', iso3: 'KNA', phoneCode: '+1869', emoji: '🇰🇳'),
    QCountry(name: 'Saint Lucia', iso2: 'LC', iso3: 'LCA', phoneCode: '+1758', emoji: '🇱🇨'),
    QCountry(name: 'Saint Martin', iso2: 'MF', iso3: 'MAF', phoneCode: '+590', emoji: '🇲🇫'),
    QCountry(name: 'Saint Pierre and Miquelon', iso2: 'PM', iso3: 'SPM', phoneCode: '+508', emoji: '🇵🇲'),
    QCountry(name: 'Saint Vincent and the Grenadines', iso2: 'VC', iso3: 'VCT', phoneCode: '+1784', emoji: '🇻🇨'),
    QCountry(name: 'Samoa', iso2: 'WS', iso3: 'WSM', phoneCode: '+685', emoji: '🇼🇸'),
    QCountry(name: 'San Marino', iso2: 'SM', iso3: 'SMR', phoneCode: '+378', emoji: '🇸🇲'),
    QCountry(name: 'Sao Tome and Principe', iso2: 'ST', iso3: 'STP', phoneCode: '+239', emoji: '🇸🇹'),
    QCountry(name: 'Saudi Arabia', iso2: 'SA', iso3: 'SAU', phoneCode: '+966', emoji: '🇸🇦'),
    QCountry(name: 'Senegal', iso2: 'SN', iso3: 'SEN', phoneCode: '+221', emoji: '🇸🇳'),
    QCountry(name: 'Serbia', iso2: 'RS', iso3: 'SRB', phoneCode: '+381', emoji: '🇷🇸'),
    QCountry(name: 'Seychelles', iso2: 'SC', iso3: 'SYC', phoneCode: '+248', emoji: '🇸🇨'),
    QCountry(name: 'Sierra Leone', iso2: 'SL', iso3: 'SLE', phoneCode: '+232', emoji: '🇸🇱'),
    QCountry(name: 'Singapore', iso2: 'SG', iso3: 'SGP', phoneCode: '+65', emoji: '🇸🇬'),
    QCountry(name: 'Sint Maarten', iso2: 'SX', iso3: 'SXM', phoneCode: '+1721', emoji: '🇸🇽'),
    QCountry(name: 'Slovakia', iso2: 'SK', iso3: 'SVK', phoneCode: '+421', emoji: '🇸🇰'),
    QCountry(name: 'Slovenia', iso2: 'SI', iso3: 'SVN', phoneCode: '+386', emoji: '🇸🇮'),
    QCountry(name: 'Solomon Islands', iso2: 'SB', iso3: 'SLB', phoneCode: '+677', emoji: '🇸🇧'),
    QCountry(name: 'Somalia', iso2: 'SO', iso3: 'SOM', phoneCode: '+252', emoji: '🇸🇴'),
    QCountry(name: 'South Africa', iso2: 'ZA', iso3: 'ZAF', phoneCode: '+27', emoji: '🇿🇦'),
    QCountry(name: 'South Georgia and the South Sandwich Islands', iso2: 'GS', iso3: 'SGS', phoneCode: '+500', emoji: '🇬🇸'),
    QCountry(name: 'South Sudan', iso2: 'SS', iso3: 'SSD', phoneCode: '+211', emoji: '🇸🇸'),
    QCountry(name: 'Spain', iso2: 'ES', iso3: 'ESP', phoneCode: '+34', emoji: '🇪🇸'),
    QCountry(name: 'Sri Lanka', iso2: 'LK', iso3: 'LKA', phoneCode: '+94', emoji: '🇱🇰'),
    QCountry(name: 'Sudan', iso2: 'SD', iso3: 'SDN', phoneCode: '+249', emoji: '🇸🇩'),
    QCountry(name: 'Suriname', iso2: 'SR', iso3: 'SUR', phoneCode: '+597', emoji: '🇸🇷'),
    QCountry(name: 'Svalbard and Jan Mayen', iso2: 'SJ', iso3: 'SJM', phoneCode: '+47', emoji: '🇸🇯'),
    QCountry(name: 'Swaziland', iso2: 'SZ', iso3: 'SWZ', phoneCode: '+268', emoji: '🇸🇿'),
    QCountry(name: 'Sweden', iso2: 'SE', iso3: 'SWE', phoneCode: '+46', emoji: '🇸🇪'),
    QCountry(name: 'Switzerland', iso2: 'CH', iso3: 'CHE', phoneCode: '+41', emoji: '🇨🇭'),
    QCountry(name: 'Syria', iso2: 'SY', iso3: 'SYR', phoneCode: '+963', emoji: '🇸🇾'),
    QCountry(name: 'Taiwan', iso2: 'TW', iso3: 'TWN', phoneCode: '+886', emoji: '🇹🇼'),
    QCountry(name: 'Tajikistan', iso2: 'TJ', iso3: 'TJK', phoneCode: '+992', emoji: '🇹🇯'),
    QCountry(name: 'Tanzania', iso2: 'TZ', iso3: 'TZA', phoneCode: '+255', emoji: '🇹🇿'),
    QCountry(name: 'Thailand', iso2: 'TH', iso3: 'THA', phoneCode: '+66', emoji: '🇹🇭'),
    QCountry(name: 'Timor-Leste', iso2: 'TL', iso3: 'TLS', phoneCode: '+670', emoji: '🇹🇱'),
    QCountry(name: 'Togo', iso2: 'TG', iso3: 'TGO', phoneCode: '+228', emoji: '🇹🇬'),
    QCountry(name: 'Tokelau', iso2: 'TK', iso3: 'TKL', phoneCode: '+690', emoji: '🇹🇰'),
    QCountry(name: 'Tonga', iso2: 'TO', iso3: 'TON', phoneCode: '+676', emoji: '🇹🇴'),
    QCountry(name: 'Trinidad and Tobago', iso2: 'TT', iso3: 'TTO', phoneCode: '+1868', emoji: '🇹🇹'),
    QCountry(name: 'Tunisia', iso2: 'TN', iso3: 'TUN', phoneCode: '+216', emoji: '🇹🇳'),
    QCountry(name: 'Turkey', iso2: 'TR', iso3: 'TUR', phoneCode: '+90', emoji: '🇹🇷'),
    QCountry(name: 'Turkmenistan', iso2: 'TM', iso3: 'TKM', phoneCode: '+993', emoji: '🇹🇲'),
    QCountry(name: 'Turks and Caicos Islands', iso2: 'TC', iso3: 'TCA', phoneCode: '+1649', emoji: '🇹🇨'),
    QCountry(name: 'Tuvalu', iso2: 'TV', iso3: 'TUV', phoneCode: '+688', emoji: '🇹🇻'),
    QCountry(name: 'Uganda', iso2: 'UG', iso3: 'UGA', phoneCode: '+256', emoji: '🇺🇬'),
    QCountry(name: 'Ukraine', iso2: 'UA', iso3: 'UKR', phoneCode: '+380', emoji: '🇺🇦'),
    QCountry(name: 'United Arab Emirates', iso2: 'AE', iso3: 'ARE', phoneCode: '+971', emoji: '🇦🇪'),
    QCountry(name: 'United Kingdom', iso2: 'GB', iso3: 'GBR', phoneCode: '+44', emoji: '🇬🇧'),
    QCountry(name: 'United States', iso2: 'US', iso3: 'USA', phoneCode: '+1', emoji: '🇺🇸'),
    QCountry(name: 'Uruguay', iso2: 'UY', iso3: 'URY', phoneCode: '+598', emoji: '🇺🇾'),
    QCountry(name: 'Uzbekistan', iso2: 'UZ', iso3: 'UZB', phoneCode: '+998', emoji: '🇺🇿'),
    QCountry(name: 'Vanuatu', iso2: 'VU', iso3: 'VUT', phoneCode: '+678', emoji: '🇻🇺'),
    QCountry(name: 'Vatican', iso2: 'VA', iso3: 'VAT', phoneCode: '+39', emoji: '🇻🇦'),
    QCountry(name: 'Venezuela', iso2: 'VE', iso3: 'VEN', phoneCode: '+58', emoji: '🇻🇪'),
    QCountry(name: 'Vietnam', iso2: 'VN', iso3: 'VNM', phoneCode: '+84', emoji: '🇻🇳'),
    QCountry(name: 'British Virgin Islands', iso2: 'VG', iso3: 'VGB', phoneCode: '+1284', emoji: '🇻🇬'),
    QCountry(name: 'U.S. Virgin Islands', iso2: 'VI', iso3: 'VIR', phoneCode: '+1340', emoji: '🇻🇮'),
    QCountry(name: 'Wallis and Futuna', iso2: 'WF', iso3: 'WLF', phoneCode: '+681', emoji: '🇼🇫'),
    QCountry(name: 'Western Sahara', iso2: 'EH', iso3: 'ESH', phoneCode: '+212', emoji: '🇪🇭'),
    QCountry(name: 'Yemen', iso2: 'YE', iso3: 'YEM', phoneCode: '+967', emoji: '🇾🇪'),
    QCountry(name: 'Zambia', iso2: 'ZM', iso3: 'ZMB', phoneCode: '+260', emoji: '🇿🇲'),
    QCountry(name: 'Zimbabwe', iso2: 'ZW', iso3: 'ZWE', phoneCode: '+263', emoji: '🇿🇼'),
  ];

  /// Get country by ISO2 code
  static QCountry? byIso2(String iso2) {
    try {
      return all.firstWhere((country) => country.iso2.toUpperCase() == iso2.toUpperCase());
    } catch (e) {
      return null;
    }
  }

  /// Get country by ISO3 code
  static QCountry? byIso3(String iso3) {
    try {
      return all.firstWhere((country) => country.iso3.toUpperCase() == iso3.toUpperCase());
    } catch (e) {
      return null;
    }
  }

  /// Get country by phone code
  static QCountry? byPhoneCode(String phoneCode) {
    try {
      final cleanPhoneCode = phoneCode.startsWith('+') ? phoneCode : '+$phoneCode';
      return all.firstWhere((country) => country.phoneCode == cleanPhoneCode);
    } catch (e) {
      return null;
    }
  }

  /// Get country by name (case insensitive)
  static QCountry? byName(String name) {
    try {
      return all.firstWhere((country) => country.name.toLowerCase() == name.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  /// Search countries by name (partial match)
  static List<QCountry> search(String query) {
    final lowerQuery = query.toLowerCase();
    return all.where((country) => country.name.toLowerCase().contains(lowerQuery)).toList();
  }

  /// Get all country names
  static List<String> get names => all.map((country) => country.name).toList();

  /// Get all ISO2 codes
  static List<String> get iso2Codes => all.map((country) => country.iso2).toList();

  /// Get all ISO3 codes 
  static List<String> get iso3Codes => all.map((country) => country.iso3).toList();

  /// Get all phone codes
  static List<String> get phoneCodes => all.map((country) => country.phoneCode).toList();

  /// Get all country emojis
  static List<String> get emojis => all.map((country) => country.emoji).toList();
} 