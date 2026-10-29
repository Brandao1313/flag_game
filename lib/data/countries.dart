import '../models/country.dart';

// LISTA 1: Apenas Países do Mundo
const List<Country> worldCountries = [
  // ---------- África ----------
  Country(name: 'África do Sul', code: 'za', continent: 'África'),
  Country(name: 'Egito',         code: 'eg', continent: 'África'),
  Country(name: 'Nigéria',       code: 'ng', continent: 'África'),
  Country(name: 'Quênia',        code: 'ke', continent: 'África'),
  Country(name: 'Marrocos',      code: 'ma', continent: 'África'),
  Country(name: 'Gana',          code: 'gh', continent: 'África'),
  Country(name: 'Etiópia',       code: 'et', continent: 'África'),
  Country(name: 'Senegal',       code: 'sn', continent: 'África'),
  Country(name: 'Angola',        code: 'ao', continent: 'África'),
  Country(name: 'Argélia',       code: 'dz', continent: 'África'),

  // ---------- América ----------
  Country(name: 'Brasil',        code: 'br', continent: 'América'),
  Country(name: 'Estados Unidos',code: 'us', continent: 'América'),
  Country(name: 'Canadá',        code: 'ca', continent: 'América'),
  Country(name: 'Argentina',     code: 'ar', continent: 'América'),
  Country(name: 'México',        code: 'mx', continent: 'América'),
  Country(name: 'Chile',         code: 'cl', continent: 'América'),
  Country(name: 'Colômbia',      code: 'co', continent: 'América'),
  Country(name: 'Peru',          code: 'pe', continent: 'América'),
  Country(name: 'Uruguai',       code: 'uy', continent: 'América'),
  Country(name: 'Venezuela',     code: 've', continent: 'América'),

  // ---------- Ásia ----------
  Country(name: 'Japão',         code: 'jp', continent: 'Ásia'),
  Country(name: 'China',         code: 'cn', continent: 'Ásia'),
  Country(name: 'Índia',         code: 'in', continent: 'Ásia'),
  Country(name: 'Coreia do Sul', code: 'kr', continent: 'Ásia'),
  Country(name: 'Tailândia',     code: 'th', continent: 'Ásia'),
  Country(name: 'Indonésia',     code: 'id', continent: 'Ásia'),
  Country(name: 'Arábia Saudita',code: 'sa', continent: 'Ásia'),
  Country(name: 'Israel',        code: 'il', continent: 'Ásia'),
  Country(name: 'Turquia',       code: 'tr', continent: 'Ásia'),
  Country(name: 'Vietnã',        code: 'vn', continent: 'Ásia'),

  // ---------- Europa ----------
  Country(name: 'Alemanha',      code: 'de', continent: 'Europa'),
  Country(name: 'França',        code: 'fr', continent: 'Europa'),
  Country(name: 'Itália',        code: 'it', continent: 'Europa'),
  Country(name: 'Espanha',       code: 'es', continent: 'Europa'),
  Country(name: 'Portugal',      code: 'pt', continent: 'Europa'),
  Country(name: 'Reino Unido',   code: 'gb', continent: 'Europa'),
  Country(name: 'Holanda',       code: 'nl', continent: 'Europa'),
  Country(name: 'Grécia',        code: 'gr', continent: 'Europa'),
  Country(name: 'Suécia',        code: 'se', continent: 'Europa'),
  Country(name: 'Polônia',       code: 'pl', continent: 'Europa'),

  // ---------- Oceania ----------
  Country(name: 'Austrália',     code: 'au', continent: 'Oceania'),
  Country(name: 'Nova Zelândia', code: 'nz', continent: 'Oceania'),
  Country(name: 'Fiji',          code: 'fj', continent: 'Oceania'),
  Country(name: 'Papua-Nova Guiné', code: 'pg', continent: 'Oceania'),
  Country(name: 'Samoa',         code: 'ws', continent: 'Oceania'),
  Country(name: 'Tonga',         code: 'to', continent: 'Oceania'),
  Country(name: 'Vanuatu',       code: 'vu', continent: 'Oceania'),
  Country(name: 'Palau',         code: 'pw', continent: 'Oceania'),
  Country(name: 'Nauru',         code: 'nr', continent: 'Oceania'),
  Country(name: 'Ilhas Salomão', code: 'sb', continent: 'Oceania'),
];

// LISTA 2: Apenas Estados do Brasil (Modo Especial)
const List<Country> brazilStates = [
  Country(name: 'Acre', code: 'ac', continent: 'Brasil (Estados)'),
  Country(name: 'Alagoas', code: 'al', continent: 'Brasil (Estados)'),
  Country(name: 'Amapá', code: 'ap', continent: 'Brasil (Estados)'),
  Country(name: 'Amazonas', code: 'am', continent: 'Brasil (Estados)'),
  Country(name: 'Bahia', code: 'ba', continent: 'Brasil (Estados)'),
  Country(name: 'Ceará', code: 'ce', continent: 'Brasil (Estados)'),
  Country(name: 'Distrito Federal', code: 'df', continent: 'Brasil (Estados)'),
  Country(name: 'Espírito Santo', code: 'es', continent: 'Brasil (Estados)'),
  Country(name: 'Goiás', code: 'go', continent: 'Brasil (Estados)'),
  Country(name: 'Maranhão', code: 'ma', continent: 'Brasil (Estados)'),
  Country(name: 'Mato Grosso', code: 'mt', continent: 'Brasil (Estados)'),
  Country(name: 'Mato Grosso do Sul', code: 'ms', continent: 'Brasil (Estados)'),
  Country(name: 'Minas Gerais', code: 'mg', continent: 'Brasil (Estados)'),
  Country(name: 'Pará', code: 'pa', continent: 'Brasil (Estados)'),
  Country(name: 'Paraíba', code: 'pb', continent: 'Brasil (Estados)'),
  Country(name: 'Paraná', code: 'pr', continent: 'Brasil (Estados)'),
  Country(name: 'Pernambuco', code: 'pe', continent: 'Brasil (Estados)'),
  Country(name: 'Piauí', code: 'pi', continent: 'Brasil (Estados)'),
  Country(name: 'Rio de Janeiro', code: 'rj', continent: 'Brasil (Estados)'),
  Country(name: 'Rio Grande do Norte', code: 'rn', continent: 'Brasil (Estados)'),
  Country(name: 'Rio Grande do Sul', code: 'rs', continent: 'Brasil (Estados)'),
  Country(name: 'Rondônia', code: 'ro', continent: 'Brasil (Estados)'),
  Country(name: 'Roraima', code: 'rr', continent: 'Brasil (Estados)'),
  Country(name: 'Santa Catarina', code: 'sc', continent: 'Brasil (Estados)'),
  Country(name: 'São Paulo', code: 'sp', continent: 'Brasil (Estados)'),
  Country(name: 'Sergipe', code: 'se', continent: 'Brasil (Estados)'),
  Country(name: 'Tocantins', code: 'to', continent: 'Brasil (Estados)'),
];

// Apenas os continentes para o menu
const List<String> continents = [
  'África', 'América', 'Ásia', 'Europa', 'Oceania',
];